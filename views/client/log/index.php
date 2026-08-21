<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Hoạt động đăng nhập - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<?php
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;

$ip = isset($_GET['ip']) ? Anti_xss($_GET['ip']) : '';
$date_start = isset($_GET['date_start']) ? Anti_xss($_GET['date_start']) : '';
$date_end = isset($_GET['date_end']) ? Anti_xss($_GET['date_end']) : '';

$where_conditions = ["user_id = '{$data_user['id']}'"];
if ($ip) {
    $where_conditions[] = "ip_address = '$ip'";
}
if ($date_start && $date_end) {
    $where_conditions[] = "created_at BETWEEN '$date_start 00:00:00' AND '$date_end 23:59:59'";
}
$where_clause = !empty($where_conditions) ? 'WHERE ' . implode(' AND ', $where_conditions) : '';

$stats_query = "SELECT COUNT(*) AS total_orders FROM `user_logins` $where_clause";
$stats = $db->get_row($stats_query);
$total_transactions = $stats['total_orders'] ?? 0;

$total_pages = ceil($total_transactions / $items_per_page);

$transactions = $db->get_list("
    SELECT *
    FROM `user_logins`
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
                        <li class="breadcrumb-item active" aria-current="page">Hoạt động đăng nhập</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Hoạt động đăng nhập</h1>
            </div>
        </div>

        <div class="row g-4 pulse-loader">
            <div class="col-xl-12">
                <div class="card custom-card">
                    <div class="card-header justify-content-between">
                        <div class="card-title"> Hoạt động đăng nhập</div>
                    </div>
                    <div class="card-body p-0">
                        <form class="row g-3 p-3" id="order-filter-form" method="GET" action="">
                            <div class="col-md-3">
                                <input class="form-control" placeholder="Địa chỉ IP" name="ip" value="<?= $ip ?>" />
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
                                <a href="/user/log" class="btn btn-danger-gradient" id="clear-filter"><i class="bi bi-x-circle me-1"></i>Bỏ lọc</a>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table class="table text-nowrap">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                     
                                        <th scope="col">IP</th>
                                        <th scope="col">KINH ĐỘ</th>
                                        <th scope="col">VĨ ĐỘ</th>
                                        <th scope="col">VỊ TRÍ</th>
                                        <th scope="col">QUỐC GIA</th>
                                        <th scope="col">THỜI GIAN</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($transactions)): ?>
                                        <?php foreach ($transactions as $transaction): ?>
                                            <tr>
                                                <td><span><?= $transaction['id'] ?></span></td>
                                                <td>
                                                    <ul>
                                                        <li>IP: <?= $transaction['ip_address'] ?></li>
                                                        <li>Trình duyệt: <?= $transaction['browser'] ?></li>
                                                        <li>Hệ điều hành: <?= $transaction['os'] ?></li>
                                                        <li>Thiết bị: <?= $transaction['get_device'] ?></li>
                                                    </ul>
                                                </td>
                                                <td><span><?= $transaction['longitude'] ?></span></td>
                                                <td><span><?= $transaction['latitude'] ?></span></td>
                                                <td><span><?= $transaction['location'] ?></span></td>
                                                <td><span><?= $transaction['country'] ?></span></td>
                                                <td><?= $transaction['created_at'] ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="7" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có hoạt động nào</p>
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
                                            <a class="page-link" href="?page=<?= $page - 1 ?>&ip=<?= urlencode($ip) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"> Prev </a>
                                        </li>
                                        <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                            <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                                                <a class="page-link" href="?page=<?= $i ?>&ip=<?= urlencode($ip) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"><?= $i ?></a>
                                            </li>
                                        <?php endfor; ?>
                                        <li class="page-item <?= $page >= $total_pages ? 'disabled' : '' ?>">
                                            <a class="page-link text-primary" href="?page=<?= $page + 1 ?>&ip=<?= urlencode($ip) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"> Next </a>
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