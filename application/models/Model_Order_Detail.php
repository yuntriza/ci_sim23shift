<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_Order_Detail extends CI_Model {

    public function get_all()
    {
        $this->db->select('od.*, so.id_pelanggan, p.nama_produk, p.harga AS harga_produk_master, pel.nama_pelanggan AS nama_pelanggan'); 
        $this->db->from('order_detail od');
        $this->db->join('salesorder so', 'so.id_order = od.id_order', 'left');
        $this->db->join('produk p', 'p.id_produk = od.id_produk', 'left');
        $this->db->join('pelanggan pel', 'pel.id_pelanggan = so.id_pelanggan', 'left'); 
        return $this->db->get()->result_array();
    }

    public function get_by_id($id_detail)
    {
        $this->db->select('od.*, so.id_pelanggan, p.nama_produk, p.harga AS harga_produk_master, pel.nama_pelanggan AS nama_pelanggan'); 
        $this->db->from('order_detail od');
        $this->db->join('salesorder so', 'so.id_order = od.id_order', 'left');
        $this->db->join('produk p', 'p.id_produk = od.id_produk', 'left');
        $this->db->join('pelanggan pel', 'pel.id_pelanggan = so.id_pelanggan', 'left'); 
        $this->db->where('od.id_detail', $id_detail);
        return $this->db->get()->row_array();
    }

    public function insert($data)
    {
        return $this->db->insert('order_detail', $data);
    }

    public function update($id_detail, $data)
    {
        $this->db->where('id_detail', $id_detail);
        return $this->db->update('order_detail', $data);
    }

    public function delete($id_detail)
    {
        $this->db->where('id_detail', $id_detail);
        return $this->db->delete('order_detail');
    }

    public function get_by_order_id($id_order)
    {
        $this->db->select('od.jumlah, od.harga_satuan'); // Only select what's needed for total
        $this->db->from('order_detail od');
        $this->db->where('od.id_order', $id_order);
        return $this->db->get()->result_array();
    }
    public function calculate_total_for_salesorder($id_order)
    {
        $this->db->select('SUM(jumlah * harga_satuan) as grand_total');
        $this->db->where('id_order', $id_order);
        $query = $this->db->get('order_detail');
        $result = $query->row_array();
        return (float)$result['grand_total']; // Ensure it's a float
    }

    public function insert_batch($data)
    {
        return $this->db->insert_batch('order_detail', $data);
    }

}