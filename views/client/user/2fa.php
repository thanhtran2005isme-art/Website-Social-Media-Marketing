<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Bảo mật 2FA - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php');

use PragmaRX\Google2FAQRCode\Google2FA;

$google2fa = new Google2FA();
?>
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
                <h1 class="page-title fw-medium fs-18 mb-0">Bảo mật 2 lớp</h1>
            </div>
        </div>
        <div class="row">
            <?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/user/menu.php'); ?>
            <div class="col-xxl-8">
                <div class="card custom-card overflow-hidden">
                    <div class="card-body p-3">
                        <div class="col-xl-12">
                            <h5><?= $data_user['two_fa'] ? 'Bảo mật 2 lớp đã được kích hoạt' : 'Kích hoạt bảo mật 2 lớp' ?></h5>
                            <p>
                                <?= $data_user['two_fa']
                                    ? 'Nhập mã từ ứng dụng xác thực để tắt 2FA.'
                                    : 'Quét mã QR bên dưới bằng ứng dụng xác thực (như Google Authenticator hoặc Authy), hoặc nhập mã bí mật thủ công. Sau đó, nhập mã 6 chữ số để kích hoạt.' ?>
                            </p>
                            <?php if (!$data_user['two_fa']): ?>
                                <div class="col-xl-6">
                                    <?php
                                    $qrCodeUrl = $google2fa->getQRCodeInline('', $data_user['email'], $data_user['two_fa_code']);
                                    ?>
                                    <?= $qrCodeUrl; ?>
                                    <div class="mt-3">
                                        <label class="form-label">Mã bí mật:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="two-fa-code" value="<?= htmlspecialchars($data_user['two_fa_code']) ?>" readonly>
                                            <button class="btn btn-outline-secondary" type="button" id="copy-2fa-code">Copy</button>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <button type="button" class="btn btn-warning-gradient" id="regenerate-2fa-btn">Khởi tạo lại mã 2FA</button>
                                    </div>
                                </div>
                            <?php endif; ?>
                            <div class="col-xl-6">
                                <label for="totp-code" class="form-label">Mã xác thực:</label>
                                <input type="text" class="form-control" id="totp-code" placeholder="Nhập mã 6 chữ số">
                            </div>
                            <div class="col-xl-12 mt-3">
                                <button type="button" class="btn <?= $data_user['two_fa'] ? 'btn-danger' : 'btn-primary-gradient' ?>" id="toggle-2fa-btn">
                                    <?= $data_user['two_fa'] ? 'Tắt 2FA' : 'Kích hoạt 2FA' ?>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card custom-card overflow-hidden">
                    <div class="card-body p-3">
                        <div class="col-xl-12">
                            <h5>Google Authenticator</h5>
                            <p>Sử dụng Google Authenticator để quét mã QR hoặc nhập mã bí mật.</p>
                            <p>Google Authenticator là ứng dụng đa yếu tố dành cho thiết bị di động. Ứng dụng này tạo ra các mã có thời gian sử dụng trong quá trình xác minh 2 bước. Để sử dụng Google Authenticator, hãy cài đặt ứng dụng Google Authenticator trên thiết bị di động của bạn.</p>
                            <a href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en" target="_blank" class="btn btn-success-gradient">TẢI ỨNG DỤNG</a>
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

        $('#copy-2fa-code').click(function() {
            const twoFaCode = $('#two-fa-code').val();
            navigator.clipboard.writeText(twoFaCode).then(() => {
                Notiflix.Notify.success('Đã sao chép mã bí mật!');
            }).catch(() => {
                Notiflix.Notify.failure('Không thể sao chép mã!');
            });
        });

        $('#toggle-2fa-btn').click(function() {
            const totpCode = $('#totp-code').val().trim();
            if (!totpCode || totpCode.length !== 6 || !/^\d+$/.test(totpCode)) {
                Notiflix.Notify.failure('Vui lòng nhập mã 6 chữ số hợp lệ');
                return;
            }

            const formData = new FormData();
            formData.append('totp_code', totpCode);
            formData.append('csrf_token', csrfToken);
            Notiflix.Loading.circle('Đang xử lý...');
            $.ajax({
                url: '/model/update/2fa',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status === "success") {
                        Notiflix.Notify.success(response.msg);
                        setTimeout(() => location.reload(), 1500);
                    } else {
                        Notiflix.Notify.failure((response.msg || 'Lỗi không xác định'));
                    }
                },
                error: function(xhr, status, error) {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi kết nối: ' + error);
                }
            });
        });

      
        $('#regenerate-2fa-btn').click(function() {
            Notiflix.Confirm.show(
                'Xác nhận khởi tạo lại mã 2FA',
                'Bạn có chắc chắn muốn khởi tạo lại mã 2FA? Mã cũ sẽ không còn hiệu lực.',
                'Đồng ý',
                'Hủy',
                function okCb() {
                    const formData = new FormData();
                    formData.append('action', 'regenerate_2fa');
                    formData.append('csrf_token', csrfToken);
                    Notiflix.Loading.circle('Đang khởi tạo mã mới...');
                    $.ajax({
                        url: '/model/update/2fa',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === "success") {
                                Notiflix.Notify.success(response.msg);
                                setTimeout(() => location.reload(), 1500);
                            } else {
                                Notiflix.Notify.failure((response.msg || 'Lỗi không xác định'));
                            }
                        },
                        error: function(xhr, status, error) {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối: ' + error);
                        }
                    });
                },
                function cancelCb() {
                  
                }
            );
        });
    });
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>