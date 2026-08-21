<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
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
                        <h4 class="card-title mb-0">Cấu hình Socialite</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center p-2 bg-action-light rounded my-1">
                            <div class="avatar avatar-sm bg-white p-2">
                                <img src="/assets/images/google.png" alt="">
                            </div>
                            <div class="clearfix ms-3">
                                <h6 class="mb-0 fw-semibold">Google</h6>
                                <span class="small d-block">Socialite đăng nhập khách hàng của bạn, họ sẽ yêu bạn vì điều đó</span>
                            </div>
                            <div class="clearfix ms-auto">
                                <a href="/admin/google-config" class="btn btn-square btn-primary light btn-sm">
                                    <i class="fa fa-pen "></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>