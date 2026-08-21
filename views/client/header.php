<?php
$client_ip = Anti_xss($_SERVER['REMOTE_ADDR']);
$query = $db->get_row("SELECT ip,reason FROM blacklist_ips WHERE ip = '{$client_ip}'");
if ($query) {
    http_response_code(403);
    die($query['reason']);
}

if (!@$user) {
    new Redirect('/login');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="vertical" data-theme-mode="light" data-header-styles="light" data-menu-styles="dark" data-toggled="close">

<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=no'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?= $title ?></title>
    <link rel="shortcut icon" href="https://<?= $_SERVER['SERVER_NAME'] . $general_data['favicon'] ?>" type="image/x-icon">

    <meta name="description" content="<?= $general_data['description'] ?>">
    <meta name="keywords" content="<?= $general_data['keywords'] ?>">
    <meta name="author" content="">
    <meta name="robots" content="index, follow">
    <meta name="googlebot" content="index, follow">
    <meta name="google" content="notranslate">
    <meta name="generator" content="<?= $_SERVER['SERVER_NAME'] ?>">

    <meta name="application-name" content="<?= $general_data['title'] ?>">
    <meta property="og:image" content="https://<?= $_SERVER['SERVER_NAME'] . $general_data['cover_photo'] ?>">
    <meta property="og:image:secure_url" content="https://<?= $_SERVER['SERVER_NAME'] . $general_data['cover_photo'] ?>">
    <meta property="og:image:width" content="128">
    <meta property="og:image:height" content="128">
    <meta property="og:image:alt" content="<?= $general_data['title'] ?>">
    <meta property="og:title" content="<?= $general_data['title'] ?>">
    <meta property="og:site_name" content="<?= $general_data['title'] ?>">
    <meta property="og:description" content="<?= $general_data['description'] ?>">
    <meta property="og:url" content="https://<?= $_SERVER['SERVER_NAME'] ?>/user/dashboard">
    <meta property="og:type" content="website">

    <script src="/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>
    <script src="/assets/js/main.js"></script>
    <link id="style" href="/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/styles.css" rel="stylesheet">
    <link href="/assets/css/custom.css?v=<?= time() ?>" rel="stylesheet">
    <link href="/assets/css/icons.css" rel="stylesheet">
    <link href="/assets/libs/node-waves/waves.min.css" rel="stylesheet">
    <link href="/assets/libs/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/libs/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="/assets/libs/@simonwep/pickr/themes/nano.min.css">
    <link rel="stylesheet" href="/assets/libs/choices.js/public/assets/styles/choices.min.css">
    <link rel="stylesheet" href="/assets/libs/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="/assets/libs/@tarekraafat/autocomplete.js/css/autoComplete.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/notiflix@3/dist/notiflix-3.2.7.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/notiflix@3/dist/notiflix-3.2.7.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Signika:wght@600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            font-family: 'Signika', sans-serif;
            letter-spacing: 0.5px;
        }

        .new_order .social-btn {
            background-color: #F8F8FA;
            display: flex;
            align-items: center;
            justify-content: start;
            font-weight: 600;
            font-size: 17px;
            text-transform: capitalize;
            color: #26282C;
            padding: 12px 20px;
            border-radius: 10px;
            gap: 10px;
            transition: border-color 0.3s ease;
            border: none;
        }

        .social-btn.active {
            border: 1px solid rgba(30, 17, 180) !important;
        }

        .new_order .social-media-img {
            width: 30px !important;
        }

        .chart-container {
            position: relative;
            height: 300px;
            max-width: 500px;
            margin: 0 auto;
        }

        .chart-total {
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .chart-total small {
            display: block;
            font-size: 14px;
            font-weight: normal;
            color: #666;
        }

        .legend-list {
            list-style: none;
            padding: 0;
            text-align: center;
        }

        .legend-list li {
            display: inline-block;
            margin: 0 10px;
        }

        .legend-color {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            display: inline-block;
            vertical-align: middle;
            margin-right: 5px;
        }

        .btn-whatsapp {
            background-color: #25D366;
            border-color: #25D366;
            color: #fff;
        }

        .btn-whatsapp:hover {
            background-color: #20BA56;
            border-color: #20BA56;
            color: #fff;
        }

        .btn-telegram {
            background-color: #0088cc;
            border-color: #0088cc;
            color: #fff;
        }

        .btn-telegram:hover {
            background-color: #0077b3;
            border-color: #0077b3;
            color: #fff;
        }

        .btn-linkedin {
            background-color: #0A66C2;
            border-color: #0A66C2;
            color: #fff;
        }

        .btn-linkedin:hover {
            background-color: #0959A6;
            border-color: #0959A6;
            color: #fff;
        }

        .btn-pinterest {
            background-color: #E60023;
            border-color: #E60023;
            color: #fff;
        }

        .btn-pinterest:hover {
            background-color: #CC001F;
            border-color: #CC001F;
            color: #fff;
        }

        .btn-email {
            background-color: #6c757d;
            border-color: #6c757d;
            color: #fff;
        }

        .btn-email:hover {
            background-color: #5c636a;
            border-color: #5c636a;
            color: #fff;
        }

        @media (max-width: 576px) {
            .social-share a {
                display: inline-block;
                width: 100%;
                margin-bottom: 10px;
            }
        }

        .nav-item-custom {
            flex: 1 1 auto;
        }

        .main-sidebar-header {
            background: transparent !important;
        }

        .app-sidebar .side-menu__item {
            color: #fff !important;
        }

        .app-sidebar .side-menu__label {
            color: #fff !important;
        }

        .app-sidebar .slide__category {
            color: #fff !important;
            opacity: 0.75 !important;
        }

        /* .app-sidebar {

            background: url(<?= $general_data['sidebar'] ?>) no-repeat bottom left #161b22;
        } */
         .app-sidebar {

            background: #050d18;
        }

        .app-sidebar .side-menu__item.active {
            padding: .5rem 1.25rem !important;
            background-color: #6e71ff !important;
            color: #e7e7ff !important;
        }

        .noti {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            box-shadow: 0 2px 3px rgba(4, 4, 7, .2);

            text-align: center;
            height: 2.5rem;
            width: 2.5rem;

        }

        .currency-img {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            box-shadow: 0 2px 3px rgba(4, 4, 7, .2);

            text-align: center;
            height: 2.5rem;
            width: 2.5rem;
        }


        .header-link .avatar {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            box-shadow: 0 2px 3px rgba(4, 4, 7, .2);
            text-align: center;
            height: 2.5rem;
            width: 2.5rem;
        }

        /* Fixed Bottom Navigation */
        .fixed-bottom-nav {
            display: none;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #fff;
            /* White background */
            border-top: 1px solid #ddd;
            /* Light border on top */
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
            /* Subtle shadow for elevation */
            z-index: 1000;
            /* Ensure it stays above other content */
        }

        /* Navigation list */
        .nav-list {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 10px 0;
            margin: 0;
            list-style: none;
        }

        /* Navigation item */
        .nav-list .nav-item {
            flex: 1;
            text-align: center;
        }

        /* Navigation link */
        .nav-list .nav-link {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
            color: #333;
            /* Dark text color */
            font-size: 18px;
            transition: color 0.3s ease;
        }

        /* Navigation icon */
        .nav-list .nav-link .nav-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            /* Slightly larger than header icons for better touch target */
            height: 40px;
            border-radius: 50%;
            /* Circular shape */
            /* border: 1px solid #007bff; */
            /* Match header border */
            box-shadow: 0 2px 3px rgba(4, 4, 7, 0.2);
            /* Match header shadow */
            background-color: #fff;
            /* White background */
            margin-bottom: 5px;
            /* Space between icon and label */
        }

        /* Icon inside nav-icon */
        .nav-list .nav-link .nav-icon i {
            font-size: 20px;

        }

        /* Navigation label */
        .nav-list .nav-link .nav-label {
            font-size: 12px;
            /* Smaller font for label */
            font-weight: 500;
        }

        @media (max-width: 576px) {
            .nav-list .nav-link .nav-label {
                font-size: 10px;
                /* Smaller font on mobile */
            }

            .nav-list .nav-link .nav-icon {
                width: 36px;
                /* Slightly smaller on mobile */
                height: 36px;
            }

            .nav-list .nav-link .nav-icon i {
                font-size: 16px;
                /* Adjust icon size on mobile */
            }

        }

        /* Ensure main content doesn't overlap with fixed nav */
        .scrollToTop {
            color: #fff !important;
            background-image: linear-gradient(to right, var(--primary-color) 0, var(--primary06) 100%) !important;

        }

        .scrollToTop:hover {
            color: rgb(92, 103, 247) !important;
            border: 2px solid var(--primary-color) !important;
            background: var(--custom-white) !important;
        }

        @media (min-width: 768px) {
            .social-btn {
                width: 100%;
            }
        }

        @media (max-width: 768px) {

            /* Show on screens ≤ 768px */
            .fixed-bottom-nav {
                display: block;
            }

            .page {
                padding-bottom: 70px;
                /* Space for fixed nav height */
            }

            .scrollToTop {
                inset-block-end: 100px !important;
            }

            .title-social {
                display: none;
            }

        }
        
    </style>
</head>

<body>

    <div class="page">
        <header class="app-header sticky" id="header">
            <div class="main-header-container container-fluid">
                <div class="header-content-left">
                    <div class="header-element">
                        <div class="horizontal-logo">
                            <a href="/user/dashboard" class="header-logo">
                                <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['favicon'] ?>" alt="logo" class="desktop-logo">
                                <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['favicon'] ?>" alt="logo" class="toggle-dark">
                                <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['favicon'] ?>" alt="logo" class="desktop-dark">
                                <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['favicon'] ?>" alt="logo" class="toggle-logo">
                                <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['favicon'] ?>" alt="logo" class="toggle-white">
                                <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['favicon'] ?>" alt="logo" class="desktop-white">
                            </a>
                        </div>
                    </div>
                    <div class="header-element mx-lg-0 mx-2"> <a aria-label="Hide Sidebar" class="sidemenu-toggle header-link animated-arrow hor-toggle horizontal-navtoggle" data-bs-toggle="sidebar" href="javascript:void(0);"><span></span></a> </div>
                </div>
                <ul class="header-content-right">
                    <li class="header-element country-selector dropdown">
                        <a href="javascript:void(0);" class="header-link dropdown-toggle" data-bs-auto-close="outside" data-bs-toggle="dropdown">
                            <span class="currency-img avatar-xs lh-1 me-2">
                                <img src="<?= getCountryFlag($data_user['currency_code']) ?>" alt="img">
                            </span>
                        </a>
                        <ul class="main-header-dropdown dropdown-menu dropdown-menu-end" data-popper-placement="none">
                            <?php foreach ($db->get_list("SELECT * FROM `currencies` WHERE `status` = 1") as $currency): ?>
                                <li>
                                    <a class="dropdown-item dropdown-item-currentcy d-flex align-items-center" href="javascript:void(0);" data-currency-code="<?= $currency['currency_code'] ?>">
                                        <span class="avatar avatar-xs lh-1 me-2">
                                            <img src="<?= getCountryFlag($currency['currency_code']) ?>" alt="img">
                                        </span>
                                        <?= $currency['name'] ?>
                                    </a>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    </li>

                    <!-- <li class="header-element country-selector dropdown">
                        <a href="javascript:void(0);" class="header-link dropdown-toggle" data-bs-auto-close="outside" data-bs-toggle="dropdown">
                            <span class="currency-img avatar-xs lh-1 me-2">
                                <img src="" id="current-lang-icon" alt="Language">
                            </span>
                        </a>
                        <ul class="main-header-dropdown dropdown-menu dropdown-menu-end" data-popper-placement="none">
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                                    English
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                                    Tiếng Việt
                                </a>
                            </li>
                        </ul>
                    </li> -->
                    <li class="header-element notifications-dropdown dropdown">
                        <a href="javascript:void(0);" class="header-link dropdown-toggle" data-bs-toggle="dropdown" data-bs-auto-close="outside" id="messageDropdown" aria-expanded="false">
                            <span class="noti"><i class="bi bi-bell fs-18"></i></span>
                        </a>
                        <div class="main-header-dropdown dropdown-menu dropdown-menu-end" data-popper-placement="none">
                            <div class="p-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <p class="mb-0 fs-15 fw-medium">Thông báo</p><span class="badge bg-secondary text-fixed-white" id="notifiation-data">0</span>
                                </div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <ul class="list-unstyled mb-0" id="header-notification-scroll" data-simplebar="init">
                                <div class="simplebar-wrapper" style="margin: 0px;">
                                    <div class="simplebar-height-auto-observer-wrapper">
                                        <div class="simplebar-height-auto-observer"></div>
                                    </div>
                                    <div class="simplebar-mask">
                                        <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                            <div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content" style="height: auto; overflow: hidden;">
                                                <div class="simplebar-content" style="padding: 0px;">
                                                    <li class="dropdown-item">
                                                        <div class="d-flex align-items-center">
                                                            <div class="pe-2 lh-1"> <span class="avatar avatar-md avatar-rounded bg-primary"> <img src="../assets/images/faces/1.jpg" alt="user1"> </span> </div>
                                                            <div class="flex-grow-1 d-flex align-items-center justify-content-between">
                                                                <div>
                                                                    <p class="mb-0 fw-medium"><a href="chat.html">New Messages</a></p>
                                                                    <div class="text-muted fw-normal fs-12 header-notification-text text-truncate">Jane Sam sent you a message.</div>
                                                                    <div class="fw-normal fs-10 text-muted op-8">Now</div>
                                                                </div>
                                                                <div> <a href="javascript:void(0);" class="min-w-fit-content dropdown-item-close1"> <i class="ri-close-line"></i> </a> </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="dropdown-item">
                                                        <div class="d-flex align-items-center">
                                                            <div class="pe-2 lh-1"> <span class="avatar avatar-md bg-primary avatar-rounded fs-20"> <i class="fe fe-shopping-cart lh-1 "></i> </span> </div>
                                                            <div class="flex-grow-1 d-flex align-items-center justify-content-between">
                                                                <div>
                                                                    <p class="mb-0 fw-medium"><a href="chat.html">Order Updates</a></p>
                                                                    <div class="text-muted fw-normal fs-12 header-notification-text text-truncate">Order <span class="text-primary1">#54321</span> has been shipped.</div>
                                                                    <div class="fw-normal fs-10 text-muted op-8">2 hours ago</div>
                                                                </div>
                                                                <div> <a href="javascript:void(0);" class="min-w-fit-content dropdown-item-close1"> <i class="ri-close-line"></i> </a> </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="dropdown-item">
                                                        <div class="d-flex align-items-center">
                                                            <div class="pe-2 lh-1"> <span class="avatar avatar-md bg-orange avatar-rounded"> <img src="../assets/images/faces/10.jpg" alt="user1"> </span> </div>
                                                            <div class="flex-grow-1 d-flex align-items-center justify-content-between">
                                                                <div>
                                                                    <p class="mb-0 fw-medium"><a href="chat.html">Comment on Post</a></p>
                                                                    <div class="text-muted fw-normal fs-12 header-notification-text text-truncate">Reacted: <span class="text-primary3">John Richard</span> on your next purchase!</div>
                                                                    <div class="fw-normal fs-10 text-muted op-8">2 hours ago</div>
                                                                </div>
                                                                <div> <a href="javascript:void(0);" class="min-w-fit-content dropdown-item-close1"> <i class="ri-close-line"></i> </a> </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="dropdown-item">
                                                        <div class="d-flex align-items-center">
                                                            <div class="pe-2 lh-1"> <span class="avatar avatar-md bg-success avatar-rounded"> <img src="../assets/images/faces/11.jpg" alt="user1"> </span> </div>
                                                            <div class="flex-grow-1 d-flex align-items-center justify-content-between">
                                                                <div>
                                                                    <p class="mb-0 fw-medium"><a href="chat.html">Follow Request</a></p>
                                                                    <div class="text-muted fw-normal fs-12 header-notification-text text-truncate"><span class="text-info">Kelin Brown</span> has sent you the request.</div>
                                                                    <div class="fw-normal fs-10 text-muted op-8">1 Day ago</div>
                                                                </div>
                                                                <div> <a href="javascript:void(0);" class="min-w-fit-content dropdown-item-close1"> <i class="ri-close-line"></i> </a> </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="dropdown-item">
                                                        <div class="d-flex align-items-center">
                                                            <div class="pe-2 lh-1"> <span class="avatar avatar-md bg-primary2 avatar-rounded"> <i class="ri-gift-line lh-1 fs-16"></i> </span> </div>
                                                            <div class="flex-grow-1 d-flex align-items-center justify-content-between">
                                                                <div>
                                                                    <p class="mb-0 fw-medium"><a href="chat.html">Exclusive Offers</a></p>
                                                                    <div class="text-muted fw-normal fs-12 header-notification-text text-truncate">Enjoy<span class="text-success">20% off</span> on your next purchase!</div>
                                                                    <div class="fw-normal fs-10 text-muted op-8">5 hours ago</div>
                                                                </div>
                                                                <div> <a href="javascript:void(0);" class="min-w-fit-content dropdown-item-close1"> <i class="ri-close-line"></i> </a> </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="simplebar-placeholder" style="width: 0px; height: 0px;"></div>
                                </div>
                                <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                                    <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                                </div>
                                <div class="simplebar-track simplebar-vertical" style="visibility: hidden;">
                                    <div class="simplebar-scrollbar" style="height: 0px; display: none;"></div>
                                </div>
                            </ul>
                            <div class="p-3 empty-header-item1 border-top">
                                <div class="d-grid"> <a href="javascript:void(0);" class="btn btn-primary btn-wave waves-effect waves-light">Xem tất cả</a> </div>
                            </div>
                            <div class="p-5 empty-item1 d-none">
                                <div class="text-center"> <span class="avatar avatar-xl avatar-rounded bg-secondary-transparent"> <i class="ri-notification-off-line fs-2"></i> </span>
                                    <h6 class="fw-medium mt-3">No New Notifications</h6>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="header-element dropdown"><a href="javascript:void(0);" class="header-link dropdown-toggle" id="mainHeaderProfile" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                            <div class="d-flex align-items-center">
                                <div> <img src="/assets/images/avt.jpg" alt="img" class="avatar avatar-sm"> </div>
                            </div>
                        </a>
                        <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
                            <li>
                                <div class="dropdown-item text-center border-bottom"> <span> <?= $data_user['lastname'] . ' ' . $data_user['firstname'] ?> </span> <span class="d-block fs-14 text-danger">Số dư: <?= formatCurrencyF($data_user['balance']) ?></span> </div>
                            </li>
                            <?php if ($data_user['role'] == 1): ?>
                                <li><a class="dropdown-item d-flex align-items-center" href="/admin/dashboard" target="_blank"><i class="fe fe-shield p-1 rounded-circle bg-primary-transparent me-2 fs-16"></i>Truy cập quản lý</a></li>
                            <?php endif; ?>
                            <li><a class="dropdown-item d-flex align-items-center" href="/user/profile"><i class="fe fe-user p-1 rounded-circle bg-primary-transparent me-2 fs-16"></i>Tài khoản</a></li>
                            <li><a class="dropdown-item d-flex align-items-center" href="/user/two-step/security"><i class="fe fe-settings p-1 rounded-circle bg-primary-transparent ings me-2 fs-16"></i>Bảo mật 2 lớp</a></li>
                            <li><a class="dropdown-item d-flex align-items-center" href="/user/transaction"><i class="fe fe-clock p-1 rounded-circle bg-primary-transparent ings me-2 fs-16"></i>Giao dịch</a></li>
                                                                                    <li><a class="dropdown-item d-flex align-items-center" href="/user/log"><i class="fe fe-chrome p-1 rounded-circle bg-primary-transparent ings me-2 fs-16"></i>Hoạt động</a></li>
                            <li><a class="dropdown-item d-flex align-items-center" href="/user/logout"><i class="fe fe-lock p-1 rounded-circle bg-primary-transparent ut me-2 fs-16"></i>Đăng xuất</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>
        <nav class="fixed-bottom-nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="/services" class="nav-link">
                        <span class="nav-icon">
                            <i class="bi bi-gear fs-18"></i>
                        </span>
                        <span class="nav-label">Dịch Vụ</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/user/mass/order" class="nav-link">
                        <span class="nav-icon">
                            <i class="bi bi-cart-plus fs-18"></i>
                        </span>
                        <span class="nav-label">Đặt SLL</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/user/order/create" class="nav-link">
                        <span class="nav-icon">
                            <i class="bi bi-plus-circle fs-18"></i>
                        </span>
                        <span class="nav-label">Đặt đơn</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/user/orders" class="nav-link">
                        <span class="nav-icon">
                            <i class="bi bi-list-check fs-18"></i>
                        </span>
                        <span class="nav-label">Đơn hàng</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/user/profile" class="nav-link">
                        <span class="nav-icon">
                            <i class="bi bi-person fs-18"></i>
                        </span>
                        <span class="nav-label">Tài khoản</span>
                    </a>
                </li>
            </ul>
        </nav>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const navLinks = document.querySelectorAll('.fixed-bottom-nav .nav-link');
                const currentPath = window.location.pathname;
                navLinks.forEach(link => {
                    const linkPath = new URL(link.href).pathname;
                    if (currentPath === linkPath) {
                        link.classList.add('active');
                        const navIcon = link.querySelector('.nav-icon');
                        if (navIcon) {
                            navIcon.classList.add('bg-primary', 'text-white');
                        }
                    }
                });
            });
        </script>
        <?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/sidebar.php'); ?>