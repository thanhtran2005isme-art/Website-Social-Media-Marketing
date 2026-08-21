<div class="col-xxl-4">
    <div class="row">
        <div class="col-xl-12">
            <div class="card custom-card">
                <div class="d-flex align-items-center gap-3 p-3 border-bottom border-block-end-dashed">
                    <span class="avatar avatar-xl online">
                        <img src="/assets/images/avt.jpg" alt="">
                    </span>
                    <div class="main-profile-info">
                        <h6 class="fw-semibold mb-1"><?= htmlspecialchars($data_user['lastname'] . ' ' . $data_user['firstname']) ?></h6>
                        <p class="mb-0"><?= htmlspecialchars($data_user['email']) ?></p>
                    </div>
                </div>
                <div class="card-body">
                    <ul class="list-unstyled files-main-nav" id="files-main-nav">
                        <li class="px-0 pt-0"> <span class="fs-12 text-muted">MENU</span> </li>
                        <li class="menu-item files-type">
                            <a href="/user/profile">
                                <div class="d-flex align-items-center">
                                    <div class="me-2"> <i class="ri-user-2-line fs-16"></i> </div>
                                    <span class="flex-fill text-nowrap"> Tài khoản </span>
                                </div>
                            </a>
                        </li>
                        <li class="menu-item files-type">
                            <a href="/user/password-setting">
                                <div class="d-flex align-items-center">
                                    <div class="me-2"> <i class="ri-key-line fs-16"></i> </div>
                                    <span class="flex-fill text-nowrap"> Đổi mật khẩu </span>
                                </div>
                            </a>
                        </li>
                        <li class="menu-item files-type">
                            <a href="/user/two-step/security">
                                <div class="d-flex align-items-center">
                                    <div class="me-2"> <i class="ri-settings-3-line fs-16"></i> </div>
                                    <span class="flex-fill text-nowrap"> Bảo mật 2 lớp </span>
                                </div>
                            </a>
                        </li>
                        <li class="">
                            <a href="/user/logout">
                                <div class="d-flex align-items-center">
                                    <div class="me-2"> <i class="ri-logout-box-line fs-16"></i> </div>
                                    <span class="flex-fill text-nowrap"> Đăng xuất </span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        var url = window.location.pathname;
        var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
        $('.menu-item a').each(function() {
            if (urlRegExp.test($(this).attr('href').replace(/\/$/, ''))) {
                $(this).parent('.menu-item').addClass('active');
            }
        });
    });
</script>