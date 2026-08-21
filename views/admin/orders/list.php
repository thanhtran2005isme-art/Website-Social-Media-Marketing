<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;
$username = isset($_GET['username']) ? Anti_xss($_GET['username']) : '';
$service_id = isset($_GET['service_id']) && is_numeric($_GET['service_id']) ? (int)$_GET['service_id'] : '';
$status = isset($_GET['status']) ? Anti_xss($_GET['status']) : '';
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
    $where[] = "u.username LIKE '%$username%'";
}
if (!empty($service_id)) {
    $where[] = "t.service_id = $service_id";
}
if (!empty($status)) {
    $where[] = "t.status = '$status'";
}
if (!empty($start_date)) {
    $where[] = "t.created_at >= '$start_date 00:00:00'";
}
if (!empty($end_date)) {
    $where[] = "t.created_at <= '$end_date 23:59:59'";
}

$where_clause = !empty($where) ? "WHERE " . implode(" AND ", $where) : "";

$not_started = $db->get_row("SELECT COUNT(*) as total FROM `orders` WHERE status = 'pending'")['total'];
$in_progress = $db->get_row("SELECT COUNT(*) as total FROM `orders` WHERE status = 'processing'")['total']; // Fixed syntax
$testing = $db->get_row("SELECT COUNT(*) as total FROM `orders` WHERE status = 'processing'")['total']; // Adjust if needed
$awaiting = $db->get_row("SELECT COUNT(*) as total FROM `orders` WHERE status = 'pending' AND created_at < NOW() - INTERVAL 1 DAY")['total'];
$complete = $db->get_row("SELECT COUNT(*) as total FROM `orders` WHERE status = 'completed'")['total'];
$pending = $db->get_row("SELECT COUNT(*) as total FROM `orders` WHERE status = 'pending'")['total'];
$refund = $db->get_row("SELECT COUNT(*) as total FROM `orders` WHERE status = 'refund'")['total']; // Added
$cancelled = $db->get_row("SELECT COUNT(*) as total FROM `orders` WHERE status = 'cancelled'")['total']; // Added

$total_transactions = $db->get_row("SELECT COUNT(*) as total FROM `orders` t LEFT JOIN `users` u ON t.user_id = u.id $where_clause")['total'];
$total_pages = ceil($total_transactions / $items_per_page);
$transactions = $db->get_list("SELECT t.*, u.username, u.email, u.image, u.lastname, u.firstname, s.service_title, p.api_name as provider_name, p.id as provider_id
                               FROM `orders` t 
                               LEFT JOIN `users` u ON t.user_id = u.id 
                               LEFT JOIN `services` s ON t.service_id = s.api_service_id AND t.service_id = s.id 
                               LEFT JOIN `api_providers` p ON s.api_provider_id = p.id
                               $where_clause 
                               ORDER BY t.id DESC 
                               LIMIT $offset, $items_per_page");
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Quản lý đơn hàng</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý đơn hàng</a></li>
        </ol>

    </div>
    <div class="container-fluid">

        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body overflow-hidden">
                        <div class="row gx-5 gy-3">
                            <div class="col-xl-2 col-sm-4 col-6 border-end">
                                <div class="d-flex align-items-center">
                                    <h2 class="text-primary my-0 fs-3 me-2"><?= $not_started ?></h2>
                                    <span class="text-secondary fw-medium fs-5">Chưa bắt đầu</span>
                                </div>
                                <span style="direction: ltr;">Tasks</span>
                            </div>
                            <div class="col-xl-2 col-sm-4 col-6 border-end">
                                <div class="d-flex align-items-center">
                                    <h2 class="text-purple my-0 fs-3 me-2"><?= $in_progress ?></h2>
                                    <span class="text-secondary fw-medium fs-5">Đang chạy</span>
                                </div>
                                <span style="direction: ltr;">Tasks</span>
                            </div>
                            <div class="col-xl-2 col-sm-4 col-6 border-end">
                                <div class="d-flex align-items-center">
                                    <h2 class="text-warning my-0 fs-3 me-2"><?= $testing ?></h2>
                                    <span class="text-secondary fw-medium fs-5">Đang kiểm tra</span>
                                </div>
                                <span style="direction: ltr;">Tasks</span>
                            </div>
                            <div class="col-xl-2 col-sm-4 col-6 border-end">
                                <div class="d-flex align-items-center">
                                    <h2 class="text-danger my-0 fs-3 me-2"><?= $awaiting ?></h2>
                                    <span class="text-secondary fw-medium fs-5">Đang chờ</span>
                                </div>
                                <span style="direction: ltr;">Tasks</span>
                            </div>
                            <div class="col-xl-2 col-sm-4 col-6 border-end">
                                <div class="d-flex align-items-center">
                                    <h2 class="text-success my-0 fs-3 me-2"><?= $complete ?></h2>
                                    <span class="text-secondary fw-medium fs-5">Hoàn thành</span>
                                </div>
                                <span style="direction: ltr;">Tasks</span>
                            </div>
                            <div class="col-xl-2 col-sm-4 col-6 border-end">
                                <div class="d-flex align-items-center">
                                    <h2 class="text-danger my-0 fs-3 me-2"><?= $pending ?></h2>
                                    <span class="text-secondary fw-medium fs-5">Đang chờ</span>
                                </div>
                                <span style="direction: ltr;">Tasks</span>
                            </div>
                            <div class="col-xl-2 col-sm-4 col-6 border-end">
                                <div class="d-flex align-items-center">
                                    <h2 class="text-info my-0 fs-3 me-2"><?= $refund ?></h2>
                                    <span class="text-secondary fw-medium fs-5">Hoàn tiền</span>
                                </div>
                                <span style="direction: ltr;">Tasks</span>
                            </div>
                            <div class="col-xl-2 col-sm-4 col-6">
                                <div class="d-flex align-items-center">
                                    <h2 class="text-danger my-0 fs-3 me-2"><?= $cancelled ?></h2>
                                    <span class="text-secondary fw-medium fs-5">Đã hủy</span>
                                </div>
                                <span style="direction: ltr;">Tasks</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Danh sách đơn hàng</h4>
                        <div class="ms-auto d-flex align-items-center">
                            <button type="button" class="btn btn-primary btn-sm me-2" id="bulkUpdateBtn" disabled>Cập nhật đã chọn</button>
                            <button type="button" class="btn btn-danger btn-sm me-2" id="bulkDeleteBtn" disabled>Xóa đã chọn</button>
                            <div class="dropdown">
                                <button type="button" class="btn btn-secondary btn-sm w-100" id="dropdownMenuClickable" data-bs-auto-close="false" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-filter me-1"></i> Tìm kiếm </button>
                                <div class="dropdown-menu dropdown-menu-sm-end dropdown-card card-dropdown-filter-centered filter_dropdown" aria-labelledby="dropdownMenuClickable">
                                    <div class="card">
                                        <div class="card-header card-header-content-between">
                                            <h5 class="card-header-title">Tìm kiếm dịch vụ</h5>
                                            <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm ms-2" id="filter_close_btn">
                                                <i class="fa fa-close"></i>
                                            </button>
                                        </div>

                                        <div class="card-body">
                                            <form action="" method="GET">
                                                <div class="row">
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">Tài khoản</span>
                                                        <input type="text" class="form-control" name="username" value="<?= $username ?>" autocomplete="off">
                                                    </div>
                                                    <div class="col-12 mb-4">
                                                        <label class="form-label">Dịch vụ</label>
                                                        <select name="service_id" id="service_select" class="form-select select2">
                                                            <option value="">Tất cả</option>
                                                            <?php foreach ($db->get_list("SELECT * FROM `services` WHERE `service_status` = 1 ORDER BY `id` DESC") as $service): ?>
                                                                <option value="<?= $service['id'] ?>" <?= $service_id == $service['id'] ? 'selected' : '' ?>><?= $service['service_title'] ?></option>
                                                            <?php endforeach; ?>
                                                        </select>
                                                    </div>
                                                    <div class="col-12 mb-4">
                                                        <label class="form-label">Trạng thái</label>
                                                        <select name="status" class="selectpicker form-select">
                                                            <option value="">Tất cả</option>
                                                            <option value="pending" <?= $status == 'pending' ? 'selected' : '' ?>>Đang chờ</option>
                                                            <option value="processing" <?= $status == 'processing' ? 'selected' : '' ?>>Đang chạy</option>
                                                            <option value="completed" <?= $status == 'completed' ? 'selected' : '' ?>>Hoàn thành</option>
                                                            <option value="cancelled" <?= $status == 'cancelled' ? 'selected' : '' ?>>Bị huỷ</option>
                                                            <option value="refund" <?= $status == 'refund' ? 'selected' : '' ?>>Hoàn tiền</option>
                                                        </select>
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
                                                    <a href="/admin/orders/list" type="button" id="filter_button" class="btn btn-danger">Bỏ lọc</a>
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
                                        <th class="mw-50"><input class="form-check-input" type="checkbox" id="selectAll"></th>
                                        <th class="mw-120">ID</th>
                                        <th class="mw-150">NGƯỜI DÙNG</th>
                                        <th class="mw-150">CHI TIẾT ĐƠN HÀNG</th>
                                        <th class="mw-150">PHẢN HỒI API</th>
                                        <th class="mw-150">NHÀ CUNG CẤP</th>
                                        <th class="mw-150">TRẠNG THÁI</th>
                                        <th class="mw-150">THỜI GIAN</th>
                                        <th class="mw-150">THAO TÁC</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($transactions)): ?>
                                        <?php foreach ($transactions as $transaction): ?>
                                            <tr data-id="<?= $transaction['id'] ?>">
                                                <td><input type="checkbox" class="orderCheckbox form-check-input" value="<?= $transaction['id'] ?>"></td>
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
                                                    <div class="accordion" id="accordionOrder<?= $transaction['id'] ?>">
                                                        <div class="accordion-item">
                                                            <h2 class="accordion-header" id="heading<?= $transaction['id'] ?>">
                                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<?= $transaction['id'] ?>" aria-expanded="false" aria-controls="collapse<?= $transaction['id'] ?>">
                                                                    <strong><?= htmlspecialchars($transaction['service_title'] ?? 'N/A') ?></strong>
                                                                </button>
                                                            </h2>
                                                            <div id="collapse<?= $transaction['id'] ?>" class="accordion-collapse collapse" aria-labelledby="heading<?= $transaction['id'] ?>" data-bs-parent="#accordionOrder<?= $transaction['id'] ?>">
                                                                <div class="accordion-body">
                                                                    <div style="display: flex; flex-direction: column; gap: 6px;">
                                                                        <span><strong>API ORDER ID:</strong> <span style="color:rgb(2, 78, 2);"><?= htmlspecialchars($transaction['api_order_id'] ?? 'N/A') ?></span></span>
                                                                        <span><strong>Liên kết:</strong> <a href="<?= htmlspecialchars($transaction['link'] ?? '#') ?>" style="color: #00B7EB; word-break: break-all;" target="_blank"><?= htmlspecialchars($transaction['link'] ?? 'N/A') ?></a></span>
                                                                        <span><strong>Số lượng:</strong> <span style="color: #32CD32;"><?= htmlspecialchars($transaction['quantity'] ?? 'N/A') ?></span></span>
                                                                        <span><strong>Bắt đầu từ:</strong> <span style="color: #606060;"><?= htmlspecialchars($transaction['start_counter'] ?? 'N/A') ?></span></span>
                                                                        <span><strong>Còn lại:</strong> <span style="color: #FF4500;"><?= htmlspecialchars($transaction['remains'] ?? 'N/A') ?></span></span>
                                                                        <span><strong>Thanh toán:</strong> <span style="color:rgb(19, 1, 79);"><?= format_cash($transaction['price']) ?>đ</span></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <span style="color:rgb(232, 33, 56) !important;"><?= htmlspecialchars($transaction['status_description'] ?? 'N/A') ?></span>
                                                </td>
                                                <td>
                                                    <span style="color: #2F4F4F !important;"><?= htmlspecialchars($transaction['provider_name'] ?? 'N/A') ?> [ID: <?= htmlspecialchars($transaction['provider_id'] ?? 'N/A') ?>]</span>
                                                </td>
                                                <td><?= display_service_admin(htmlspecialchars($transaction['status'] ?? 'N/A')) ?></td>
                                                <td><?= $transaction['created_at'] ?></td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-sm update-btn" data-id="<?= $transaction['id'] ?>" data-status="<?= $transaction['status'] ?>">
                                                        <i class="fas fa-sync-alt"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-info btn-sm details-btn"
                                                        data-id="<?= $transaction['id'] ?>"
                                                        data-service="<?= htmlspecialchars($transaction['service_title'] ?? 'N/A') ?>"
                                                        data-link="<?= htmlspecialchars($transaction['link'] ?? 'N/A') ?>"
                                                        data-quantity="<?= htmlspecialchars($transaction['quantity'] ?? 'N/A') ?>"
                                                        data-start_counter="<?= htmlspecialchars($transaction['start_counter'] ?? 'N/A') ?>"
                                                        data-remains="<?= htmlspecialchars($transaction['remains'] ?? 'N/A') ?>"
                                                        data-status="<?= htmlspecialchars($transaction['status'] ?? 'N/A') ?>"
                                                        data-bs-toggle="modal" data-bs-target="#orderModal">
                                                        <i class="fas fa-eye"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-danger btn-sm delete-btn" data-id="<?= $transaction['id'] ?>">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="8" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có đơn hàng nào</p>
                                            </td>
                                        </tr>
                                    <?php endif; ?>

                                </tbody>
                            </table>
                        </div>
                        <?php if ($total_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page > 1): ?>
                                    <a href="?page=<?php echo $page - 1; ?>&username=<?= $username ?>&service_id=<?= $service_id ?>&status=<?= $status ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>

                                <?php
                                $range = 2;
                                $show_ellipsis = $total_pages > 7;

                                if ($page == 1) {
                                    echo '<a href="?page=1&username=' . $username . '&service_id=' . $service_id . '&status=' . $status . '&start_date=' . $start_date . '&end_date=' . $end_date . '" class="active">1</a>';
                                } else {
                                    echo '<a href="?page=1&username=' . $username . '&service_id=' . $service_id . '&status=' . $status . '&start_date=' . $start_date . '&end_date=' . $end_date . '">1</a>';
                                }

                                if ($show_ellipsis && $page > ($range + 2)) {
                                    echo '<span class="ellipsis">...</span>';
                                }

                                for ($i = max(2, $page - $range); $i <= min($total_pages - 1, $page + $range); $i++) {
                                    if ($i == $page) {
                                        echo '<a href="?page=' . $i . '&username=' . $username . '&service_id=' . $service_id . '&status=' . $status . '&start_date=' . $start_date . '&end_date=' . $end_date . '" class="active">' . $i . '</a>';
                                    } else {
                                        echo '<a href="?page=' . $i . '&username=' . $username . '&service_id=' . $service_id . '&status=' . $status . '&start_date=' . $start_date . '&end_date=' . $end_date . '">' . $i . '</a>';
                                    }
                                }

                                if ($show_ellipsis && $page < ($total_pages - $range - 1)) {
                                    echo '<span class="ellipsis">...</span>';
                                }

                                if ($total_pages > 1) {
                                    if ($page == $total_pages) {
                                        echo '<a href="?page=' . $total_pages . '&username=' . $username . '&service_id=' . $service_id . '&status=' . $status . '&start_date=' . $start_date . '&end_date=' . $end_date . '" class="active">' . $total_pages . '</a>';
                                    } else {
                                        echo '<a href="?page=' . $total_pages . '&username=' . $username . '&service_id=' . $service_id . '&status=' . $status . '&start_date=' . $start_date . '&end_date=' . $end_date . '">' . $total_pages . '</a>';
                                    }
                                }
                                ?>
                                <?php if ($page < $total_pages): ?>
                                    <a href="?page=<?php echo $page + 1; ?>&username=<?= $username ?>&service_id=<?= $service_id ?>&status=<?= $status ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderModalLabel">Chi tiết đơn hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="orderEditForm">
                    <input type="hidden" name="id" id="order_id">
                    <div class="mb-3">
                        <label class="form-label">Mã đơn hàng</label>
                        <input type="text" class="form-control" id="order_id_display" disabled>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Dịch vụ</label>
                        <input type="text" class="form-control" id="order_service" disabled>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Link</label>
                        <input type="text" class="form-control" name="link" id="order_link">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số lượng</label>
                        <input type="number" class="form-control" name="quantity" id="order_quantity">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Start Counter</label>
                        <input type="text" class="form-control" name="start_counter" id="order_start_counter">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Remains</label>
                        <input type="text" class="form-control" name="remains" id="order_remains">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Trạng thái</label>
                        <select class="form-control" name="status" id="order_status">
                            <option value="pending">Đang chờ</option>
                            <option value="processing">Đang chạy</option>
                            <option value="completed">Hoàn thành</option>
                            <option value="cancelled">Bị huỷ</option>
                            <option value="refund">Hoàn tiền</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" id="saveOrderBtn">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        // Initialize Select2 with Bootstrap 5 theme
        $('.select2').select2({
            placeholder: "Chọn một tùy chọn",
            allowClear: true,
            width: '100%'
        });

        // Select All Checkbox
        $('#selectAll').on('change', function() {
            $('.orderCheckbox').prop('checked', $(this).prop('checked'));
            toggleBulkButtons();
        });

        // Individual Checkbox Change
        $('.orderCheckbox').on('change', function() {
            if ($('.orderCheckbox:checked').length === $('.orderCheckbox').length) {
                $('#selectAll').prop('checked', true);
            } else {
                $('#selectAll').prop('checked', false);
            }
            toggleBulkButtons();
        });

        // Enable/Disable Bulk Action Buttons
        function toggleBulkButtons() {
            const selectedCount = $('.orderCheckbox:checked').length;
            if (selectedCount > 0) {
                $('#bulkDeleteBtn').prop('disabled', false);
                $('#bulkUpdateBtn').prop('disabled', false);
                $('#bulkStatus').prop('disabled', false);
            } else {
                $('#bulkDeleteBtn').prop('disabled', true);
                $('#bulkUpdateBtn').prop('disabled', true);
                $('#bulkStatus').prop('disabled', true);
            }
        }

        // Bulk Delete
        $('#bulkDeleteBtn').on('click', function() {
            const selectedIds = $('.orderCheckbox:checked').map(function() {
                return $(this).val();
            }).get();

            if (selectedIds.length === 0) {
                Notiflix.Notify.warning('Vui lòng chọn ít nhất một đơn hàng');
                return;
            }

            Notiflix.Confirm.show(
                'Xác nhận xóa',
                `Bạn có chắc chắn muốn xóa ${selectedIds.length} đơn hàng đã chọn?`,
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/delete',
                        type: 'POST',
                        data: {
                            action: 'bulkDeleteOrders',
                            ids: selectedIds
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Xóa đơn hàng thành công');
                                $('.orderCheckbox:checked').each(function() {
                                    $(this).closest('tr').fadeOut(300, function() {
                                        $(this).remove();
                                    });
                                });
                                if ($('#employeesTable tbody tr').length === selectedIds.length) {
                                    $('#employeesTable tbody').html(`
                                    <tr>
                                        <td colspan="8" class="py-3 px-4 text-center text-dark">
                                            <img src="/assets/images/empty.png" width="100" />
                                            <p>Chưa có đơn hàng nào</p>
                                        </td>
                                    </tr>
                                `);
                                }
                                toggleBulkButtons();
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi xóa');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {
                    // Do nothing
                }
            );
        });

        // Bulk Update
        $('#bulkUpdateBtn').on('click', function() {
            const selectedIds = $('.orderCheckbox:checked').map(function() {
                return $(this).val();
            }).get();

            if (selectedIds.length === 0) {
                Notiflix.Notify.warning('Vui lòng chọn ít nhất một đơn hàng');
                return;
            }


            Notiflix.Confirm.show(
                'Xác nhận cập nhật',
                `Bạn có chắc chắn muốn cập nhật trạng thái của ${selectedIds.length} đơn hàng"?`,
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/order/update',
                        type: 'POST',
                        data: {
                            order_ids: selectedIds
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Cập nhật đơn hàng thành công');
                                setTimeout(() => location.reload(), 1000);
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi cập nhật');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {
                    // Do nothing
                }
            );
        });
        // Update Button with Notiflix Confirm
        $('.update-btn').on('click', function() {
            const id = $(this).data('id');
            Notiflix.Confirm.show(
                'Xác nhận cập nhật',
                'Bạn có chắc chắn muốn cập nhật trạng thái đơn hàng này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/order/update',
                        type: 'POST',
                        data: {
                            order_id: id
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Cập nhật đơn hàng thành công');
                                setTimeout(() => location.reload(), 1000);
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi cập nhật');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {
                    // Do nothing on cancel
                }
            );
        });

        // Details/Edit Button to Populate Modal
        $('.details-btn').on('click', function() {
            const id = $(this).data('id');
            const service = $(this).data('service');
            const link = $(this).data('link');
            const quantity = $(this).data('quantity');
            const start_counter = $(this).data('start_counter');
            const remains = $(this).data('remains');
            const status = $(this).data('status');

            $('#order_id').val(id);
            $('#order_id_display').val(id);
            $('#order_service').val(service);
            $('#order_link').val(link);
            $('#order_quantity').val(quantity);
            $('#order_start_counter').val(start_counter);
            $('#order_remains').val(remains);
            $('#order_status').val(status);
        });

        // Save Changes in Modal
        $('#saveOrderBtn').on('click', function() {
            const formData = $('#orderEditForm').serialize();
            Notiflix.Confirm.show(
                'Xác nhận lưu thay đổi',
                'Bạn có chắc chắn muốn lưu các thay đổi này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/order/edit',
                        type: 'POST',
                        data: formData,
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Cập nhật đơn hàng thành công');
                                $('#orderModal').modal('hide');
                                setTimeout(() => location.reload(), 1000);
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi cập nhật');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {
                    // Do nothing on cancel
                }
            );
        });

        // Delete Button with Notiflix Confirm
        $('.delete-btn').on('click', function() {
            const id = $(this).data('id');
            const row = $(this).closest('tr');
            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa đơn hàng này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/delete',
                        type: 'POST',
                        data: {
                            id: id,
                            action: 'deleteOrder'
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Xóa đơn hàng thành công');
                                row.fadeOut(300, function() {
                                    $(this).remove();
                                    if ($('#employeesTable tbody tr').length === 0) {
                                        $('#employeesTable tbody').html(`
                                        <tr>
                                            <td colspan="6" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có đơn hàng nào</p>
                                            </td>
                                        </tr>
                                    `);
                                    }
                                });
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi xóa');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {
                    // Do nothing on cancel
                }
            );
        });
    });
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>