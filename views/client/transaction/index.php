<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Giao dịch - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<?php
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;

$trx_id = isset($_GET['trx_id']) ? Anti_xss($_GET['trx_id']) : '';
$remarks = isset($_GET['remarks']) ? Anti_xss($_GET['remarks']) : '';
$trx_type = isset($_GET['trx_type']) ? Anti_xss($_GET['trx_type']) : '';
$date_start = isset($_GET['date_start']) ? Anti_xss($_GET['date_start']) : '';
$date_end = isset($_GET['date_end']) ? Anti_xss($_GET['date_end']) : '';

$where_conditions = ["user_id = '{$data_user['id']}'"];
if ($trx_id) {
    $where_conditions[] = "trx_id = '$trx_id'";
}
if ($remarks) {
    $where_conditions[] = "remarks = '$remarks'";
}
if ($trx_type) {
    $where_conditions[] = "trx_type = '$trx_type'";
}
if ($date_start && $date_end) {
    $where_conditions[] = "created_at BETWEEN '$date_start 00:00:00' AND '$date_end 23:59:59'";
}
$where_clause = !empty($where_conditions) ? 'WHERE ' . implode(' AND ', $where_conditions) : '';

$stats_query = "SELECT COUNT(*) AS total_orders FROM `transactions` $where_clause";
$stats = $db->get_row($stats_query);
$total_transactions = $stats['total_orders'] ?? 0;

$total_pages = ceil($total_transactions / $items_per_page);

$transactions = $db->get_list("
    SELECT *
    FROM `transactions`
    $where_clause
    ORDER BY id DESC 
    LIMIT $offset, $items_per_page
");
?>
<div class="main-content app-content new_order">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Giao dịch</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Lịch sử giao dịch</h1>
            </div>
        </div>

        <div class="row g-4 pulse-loader">
            <div class="col-xl-12">
                <div class="card custom-card">
                    <div class="card-header justify-content-between">
                        <div class="card-title"> Lịch sử giao dịch</div>
                    </div>
                    <div class="card-body p-0">
                        <form class="row g-3 p-3" id="order-filter-form" method="GET" action="">
                            <div class="col-md-3">
                                <input class="form-control" placeholder="Mã giao dịch" name="trx_id" value="<?=$trx_id?>" />
                            </div>
                            <div class="col-md-3">
                                <input class="form-control" placeholder="Nội dung" name="remarks" value="<?=$remarks?>" />
                            </div>
                             <div class="col-md-3">
                                <select class="js-example-placeholder-single form-control" name="trx_type" id="status-select">
                                    <option value="" <?= empty($trx_type) ? 'selected' : '' ?>>Loại giao dịch</option>
                                    <option value="-" <?= $trx_type == '-' ? 'selected' : '' ?>>Trừ tiền</option>
                                    <option value="+" <?= $trx_type == '+' ? 'selected' : '' ?>>Cộng tiền</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-text text-muted"><i class="ri-calendar-line"></i></div>
                                        <input type="text" class="form-control flatpickr-input" id="daterange" placeholder="Chọn mốc thời gian" readonly="readonly" value="<?= $date_start && $date_end ? htmlspecialchars("$date_start to $date_end") : '' ?>">
                                        <input type="hidden" name="date_start" id="date_start" value="<?= htmlspecialchars($date_start) ?>">
                                        <input type="hidden" name="date_end" id="date_end" value="<?= htmlspecialchars($date_end) ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-primary-gradient"><i class="bi bi-search me-1"></i>Tìm kiếm</button>
                                <a href="/user/transaction" class="btn btn-danger-gradient" id="clear-filter"><i class="bi bi-x-circle me-1"></i>Bỏ lọc</a>
                            </div>

                        </form>
                       
                        <div class="table-responsive">
                            <table class="table text-nowrap">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Mã giao dịch</th>
                                        <th scope="col">Số tiền</th>
                                        <th scope="col">Loại</th>
                                        <th scope="col">Nội dung</th>
                                        <th scope="col">Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($transactions)): ?>
                                        <?php foreach ($transactions as $transaction): ?>
                                            <tr>
                                                <td><?= htmlspecialchars($transaction['id']) ?></td>
                                                <td><?= htmlspecialchars($transaction['trx_id']) ?></td>
                                                <td><?= formatCurrencyF($transaction['amount']) ?></td>
                                                <td><?= htmlspecialchars($transaction['trx_type']) == '+' ? '<span class="badge bg-success-gradient">Cộng</span>':'<span class="badge bg-danger-gradient">Trừ</span>' ?></td>
                                                <td><?= htmlspecialchars($transaction['remarks'] ?? 'N/A') ?></td>
                                                <td><?= htmlspecialchars($transaction['created_at'] ?? 'N/A') ?></td>
                                               
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="6" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có giao dịch nào</p>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer border-top-0">
                        <div class="d-flex align-items-center">
                            <div> Showing <?= min($items_per_page, count($transactions)) ?> Entries <i class="bi bi-arrow-right ms-2 fw-semibold"></i> </div>
                            <div class="ms-auto d-flex align-items-center gap-2">
                                <nav aria-label="Page navigation" class="pagination-style-4">
                                    <ul class="pagination mb-0">
                                        <li class="page-item <?= $page <= 1 ? 'disabled' : '' ?>">
                                            <a class="page-link" href="?page=<?= $page - 1 ?>&trx_type=<?= urlencode($trx_type) ?>&trx_id=<?= urlencode($trx_id) ?>&remarks=<?= urlencode($remarks) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"> Prev </a>
                                        </li>
                                        <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                            <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                                                <a class="page-link" href="?page=<?= $i ?>&trx_type=<?= urlencode($trx_type) ?>&trx_id=<?= urlencode($trx_id) ?>&remarks=<?= urlencode($remarks) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"><?= $i ?></a>
                                            </li>
                                        <?php endfor; ?>
                                        <li class="page-item <?= $page >= $total_pages ? 'disabled' : '' ?>">
                                            <a class="page-link text-primary" href="?page=<?= $page + 1 ?>&trx_type=<?= urlencode($trx_type) ?>&trx_id=<?= urlencode($trx_id) ?>&remarks=<?= urlencode($remarks) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"> Next </a>
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
    $(document).ready(function() {
        Notiflix.Notify.init();
        Notiflix.Confirm.init({
            titleColor: '#ff5549',
            okButtonBackground: '#ff5549',
            cancelButtonBackground: '#a9a9a9'
        });
        $("#daterange").flatpickr({
            mode: "range",
            dateFormat: "Y-m-d",
            onChange: function(selectedDates, dateStr, instance) {
                if (selectedDates.length === 2) {
                    $('#date_start').val(instance.formatDate(selectedDates[0], 'Y-m-d'));
                    $('#date_end').val(instance.formatDate(selectedDates[1], 'Y-m-d'));
                }
            }
        });
    });
</script>

<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>