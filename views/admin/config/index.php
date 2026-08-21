<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php');
$settings = $db->get_list("SELECT `key`, `value` FROM `settings`");
$settings_map = array_column($settings, 'value', 'key');
?>
<div class="content-body">
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
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h4 class="card-title">Cài đặt hệ thống</h4>
                        <a class="collapse-indicator" data-bs-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="false" aria-controls="collapseFilter">
                            <i class="fa fa-angle-down"></i>
                        </a>
                    </div>
                    <div class="collapsed collapse show" id="collapseFilter">
                        <div class="card-body">
                            <form id="settingsForm" action="/model/admin/settings" method="POST" enctype="multipart/form-data">
                                <!-- General Settings -->
                                <h5 class="mt-4">Cài đặt chung</h5>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Tiêu đề</label>
                                            <input type="text" name="settings[title]" class="form-control" value="<?php echo htmlspecialchars($settings_map['title'] ?? ''); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả</label>
                                            <textarea class="form-control" name="settings[description]" rows="5"><?php echo htmlspecialchars($settings_map['description'] ?? ''); ?></textarea>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Từ khóa tìm kiếm</label>
                                            <input type="text" name="settings[keywords]" class="form-control" placeholder="Từ khóa cách nhau bởi dấu phẩy" value="<?php echo htmlspecialchars($settings_map['keywords'] ?? ''); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Logo</label>
                                            <input type="file" name="logo" class="form-control" accept=".jpg,.jpeg,.png">
                                            <?php if (!empty($settings_map['logo'])): ?>
                                                <img src="<?php echo htmlspecialchars($settings_map['logo']); ?>" alt="Logo" style="max-width: 100px; margin-top: 10px;">
                                            <?php endif; ?>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Logo Mobile</label>
                                            <input type="file" name="logo_mobile" class="form-control" accept=".jpg,.jpeg,.png">
                                            <?php if (!empty($settings_map['logo_mobile'])): ?>
                                                <img src="<?php echo htmlspecialchars($settings_map['logo_mobile']); ?>" alt="Logo Mobile" style="max-width: 100px; margin-top: 10px;">
                                            <?php endif; ?>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Favicon</label>
                                            <input type="file" name="favicon" class="form-control" accept=".jpg,.jpeg,.png,.ico">
                                            <?php if (!empty($settings_map['favicon'])): ?>
                                                <img src="<?php echo htmlspecialchars($settings_map['favicon']); ?>" alt="Favicon" style="max-width: 50px; margin-top: 10px;">
                                            <?php endif; ?>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Thumbnail</label>
                                            <input type="file" name="thumbnail" class="form-control" accept=".jpg,.jpeg,.png,.ico">
                                            <?php if (!empty($settings_map['thumbnail'])): ?>
                                                <img src="<?php echo htmlspecialchars($settings_map['thumbnail']); ?>" alt="thumbnail" style="max-width: 200px; margin-top: 10px;">
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </div>

                                <!-- Captcha Settings -->
                                <h5 class="mt-4">Cài đặt Captcha</h5>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Trạng thái Captcha (1: Bật, 0: Tắt)</label>
                                            <input type="text" name="settings[captcha_status]" class="form-control" value="<?php echo htmlspecialchars($settings_map['captcha_status'] ?? ''); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Captcha Site Key</label>
                                            <input type="text" name="settings[captcha_site_key]" class="form-control" value="<?php echo htmlspecialchars($settings_map['captcha_site_key'] ?? ''); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Captcha Secret Key</label>
                                            <input type="text" name="settings[captcha_secret_key]" class="form-control" value="<?php echo htmlspecialchars($settings_map['captcha_secret_key'] ?? ''); ?>">
                                        </div>
                                    </div>
                                </div>

                                <!-- SMTP Settings -->
                                <h5 class="mt-4">Cài đặt SMTP</h5>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">SMTP User</label>
                                            <input type="text" name="settings[smtp_user]" class="form-control" value="<?php echo htmlspecialchars($settings_map['smtp_user'] ?? ''); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">SMTP Password</label>
                                            <input type="password" name="settings[smtp_pass]" class="form-control" value="<?php echo htmlspecialchars($settings_map['smtp_pass'] ?? ''); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">SMTP Host</label>
                                            <input type="text" name="settings[smtp_host]" class="form-control" value="<?php echo htmlspecialchars($settings_map['smtp_host'] ?? ''); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">SMTP Port</label>
                                            <input type="text" name="settings[smtp_port]" class="form-control" value="<?php echo htmlspecialchars($settings_map['smtp_port'] ?? ''); ?>">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Trạng thái SMTP (1: Bật, 0: Tắt)</label>
                                            <input type="text" name="settings[smtp_status]" class="form-control" value="<?php echo htmlspecialchars($settings_map['smtp_status'] ?? ''); ?>">
                                        </div>
                                    </div>
                                </div>

                                <!-- Bank Settings -->

                                <h5 class="mt-4">Cài đặt Telegram</h5>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Token Telegram</label>
                                            <input type="text" name="settings[token_telegram]" class="form-control" value="<?php echo htmlspecialchars($settings_map['token_telegram'] ?? ''); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Chat ID Telegram</label>
                                            <input type="text" name="settings[chat_id_telegram]" class="form-control" value="<?php echo htmlspecialchars($settings_map['chat_id_telegram'] ?? ''); ?>">
                                        </div>
                                    </div>
                                </div>

                                <!-- Demo Status -->
                                <h5 class="mt-4">Cài đặt khác</h5>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Trạng thái Demo (1: Bật, 0: Tắt)</label>
                                            <input type="text" name="settings[status_demo]" class="form-control" value="<?php echo htmlspecialchars($settings_map['status_demo'] ?? ''); ?>">
                                        </div>
                                    </div>
                                </div>
                                <h5 class="mt-4">Plugin chat</h5>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Plugin chat cấu hình tại (https://chative.io/vi/)</label>
                                            <textarea name="settings[plugin_chat]" class="form-control"><?php echo htmlspecialchars($settings_map['plugin_chat'] ?? ''); ?></textarea>
                                        </div>
                                    </div>
                                </div>
                                <h5 class="mt-4">Thông báo</h5>
                                <div class="row">
                                    <div class="col-xl-12">

                                        <div class="mb-3">
                                            <label class="form-label">Thông báo hệ thống</label>
                                            <textarea class="form-control" name="settings[system_notification]" id="system_notification"><?php echo htmlspecialchars($settings_map['system_notification'] ?? ''); ?></textarea>
                                        </div>
                                    </div>
                                </div>

                                <h5 class="mt-4">Thông báo trang đặt đơn</h5>
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="mb-3">
                                            <label class="form-label">Nội dung</label>
                                            <textarea class="form-control" name="settings[thongbao_taodon]" id="thongbao_taodon"><?php echo htmlspecialchars($settings_map['thongbao_taodon'] ?? ''); ?></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-12">
                                    <div class="text-start">
                                        <button type="submit" class="btn btn-primary">Lưu thông tin</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        CKEDITOR.replace('system_notification');
        CKEDITOR.replace('thongbao_taodon');
        $('#settingsForm').on('submit', function(e) {
            e.preventDefault();
            CKEDITOR.instances['system_notification'].updateElement();
            CKEDITOR.instances['thongbao_taodon'].updateElement();
            var formData = new FormData(this);
            Notiflix.Loading.standard('Đang xử lý...');
            $.ajax({
                url: $(this).attr('action'),
                type: 'POST',
                data: formData,
                dataType: 'json',
                contentType: false,
                processData: false,
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status === 'success') {
                        Notiflix.Notify.success(response.msg);
                    } else {
                        Notiflix.Notify.failure(response.msg);
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi khi xử lý yêu cầu. Vui lòng thử lại.');
                }
            });
        });
    });
</script>

<?php
$db->dis_connect();
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php');
?>