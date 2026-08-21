<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Thay đổi mật khẩu - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<div class="main-content app-content">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tài khoản</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Đổi mật khẩu</h1>
            </div>
        </div>
        <div class="row">
        <?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/user/menu.php'); ?>
            <div class="col-xxl-8">
                <div class="card custom-card overflow-hidden">
                    <div class="card-body p-3">
                        <div class="row gy-3">
                            <div class="col-xl-6">
                                <label for="current-password" class="form-label">Mật khẩu hiện tại:</label>
                                <input type="password" class="form-control" id="current-password" placeholder="Nhập mật khẩu hiện tại">
                            </div>
                            <div class="col-xl-6">
                                <label for="new-password" class="form-label">Mật khẩu mới:</label>
                                <input type="password" class="form-control" id="new-password" placeholder="Nhập mật khẩu mới">
                            </div>
                            <div class="col-xl-6">
                                <label for="confirm-password" class="form-label">Xác nhận mật khẩu mới:</label>
                                <input type="password" class="form-control" id="confirm-password" placeholder="Xác nhận mật khẩu mới">
                            </div>
                            <div class="col-xl-12">
                                <button type="button" class="btn btn-primary-gradient" id="change-password-btn">Lưu thay đổi</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

Notiflix.Notify.init({
    width: '300px',
    position: 'right-top',
    timeout: 3000,
});

const csrfToken = "<?= htmlspecialchars($_SESSION['csrf_token'] ?? bin2hex(random_bytes(32))) ?>";

$(document).ready(function() {
   
    $('#change-password-btn').click(function() {
        const formData = new FormData();
        formData.append('current_password', $('#current-password').val());
        formData.append('new_password', $('#new-password').val());
        formData.append('confirm_password', $('#confirm-password').val());
        formData.append('csrf_token', csrfToken);

        if (!formData.get('current_password')) {
            Notiflix.Notify.failure('Vui lòng nhập mật khẩu hiện tại');
            return;
        }
        if (!formData.get('new_password')) {
            Notiflix.Notify.failure('Vui lòng nhập mật khẩu mới');
            return;
        }
        if (formData.get('new_password').length < 8) {
            Notiflix.Notify.failure('Mật khẩu mới phải có ít nhất 8 ký tự');
            return;
        }
        if (formData.get('new_password') !== formData.get('confirm_password')) {
            Notiflix.Notify.failure('Mật khẩu xác nhận không khớp');
            return;
        }
        Notiflix.Loading.circle('Đang xử lý...');
        $.ajax({
            url: '/model/update/password',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                Notiflix.Loading.remove();
                if (response.status == "success") {
                    Notiflix.Notify.success('Đổi mật khẩu thành công!');
                    $('#current-password, #new-password, #confirm-password').val('');
                } else {
                    Notiflix.Notify.failure(response.msg || 'Lỗi không xác định');
                }
            },
            error: function(xhr, status, error) {
                Notiflix.Loading.remove();
                Notiflix.Notify.failure('Lỗi kết nối: ' + error);
            }
        });
    });
});
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>