<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    // Lấy dữ liệu từ form
    $platform_name = Anti_xss($_POST['platform_name']);
    $status = isset($_POST['status']) ? 1 : 0;

    // Xử lý upload file icon
    $icon_path = '';
    if (isset($_FILES['platform_icon']) && $_FILES['platform_icon']['error'] === UPLOAD_ERR_OK) {
        $upload_dir = $_SERVER['DOCUMENT_ROOT'] . '/uploads/platforms/';
        $icon_name = time() . '_' . basename($_FILES['platform_icon']['name']);
        $icon_path = '/uploads/platforms/' . $icon_name;

        // Kiểm tra loại file
        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        $file_type = mime_content_type($_FILES['platform_icon']['tmp_name']);
        if (!in_array($file_type, $allowed_types)) {
            alertBack("Định dạng file không hợp lệ");
        }

        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        if (!move_uploaded_file($_FILES['platform_icon']['tmp_name'], $upload_dir . $icon_name)) {
            alertBack("Không thể upload icon");
        }
    } else {
        alertBack("Vui lòng chọn file icon");
    }

    // Dữ liệu để insert
    $data = [
        'name' => $platform_name,
        'icon' => $icon_path,
        'status' => $status,
        'created_at' => gettime(),
        'updated_at' => gettime()
    ];

    // Thêm vào database
    if ($db->insert('social_media', $data)) {
        alertBack("Thêm nền tảng thành công");
    } else {
        alertBack("Lỗi khi thêm nền tảng");
    }
    $db->dis_connect();
}
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Nền tảng</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Nền tảng</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h3 class="card-title">Thêm nền tảng</h3>
                        <a class="collapse-indicator" data-bs-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="true" aria-controls="collapseFilter">
                            <i class="fa fa-angle-down"></i>
                        </a>
                    </div>
                    <div class="collapsed collapse show" id="collapseFilter">
                        <div class="card-body">
                            <form action="" method="POST" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Tên nền tảng</label>
                                            <input type="text" name="platform_name" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Icon</label>
                                            <input type="file" name="platform_icon" class="form-control" accept="image/*" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <label class="form-label">Trạng thái</label>
                                        <div class="form-check custom-checkbox mb-3">
                                            <input class="form-check-input" type="checkbox" name="status" id="checkboxDeactivation" value="1" checked>
                                            <label class="form-check-label" for="checkboxDeactivation">Hiển thị</label>
                                        </div>
                                        <div class="text-start">
                                            <button type="submit" class="btn btn-primary">Thêm Ngay</button>
                                        </div>
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
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>