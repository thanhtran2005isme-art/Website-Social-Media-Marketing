<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    $result = store_multiple($_POST, $_FILES, $_POST['content'] ?? '', $_POST['language'] ?? 0);
 
    if ($result['status'] === 'success') {
        alertBack($result['message']);
    } else {

        if (isset($result['errors'])) {
            alertBack($result['error']);
        }
    }
}
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Tạo mục FAQ</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Tạo mục FAQ</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h3 class="card-title">Tạo mục FAQ</h3>
                        <a class="collapse-indicator" data-bs-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="true" aria-controls="collapseFilter">
                            <i class="fa fa-angle-down"></i>
                        </a>
                    </div>
                    <div class="collapsed collapse show" id="collapseFilter">
                        <div class="card-body">
                            <form action="" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="content" value="contact">
                            <input type="hidden" name="language" value="1">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="mb-3">
                                            <label class="form-label">Tên</label>
                                            <input type="text" name="name[1]" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="mb-3">
                                            <label class="form-label">Icon</label>
                                            <input type="icon" name="icon[1]" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="mb-3">
                                            <label class="form-label">Liên kết</label>
                                            <input type="url" name="link[1]" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">  
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