<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    // Lấy dữ liệu từ form
    $captcha_siteKey = isset($_POST['captcha_siteKey']) ? Anti_xss($_POST['captcha_siteKey']) : '';
    $captcha_secretKey = isset($_POST['captcha_secretKey']) ? Anti_xss($_POST['captcha_secretKey']) : '';
    $captcha_status = isset($_POST['captcha_status']) ? Anti_xss($_POST['captcha_status']) : '';

    // Lấy dữ liệu cấu hình hiện tại
    $general_data = getConfig('general');

    // Cập nhật các trường mới
    $general_data['captcha_siteKey'] = $captcha_siteKey;
    $general_data['captcha_secretKey'] = $captcha_secretKey;
    $general_data['captcha_status'] = $captcha_status;

    // Lưu lại dữ liệu
    if (updateConfig('general', $general_data)) {
        alertBack("Lưu cấu hình thành công!");
    } else {
        alertBack("Lưu cấu hình thất bại!");
    }
}

// Lấy dữ liệu để hiển thị trong form
//$general_data = getConfig('general');
?>
<div class="content-body">
    <!-- row -->
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Bảng điều khiển</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Bảng điều khiển </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Cài đặt</a></li>
        </ol>

    </div>
    <div class="container-fluid">
        <div class="row">
           
            <div class="col-xxl-12 col-xl-12">
                <div class="card">
                    <div class="card-header py-3 flex-wrap gap-2">
                        <h4 class="card-title mb-0">Cloudflare Captcha Configuration</h4>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="">
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Cloudflare Captcha Site Key</label>
                                    <input type="text" class="form-control" name="captcha_siteKey" value="<?= $general_data['captcha_siteKey'] ?>">
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Cloudflare Captcha Secret Key</label>
                                    <input type="text" class="form-control" name="captcha_secretKey" value="<?= $general_data['captcha_secretKey'] ?>">
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Trạng thái</label>
                                   
                                    <div class="clearfix ms-auto">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" name="captcha_status" value="1" <?= $general_data['captcha_status'] ? 'checked' : '' ?>>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-start">
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>