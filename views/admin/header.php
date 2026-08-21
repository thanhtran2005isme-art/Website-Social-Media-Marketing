<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
$client_ip = Anti_xss($_SERVER['REMOTE_ADDR']);
$query = $db->get_row("SELECT ip,reason FROM blacklist_ips WHERE ip = '{$client_ip}'");
if ($query) {
    http_response_code(403);
    die($query['reason']);
}
if (!@$user || $data_user['role'] != 1) {
    new Redirect('/login');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Title -->
    <title>Admin Dashboard</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/assets/admin/css/jquery.localizationTool.css" rel="stylesheet">
    <link href="/assets/admin/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="/assets/admin/vendor/swiper/css/swiper-bundle.min.css" rel="stylesheet">
    <link href="/assets/admin/css/switcher.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.4/nouislider.min.css">
    <link href="/assets/admin/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="/assets/admin/vendor/jvmap/jquery-jvectormap.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="/assets/admin/vendor/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <!-- tagify-css -->
    <link href="/assets/admin/vendor/tagify/dist/tagify.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/notiflix@3/dist/notiflix-3.2.7.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/notiflix@3/dist/notiflix-3.2.7.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- <link href="/assets/admin/vendor/dropzone/dropzone.min.css" rel="stylesheet"> -->
    <!-- Style css -->
    <link href="/assets/admin/css/plugins.css" rel="stylesheet">
    <link href="/assets/admin/css/style.css?v=<?=time()?>" rel="stylesheet">
          <script src="/assets/admin/ckeditor/ckeditor.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Signika:wght@600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Play:wght@600;700;800&display=swap" rel="stylesheet">
    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <style>
        * {
            font-family: 'Signika', sans-serif;
            letter-spacing: 0.5px;
            --primary-color: #1C2E9E;
            --primary: #1C2E9E;
            --sidebar-bg: #2C2C2C;
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 20px;
        }


        .pagination a {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background-color: #ffffff;
            /* White background for inactive */
            color: #4b5563;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.2s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            /* Added shadow */
        }

        .pagination a:hover {
            background-color: #e0e7ff;
        }

        .pagination a.active {
            background-color: #1C2E9E;
            /* bg-indigo-600 */
            color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            /* Slightly stronger shadow for active */
        }

        .filter_dropdown {

            min-width: 22rem !important;
        }

        .dropdown-card {
            padding: 0;
        }

        .dropdown-menu .card {
            border-color: transparent;
            box-shadow: none;
        }

        .select2-container--default .select2-selection--single {
            height: 2.7rem !important;
            border: 1px solid #CCCCCC !important;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow {
            top: 0.375rem !important;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 1.5rem !important;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            padding-left: 0px !important;
        }

        .card-icon i {
            font-size: 25px;
            padding: 5px 10px;
            background-color: rgba(189, 197, 209, .2);
            border-radius: 5px;
        }

        .menu-icon img {
            width: 22px;
            height: 22px;
            margin-right: 5px;
        }

        span.nav-text {
            font-size: 13px !important;
        }

        .deznav .metismenu .menu-title {
            font-size: 0.65rem !important;

        }

        .deznav .metismenu>li>a {
            color: rgba(255, 255, 255, 0.85) !important;
        }

        .deznav .metismenu>li {
            color: rgba(255, 255, 255, 0.85) !important;
        }

        .deznav .metismenu a {
            color: rgba(255, 255, 255, 0.8) !important;
        }

        .deznav .metismenu>li.mm-active>a {
            background: rgba(255, 255, 255, 0.15) !important;
            color: #fff;
        }

        .bg-warning-subtle {
            background-color: #fff3cd !important;
            /* Màu nền sáng hơn */
        }

        .border-warning {
            border-color: #ffc107 !important;
            /* Viền vàng đậm */
        }

        .blockquote {
            margin-bottom: 1.5rem;
            /* Tăng khoảng cách dưới tiêu đề */
        }

        .blockquote-footer {
            color: #333;
            /* Màu chữ đậm hơn */
        }

        .cron-note {
            color: #555;
            /* Màu chữ chú thích nhẹ hơn */
            line-height: 1.5;
            /* Tăng khoảng cách dòng */
        }
        /* Accordion Styling */
.accordion {
    border: none;
    background: transparent;
}

.accordion-item {
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    margin-bottom: 5px;
    background: #fff;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.accordion-button {
    font-size: 14px;
    font-weight: 600;
    color: #4B0082;
    background: #f8f9fa;
    padding: 8px 12px;
    border-radius: 4px 4px 0 0;
    transition: background-color 0.2s ease, color 0.2s ease;
}

.accordion-button:not(.collapsed) {
    background: #e9ecef;
    color: #2F4F4F;
}

.accordion-button:focus {
    box-shadow: none;
    outline: none;
}

.accordion-button::after {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%234B0082'%3E%3Cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3E%3C/svg%3E");
    transition: transform 0.2s ease;
}

.accordion-button:not(.collapsed)::after {
    transform: rotate(180deg);
}

.accordion-body {
    padding: 10px 12px;
    font-size: 13px;
    background: #fff;
    border-top: 1px solid #e0e0e0;
    border-radius: 0 0 4px 4px;
}
/* 
.accordion-body div {
    display: flex;
    flex-direction: column;
    gap: 6px;
} */

.accordion-body span {
    line-height: 1.4;
    word-break: break-word;
}

/* Ensure table cell padding is minimal for compactness */
.table td .accordion {
    margin: 0;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .accordion-button {
        font-size: 13px;
        padding: 6px 10px;
    }
    .accordion-body {
        font-size: 12px;
        padding: 8px 10px;
    }
}
    </style>
</head>

<body data-typography="poppins" data-theme-version="light" data-layout="vertical" data-nav-headerbg="black" data-headerbg="color_1">
    <div id="preloader">
        <div class="lds-ripple">
            <div></div>
            <div></div>
        </div>
    </div>
    <div id="main-wrapper">
        <div class="nav-header">
            <a href="/admin/dashboard" class="brand-logo">
                <svg class="logo-abbr" width="39" height="23" viewBox="0 0 39 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path class="w3" d="M32.0362 22H19.0466L20.7071 18.7372C20.9559 18.2484 21.455 17.9378 22.0034 17.9305L31.1036 17.8093C33.0753 17.6497 33.6571 15.9246 33.7015 15.0821C33.7015 13.2196 32.1916 12.5765 31.4367 12.4878H23.7095L25.9744 8.49673H30.4375C31.8763 8.3903 32.236 7.03332 32.236 6.36814C32.3426 4.93133 30.9482 4.61648 30.2376 4.63865H28.6955C28.2646 4.63865 27.9788 4.19212 28.1592 3.8008L29.7047 0.44798C31.0903 0.394765 32.8577 0.780573 33.5683 0.980129C38.6309 3.42801 37.0988 7.98676 35.6999 9.96014C38.1513 11.9291 38.4976 14.3282 38.3644 15.2816C38.098 20.1774 34.0346 21.8005 32.0362 22Z" fill="var(--primary)" />
                    <path class="react-w" d="M9.89261 21.4094L0 2.80536H4.86354C5.41354 2.80536 5.91795 3.11106 6.17246 3.59864L12.4032 15.5355C12.6333 15.9762 12.6261 16.5031 12.3842 16.9374L9.89261 21.4094Z" fill="white" />
                    <path class="react-w" d="M17.5705 21.4094L7.67786 2.80536H12.5372C13.0894 2.80536 13.5954 3.11351 13.8489 3.60412L20.302 16.0939L17.5705 21.4094Z" fill="white" />
                    <path class="react-w" d="M17.6443 21.4094L28.2751 0H23.4513C22.8806 0 22.361 0.328884 22.1168 0.844686L14.8271 16.2416L17.6443 21.4094Z" fill="white" />
                    <path class="react-w" d="M9.89261 21.4094L0 2.80536H4.86354C5.41354 2.80536 5.91795 3.11106 6.17246 3.59864L12.4032 15.5355C12.6333 15.9762 12.6261 16.5031 12.3842 16.9374L9.89261 21.4094Z" stroke="white" />
                    <path class="react-w" d="M17.5705 21.4094L7.67786 2.80536H12.5372C13.0894 2.80536 13.5954 3.11351 13.8489 3.60412L20.302 16.0939L17.5705 21.4094Z" stroke="white" />
                    <path class="react-w" d="M17.6443 21.4094L28.2751 0H23.4513C22.8806 0 22.361 0.328884 22.1168 0.844686L14.8271 16.2416L17.6443 21.4094Z" stroke="white" />
                </svg>
                <svg class="brand-title" width="47" height="16" viewBox="0 0 47 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.36 15.2C7.2933 15.2 6.3 15.0267 5.38 14.68C4.4733 14.32 3.68 13.82 3 13.18C2.3333 12.5267 1.8133 11.76 1.44 10.88C1.0667 9.99999 0.880005 9.03999 0.880005 7.99999C0.880005 6.95999 1.0667 5.99999 1.44 5.11999C1.8133 4.23999 2.34 3.47999 3.02 2.83999C3.7 2.18666 4.49331 1.68666 5.40001 1.33999C6.30671 0.979988 7.3 0.799988 8.38 0.799988C9.5267 0.799988 10.5733 0.999988 11.52 1.39999C12.4667 1.78666 13.2667 2.36666 13.92 3.13999L12.24 4.71999C11.7333 4.17332 11.1667 3.76666 10.54 3.49999C9.9133 3.21999 9.2333 3.07999 8.5 3.07999C7.7667 3.07999 7.0933 3.19999 6.48 3.43999C5.88 3.67999 5.35331 4.01999 4.90001 4.45999C4.46001 4.89999 4.1133 5.41999 3.86 6.01999C3.62 6.61999 3.5 7.27999 3.5 7.99999C3.5 8.71999 3.62 9.37999 3.86 9.97999C4.1133 10.58 4.46001 11.1 4.90001 11.54C5.35331 11.98 5.88 12.32 6.48 12.56C7.0933 12.8 7.7667 12.92 8.5 12.92C9.2333 12.92 9.9133 12.7867 10.54 12.52C11.1667 12.24 11.7333 11.82 12.24 11.26L13.92 12.86C13.2667 13.62 12.4667 14.2 11.52 14.6C10.5733 15 9.52 15.2 8.36 15.2ZM16.4113 15V0.999988H22.1713C23.4113 0.999988 24.4713 1.19999 25.3513 1.59999C26.2446 1.99999 26.9313 2.57332 27.4113 3.31999C27.8913 4.06666 28.1313 4.95332 28.1313 5.97999C28.1313 7.00669 27.8913 7.89329 27.4113 8.63999C26.9313 9.37329 26.2446 9.93999 25.3513 10.34C24.4713 10.7267 23.4113 10.92 22.1713 10.92H17.8513L19.0113 9.73999V15H16.4113ZM25.5713 15L22.0313 9.91999H24.8112L28.3713 15H25.5713ZM19.0113 10.02L17.8513 8.77999H22.0513C23.1979 8.77999 24.0579 8.53329 24.6312 8.03999C25.2179 7.54669 25.5113 6.85999 25.5113 5.97999C25.5113 5.08666 25.2179 4.39999 24.6312 3.91999C24.0579 3.43999 23.1979 3.19999 22.0513 3.19999H17.8513L19.0113 1.91999V10.02ZM31.0402 15V0.999988H33.1802L39.3002 11.22H38.1802L44.2002 0.999988H46.3402L46.3602 15H43.9002L43.8802 4.85999H44.4002L39.2802 13.4H38.1202L32.9202 4.85999H33.5202V15H31.0402Z" fill="black" />
                </svg>
            </a>
            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span>
                    <span class="line"></span>
                    <span class="line"></span>
                </div>
            </div>
        </div>

        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">

                        </div>
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <div class="dropdown">
                                    <a href="/user/dashboard" class="nav-link" type="button" ria-label="Notification Dropdown">
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
                                            <path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
                                        </svg>
                                    </a>

                                </div>
                            </li>
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link bell dz-fullscreen" href="javascript:void(0);">
                                    <svg id="icon-full" viewBox="0 0 24 24" width="20" height="20" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
                                        <path d="M8 3H5a2 2 0 0 0-2 2v3m18 0V5a2 2 0 0 0-2-2h-3m0 18h3a2 2 0 0 0 2-2v-3M3 16v3a2 2 0 0 0 2 2h3" style="stroke-dasharray: 37, 57; stroke-dashoffset: 0;"></path>
                                    </svg>
                                    <svg id="icon-minimize" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="A098AE" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minimize">
                                        <path d="M8 3v3a2 2 0 0 1-2 2H3m18 0h-3a2 2 0 0 1-2-2V3m0 18v-3a2 2 0 0 1 2-2h3M3 16h3a2 2 0 0 1 2 2v3" style="stroke-dasharray: 37, 57; stroke-dashoffset: 0;"></path>
                                    </svg>
                                </a>
                            </li>
                            <li class="nav-item ps-3">
                                <div class="dropdown header-profile2">
                                    <a class="nav-link" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <div class="header-info2 d-flex align-items-center">
                                            <div class="header-media">
                                                <img src="/assets/images/avt.png" alt="">
                                            </div>
                                            <div class="header-info">
                                                <h6><?= $data_user['lastname'] . ' ' . $data_user['firstname'] ?></h6>
                                                <p><?= $data_user['email'] ?></p>
                                            </div>

                                        </div>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end" style="">
                                        <div class="card border-0 mb-0">
                                            <div class="card-header py-2">
                                                <div class="products">
                                                    <img src="/assets/images/avt.png" class="avatar avatar-md" alt="">
                                                    <div>
                                                        <h6><?= $data_user['lastname'] . ' ' . $data_user['firstname'] ?></h6>
                                                        <span><?= $data_user['email'] ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body px-0 py-2">
                                                <a href="/logout" class="dropdown-item ai-icon">
                                                    <svg class="profle-logout" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#ff7979" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                                        <polyline points="16 17 21 12 16 7"></polyline>
                                                        <line x1="21" y1="12" x2="9" y2="12"></line>
                                                    </svg>
                                                    <span class="ms-2 text-danger">Đăng xuất </span>
                                                </a>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/sidebar.php'); ?>