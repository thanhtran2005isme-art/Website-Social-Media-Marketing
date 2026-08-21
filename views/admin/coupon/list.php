<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>

<?php
// Xử lý thêm coupon mới
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['code']) && !isset($_POST['edit_id']) && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }

    $code = Anti_xss($_POST['code']);
    $discount_type = Anti_xss($_POST['discount_type']);
    $discount_value = (float)Anti_xss($_POST['discount_value']);
    $min_order_value = !empty($_POST['min_order_value']) ? (float)Anti_xss($_POST['min_order_value']) : '';
    $max_order_value = !empty($_POST['max_order_value']) ? (float)Anti_xss($_POST['max_order_value']) : '';
    $max_uses = !empty($_POST['max_uses']) ? (int)Anti_xss($_POST['max_uses']) : 0;
    $start_date = !empty($_POST['start_date']) ? Anti_xss($_POST['start_date']) : '';
    $end_date = !empty($_POST['end_date']) ? Anti_xss($_POST['end_date']) : '';
    $status = isset($_POST['status']) ? 1 : 0;

    if (empty($code) || strlen($code) < 3) {
        alertBack("Mã coupon không hợp lệ (ít nhất 3 ký tự)!");
    }
    if ($discount_value <= 0 || ($discount_type === 'percentage' && $discount_value > 100)) {
        alertBack("Giá trị giảm giá không hợp lệ!");
    }
    if (!empty($min_order_value) && $min_order_value < 0) {
        alertBack("Giá trị đơn hàng tối thiểu không hợp lệ!");
    }
    if (!empty($max_order_value) && ($max_order_value <= 0 || (!empty($min_order_value) && $max_order_value < $min_order_value))) {
        alertBack("Giá trị đơn hàng tối đa không hợp lệ!");
    }

    $data = [
        'code' => $code,
        'discount_type' => $discount_type,
        'discount_value' => $discount_value,
        'min_order_value' => $min_order_value,
        'max_order_value' => $max_order_value,
        'max_uses' => $max_uses,
        'start_date' => $start_date,
        'end_date' => $end_date,
        'status' => $status,
        'created_at' => date('Y-m-d H:i:s'),
        'updated_at' => date('Y-m-d H:i:s')
    ];

    if ($db->insert('coupons', $data)) {
        alertBack("Thêm coupon thành công!", true);
    } else {
        alertBack("Lỗi khi thêm coupon!");
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['edit_id']) && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }

    $edit_id = Anti_xss($_POST['edit_id']);
    $code = Anti_xss($_POST['code']);
    $discount_type = Anti_xss($_POST['discount_type']);
    $discount_value = (float)Anti_xss($_POST['discount_value']);
    $min_order_value = !empty($_POST['min_order_value']) ? (float)Anti_xss($_POST['min_order_value']) : '';
    $max_order_value = !empty($_POST['max_order_value']) ? (float)Anti_xss($_POST['max_order_value']) : '';
    $max_uses = !empty($_POST['max_uses']) ? (int)Anti_xss($_POST['max_uses']) : 0;
    $start_date = !empty($_POST['start_date']) ? Anti_xss($_POST['start_date']) : '';
    $end_date = !empty($_POST['end_date']) ? Anti_xss($_POST['end_date']) : '';
    $status = isset($_POST['status']) ? 1 : 0;

    // Kiểm tra mã coupon hợp lệ
    if (empty($code) || strlen($code) < 3) {
        alertBack("Mã coupon không hợp lệ (ít nhất 3 ký tự)!");
    }
    if ($discount_value <= 0 || ($discount_type === 'percentage' && $discount_value > 100)) {
        alertBack("Giá trị giảm giá không hợp lệ!");
    }
    if (!empty($min_order_value) && $min_order_value < 0) {
        alertBack("Số lượng tối thiểu không hợp lệ!");
    }
    if (!empty($max_order_value) && ($max_order_value <= 0 || (!empty($min_order_value) && $max_order_value < $min_order_value))) {
        alertBack("Số lượng tối đa không hợp lệ!");
    }

    $data = [
        'code' => $code,
        'discount_type' => $discount_type,
        'discount_value' => $discount_value,
        'min_order_value' => $min_order_value,
        'max_order_value' => $max_order_value,
        'max_uses' => $max_uses,
        'start_date' => $start_date,
        'end_date' => $end_date,
        'status' => $status,
        'updated_at' => date('Y-m-d H:i:s')
    ];
    if ($db->update('coupons', $data, "id = '" . $edit_id . "'")) {
        alertBack("Cập nhật coupon thành công!", true);
    } else {
        alertBack("Lỗi khi thêm coupon!");
    }
}

// Phân trang và tìm kiếm
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;
$code = isset($_GET['code']) ? Anti_xss($_GET['code']) : '';
$start_date = isset($_GET['start_date']) ? Anti_xss($_GET['start_date']) : '';
$end_date = isset($_GET['end_date']) ? Anti_xss($_GET['end_date']) : '';

if (!empty($start_date) && !preg_match('/^\d{4}-\d{2}-\d{2}$/', $start_date)) {
    $start_date = '';
}
if (!empty($end_date) && !preg_match('/^\d{4}-\d{2}-\d{2}$/', $end_date)) {
    $end_date = '';
}

$where = [];
if (!empty($code)) {
    $where[] = "code LIKE '%$code%'";
}
if (!empty($start_date)) {
    $where[] = "start_date >= '$start_date 00:00:00'";
}
if (!empty($end_date)) {
    $where[] = "end_date <= '$end_date 23:59:59'";
}

$where_clause = !empty($where) ? "WHERE " . implode(" AND ", $where) : "";

$total = $db->get_row("SELECT COUNT(*) as total FROM `coupons` $where_clause")['total'];
$total_pages = ceil($total / $items_per_page);
$coupons = $db->get_list("SELECT * FROM `coupons` $where_clause ORDER BY id DESC LIMIT $offset, $items_per_page");
?>

<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Danh sách Coupon</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Danh sách Coupon</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Danh sách Coupon</h4>
                        <div class="ms-auto d-flex align-items-center">
                            <button type="button" class="btn btn-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#addCouponModal">Thêm mới</button>
                            <div class="dropdown">
                                <button type="button" class="btn btn-secondary btn-sm w-100" id="dropdownMenuClickable" data-bs-auto-close="false" data-bs-toggle="dropdown" aria-expanded="false">
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
                                                        <span class="text-cap text-body">Mã Coupon</span>
                                                        <input type="text" class="form-control" name="code" value="<?= $code ?>" autocomplete="off">
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
                                                    <a href="/admin/coupons" type="button" id="filter_button" class="btn btn-danger">Bỏ lọc</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal để thêm coupon -->
                    <div class="modal fade" id="addCouponModal" tabindex="-1" aria-labelledby="addCouponModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addCouponModalLabel">Thêm Coupon Mới</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="addCouponForm" method="POST" action="">
                                        <div class="mb-3">
                                            <label for="code" class="form-label">Mã Coupon <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="code" name="code" required placeholder="Ví dụ: SAVE10">
                                        </div>
                                        <div class="mb-3">
                                            <label for="discount_type" class="form-label">Loại giảm giá <span class="text-danger">*</span></label>
                                            <select class="form-control" id="discount_type" name="discount_type" required>
                                                <option value="percentage">Phần trăm (%)</option>
                                                <option value="fixed">Số tiền cố định</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="discount_value" class="form-label">Giá trị giảm <span class="text-danger">*</span></label>
                                            <input type="number" step="0.01" class="form-control" id="discount_value" name="discount_value" required placeholder="Ví dụ: 10">
                                        </div>
                                        <div class="mb-3">
                                            <label for="min_order_value" class="form-label">Giá trị đơn hàng tối thiểu (tùy chọn)</label>
                                            <input type="number" step="0.01" class="form-control" id="min_order_value" name="min_order_value" placeholder="Ví dụ: 1000">
                                        </div>
                                        <div class="mb-3">
                                            <label for="max_order_value" class="form-label">Giá trị đơn hàng tối đa (tùy chọn)</label>
                                            <input type="number" step="0.01" class="form-control" id="max_order_value" name="max_order_value" placeholder="Ví dụ: 5000">
                                        </div>
                                        <div class="mb-3">
                                            <label for="max_uses" class="form-label">Số lần sử dụng tối đa (tùy chọn)</label>
                                            <input type="number" class="form-control" id="max_uses" name="max_uses" placeholder="Để trống nếu không giới hạn">
                                        </div>
                                        <div class="mb-3">
                                            <label for="start_date" class="form-label">Ngày bắt đầu (tùy chọn)</label>
                                            <input type="datetime-local" class="form-control" id="start_date" name="start_date">
                                        </div>
                                        <div class="mb-3">
                                            <label for="end_date" class="form-label">Ngày kết thúc (tùy chọn)</label>
                                            <input type="datetime-local" class="form-control" id="end_date" name="end_date">
                                        </div>
                                        <div class="mb-3">
                                            <label for="status" class="form-label">Trạng thái</label>
                                            <input type="checkbox" id="status" name="status" value="1" checked> Kích hoạt
                                        </div>
                                        <button type="submit" class="btn btn-primary">Thêm Coupon</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-card-body px-0 pt-0 pb-2 p-3">
                        <div class="table-responsive">
                            <table id="couponsTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="mw-120">ID</th>
                                        <th class="mw-150">MÃ COUPON</th>
                                        <th class="mw-150">LOẠI GIẢM GIÁ</th>
                                        <th class="mw-150">GIÁ TRỊ</th>
                                        <th class="mw-150">MUA TỐI THIỂU</th>
                                        <th class="mw-150">MUA TỐI ĐA</th>
                                        <th class="mw-100">SỐ LƯỢT DÙNG</th>
                                        <th class="mw-150">TRẠNG THÁI</th>
                                        <th class="mw-150">THỜI GIAN</th>
                                        <th class="mw-100">HÀNH ĐỘNG</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($coupons)): ?>
                                        <?php foreach ($coupons as $coupon): ?>
                                            <tr data-id="<?= $coupon['id'] ?>">
                                                <td><span><?= $coupon['id'] ?></span></td>
                                                <td><span><?= $coupon['code'] ?></span></td>
                                                <td><span><?= $coupon['discount_type'] === 'percentage' ? 'Phần trăm' : 'Cố định' ?></span></td>
                                                <td><span><?= $coupon['discount_value'] . ($coupon['discount_type'] === 'percentage' ? '%' : ' VNĐ') ?></span></td>
                                                <td><span><?= $coupon['min_order_value'] ? number_format($coupon['min_order_value'], 2) . '' : 'Không giới hạn' ?></span></td>
                                                <td><span><?= $coupon['max_order_value'] ? number_format($coupon['max_order_value'], 2) . '' : 'Không giới hạn' ?></span></td>
                                                <td><span><?= $coupon['used_count'] . '/' . ($coupon['max_uses'] ?: '∞') ?></span></td>
                                                <td><span><?= $coupon['status'] ? 'Kích hoạt' : 'Vô hiệu' ?></span></td>
                                                <td><span><?= $coupon['created_at'] ?></span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm me-1 edit-coupon-btn" data-id="<?= $coupon['id'] ?>" data-bs-toggle="modal" data-bs-target="#editCouponModal">Sửa</button>
                                                    <button type="button" class="btn btn-danger btn-square-2 btn-sm ms-1 delete-btn"><i class="fas fa-trash-alt"></i></button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="10" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có coupon nào được tạo</p>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php if ($total_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page > 1): ?>
                                    <a href="?page=<?php echo $page - 1; ?>&code=<?= $code ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                    <a href="?page=<?php echo $i; ?>&code=<?= $code ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="<?php echo $i === $page ? 'active' : ''; ?>">
                                        <?php echo $i; ?>
                                    </a>
                                <?php endfor; ?>
                                <?php if ($page < $total_pages): ?>
                                    <a href="?page=<?php echo $page + 1; ?>&code=<?= $code ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="editCouponModal" tabindex="-1" aria-labelledby="editCouponModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCouponModalLabel">Chỉnh sửa Coupon</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editCouponForm" method="POST" action="">
                    <input type="hidden" id="edit_id" name="edit_id">
                    <div class="mb-3">
                        <label for="edit_code" class="form-label">Mã Coupon <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="edit_code" name="code" required placeholder="Ví dụ: SAVE10">
                    </div>
                    <div class="mb-3">
                        <label for="edit_discount_type" class="form-label">Loại giảm giá <span class="text-danger">*</span></label>
                        <select class="form-control" id="edit_discount_type" name="discount_type" required>
                            <option value="percentage">Phần trăm (%)</option>
                            <option value="fixed">Số tiền cố định</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="edit_discount_value" class="form-label">Giá trị giảm <span class="text-danger">*</span></label>
                        <input type="number" step="0.01" class="form-control" id="edit_discount_value" name="discount_value" required placeholder="Ví dụ: 10">
                    </div>
                    <div class="mb-3">
                        <label for="edit_min_order_value" class="form-label">Giá trị đơn hàng tối thiểu (tùy chọn)</label>
                        <input type="number" step="0.01" class="form-control" id="edit_min_order_value" name="min_order_value" placeholder="Ví dụ: 1000">
                    </div>
                    <div class="mb-3">
                        <label for="edit_max_order_value" class="form-label">Giá trị đơn hàng tối đa (tùy chọn)</label>
                        <input type="number" step="0.01" class="form-control" id="edit_max_order_value" name="max_order_value" placeholder="Ví dụ: 5000">
                    </div>
                    <div class="mb-3">
                        <label for="edit_max_uses" class="form-label">Số lần sử dụng tối đa (tùy chọn)</label>
                        <input type="number" class="form-control" id="edit_max_uses" name="max_uses" placeholder="Để trống nếu không giới hạn">
                    </div>
                    <div class="mb-3">
                        <label for="edit_start_date" class="form-label">Ngày bắt đầu (tùy chọn)</label>
                        <input type="datetime-local" class="form-control" id="edit_start_date" name="start_date">
                    </div>
                    <div class="mb-3">
                        <label for="edit_end_date" class="form-label">Ngày kết thúc (tùy chọn)</label>
                        <input type="datetime-local" class="form-control" id="edit_end_date" name="end_date">
                    </div>
                    <div class="mb-3">
                        <label for="edit_status" class="form-label">Trạng thái</label>
                        <input type="checkbox" id="edit_status" name="status" value="1"> Kích hoạt
                    </div>
                    <button type="submit" class="btn btn-primary">Cập nhật Coupon</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById('addCouponForm').addEventListener('submit', function(event) {
        const codeInput = document.getElementById('code').value.trim();
        const discountValue = parseFloat(document.getElementById('discount_value').value);
        const discountType = document.getElementById('discount_type').value;
        const minOrderValue = document.getElementById('min_order_value').value.trim();
        const maxOrderValue = document.getElementById('max_order_value').value.trim();

        if (codeInput.length < 3) {
            event.preventDefault();
            alert('Mã coupon phải có ít nhất 3 ký tự!');
            return;
        }
        if (discountValue <= 0 || (discountType === 'percentage' && discountValue > 100)) {
            event.preventDefault();
            alert('Giá trị giảm giá không hợp lệ!');
            return;
        }
        if (minOrderValue && parseFloat(minOrderValue) < 0) {
            event.preventDefault();
            alert('Giá trị đơn hàng tối thiểu không hợp lệ!');
            return;
        }
        if (maxOrderValue && (parseFloat(maxOrderValue) <= 0 || (minOrderValue && parseFloat(maxOrderValue) < parseFloat(minOrderValue)))) {
            event.preventDefault();
            alert('Giá trị đơn hàng tối đa không hợp lệ!');
            return;
        }
    });
    document.getElementById('editCouponForm').addEventListener('submit', function(event) {
        const codeInput = document.getElementById('edit_code').value.trim();
        const discountValue = parseFloat(document.getElementById('edit_discount_value').value);
        const discountType = document.getElementById('edit_discount_type').value;
        const minOrderValue = document.getElementById('edit_min_order_value').value.trim();
        const maxOrderValue = document.getElementById('edit_max_order_value').value.trim();
        const maxUses = document.getElementById('edit_max_uses').value.trim();

        if (codeInput.length < 3) {
            event.preventDefault();
            alert('Mã coupon phải có ít nhất 3 ký tự!');
            return;
        }
        if (discountValue <= 0 || (discountType === 'percentage' && discountValue > 100)) {
            event.preventDefault();
            alert('Giá trị giảm giá không hợp lệ!');
            return;
        }
        if (minOrderValue && parseFloat(minOrderValue) < 0) {
            event.preventDefault();
            alert('Giá trị đơn hàng tối thiểu không hợp lệ!');
            return;
        }
        if (maxOrderValue && (parseFloat(maxOrderValue) <= 0 || (minOrderValue && parseFloat(maxOrderValue) < parseFloat(minOrderValue)))) {
            event.preventDefault();
            alert('Giá trị đơn hàng tối đa không hợp lệ!');
            return;
        }
        if (maxUses && parseInt(maxUses) < 0) {
            event.preventDefault();
            alert('Số lần sử dụng tối đa không hợp lệ!');
            return;
        }
    });
    document.querySelectorAll('.edit-coupon-btn').forEach(button => {
        button.addEventListener('click', function() {
            const couponId = this.getAttribute('data-id');
            $.ajax({
                url: '/model/admin/coupon/detail',
                type: 'POST',
                data: {
                    id: couponId
                },
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status == "success") {
                        const coupon = response.coupon;
                        document.getElementById('edit_id').value = coupon.id;
                        document.getElementById('edit_code').value = coupon.code;
                        document.getElementById('edit_discount_type').value = coupon.discount_type;
                        document.getElementById('edit_discount_value').value = coupon.discount_value;
                        document.getElementById('edit_min_order_value').value = coupon.min_order_value || '';
                        document.getElementById('edit_max_order_value').value = coupon.max_order_value || '';
                        document.getElementById('edit_max_uses').value = coupon.max_uses || '';
                        document.getElementById('edit_start_date').value = coupon.start_date ? coupon.start_date.replace(' ', 'T').slice(0, 16) : '';
                        document.getElementById('edit_end_date').value = coupon.end_date ? coupon.end_date.replace(' ', 'T').slice(0, 16) : '';
                        document.getElementById('edit_status').checked = coupon.status == 1;
                    } else {
                        Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi xóa');
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi kết nối server');
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function() {
        $('.delete-btn').on('click', function() {
            const row = $(this).closest('tr');
            const id = row.data('id');

            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa xoá mã giảm giá này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');

                    $.ajax({
                        url: '/model/admin/delete',
                        type: 'POST',
                        data: {
                            id: id,
                            action: 'removeCoupon'
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success('Xóa thành công');
                                row.fadeOut(300, function() {
                                    $(this).remove();
                                    if ($('#linksTable tbody tr').length === 0) {
                                        $('#linksTable tbody').html(`
                                        <tr>
                                            <td colspan="10" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có coupon nào được tạo</p>
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