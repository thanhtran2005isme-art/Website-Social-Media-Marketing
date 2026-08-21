<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); 
if (isset($_GET['id']) && $data_user['role'] == 1) {
    $categories = $db->get_row(" SELECT * FROM `categories` WHERE `id` = '" . Anti_xss($_GET['id']) . "'  ");
    if (!$categories) {
        new Redirect('/admin/category');
    }
} else {
    new Redirect('/admin/category');
}
?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    // Get form data
    $category_title = Anti_xss($_POST['category_title']);
    $social_media_id = Anti_xss($_POST['social_media_id']);
    $status = isset($_POST['status']) ? 1 : 0;
    $icon_path = $flatform['icon']; // Default to existing icon

    // Handle file upload if new icon is provided
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $upload_dir = $_SERVER['DOCUMENT_ROOT'] . '/uploads/category/';
        $icon_name = time() . '_' . basename($_FILES['image']['name']);
        $new_icon_path = '/uploads/category/' . $icon_name;

        // Check file type
        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        $file_type = mime_content_type($_FILES['image']['tmp_name']);
        if (!in_array($file_type, $allowed_types)) {
            alertBack("Định dạng file không hợp lệ");
        }

        // Create upload directory if it doesn't exist
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        // Upload new file
        if (move_uploaded_file($_FILES['image']['tmp_name'], $upload_dir . $icon_name)) {
            // Delete old icon if it exists and is different from the new one
            if (!empty($categories['image']) && file_exists($_SERVER['DOCUMENT_ROOT'] . $categories['image']) && $categories['image'] !== $new_icon_path) {
                unlink($_SERVER['DOCUMENT_ROOT'] . $categories['image']);
            }
            $icon_path = $new_icon_path;
        } else {
            alertBack("Không thể upload icon");
        }
    }

    // Data to update
    $data = [
        'category_title' => $category_title,
        'social_media_id' => $social_media_id,
        'image' => $icon_path,
        'status' => $status,
        'updated_at' => gettime()
    ];

    // Update database
    if ($db->update('categories', $data, "id = '" . $categories['id'] . "'")) {
        alertBack("Cập nhật danh mục thành công");
    } else {
        alertBack("Lỗi khi cập nhật danh mục");
    }
    $db->dis_connect();
}
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Danh mục</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">Danh mục</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Chỉnh sửa danh mục [<?=$categories['category_title']?>]</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h3 class="card-title">Chỉnh sửa danh mục <span class="text-danger">[<?=$categories['category_title']?>]</span></h3>
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
                                            <label class="form-label">Tên danh mục</label>
                                            <input type="text" name="category_title" class="form-control" value="<?=$categories['category_title']?>" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Nền tảng</label>
                                            <select name="social_media_id" class="selectpicker form-select" required>
                                                <option value="">Chọn nền tảng</option>
                                                <?php foreach ($db->get_list("SELECT * FROM `social_media` WHERE `status` = 1 ORDER BY `id` DESC") as $flatform): ?>
                                                    <option value="<?= $flatform['id'] ?>" <?=$categories['social_media_id'] == $flatform['id'] ? 'selected':''?>><?= $flatform['name'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Icon</label>
                                            <input type="file" name="image" class="form-control" accept="image/*">
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <label class="form-label">Trạng thái</label>
                                        <div class="form-check custom-checkbox mb-3">
                                            <input class="form-check-input" type="checkbox" name="status" id="checkboxDeactivation" value="1" <?=$categories['status'] == 1 ? 'checked':''?>>
                                            <label class="form-check-label" for="checkboxDeactivation">Hiển thị</label>
                                        </div>
                                        <div class="text-start">
                                            <button type="submit" class="btn btn-primary">Lưu Ngay</button>
                                            <a href="/admin/category" type="button" class="btn btn-danger">Quay Lại</a>
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