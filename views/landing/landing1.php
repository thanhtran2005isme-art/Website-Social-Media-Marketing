<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dịch vụ SMM Tăng Tương Tác Mạng Xã Hội Hàng Đầu</title>
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
    <!-- ==== css dependencies start ==== -->
    <link rel="stylesheet" href="/assets/plugin/css-dependable/slick/slick.css">
    <link rel="stylesheet" href="/assets/plugin/css-dependable/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/plugin/css-dependable/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/assets/plugin/css-dependable/animate/animate.css">
    <link rel="stylesheet" href="/assets/plugin/css-dependable/owl/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/plugin/css-dependable/owl/owl.theme.default.min.css">
    <link rel="stylesheet" href="/assets/plugin/css-dependable/magnific_popup/magnific-popup.css">
    <!-- ==== css dependencies end ==== -->
    <link rel="stylesheet" href="/assets/css/index.css">
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
    </style>
</head>

<body>

    <!-- preloader_start -->
    <div class="preloader">
        <div class="preloader_inner">
            <h4>Loading</h4>
            <div class="preloader_outer_border"></div>
        </div>
    </div>
    <!-- preloader_end -->

    <!-- header_area_start -->
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-light navbar_animation">
            <div class="container">
                <a class="navbar-brand" href="/"><img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['logo_light'] ?>" width="200" alt="logo"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span><i class="fa-solid fa-bars"></i></span>
                </button>
                <div class="navbar-collapse collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="/">TRANG CHỦ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/faq">FAQS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/api/docs">TÀI LIỆU API</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="/">ĐIỀU KHOẢN</a>
                        </li>

                        <li class="nav-item nav_item_btn">
                            <?php if ($user): ?>
                                <a href="/user/dashboard" class="nav-link nav_btn text-white">QUẢN LÝ</a>
                            <?php else: ?>
                                <a href="/login" class="nav-link nav_btn text-white">BẮT ĐẦU NGAY</a>
                            <?php endif; ?>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- header_area_end -->

    <!-- hero_section_start -->
    <section class="hero">
        <div class="hero_inner">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-xl-6 col-lg-7">
                        <div class="hero_left_content">
                            <h4>SOCIAL MEDIA</h4>
                            <h3>Bảng điều khiển SMM tốt nhất, rẻ nhất và nhanh nhất thế giới</h3>
                            <p>Quản lý tất cả các mạng truyền thông xã hội từ một bảng điều khiển duy nhất, chất lượng và giá rẻ. Chúng tôi cung cấp dịch vụ trên các mạng xã hội phổ biến nhất hiện nay. Chúng tôi có Instagram, Twitter, Facebook, Youtube, TikTok, Spotify và nhiều dịch vụ khác.</p>
                            <div class="hero_left_content_btn">
                                <a href="/login" class="contact">Bắt đầu ngay</a>
                                <a href="/services" class="servics">Dịch vụ của chúng tôi</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="hero_right_content">
                            <div class="hero_thumb">
                                <img src="/assets/images/illustration.png" alt="img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- hero_section_end -->

    <!-- counter_section_start -->
    <section class="hero_counter">
        <div class="hero_counter_inner">
            <div class="container">
                <div class="row align-content-center">
                    <div class="col-lg-3 col-sm-6">
                        <div class="hero_counter_inner_content">
                            <div class="icon_box">
                                <img src="/assets/images/Icon.png" alt="icon">
                            </div>
                            <div class="counter_text">
                                <h4><span class="span_one">20,000</span><span>+</span></h4>
                                <p>Người dùng tin cậy</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="hero_counter_inner_content">
                            <div class="icon_box icon_box1">
                                <img src="/assets/images/icon-1.png" alt="icon">
                            </div>
                            <div class="counter_text">
                                <h4><span class="span_one">1,000,000</span><span>+</span></h4>
                                <p>Đơn hàng</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="hero_counter_inner_content">
                            <div class="icon_box icon_box2">
                                <img src="/assets/images/icon-2.png" alt="icon">
                            </div>
                            <div class="counter_text">
                                <h4><span class="span_one">50</span><span>+</span></h4>
                                <p>Nền tảng hỗ trợ</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="hero_counter_inner_content">
                            <div class="icon_box icon_box3">
                                <img src="/assets/images/Icon-3.png" alt="icon">
                            </div>
                            <div class="counter_text">
                                <h4><span class="span_one">99.9</span><span>%</span></h4>
                                <p>Tỷ lệ hài lòng</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- counter_section_end -->

    <!-- about_section_start -->
    <section class="about">
        <div class="about_inner">
            <div class="container">
                <div class="row about_differ">
                    <div class="col-lg-6">
                        <div class="about_text">
                            <h5>Về chúng tôi</h5>
                            <h3>Chuyên gia SMM với nhiều năm kinh nghiệm</h3>
                            <p>Chúng tôi là nền tảng SMM hàng đầu, cung cấp giải pháp toàn diện giúp doanh nghiệp và cá nhân tối ưu hóa chiến lược mạng xã hội. Với hơn 10 năm kinh nghiệm, chúng tôi cam kết mang lại kết quả vượt trội thông qua các dịch vụ chất lượng cao, giá cả cạnh tranh và hỗ trợ 24/7.</p>
                            <a href="/user/dashboard">Tìm hiểu thêm</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about_thumb">
                            <img src="/assets/images/about.png" alt="img">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about_section_end -->

    <!-- impact_service_section_start -->
    <section class="impact_service">
        <div class="impact_service_inner">
            <div class="container">
                <div class="row impact_service_differ">
                    <div class="col-lg-6">
                        <div class="impact_service_card_area">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-12 col-sm-6">
                                            <div class="impact_service_card">
                                                <div class="card_img">
                                                    <img src="/assets/images/idea.png" alt="icon">
                                                </div>
                                                <h5>Tăng trưởng nhanh chóng</h5>
                                                <p>Tăng lượt theo dõi, lượt thích và tương tác trên mọi nền tảng xã hội với các chiến dịch được tối ưu hóa thông minh.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-sm-6">
                                            <div class="impact_service_card">
                                                <div class="card_img">
                                                    <img src="/assets/images/payment.png" alt="icon">
                                                </div>
                                                <h5>Thanh toán dễ dàng</h5>
                                                <p>Hỗ trợ nhiều phương thức thanh toán an toàn, nhanh chóng, giúp bạn dễ dàng quản lý ngân sách SMM.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="row margin_top_110">
                                        <div class="col-lg-12 col-sm-6">
                                            <div class="impact_service_card">
                                                <div class="card_img">
                                                    <img src="/assets/images/suport.png" alt="icon">
                                                </div>
                                                <h5>Hỗ trợ khách hàng</h5>
                                                <p>Đội ngũ hỗ trợ chuyên nghiệp luôn sẵn sàng giải đáp mọi thắc mắc và đảm bảo trải nghiệm tốt nhất.</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-sm-6">
                                            <div class="impact_service_card">
                                                <div class="card_img">
                                                    <img src="/assets/images/database.png" alt="icon">
                                                </div>
                                                <h5>Phân tích dữ liệu</h5>
                                                <p>Cung cấp báo cáo chi tiết và phân tích hiệu suất chiến dịch để tối ưu hóa chiến lược của bạn.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="impact_service_text">
                            <h5>Dịch vụ đột phá</h5>
                            <h3>Đưa thương hiệu của bạn từ hàng nghìn đến hàng triệu người</h3>
                            <p>Với các giải pháp SMM tiên tiến, chúng tôi giúp bạn tối ưu hóa chiến lược mạng xã hội, tăng tương tác thực và mở rộng phạm vi tiếp cận trên các nền tảng như Instagram, Facebook, YouTube, TikTok và hơn thế nữa. Bắt đầu hành trình phát triển ngay hôm nay!</p>
                            <a href="/services">Khám phá dịch vụ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- impact_service_section_end -->

    <!-- efficient_process_start -->
    <div class="efficient_process">
        <div class="efficient_process_innner">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8">
                        <div class="efficient_process_text">
                            <h5>Quy trình đơn giản, hiệu quả vượt trội</h5>
                            <h3>3 bước để chinh phục mạng xã hội</h3>
                            <p>Chúng tôi cung cấp quy trình SMM tối ưu, giúp bạn dễ dàng tăng tương tác, mở rộng phạm vi tiếp cận và đạt được mục tiêu kinh doanh trên các nền tảng như Instagram, Facebook, YouTube, TikTok và hơn thế nữa.</p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-between">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card_area_content">
                            <div class="efficient_process_card">
                                <div class="card_img before_after">
                                    <img src="/assets/images/card.png" alt="img">
                                </div>
                                <h4>Đăng ký & Nạp tiền</h4>
                                <p>Tạo tài khoản miễn phí trong vài giây và nạp tiền vào ví để bắt đầu sử dụng các dịch vụ SMM của chúng tôi.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card_area_content">
                            <div class="efficient_process_card">
                                <div class="card_img before_after">
                                    <img src="/assets/images/card-1.png" alt="img">
                                </div>
                                <h4>Chọn & Triển khai dịch vụ</h4>
                                <p>Lựa chọn gói dịch vụ phù hợp (lượt thích, theo dõi, xem, v.v.) và triển khai ngay với giao diện thân thiện.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card_area_content">
                            <div class="efficient_process_card">
                                <div class="card_img">
                                    <img src="/assets/images/card-2.png" alt="img">
                                </div>
                                <h4>Tăng trưởng & Thành công</h4>
                                <p>Thưởng thức kết quả vượt trội với lượt tương tác tăng vọt và thương hiệu của bạn vươn xa hơn bao giờ hết.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="video_content_area">
                            <div class="bg_play_button">
                                <img src="/assets/images/bg_play_button.png" alt="img">
                            </div>
                            <a class="play_btn" href="https://www.youtube.com/watch?v=yMy6ytfeu9c">
                                <div class="play_button">
                                    <div class="btn_img">
                                        <img src="/assets/images/play_button.png" alt="play">
                                    </div>
                                </div>
                            </a>
                            <div class="overlay"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- efficient_process_end -->

    <!-- service_section_start -->
    <section class="service">
        <div class="service_inner">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xxl-8 col-xl-10">
                        <div class="service_text">
                            <h5>Dịch vụ SMM của chúng tôi</h5>
                            <h3>Giải pháp mạnh mẽ đưa doanh nghiệp của bạn vươn xa</h3>
                            <p>Khám phá các dịch vụ SMM chất lượng cao giúp tăng tương tác, xây dựng thương hiệu và mở rộng phạm vi tiếp cận trên các nền tảng mạng xã hội phổ biến như Instagram, Facebook, YouTube, TikTok, Twitter và hơn thế nữa. Với chi phí hợp lý và hiệu quả vượt trội, chúng tôi giúp bạn đạt được mục tiêu kinh doanh nhanh chóng!</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="service_card">
                            <div class="service_card_img">
                                <img src="/assets/images/facebook.png" alt="icon">
                            </div>
                            <div class="service_card_text">
                                <h5>Facebook Marketing</h5>
                                <p>Tăng lượt thích, lượt theo dõi và tương tác trên trang Facebook của bạn với các gói dịch vụ chất lượng cao, an toàn và nhanh chóng.</p>
                                <div class="service_card__btn">
                                    <a href="/services">Bắt đầu ngay<i class="fa-solid fa-arrow-right-long"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service_card">
                            <div class="service_card_img">
                                <img src="/assets/images/youtube.png" alt="icon">
                            </div>
                            <div class="service_card_text">
                                <h5>Youtube Subscribe</h5>
                                <p>Thúc đẩy kênh YouTube với lượt xem, lượt đăng ký và bình luận thực, giúp tăng thứ hạng và độ tin cậy.</p>
                                <div class="service_card__btn">
                                    <a href="/services">Bắt đầu ngay<i class="fa-solid fa-arrow-right-long"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service_card">
                            <div class="service_card_img">
                                <img src="/assets/images/instagram.png" alt="icon">
                            </div>
                            <div class="service_card_text">
                                <h5>Instagram Like</h5>
                                <p>Phát triển tài khoản Instagram với lượt thích, theo dõi và story views, giúp thương hiệu của bạn nổi bật.</p>
                                <div class="service_card__btn">
                                    <a href="/services">Bắt đầu ngay<i class="fa-solid fa-arrow-right-long"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service_card">
                            <div class="service_card_img">
                                <img src="/assets/images/tiktok.webp" width="100" alt="icon">
                            </div>
                            <div class="service_card_text">
                                <h5>TikTok Boost</h5>
                                <p>Tăng lượt xem, lượt thích và theo dõi trên TikTok, giúp video của bạn viral và tiếp cận hàng triệu người dùng.</p>
                                <div class="service_card__btn">
                                    <a href="/services">Bắt đầu ngay<i class="fa-solid fa-arrow-right-long"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service_card">
                            <div class="service_card_img">
                                <img src="/assets/images/twitter.webp" alt="icon">
                            </div>
                            <div class="service_card_text">
                                <h5>Twitter Influence</h5>
                                <p>Xây dựng sự hiện diện mạnh mẽ trên Twitter với lượt retweet, lượt thích và theo dõi từ người dùng thực.</p>
                                <div class="service_card__btn">
                                    <a href="/services">Bắt đầu ngay<i class="fa-solid fa-arrow-right-long"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service_card">
                            <div class="service_card_img">
                                <img src="/assets/images/spotify.webp" alt="icon">
                            </div>
                            <div class="service_card_text">
                                <h5>Spotify Promotion</h5>
                                <p>Tăng lượt stream, lượt theo dõi playlist và sự hiện diện trên Spotify, giúp âm nhạc của bạn tiếp cận khán giả toàn cầu.</p>
                                <div class="service_card__btn">
                                    <a href="/services">Bắt đầu ngay<i class="fa-solid fa-arrow-right-long"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="social_netwark">
        <div class="social_netwark_inner">
            <div class="container">
                <div class="row social_netwark_content">
                    <div class="col-lg-5">
                        <div class="social_netwark_thumbnail">
                            <img src="/assets/images/frame.png" alt="Bảng điều khiển SMM">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="social_netwark_text">
                            <h5>Thúc đẩy sự phát triển thương hiệu</h5>
                            <h3>Quản lý tất cả mạng xã hội trong một nền tảng duy nhất</h3>
                            <p>Với bảng điều khiển SMM thông minh, bạn có thể dễ dàng quản lý và tối ưu hóa chiến lược trên Instagram, Facebook, YouTube, TikTok, Twitter và nhiều nền tảng khác từ một nơi duy nhất. Tăng tương tác, theo dõi hiệu suất và phát triển thương hiệu của bạn một cách hiệu quả với các công cụ tự động hóa tiên tiến và hỗ trợ 24/7. Hãy để chúng tôi giúp bạn tiết kiệm thời gian và đạt được kết quả vượt mong đợi!</p>
                            <a href="/register">Bắt đầu miễn phí</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="faq">
        <div class="faq_inner">
            <div class="container">
                <div class="row differ_each">
                    <div class="col-lg-4">
                        <div class="faq_thubmnail">
                            <img src="/assets/images/faq_thubmnail.png" alt="faq">
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="faq_text">
                            <h5>FAQS</h5>
                            <h3>Những câu hỏi thường gặp</h3>
                        </div>
                        <div class="accrodian_content">
                            <div class="accordion accordion-flush" id="accordionFlushExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="flush-headingOne">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                            Dịch vụ SMM của bạn có an toàn không?
                                        </button>
                                    </h2>
                                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">Có, tất cả dịch vụ của chúng tôi đều tuân thủ chính sách của các nền tảng xã hội và sử dụng người dùng thực để đảm bảo an toàn cho tài khoản của bạn. Chúng tôi cam kết không sử dụng bot hoặc các phương pháp không hợp pháp.</div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="flush-headingTwo">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                            Tôi có thể thấy kết quả bao lâu sau khi sử dụng dịch vụ?
                                        </button>
                                    </h2>
                                    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">Tùy thuộc vào dịch vụ, bạn có thể thấy kết quả ngay lập tức hoặc trong vòng 24-48 giờ. Chúng tôi cung cấp báo cáo chi tiết để bạn theo dõi tiến độ.</div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="flush-headingThree">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                            Làm thế nào để chọn gói dịch vụ phù hợp?
                                        </button>
                                    </h2>
                                    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">Chúng tôi cung cấp nhiều gói dịch vụ phù hợp với nhu cầu và ngân sách khác nhau. Bạn có thể liên hệ với đội ngũ hỗ trợ của chúng tôi để được tư vấn gói dịch vụ tối ưu nhất.</div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="flush-headingfour">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapsefour" aria-expanded="false" aria-controls="flush-collapsefour">
                                            Tôi có thể hủy đơn hàng nếu không hài lòng không?
                                        </button>
                                    </h2>
                                    <div id="flush-collapsefour" class="accordion-collapse collapse" aria-labelledby="flush-headingfour" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">Chúng tôi cung cấp chính sách hoàn tiền nếu dịch vụ không đáp ứng cam kết. Vui lòng liên hệ với chúng tôi trong vòng 7 ngày kể từ khi đặt hàng để được hỗ trợ.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="animation_content">
                <img class="imgone" src="/assets/images/one.png" alt="faq">
                <img class="imgtwo" src="/assets/images/two.png" alt="faq">
                <img class="imgthree" src="/assets/images/three.png" alt="faq">
            </div>
        </div>
    </section>


    <footer>
        <div class="footer">
            <div class="footer_inner">
                <div class="container">
                    <div class="row">
                        <div class="footer_inner_content">
                            <div class="row mb30">
                                <div class="col-lg-3 col-sm-6">
                                    <div class="footer_inner_text">
                                        <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['logo_light'] ?>" alt="Logo" width="200px">
                                        <p>Nền tảng SMM hàng đầu giúp bạn tăng tương tác và phát triển thương hiệu trên các mạng xã hội như Instagram, Facebook, YouTube, TikTok và hơn thế nữa. Tham gia ngay để chinh phục mục tiêu kinh doanh!</p>
                                        <div class="social_content">
                                            <span><a href="https://facebook.com/sieuthicode"><i class="fa-brands fa-facebook-f"></i></a></span>
                                            <span><a href="https://twitter.com/sieuthicode"><i class="fa-brands fa-twitter"></i></a></span>
                                            <span><a href="https://instagram.com/sieuthicode"><i class="fa-brands fa-instagram"></i></a></span>
                                            <span><a href="https://tiktok.com/@sieuthicode"><i class="fa-brands fa-tiktok"></i></a></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="footer_inner_text_one">
                                        <h5>Liên kết nhanh</h5>
                                        <ul>
                                            <li><a href="/">Trang chủ</a></li>
                                            <li><a href="/about">Về chúng tôi</a></li>
                                            <li><a href="/blog">Blog</a></li>
                                            <li><a href="/faq">Câu hỏi thường gặp</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="footer_inner_text_one">
                                        <h5>Hỗ trợ</h5>
                                        <ul>
                                            <li><a href="/privacy-policy">Chính sách bảo mật</a></li>
                                            <li><a href="/terms">Điều khoản dịch vụ</a></li>
                                            <li><a href="/contact">Liên hệ</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="footer_inner_text_two">
                                        <h5>Liên hệ</h5>
                                        <ul>
                                            <li><a href="tel:+842839876543"><i class="fa-sharp fa-solid fa-phone-volume"></i>+84 283 987 6543</a></li>
                                            <li><a href="#"><i class="fa-sharp fa-solid fa-location-dot"></i>123 Nguyễn Văn Cừ, Quận 5, TP.HCM, Việt Nam</a></li>
                                            <li><a href="mailto:support@sieuthicode.vn"><i class="fa-sharp fa-solid fa-envelope"></i>support@sieuthicode.vn</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footer_bottom_content">
                            <p>Copyright &COPY;<?= date('Y') ?> <span><a href="/">SIEUTHICODE.VN</a></span> All Rights Reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer_area_end -->

    <!-- up_arrow_btn_start -->
    <div class="bottomtotop_btn">
        <div class="btn_up_arrow">
            <span><i class="fa-solid fa-angles-up"></i></span>
        </div>
    </div>
    <!-- up_arrow_btn_end -->

    <script src="/assets/plugin/js-dependable/jquery/jquery-3.6.0.min.js"></script>
    <script src="/assets/plugin/js-dependable/counter/jquery.waypoints.min.js"></script>
    <script src="/assets/plugin/js-dependable/counter/jquery.counterup.min.js"></script>
    <script src="/assets/plugin/js-dependable/slick/slick.min.js"></script>
    <script src="/assets/plugin/js-dependable/magnific_popup/jquery.magnific-popup.min.js"></script>
    <script src="/assets/plugin/js-dependable/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/plugin/js-dependable/owl/owl.carousel.min.js"></script>
    <!-- ==== js dependencies end ==== -->
    <script src="/assets/plugin/js/plugn.js"></script>
    <script src="/assets/plugin/js/main.js"></script>

</body>

</html>