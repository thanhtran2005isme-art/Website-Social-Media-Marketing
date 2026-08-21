<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }

    $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/uploads/theme/';
    // Xử lý logo
    uploadFile(
        $_FILES['logo'],
        $uploadDir,
        ['image/png', 'image/jpeg', 'image/jpg', 'gif'],
        20 * 1024 * 1024,
        $general_data,
        'logo_light'
    );

    // Xử lý favicon
    uploadFile(
        $_FILES['favicon'],
        $uploadDir,
        ['image/png', 'image/jpeg', 'image/jpg', 'image/x-icon', 'gif'],
        20 * 1024 * 1024,
        $general_data,
        'favicon'
    );

    uploadFile(
        $_FILES['cover'],
        $uploadDir,
        ['image/png', 'image/jpeg', 'image/jpg', 'image/x-icon', 'gif'],
        20 * 1024 * 1024,
        $general_data,
        'cover_photo'
    );
    uploadFile(
        $_FILES['sidebar'],
        $uploadDir,
        ['image/png', 'image/jpeg', 'image/jpg', 'image/x-icon', 'gif'],
        20 * 1024 * 1024,
        $general_data,
        'sidebar'
    );

    // Lưu dữ liệu
    if (updateConfig('general', $general_data)) {
        alertBack("Lưu cấu hình thành công!");
    } else {
        alertBack("Lưu cấu hình thất bại!");
    }
}
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
                        <h4 class="card-title mb-0">Basic Controls</h4>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Website Logo</label>
                                    <input type="file" name="logo" id="logoInput" class="filepond" accept="image/png,image/jpeg,image/jpg">
                                    <?php if (!empty($general_data['logo_light'])): ?>
                                        <div class="mt-2">
                                            <img src="<?= htmlspecialchars($general_data['logo_light']) ?>" alt="Logo" style="max-width: 100px;">
                                            <p><small>Logo hiện tại</small></p>

                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Favicon</label>
                                    <input type="file" name="favicon" id="faviconInput" class="filepond" accept="image/png,image/jpeg,image/jpg,image/x-icon">
                                    <?php if (!empty($general_data['favicon'])): ?>
                                        <div class="mt-2">
                                            <img src="<?= htmlspecialchars($general_data['favicon']) ?>" alt="Favicon" style="max-width: 100px;">
                                            <p><small>Favicon hiện tại</small></p>

                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Ảnh bìa</label>
                                    <input type="file" name="cover" id="coverInput" class="filepond" accept="image/png,image/jpeg,image/jpg,image/x-icon">
                                    <?php if (!empty($general_data['cover_photo'])): ?>
                                        <div class="mt-2">
                                            <img src="<?= htmlspecialchars($general_data['cover_photo']) ?>" alt="Favicon" style="max-width: 100px;">
                                            <p><small>Ảnh bìa hiện tại</small></p>

                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Ảnh sidebar</label>
                                    <input type="file" name="sidebar" id="sidebarInput" class="filepond" accept="image/png,image/jpeg,image/jpg,image/x-icon">
                                    <?php if (!empty($general_data['sidebar'])): ?>
                                        <div class="mt-2">
                                            <img src="<?= htmlspecialchars($general_data['sidebar']) ?>" alt="Favicon" style="max-width: 100px;">
                                            <p><small>Ảnh sidebar hiện tại</small></p>

                                        </div>
                                    <?php endif; ?>
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
<link href="https://unpkg.com/filepond@^4/dist/filepond.css" rel="stylesheet">
<script src="https://unpkg.com/filepond@^4/dist/filepond.min.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-preview@^4/dist/filepond-plugin-image-preview.min.js"></script>
<link href="https://unpkg.com/filepond-plugin-image-preview@^4/dist/filepond-plugin-image-preview.css" rel="stylesheet">
<style>
    .filepond--root {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    }

    .filepond--panel-root {
        border: 2px dashed #007bff;
        background: #f8f9fa;
        border-radius: 5px;
    }

    .filepond--item {
        margin: 10px;
    }
</style>
<script>
    // Đăng ký plugin FilePond
    FilePond.registerPlugin(FilePondPluginImagePreview);

    // Hàm khởi tạo FilePond
    function initFilePond(inputId, acceptedFileTypes, maxFileSize, labelIdle, imagePreviewHeight) {
        FilePond.create(document.querySelector(`#${inputId}`), {
            allowMultiple: false,
            acceptedFileTypes: acceptedFileTypes,
            maxFileSize: maxFileSize,
            labelIdle: labelIdle,
            imagePreviewHeight: imagePreviewHeight,
            storeAsFile: true,
            onremovefile: (error, file) => {
                if (!error) {
                    document.querySelector(`#${inputId}`).value = '';
                }
            },
            onaddfile: (error, file) => {
                if (!error) {
                    document.querySelector(`#${inputId}`).files = [file.file];
                }
            }
        });
    }

    // Khởi tạo FilePond cho logo
    initFilePond(
        'logoInput',
        ['image/png', 'image/jpeg', 'image/jpg'],
        '20MB',
        'Kéo và thả logo hoặc <span class="filepond--label-action">Chọn tệp</span> (PNG/JPG, tối đa 20MB)',
        100
    );

    // Khởi tạo FilePond cho favicon
    initFilePond(
        'faviconInput',
        ['image/png', 'image/jpeg', 'image/jpg', 'image/x-icon'],
        '20MB',
        'Kéo và thả favicon hoặc <span class="filepond--label-action">Chọn tệp</span> (PNG/JPG/ICO, tối đa 20MB)',
        32
    );
    initFilePond(
        'coverInput',
        ['image/png', 'image/jpeg', 'image/jpg', 'image/x-icon'],
        '20MB',
        'Kéo và thả favicon hoặc <span class="filepond--label-action">Chọn tệp</span> (PNG/JPG/ICO, tối đa 20MB)',
        32
    );
    initFilePond(
        'sidebarInput',
        ['image/png', 'image/jpeg', 'image/jpg', 'image/x-icon'],
        '20MB',
        'Kéo và thả favicon hoặc <span class="filepond--label-action">Chọn tệp</span> (PNG/JPG/ICO, tối đa 20MB)',
        32
    );
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>