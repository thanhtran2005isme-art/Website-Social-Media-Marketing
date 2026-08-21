<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php');
if (isset($_GET['id']) && $data_user['role'] == 1) {
    $row = $db->get_row(" SELECT * FROM `users` WHERE `id` = '" . Anti_xss($_GET['id']) . "'  ");
    if (!$row) {
        new Redirect('/admin/users');
    }
} else {
    new Redirect('/admin/users');
}
?>
<?php
// Xử lý cập nhật thông tin
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_info']) && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    if (!isset($_POST['csrf_token']) || !verifyCsrfToken($_POST['csrf_token'])) {
        alertBack("Invalid CSRF token. Please try again.");
    }

    // Sanitize và validate inputs
    $lastname = Anti_xss($_POST['lastname'] ?? '');
    $firstname = Anti_xss($_POST['firstname'] ?? '');
    $username = Anti_xss($_POST['username'] ?? '');
    $email = filter_var($_POST['email'] ?? '', FILTER_VALIDATE_EMAIL);
    $phone = Anti_xss($_POST['phone'] ?? '');
    $phone_code = Anti_xss($_POST['phone_code'] ?? '');
    $country = Anti_xss($_POST['country'] ?? '');
    $country_code = Anti_xss($_POST['country_code'] ?? '');
    $state = Anti_xss($_POST['state'] ?? '');
    $city = Anti_xss($_POST['city'] ?? '');
    $zip_code = Anti_xss($_POST['zip_code'] ?? '');
    $address_one = Anti_xss($_POST['address_one'] ?? '');
    $address_two = Anti_xss($_POST['address_two'] ?? '');
    $balance = filter_var($_POST['balance'] ?? 0, FILTER_VALIDATE_FLOAT);
    $balance_referred = filter_var($_POST['balance_referred'] ?? 0, FILTER_VALIDATE_FLOAT);
    $referral_percent = filter_var($_POST['referral_percent'] ?? 5, FILTER_VALIDATE_INT);
    $referred_by = Anti_xss($_POST['referred_by'] ?? '');
    $language_id = filter_var($_POST['language_id'] ?? null, FILTER_VALIDATE_INT) ?: null;
    $child_panel_id = filter_var($_POST['child_panel_id'] ?? null, FILTER_VALIDATE_INT) ?: null;
    $status = isset($_POST['status']) ? 1 : 0;
    $role = filter_var($_POST['role'] ?? 0, FILTER_VALIDATE_INT);
    $two_fa = isset($_POST['two_fa']) ? 1 : 0;
    $two_fa_verify = isset($_POST['two_fa_verify']) ? 1 : 0;
    $email_verification = isset($_POST['email_verification']) ? 1 : 0;
    $sms_verification = isset($_POST['sms_verification']) ? 1 : 0;
    $time_zone = Anti_xss($_POST['time_zone'] ?? '');
    $currency_code = Anti_xss($_POST['currency_code'] ?? '');

    // Validate required fields
    if (!$email) {
        alertBack("Định dạng email không hợp lệ");
    }
    if (!$username) {
        alertBack("Tên người dùng là bắt buộc");
    }

    // Kiểm tra trùng username hoặc email
    if ($username !== $row['username']) {
        if ($db->get_row("SELECT * FROM `users` WHERE `username` = '{$username}' AND `id` != '{$row['id']}'")) {
            alertBack("Tên người dùng đã tồn tại");
        }
    }
    if ($email !== $row['email']) {
        if ($db->get_row("SELECT * FROM `users` WHERE `email` = '{$email}' AND `id` != '{$row['id']}'")) {
            alertBack("Email đã tồn tại");
        }
    }

    // Dữ liệu cập nhật
    $data = [
        'lastname' => $lastname,
        'firstname' => $firstname,
        'username' => $username,
        'email' => $email,
        'phone' => $phone,
        'phone_code' => $phone_code,
        'country' => $country,
        'country_code' => $country_code,
        'state' => $state,
        'city' => $city,
        'zip_code' => $zip_code,
        'address_one' => $address_one,
        'address_two' => $address_two,
        'balance' => $balance,
        'balance_referred' => $balance_referred,
        'referral_percent' => $referral_percent,
        'referred_by' => $referred_by,
        'language_id' => $language_id,
        'child_panel_id' => $child_panel_id,
        'status' => $status,
        'role' => $role,
        'two_fa' => $two_fa,
        'two_fa_verify' => $two_fa_verify,
        'email_verification' => $email_verification,
        'sms_verification' => $sms_verification,
        'time_zone' => $time_zone,
        'currency_code' => $currency_code,
        'updated_at' => gettime()
    ];

    // Cập nhật database
    if ($db->update('users', $data, "id = '" . $row['id'] . "'")) {
        alertBack("Cập nhật thông tin thành công");
    } else {
        alertBack("Không thể cập nhật thông tin");
    }
}
// Xử lý đổi mật khẩu
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['change_password'])) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    if (!isset($_POST['csrf_token']) || !verifyCsrfToken($_POST['csrf_token'])) {
        alertBack("Invalid CSRF token. Please try again.");
    }

    $password = Anti_xss($_POST['password'] ?? '');
    $password_confirm = Anti_xss($_POST['password_confirm'] ?? '');

    if (strlen($password) < 6) {
        alertBack("Mật khẩu phải dài ít nhất 6 ký tự");
    }
    if ($password !== $password_confirm) {
        alertBack("Mật khẩu không khớp");
    }

    $data = [
        'password' => password_hash($password, PASSWORD_DEFAULT),
        'updated_at' => gettime()
    ];

    if ($db->update('users', $data, "id = '" . $row['id'] . "'")) {
        alertBack("Đổi mật khẩu thành công");
    } else {
        alertBack("Không thể đổi mật khẩu");
    }
}
// Xử lý quản lý số dư
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['manage_balance'])) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    if (!isset($_POST['csrf_token']) || !verifyCsrfToken($_POST['csrf_token'])) {
        alertBack("Invalid CSRF token. Please try again.");
    }

    $amount = filter_var($_POST['balance_adjustment'] ?? 0, FILTER_VALIDATE_FLOAT);
    $action = Anti_xss($_POST['balance_action']);
    $remarks = Anti_xss($_POST['balance_remarks'] ?? '');

    if ($amount <= 0) {
        alertBack("Số tiền điều chỉnh phải là số dương");
    }
    if (!in_array($action, ['add', 'subtract'])) {
        alertBack("Hành động số dư không hợp lệ");
    }
    if (empty($remarks)) {
        alertBack("Ghi chú là bắt buộc cho điều chỉnh số dư");
    }
    if ($action === 'subtract' && ($row['balance'] - $amount) < 0) {
        alertBack("Số dư không đủ để trừ");
    }

    $trxType = $action === 'add' ? '+' : '-';
    $newBalance = $action === 'add' ? $row['balance'] + $amount : $row['balance'] - $amount;

    // Cập nhật số dư
    $db->update('users', ['balance' => $newBalance], "id = '{$row['id']}'");

    // Ghi lại giao dịch
    $transaction_data = [
        'trx_id' => generateOrderNumber(),
        'user_id' => $row['id'],
        'trx_type' => $trxType,
        'amount' => $amount,
        'remarks' => $remarks,
        'charge' => 0,
        'created_at' => gettime(),
        'updated_at' => gettime()
    ];
    $db->insert("transactions", $transaction_data);

    alertBack("Cập nhật số dư thành công");
}
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Người dùng</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">Người dùng</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Chỉnh sửa người dùng [<?= $row['username'] ?>]</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <form method="post" action="" enctype="multipart/form-data">
                    <input type="hidden" name="csrf_token" value="<?= generate_csrf_token() ?>">
                    <input type="hidden" name="update_info" value="1">
                    <div class="card m-b30">
                        <div class="card-header">
                            <h6 class="card-title" style="direction: ltr;">THÔNG TIN</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <!-- Personal Information -->
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Họ</label>
                                    <input type="text" name="lastname" class="form-control" value="<?= htmlspecialchars($row['lastname'] ?? '') ?>" required>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Tên</label>
                                    <input type="text" name="firstname" class="form-control" value="<?= htmlspecialchars($row['firstname'] ?? '') ?>" required>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Tên người dùng</label>
                                    <input type="text" name="username" class="form-control" value="<?= htmlspecialchars($row['username'] ?? '') ?>" required>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" value="<?= htmlspecialchars($row['email'] ?? '') ?>" required>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Mã điện thoại</label>
                                    <input type="text" name="phone_code" class="form-control" value="<?= htmlspecialchars($row['phone_code'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Số điện thoại</label>
                                    <input type="tel" name="phone" class="form-control" value="<?= htmlspecialchars($row['phone'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Mã quốc gia</label>
                                    <input type="text" name="country_code" class="form-control" value="<?= htmlspecialchars($row['country_code'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Quốc gia</label>
                                    <input type="text" name="country" class="form-control" value="<?= htmlspecialchars($row['country'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Bang/Tỉnh</label>
                                    <input type="text" name="state" class="form-control" value="<?= htmlspecialchars($row['state'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Thành phố</label>
                                    <input type="text" name="city" class="form-control" value="<?= htmlspecialchars($row['city'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Mã bưu điện</label>
                                    <input type="text" name="zip_code" class="form-control" value="<?= htmlspecialchars($row['zip_code'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Múi giờ</label>
                                    <input type="text" name="time_zone" class="form-control" value="<?= htmlspecialchars($row['time_zone'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Mã tiền tệ</label>
                                    <input type="text" name="currency_code" class="form-control" value="<?= htmlspecialchars($row['currency_code'] ?? '') ?>">
                                </div>
                                <div class="col-sm-12 mb-4">
                                    <label class="form-label">Địa chỉ 1</label>
                                    <textarea name="address_one" class="form-control"><?= htmlspecialchars($row['address_one'] ?? '') ?></textarea>
                                </div>
                                <div class="col-sm-12 mb-4">
                                    <label class="form-label">Địa chỉ 2</label>
                                    <textarea name="address_two" class="form-control"><?= htmlspecialchars($row['address_two'] ?? '') ?></textarea>
                                </div>

                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Số dư</label>
                                    <input type="number" name="balance" class="form-control" step="0.01" value="<?= htmlspecialchars($row['balance'] ?? '0.00') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Số dư giới thiệu</label>
                                    <input type="number" name="balance_referred" class="form-control" step="0.01" value="<?= htmlspecialchars($row['balance_referred'] ?? '0.00') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Phần trăm giới thiệu</label>
                                    <input type="number" name="referral_percent" class="form-control" value="<?= htmlspecialchars($row['referral_percent'] ?? '5') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Người giới thiệu</label>
                                    <input type="text" name="referred_by" class="form-control" value="<?= htmlspecialchars($row['referred_by'] ?? '') ?>">
                                </div>

                                <!-- System Settings -->
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">ID Ngôn ngữ</label>
                                    <input type="number" name="language_id" class="form-control" value="<?= htmlspecialchars($row['language_id'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">ID Panel con</label>
                                    <input type="number" name="child_panel_id" class="form-control" value="<?= htmlspecialchars($row['child_panel_id'] ?? '') ?>">
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Trạng thái</label>
                                    <div class="clearfix ms-auto">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" name="status" value="1" <?= $row['status'] ? 'checked' : '' ?>>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Vai trò</label>
                                    <select name="role" class="form-control">
                                        <option value="0" <?= $row['role'] == 0 ? 'selected' : '' ?>>Người dùng</option>
                                        <option value="1" <?= $row['role'] == 1 ? 'selected' : '' ?>>Admin</option>
                                    </select>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Xác thực hai yếu tố</label>
                                    <div class="clearfix ms-auto">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" name="two_fa" value="1" <?= $row['two_fa'] ? 'checked' : '' ?>>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Xác minh 2FA</label>
                                    <div class="clearfix ms-auto">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" name="two_fa_verify" value="1" <?= $row['two_fa_verify'] ? 'checked' : '' ?>>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Xác minh Email</label>
                                    <div class="clearfix ms-auto">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" name="email_verification" value="1" <?= $row['email_verification'] ? 'checked' : '' ?>>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Xác minh SMS</label>
                                    <div class="clearfix ms-auto">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" name="sms_verification" value="1" <?= $row['sms_verification'] ? 'checked' : '' ?>>
                                        </div>
                                    </div>
                                </div>

                                <!-- Readonly Information -->
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Đăng nhập lần cuối</label>
                                    <input type="text" class="form-control" value="<?= $row['last_login'] ? timeAgo2($row['last_login']) : 'Chưa đăng nhập' ?>" readonly>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Hoạt động lần cuối</label>
                                    <input type="text" class="form-control" value="<?= $row['last_seen'] ? timeAgo2($row['last_seen']) : 'Chưa hoạt động' ?>" readonly>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Số lần thử đăng nhập</label>
                                    <input type="text" class="form-control" value="<?= htmlspecialchars($row['login_attempts'] ?? '0') ?>" readonly>
                                </div>
                                <div class="col-sm-4 mb-4">
                                    <label class="form-label">Thời gian khóa</label>
                                    <input type="text" class="form-control" value="<?= htmlspecialchars($row['lockout_time'] ?? 'Không có') ?>" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-primary me-1">CẬP NHẬT</button>

                        </div>
                    </div>
                </form>
                <form method="post" action="" enctype="multipart/form-data">
                    <input type="hidden" name="csrf_token" value="<?= generate_csrf_token() ?>">
                    <input type="hidden" name="change_password" value="1">
                    <div class="card m-b30">
                        <div class="card-header">
                            <h6 class="card-title">ĐỔI MẬT KHẨU</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6 mb-4">
                                    <label class="form-label">Mật khẩu mới</label>
                                    <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu mới">
                                </div>
                                <div class="col-sm-6 mb-4">
                                    <label class="form-label">Xác nhận mật khẩu</label>
                                    <input type="password" name="password_confirm" class="form-control" placeholder="Xác nhận mật khẩu">
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary me-1">ĐỔI MẬT KHẨU</button>
                        </div>
                    </div>
                </form>

                <!-- Form quản lý số dư -->
                <form method="post" action="" enctype="multipart/form-data">
                    <input type="hidden" name="csrf_token" value="<?= generate_csrf_token() ?>">
                    <input type="hidden" name="manage_balance" value="1">
                    <div class="card m-b30">
                        <div class="card-header">
                            <h6 class="card-title">QUẢN LÝ SỐ DƯ</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6 mb-4">
                                    <label class="form-label">Số tiền</label>
                                    <input type="number" name="balance_adjustment" class="form-control" step="0.01" placeholder="Nhập số tiền">
                                </div>
                                <div class="col-sm-6 mb-4">
                                    <label class="form-label">Hành động</label>
                                    <select name="balance_action" class="form-control">
                                        <option value="">Chọn hành động</option>
                                        <option value="add">Cộng số dư</option>
                                        <option value="subtract">Trừ số dư</option>
                                    </select>
                                </div>
                                <div class="col-sm-12 mb-4">
                                    <label class="form-label">Ghi chú</label>
                                    <textarea name="balance_remarks" class="form-control" placeholder="Nhập ghi chú cho giao dịch"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary me-1">CẬP NHẬT SỐ DƯ</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>