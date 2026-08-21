<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
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
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <div class="d-flex flex-row p-4 gap-4 justify-items-center">
                        <span class="card-icon">
                            <i class="text-primary fa fa-gear"></i>
                        </span>
                        <div class="d-flex flex-column">
                            <h5>Basic Control</h5>
                            <span class="">Những thông tin cơ bản như tiêu đề trang web, múi giờ, tiền tệ, thông báo, xác minh, v.v.</span>
                            <span class="mt-1 link-text">
                                <a href="/admin/basic-control">Thay đổi cài đặt <i class="fa fa-chevron-right"></i>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <div class="d-flex flex-row p-4 gap-4 justify-items-center">
                        <span class="card-icon ">
                            <i class="text-primary fa fa-image"></i>
                        </span>
                        <div class="d-flex flex-column">
                            <h5>Logo</h5>
                            <span class="">Cài đặt logo như logo, logo chân trang, logo quản trị, favicon, breadcrumb.</span>
                            <span class="mt-1 link-text">
                                <a href="/admin/logo-setting">Thay đổi cài đặt <i class="fa fa-chevron-right"></i>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <div class="d-flex flex-row p-4 gap-4 justify-items-center">
                        <span class="card-icon ">
                            <i class="text-primary fa fa-toolbox"></i>
                        </span>
                        <div class="d-flex flex-column">
                            <h5>Plugin</h5>
                            <span class="">Nhắn tin cho khách hàng, captcha bảo vệ, Google phân tích trang web của bạn, v.v.</span>
                            <span class="mt-1 link-text">
                                <a href="/admin/plugin">Thay đổi cài đặt <i class="fa fa-chevron-right"></i>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <div class="d-flex flex-row p-4 gap-4 justify-items-center">
                        <span class="card-icon ">
                            <i class="text-primary fa fa-screwdriver-wrench"></i>
                        </span>
                        <div class="d-flex flex-column">
                            <h5>Chế độ bảo trì</h5>
                            <span class="">Chế độ bảo trì là tính năng cho phép bạn tạm thời vô hiệu hóa quyền truy cập vào giao diện cửa hàng trực tuyến của mình trong khi thực hiện cập nhật.</span>
                            <span class="mt-1 link-text">
                                <a href="/admin/maintenance-mode">Thay đổi cài đặt <i class="fa fa-chevron-right"></i>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </div> -->

            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <div class="d-flex flex-row p-4 gap-4 justify-items-center">
                        <span class="card-icon ">
                            <i class="text-primary fa fa-share-nodes"></i>
                        </span>
                        <div class="d-flex flex-column">
                            <h5>Socialite</h5>
                            <span class="">Cài đặt mạng xã hội như lợi thế cho người dùng đăng nhập vào bảng điều khiển mà không cần phải đăng ký.</span>
                            <span class="mt-1 link-text">
                                <a href="/admin/socialite">Thay đổi cài đặt <i class="fa fa-chevron-right"></i>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>
</div>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>