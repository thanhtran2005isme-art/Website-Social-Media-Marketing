<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Nạp thẻ cào tự động - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php');
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;

// Sanitize filter inputs
$telcos = isset($_GET['telco']) ? Anti_xss($_GET['telco']) : '';
$amount = isset($_GET['amount']) ? Anti_xss($_GET['amount']) : '';
$code = isset($_GET['code']) ? Anti_xss($_GET['code']) : '';
$serial = isset($_GET['serial']) ? Anti_xss($_GET['serial']) : '';
$status = isset($_GET['status']) ? Anti_xss($_GET['status']) : '';
$date_start = isset($_GET['date_start']) ? Anti_xss($_GET['date_start']) : '';
$date_end = isset($_GET['date_end']) ? Anti_xss($_GET['date_end']) : '';
// Validate date format (YYYY-MM-DD)
if ($date_start) {
    $date_start = preg_replace('/[^0-9-]/', '', $date_start); // Loại bỏ ký tự không phải số hoặc dấu -
    if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $date_start) || !strtotime($date_start)) {
        $date_start = '';
    }
}
if ($date_end) {
    $date_end = preg_replace('/[^0-9-]/', '', $date_end); // Loại bỏ ký tự không phải số hoặc dấu -
    if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $date_end) || !strtotime($date_end)) {
        $date_end = '';
    }
}

// Build WHERE clause for filtering
$where_conditions = ["user_id = '{$data_user['id']}'"];
if ($telcos) {
    $where_conditions[] = "telco = '$telcos'";
}
if ($amount) {
    $where_conditions[] = "amount = '$amount'";
}
if ($code) {
    $where_conditions[] = "code LIKE '%$code%'";
}
if ($serial) {
    $where_conditions[] = "serial LIKE '%$serial%'";
}
if ($status) {
    $where_conditions[] = "status = '$status'";
}
if ($date_start && $date_end) {
    $where_conditions[] = "`created_at` BETWEEN '$date_start 00:00:00' AND '$date_end 23:59:59'";
}
$where_clause = !empty($where_conditions) ? 'WHERE ' . implode(' AND ', $where_conditions) : '';

// Count total orders for pagination
$stats_query = "SELECT COUNT(*) as total_orders FROM `card_transactions` $where_clause";
$stats = $db->get_row($stats_query);
$total_orders = $stats['total_orders'] ?? 0;
$total_pages = ceil($total_orders / $items_per_page);

// Get transaction history
$transactions = $db->get_list("SELECT telco, amount, real_amount, status, message, created_at, fee, code, serial, request_id 
                               FROM card_transactions 
                               $where_clause 
                               ORDER BY created_at DESC LIMIT $offset, $items_per_page");

$fees = $charging_data['fees'] ?? [];
$default_telco = !empty($fees) ? array_key_first($fees) : '';
?>
<style>
    #real-amount {
        font-size: 1.5rem;
        text-align: center;
        color: #007bff;
        font-weight: bold;
        margin: 10px 0;
    }
</style>
<div class="main-content app-content">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Nạp thẻ cào</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Nạp thẻ cào</h1>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <div class="card custom-card">
                    <div class="card-header justify-content-between">
                        <div class="card-title"> Nạp thẻ cào tự động</div>
                    </div>
                    <div class="card-body p-3">
                        <form id="card-form" method="POST">
                            <div class="mb-3">
                                <label for="telco" class="form-label">Loại thẻ:</label>
                                <select class="form-select" id="telco" name="telco" required>
                                    <option value="">Chọn loại thẻ</option>
                                    <?php foreach ($fees as $telco => $fee): ?>
                                        <option value="<?php echo htmlspecialchars($telco); ?>" data-fee="<?php echo $fee; ?>" <?php echo $telco === $default_telco ? 'selected' : ''; ?>>
                                            <?php echo htmlspecialchars($telco); ?> (Chiết khấu: <?php echo $fee; ?>%)
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="amount" class="form-label">Mệnh giá:</label>
                                <select class="form-select" id="amount" name="amount" required>
                                    <option value="">Chọn mệnh giá</option>
                                    <option value="10000" selected>10,000 VNĐ</option>
                                    <option value="20000">20,000 VNĐ</option>
                                    <option value="50000">50,000 VNĐ</option>
                                    <option value="100000">100,000 VNĐ</option>
                                    <option value="200000">200,000 VNĐ</option>
                                    <option value="500000">500,000 VNĐ</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="code" class="form-label">Mã thẻ:</label>
                                <input type="text" class="form-control" id="code" name="code" placeholder="Nhập mã thẻ cào" required>
                            </div>
                            <div class="mb-3">
                                <label for="serial" class="form-label">Số seri:</label>
                                <input type="text" class="form-control" id="serial" name="serial" placeholder="Nhập số seri" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tổng thực nhận:</label>
                                <div id="real-amount" class="form-text text-primary fw-bold">0</div>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Nạp thẻ ngay</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card custom-card">
                    <div class="card-header justify-content-between">
                        <div class="card-title"> Lưu ý khi nạp thẻ cào:</div>
                    </div>
                    <div class="card-body p-3">
                        <ul class="list-unstyled">
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>Kiểm tra kỹ <strong>loại thẻ</strong> và <strong>mệnh giá</strong> trước khi nạp. Sai mệnh giá có thể dẫn đến mất thẻ.</li>
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>Nhập chính xác <strong>mã thẻ</strong> và <strong>số seri</strong>. Sai thông tin sẽ khiến giao dịch thất bại.</li>
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>Không sử dụng thẻ cào giả, hết hạn hoặc đã qua sử dụng.</li>
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>Thời gian xử lý giao dịch thường từ <strong>1-30 giây</strong>. Nếu quá 5 phút không nhận được kết quả, liên hệ hỗ trợ.</li>
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>Chiết khấu nạp thẻ dao động từ <strong>10-20%</strong> tùy loại thẻ và mệnh giá.</li>
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>Không chia sẻ thông tin thẻ cào qua các kênh không chính thức (Facebook, Zalo) để tránh lừa đảo.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card custom-card">
                    <div class="card-header justify-content-between">
                        <div class="card-title">Lịch sử giao dịch</div>
                    </div>
                    <div class="card-body p-3">
                        <form class="row g-3 mb-2" id="order-filter-form" method="GET" action="">
                            <div class="col-md-2">
                                <select class="form-select" name="telco" id="telco-select">
                                    <option value="">Chọn loại thẻ</option>
                                    <option value="VIETTEL" <?= $telcos == 'VIETTEL' ? 'selected' : '' ?>>Viettel</option>
                                    <option value="VINAPHONE" <?= $telcos == 'VINAPHONE' ? 'selected' : '' ?>>Vinaphone</option>
                                    <option value="MOBIFONE" <?= $telcos == 'MOBIFONE' ? 'selected' : '' ?>>Mobifone</option>
                                    <option value="VNMOBI" <?= $telcos == 'VNMOBI' ? 'selected' : '' ?>>Vietnamobile</option>
                                    <option value="ZING" <?= $telcos == 'ZING' ? 'selected' : '' ?>>Zing</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select class="form-select" name="amount" id="amount-select">
                                    <option value="" <?= empty($amount) ? 'selected' : '' ?>>Chọn mệnh giá</option>
                                    <option value="10000" <?= $amount == '10000' ? 'selected' : '' ?>>10,000 VNĐ</option>
                                    <option value="20000" <?= $amount == '20000' ? 'selected' : '' ?>>20,000 VNĐ</option>
                                    <option value="50000" <?= $amount == '50000' ? 'selected' : '' ?>>50,000 VNĐ</option>
                                    <option value="100000" <?= $amount == '100000' ? 'selected' : '' ?>>100,000 VNĐ</option>
                                    <option value="200000" <?= $amount == '200000' ? 'selected' : '' ?>>200,000 VNĐ</option>
                                    <option value="500000" <?= $amount == '500000' ? 'selected' : '' ?>>500,000 VNĐ</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <input type="text" class="form-control" name="code" id="code-input" placeholder="Mã thẻ" value="<?= htmlspecialchars($code) ?>">
                            </div>
                            <div class="col-md-2">
                                <input type="text" class="form-control" name="serial" id="serial-input" placeholder="Số seri" value="<?= htmlspecialchars($serial) ?>">
                            </div>
                            <div class="col-md-2">
                                <select class="form-select" name="status" id="status-select">
                                    <option value="" <?= empty($status) ? 'selected' : '' ?>>Chọn trạng thái</option>
                                    <option value="pending" <?= $status == 'pending' ? 'selected' : '' ?>>Đang chờ</option>
                                    <option value="success" <?= $status == 'success' ? 'selected' : '' ?>>Thành công</option>
                                    <option value="error" <?= $status == 'error' ? 'selected' : '' ?>>Thẻ lỗi</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <div class="input-group-text text-muted"><i class="ri-calendar-line"></i></div>
                                    <input type="text" class="form-control flatpickr-input" id="daterange" placeholder="Chọn thời gian" readonly="readonly" value="<?= $date_start && $date_end ? htmlspecialchars("$date_start to $date_end") : '' ?>">
                                    <input type="hidden" name="date_start" id="date_start" value="<?= htmlspecialchars($date_start) ?>">
                                    <input type="hidden" name="date_end" id="date_end" value="<?= htmlspecialchars($date_end) ?>">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary-gradient"><i class="bi bi-search me-1"></i>Tìm kiếm</button>
                                <button type="button" class="btn btn-danger-gradient" id="clear-filter"><i class="bi bi-x-circle me-1"></i>Bỏ lọc</button>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table class="table text-nowrap">
                                <thead>
                                    <tr>
                                        <th scope="col">Loại thẻ</th>
                                        <th scope="col">Mệnh giá</th>
                                        <th scope="col">Chiết khấu</th>
                                        <th scope="col">Thực nhận</th>
                                        <th scope="col">Mã thẻ</th>
                                        <th scope="col">Số seri</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($transactions)): ?>
                                        <tr>
                                            <td colspan="10" class="text-center">Chưa có giao dịch nào</td>
                                        </tr>
                                    <?php else: ?>
                                        <?php foreach ($transactions as $trans): ?>
                                            <tr>
                                                <td><?= htmlspecialchars($trans['telco']); ?></td>
                                                <td><?= formatCurrencyF($trans['amount']); ?></td>
                                                <td><?= $trans['fee'] ? number_format($trans['fee'], 2) . '%' : 'N/A'; ?></td>
                                                <td><?= formatCurrencyF($trans['real_amount']); ?></td>
                                                <td><?= $trans['code'] ?></td>
                                                <td><?= $trans['serial'] ?></td>
                                                <td><?= getStatusClass($trans['status']); ?></td>
                                                <td><?= htmlspecialchars($trans['created_at']); ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer border-top-0">
                        <div class="d-flex align-items-center">
                            <div>Showing <?= min($items_per_page, count($transactions)) ?> Entries <i class="bi bi-arrow-right ms-2 fw-semibold"></i></div>
                            <div class="ms-auto d-flex align-items-center gap-2">
                                <nav aria-label="Page navigation" class="pagination-style-4">
                                    <ul class="pagination mb-0">
                                        <li class="page-item <?= $page <= 1 ? 'disabled' : '' ?>">
                                            <a class="page-link" href="?page=<?= $page - 1 ?>&telco=<?= urlencode($telcos) ?>&amount=<?= urlencode($amount) ?>&code=<?= urlencode($code) ?>&serial=<?= urlencode($serial) ?>&status=<?= urlencode($status) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>">Prev</a>
                                        </li>
                                        <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                            <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                                                <a class="page-link" href="?page=<?= $i ?>&telco=<?= urlencode($telcos) ?>&amount=<?= urlencode($amount) ?>&code=<?= urlencode($code) ?>&serial=<?= urlencode($serial) ?>&status=<?= urlencode($status) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"><?= $i ?></a>
                                            </li>
                                        <?php endfor; ?>
                                        <li class="page-item <?= $page >= $total_pages ? 'disabled' : '' ?>">
                                            <a class="page-link text-primary" href="?page=<?= $page + 1 ?>&telco=<?= urlencode($telcos) ?>&amount=<?= urlencode($amount) ?>&code=<?= urlencode($code) ?>&serial=<?= urlencode($serial) ?>&status=<?= urlencode($status) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>">Next</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    // Khởi tạo Notiflix
    Notiflix.Notify.init();
    Notiflix.Confirm.init();

    $(document).ready(function() {
        // Hàm tính tổng thực nhận
        function calculateRealAmount() {
            const telco = $('#telco').find('option:selected');
            const fee = parseFloat(telco.data('fee')) || 0;
            const amount = parseFloat($('#amount').val()) || 0;
            const realAmount = amount * (1 - fee / 100);
            $('#real-amount').text($formatCurrency(realAmount));
        }

        // Tính tổng thực nhận ngay khi tải trang
        calculateRealAmount();

        // Cập nhật tổng thực nhận khi thay đổi nhà mạng hoặc mệnh giá
        $('#telco, #amount').on('change', calculateRealAmount);

        $('#card-form').on('submit', function(e) {
            e.preventDefault();

            // Hiển thị confirm dialog
            Notiflix.Confirm.show(
                'Xác nhận nạp thẻ',
                'Bạn có chắc muốn nạp thẻ này?',
                'Xác nhận',
                'Hủy',
                function() {
                    // Hiển thị loading
                    Notiflix.Loading.circle('Đang xử lý...');

                    // Thu thập dữ liệu form
                    var formData = $('#card-form').serialize();

                    // Gửi AJAX
                    $.ajax({
                        url: '/model/process_card',
                        type: 'POST',
                        dataType: "JSON",
                        data: formData,
                        success: function(response) {
                            Notiflix.Loading.remove();


                            if (response.status === 'success') {
                                Notiflix.Notify.success('Nạp thẻ thành công! Mệnh giá: ' + response.amount + ' VNĐ');
                                $('#message').html('<div class="alert alert-success">' + response.message + '</div>');
                                $('#card-form')[0].reset(); // Reset form
                                $('#real-amount').text('0 VNĐ'); // Reset tổng thực nhận
                                // Tải lại trang để cập nhật lịch sử giao dịch
                                setTimeout(() => location.reload(), 2000);
                            } else {
                                Notiflix.Notify.failure(response.message);
                                $('#message').html('<div class="alert alert-danger">' + response.message + '</div>');
                            }

                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server. Vui lòng thử lại.');
                            $('#message').html('<div class="alert alert-danger">Lỗi kết nối server. Vui lòng thử lại.</div>');
                        }
                    });
                },
                function() {
                    // Hủy confirm
                    Notiflix.Notify.info('Đã hủy nạp thẻ.');
                }
            );
        });
        // Xóa bộ lọc
        $('#clear-filter').on('click', function() {
            window.location.href = '?page=1';
        });
        // Khởi tạo flatpickr cho daterange
        flatpickr('#daterange', {
            mode: 'range',
            dateFormat: 'Y-m-d',
            defaultDate: [
                new Date(new Date().setDate(new Date().getDate() - 7)).toISOString().split('T')[0], // 7 ngày trước
                new Date().toISOString().split('T')[0] // Hôm nay
            ],
            onChange: function(selectedDates) {
                console.log('Selected dates:', selectedDates);
                if (selectedDates.length === 2) {
                    $('#date_start').val(selectedDates[0].toISOString().split('T')[0]);
                    $('#date_end').val(selectedDates[1].toISOString().split('T')[0]);
                } else if (selectedDates.length === 1) {
                    $('#date_start').val(selectedDates[0].toISOString().split('T')[0]);
                    $('#date_end').val(selectedDates[0].toISOString().split('T')[0]);
                }
            },
            onReady: function(selectedDates, dateStr, instance) {
                if (instance.selectedDates.length === 0) {
                    const defaultStart = new Date(new Date().setDate(new Date().getDate() - 7)).toISOString().split('T')[0];
                    const defaultEnd = new Date().toISOString().split('T')[0];
                    $('#date_start').val(defaultStart);
                    $('#date_end').val(defaultEnd);
                    instance.setDate([defaultStart, defaultEnd]);
                }
            }
        });
    });
</script>
<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php');
?>