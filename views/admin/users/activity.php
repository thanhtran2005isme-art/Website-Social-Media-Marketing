<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;
$username = isset($_GET['username']) ? Anti_xss($_GET['username']) : ''; // Add username
$ip = isset($_GET['ip']) ? Anti_xss($_GET['ip']) : ''; // Add IP
$start_date = isset($_GET['start_date']) ? Anti_xss($_GET['start_date']) : '';
$end_date = isset($_GET['end_date']) ? Anti_xss($_GET['end_date']) : '';
if (!empty($start_date) && !preg_match('/^\d{4}-\d{2}-\d{2}$/', $start_date)) {
    $start_date = '';
}
if (!empty($end_date) && !preg_match('/^\d{4}-\d{2}-\d{2}$/', $end_date)) {
    $end_date = '';
}
$where = [];
if (!empty($username)) {
    $where[] = "u.username LIKE '%$username%'"; // Search by username
}
if (!empty($ip)) {
    $where[] = "t.ip_address LIKE '%$ip%'"; // Search by IP
}
if (!empty($start_date)) {
    $where[] = "t.created_at >= '$start_date 00:00:00'";
}
if (!empty($end_date)) {
    $where[] = "t.created_at <= '$end_date 23:59:59'";
}

$where_clause = !empty($where) ? "WHERE " . implode(" AND ", $where) : "";

$total_transactions = $db->get_row("SELECT COUNT(*) as total FROM `user_logins` t LEFT JOIN `users` u ON t.user_id = u.id $where_clause")['total'];
$total_pages = ceil($total_transactions / $items_per_page);
$transactions = $db->get_list("SELECT t.*, u.username, u.email,u.image,u.lastname,u.firstname FROM `user_logins` t LEFT JOIN `users` u ON t.user_id = u.id $where_clause ORDER BY t.id DESC LIMIT $offset, $items_per_page");
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Quản lý đăng nhập</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý đăng nhập</a></li>
        </ol>

    </div>
    <div class="container-fluid">

        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Lịch sử đăng nhập</h4>
                        <div class="clearfix">
                            <div class="dropdown">
                                <button type="button" class="btn btn-secondary w-100" id="dropdownMenuClickable" data-bs-auto-close="false" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-filter me-1"></i> Tìm kiếm </button>
                                <div class="dropdown-menu dropdown-menu-sm-end dropdown-card card-dropdown-filter-centered filter_dropdown" aria-labelledby="dropdownMenuClickable">
                                    <div class="card">
                                        <div class="card-header card-header-content-between">
                                            <h5 class="card-header-title">Tìm kiếm</h5>
                                            <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm ms-2" id="filter_close_btn">
                                                <i class="fa fa-close"></i>
                                            </button>
                                        </div>

                                        <div class="card-body">
                                            <form action="" method="GET">
                                                <div class="row">
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">Người dùng</span>
                                                        <input type="text" class="form-control" name="username" value="<?= $username ?>" autocomplete="off">
                                                    </div>
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">IP</span>
                                                        <input type="text" class="form-control" name="ip" value="<?= $ip ?>" autocomplete="off">
                                                    </div>
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">Từ ngày</span>
                                                        <input type="date" class="form-control" name="start_date" value="<?= $start_date ?>">
                                                    </div>
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">Đến ngày</span>
                                                        <input type="date" class="form-control" name="end_date" value="<?= $end_date ?>">
                                                    </div>
                                                </div>
                                                <div class="d-grid">
                                                    <button type="submit" id="filter_button" class="btn btn-primary mb-3">Tìm kiếm</button>
                                                    <a href="/admin/users/activity" type="button" id="filter_button" class="btn btn-danger">Bỏ lọc</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-card-body px-0 pt-0 pb-2 p-3">
                        <div class="table-responsive">
                            <table id="employeesTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="mw-120">ID</th>
                                        <th class="mw-150">NGƯỜI DÙNG</th>
                                        <th class="mw-150">IP</th>
                                        <th class="mw-150">KINH ĐỘ</th>
                                        <th class="mw-150">VĨ ĐỘ</th>
                                        <th class="mw-150">VỊ TRÍ</th>
                                        <th class="mw-150">QUỐC GIA</th>
                                        <th class="mw-150">THỜI GIAN</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($transactions)): ?>
                                        <?php foreach ($transactions as $transaction): ?>
                                            <tr data-id="<?= $transaction['id'] ?>">
                                                <td><span><?= $transaction['id'] ?></span></td>

                                                <td>
                                                    <div class="d-flex">
                                                        <img src="<?= empty($transaction['image']) ? '/assets/images/default.png' : $transaction['image'] ?>" class="avatar avatar-sm me-2" alt="">
                                                        <div class="clearfix">
                                                            <h6 class="mb-0"><?= $transaction['lastname'] . ' ' . $transaction['firstname'] ?></h6>
                                                            <small>@<?= $transaction['username'] ?></small>
                                                        </div>
                                                    </div>
                                                </td>
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
                                            <td colspan="6" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có danh mục nào được tạo</p>
                                            </td>
                                        </tr>
                                    <?php endif; ?>

                                </tbody>
                            </table>
                        </div>
                        <?php if ($total_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page > 1): ?>
                                    <a href="?page=<?php echo $page - 1; ?>&username=<?= $username ?>&ip=<?= $ip ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                    <a href="?page=<?php echo $i; ?>&username=<?= $username ?>&ip=<?= $ip ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="<?php echo $i === $page ? 'active' : ''; ?>">
                                        <?php echo $i; ?>
                                    </a>
                                <?php endfor; ?>
                                <?php if ($page < $total_pages): ?>
                                    <a href="?page=<?php echo $page + 1; ?>&username=<?= $username ?>&ip=<?= $ip ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>