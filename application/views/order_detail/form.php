<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Form Tambah Order Detail</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Form Tambah Order Detail</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Form Tambah Order Detail</h3>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                        <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>

            <div class="card-body">
            <form action="<?= base_url('order_detail/insert'); ?>" method="POST">
    <div class="form-group">
        <label for="id_order">ID Order</label>
        <select class="form-control" name="id_order" id="id_order" required>
            <option value="">-- Pilih ID Order --</option>
            <?php foreach ($salesorders as $so): ?>
                <option value="<?= $so['id_order']; ?>"><?= $so['id_order']; ?> (<?= $so['nama_pelanggan']; ?>)</option>
            <?php endforeach; ?>
        </select>
    </div>

    <h5>Detail Produk</h5>
    <div class="table-responsive">
        <table class="table table-bordered" id="produkTable">
            <thead>
                <tr>
                    <th>Produk</th>
                    <th>Harga</th>
                    <th>Jumlah</th>
                    <th>Subtotal</th>
                    <th>
                        <button type="button" id="addRow" class="btn btn-success btn-sm">Tambah</button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <select name="produk[]" class="form-control produk-select" required>
                            <option value="">-- Pilih Produk --</option>
                            <?php foreach($produks as $pr): ?>
                                <option value="<?= $pr['id_produk'] ?>" data-harga="<?= $pr['harga'] ?>">
                                    <?= htmlspecialchars($pr['nama_produk']) ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </td>
                    <td class="harga">0</td>
                    <td>
                        <input type="number" name="jumlah[]" class="form-control jumlah" min="1" value="1" required>
                    </td>
                    <td class="subtotal">0</td>
                    <td>
                        <button type="button" class="btn btn-danger btn-sm removeRow">Hapus</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="form-group mt-3">
        <button type="submit" class="btn btn-primary">Simpan</button>
    </div>
</form>

            </div>

            <div class="card-footer">
            </div>
        </div>
    </section>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    function hitungSubtotal(row) {
        var harga = parseFloat(row.find('select.produk-select option:selected').data('harga')) || 0;
        var jumlah = parseInt(row.find('.jumlah').val()) || 0;
        var subtotal = harga * jumlah;

        row.find('.harga').text(harga);
        row.find('.subtotal').text(subtotal);
    }

    $('#produkTable').on('change', '.produk-select', function() {
        var row = $(this).closest('tr');
        hitungSubtotal(row);
    });

    $('#produkTable').on('input', '.jumlah', function() {
        var row = $(this).closest('tr');
        hitungSubtotal(row);
    });

    $('#addRow').click(function() {
        var newRow = $('#produkTable tbody tr:first').clone();
        newRow.find('select').val('');
        newRow.find('.harga').text('0');
        newRow.find('.jumlah').val(1);
        newRow.find('.subtotal').text('0');
        $('#produkTable tbody').append(newRow);
    });

    $('#produkTable').on('click', '.removeRow', function() {
        if ($('#produkTable tbody tr').length > 1) {
            $(this).closest('tr').remove();
        } else {
            alert('Minimal satu produk harus diinput!');
        }
    });

    // Hitung subtotal pertama kali
    $('#produkTable tbody tr').each(function() {
        hitungSubtotal($(this));
    });
});
</script>
