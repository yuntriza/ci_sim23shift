<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Order_Detail extends CI_Controller {
    
        public function __construct()
        {
            parent::__construct();
            $this->load->model('Model_Order_Detail');
            $this->load->model('Model_Salesorder'); // Make sure this is loaded
            $this->load->model('Model_Produk');
            $this->load->library('form_validation');
        }
    
        public function index()
        {
            $data['title'] = 'Data Order Detail';
            // This will now fetch order details with product name, sales order code, and customer name
            $data['order_detail'] = $this->Model_Order_Detail->get_all();
            $data['produks'] = $this->Model_Produk->get_all(); // Still needed for the 'Produk' column
            // No direct change needed here, as the model handles the join.
    
            $this->load->view('templates/header', $data);
            $this->load->view('order_detail/index', $data);
            $this->load->view('templates/footer');
        }
    
        public function form()
        {
            $data['title'] = 'Form Tambah Order Detail';
            // This will now fetch sales orders with customer names
            $data['salesorders'] = $this->Model_Salesorder->get_all();
            $data['produks'] = $this->Model_Produk->get_all();
    
            $this->load->view('templates/header', $data);
            $this->load->view('order_detail/form', $data);
            $this->load->view('templates/footer');
        }
    
        public function insert()
        {
            $this->form_validation->set_rules('id_order', 'ID Order', 'required|numeric'); // Ensure id_order is validated
    
            if ($this->form_validation->run() == FALSE) {
                // ... (reload form as before)
                $data['title'] = 'Form Tambah Order Detail';
                $data['salesorders'] = $this->Model_Salesorder->get_all();
                $data['produks'] = $this->Model_Produk->get_all();
                $this->load->view('templates/header', $data);
                $this->load->view('order_detail/form', $data);
                $this->load->view('templates/footer');
            } else {
                $id_order = $this->input->post('id_order');
                $produk_ids = $this->input->post('produk');
                $jumlahs = $this->input->post('jumlah');
                $data_detail = [];
    
                // Add validation to ensure produk_ids and jumlahs are arrays and not empty
                if (empty($produk_ids) || empty($jumlahs) || !is_array($produk_ids) || !is_array($jumlahs)) {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger">Tidak ada produk yang ditambahkan.</div>');
                    redirect('order_detail'); // Redirect if no products selected
                }
    
                foreach ($produk_ids as $i => $id_produk) {
                    $produk = $this->Model_Produk->get_by_id($id_produk);
                    if (!$produk) continue;
    
                    $jumlah = isset($jumlahs[$i]) ? (int)$jumlahs[$i] : 1;
                    $harga_satuan = (int)$produk['harga'];
    
                    $data_detail[] = [
                        'id_order' => $id_order,
                        'id_produk' => $id_produk,
                        'jumlah' => $jumlah,
                        'harga_satuan' => $harga_satuan
                    ];
                }
    
                if (!empty($data_detail) && $this->Model_Order_Detail->insert_batch($data_detail)) {
                    // --- CRITICAL STEP: Recalculate and update salesorder total_harga ---
                    $new_total_harga = $this->Model_Order_Detail->calculate_total_for_salesorder($id_order);
                    $this->Model_Salesorder->update_total_harga($id_order, $new_total_harga);
                    // -------------------------------------------------------------------
    
                    $this->session->set_flashdata('message', '<div class="alert alert-success">Data Order Detail berhasil ditambahkan dan Total Sales Order diperbarui!</div>');
                } else {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger">Gagal menambahkan data Order Detail.</div>');
                }
                redirect('order_detail');
            }
        }
    
        // ... (get_edit_form() method is fine)
    
        public function update($id_detail)
        {
            // Make sure id_order is passed, perhaps hidden or via AJAX
            $id_order = $this->input->post('id_order'); // You need to ensure id_order is passed from the modal form
    
            $this->form_validation->set_rules('id_order', 'ID Order', 'required|numeric'); // Validate id_order
            $this->form_validation->set_rules('id_produk', 'Produk', 'required|numeric');
            $this->form_validation->set_rules('jumlah', 'Jumlah', 'required|numeric|integer|greater_than[0]');
            $this->form_validation->set_rules('harga_satuan', 'Harga Satuan', 'required|numeric|greater_than[0]');
    
            if ($this->form_validation->run() == FALSE) {
                $response = [
                    'status' => 'error',
                    'message' => 'Validasi gagal',
                    'errors' => validation_errors()
                ];
            } else {
                $data = [
                    'id_order' => $id_order, // Ensure id_order is included in data
                    'id_produk' => $this->input->post('id_produk'),
                    'jumlah' => $this->input->post('jumlah'),
                    'harga_satuan' => $this->input->post('harga_satuan')
                ];
    
                if ($this->Model_Order_Detail->update($id_detail, $data)) {
                    // --- CRITICAL STEP: Recalculate and update salesorder total_harga after update ---
                    $new_total_harga = $this->Model_Order_Detail->calculate_total_for_salesorder($id_order);
                    $this->Model_Salesorder->update_total_harga($id_order, $new_total_harga);
                    // ----------------------------------------------------------------------------------
    
                    $response = [
                        'status' => 'success',
                        'message' => 'Data Order Detail berhasil diperbarui dan Total Sales Order diperbarui!'
                    ];
                } else {
                    $response = [
                        'status' => 'error',
                        'message' => 'Gagal memperbarui data Order Detail. Silakan coba lagi.'
                    ];
                }
            }
    
            $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($response));
        }
    
        public function delete($id_detail)
        {
            // First, get the id_order related to this order_detail before deleting
            $order_detail_to_delete = $this->Model_Order_Detail->get_by_id($id_detail);
            $id_order = isset($order_detail_to_delete['id_order']) ? $order_detail_to_delete['id_order'] : null;
    
            if ($this->Model_Order_Detail->delete($id_detail)) {
                // --- CRITICAL STEP: Recalculate and update salesorder total_harga after delete ---
                if ($id_order) {
                    $new_total_harga = $this->Model_Order_Detail->calculate_total_for_salesorder($id_order);
                    $this->Model_Salesorder->update_total_harga($id_order, $new_total_harga);
                }
                // ----------------------------------------------------------------------------------
    
                $this->session->set_flashdata('message', '<div class="alert alert-success">Data Order Detail berhasil dihapus dan Total Sales Order diperbarui!</div>');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger">Gagal menghapus data Order Detail.</div>');
            }
            redirect('order_detail');
        }
    }