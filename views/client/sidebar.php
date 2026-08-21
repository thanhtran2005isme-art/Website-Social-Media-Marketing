<aside class="app-sidebar sticky" id="sidebar">
    <div class="main-sidebar-header">
        <a href="/user/dashboard" class="header-logo">
            <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['logo_light'] ?>" alt="logo" width="180px">
        </a>
    </div>
    <div class="main-sidebar simplebar-scrollable-y" id="sidebar-scroll" data-simplebar="init">
        <div class="simplebar-wrapper" style="margin: -8px 0px -80px;">
            <div class="simplebar-height-auto-observer-wrapper">
                <div class="simplebar-height-auto-observer"></div>
            </div>
            <div class="simplebar-mask">
                <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                    <div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content" style="height: 100%; overflow: hidden scroll;">
                        <div class="simplebar-content" style="padding: 8px 0px 80px;">
                            <nav class="main-menu-container nav nav-pills flex-column sub-open open active">
                                <div class="slide-left active d-none" id="slide-left"> <svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
                                        <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"></path>
                                    </svg> </div>
                                <ul class="main-menu" style="display: block; margin-left: 0px; margin-right: 0px;">
                                    <li class="slide__category"><span class="category-name">Dịch vụ</span></li>
                                    <li class="slide"> <a href="/user/dashboard" class="side-menu__item"><img src="/assets/images/card-2.png" width="25px" class="me-1" /><span class="side-menu__label">Bảng thống kê</span> </a> </li>
                                    <li class="slide"> <a href="/user/order/create" class="side-menu__item"><img src="/assets/images/add-to-cart.png" width="25px" class="me-1" /><span class="side-menu__label">Đơn hàng mới</span> </a> </li>
                                    <li class="slide"> <a href="/user/mass/order" class="side-menu__item"><img src="/assets/images/add-to-cart-2.png" width="25px" class="me-1" /><span class="side-menu__label">Đặt hàng số lượng lớn</span> </a> </li>
                                    <li class="slide"> <a href="/services" class="side-menu__item"><img src="/assets/images/menu.png" width="25px" class="me-1" /><span class="side-menu__label">Danh sách dịch vụ</span> </a> </li>
                                    <li class="slide__category"><span class="category-name">KHÁCH HÀNG</span></li>
                                    <li class="slide has-sub">
                                        <a href="javascript:void(0);" class="side-menu__item">
                                            <img src="/assets/images/credit-cards.png" width="25px" class="me-1" /><span class="side-menu__label">Nạp tiền</span>
                                            <i class="ri-arrow-down-s-line side-menu__angle"></i>
                                        </a>
                                        <ul class="slide-menu child1" style="position: relative; left: 0px; top: 0px; margin: 0px; transform: translate3d(119.2px, 188px, 0px);" data-popper-placement="bottom">
                                            <li class="slide"> <a href="/user/deposit/card" class="side-menu__item">Thẻ cào</a> </li>
                                            <li class="slide"> <a href="/user/deposit/transfer" class="side-menu__item">Ngân hàng</a> </li>
                                        </ul>
                                    </li>
                                    <li class="slide"> <a href="/user/referral" class="side-menu__item"><img src="/assets/images/connection.png" width="25px" class="me-1" /><span class="side-menu__label">Tiếp thị liên kết</span> </a> </li>
                                    <li class="slide"> <a href="/user/orders" class="side-menu__item"><img src="/assets/images/approved-order.png" width="25px" class="me-1" /><span class="side-menu__label">Quản lý đơn hàng</span> </a> </li>
                                    <li class="slide__category"><span class="category-name">KHÁC</span></li>
                                    <!-- <li class="slide"> <a href="/user/childpanel" class="side-menu__item"><img src="/assets/images/world-wide-web.png" width="25px" class="me-1" /><span class="side-menu__label">Tạo website con</span> </a> </li> -->
                                     <!-- <li class="slide"> <a href="/user/childpanel" class="side-menu__item"><img src="/assets/images/world-wide-web.png" width="25px" class="me-1" /><span class="side-menu__label">Ticket</span> </a> </li> -->
                                    <li class="slide"> <a href="/user/api/docs" class="side-menu__item"><img src="/assets/images/browser.png" width="25px" class="me-1" /><span class="side-menu__label">Tài liệu API</span> </a> </li>
                                    <li class="slide"> <a href="/faq" class="side-menu__item"><img src="/assets/images/question.png" width="25px" class="me-1" /><span class="side-menu__label">FAQ</span> </a> </li>
                                    <li class="slide"> <a href="/contact" class="side-menu__item"><img src="/assets/images/customer-service.png" width="25px" class="me-1" /><span class="side-menu__label">Liên hệ</span> </a> </li>
                                </ul>
                                <div class="slide-right d-none" id="slide-right"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
                                        <path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z"></path>
                                    </svg>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="simplebar-placeholder" style="width: 239px; height: 1772px;"></div>
        </div>
        <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
            <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
        </div>
        <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
            <div class="simplebar-scrollbar" style="height: 272px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
        </div>
    </div>
</aside>
<script>
    $(document).ready(function() {
        const currentPath = window.location.pathname.toLowerCase().replace(/\/$/, '');

        function isActiveUrl(href) {
            const normalizedHref = href.toLowerCase().replace(/\/$/, '');
            return currentPath === normalizedHref || currentPath.startsWith(normalizedHref + '/');
        }
        $('.slide a').each(function() {
            const $link = $(this);
            const href = $link.attr('href');
            if (!href || href === 'javascript:void(0);' || href.startsWith('#')) {
                return;
            }
            if (isActiveUrl(href)) {
                $link.addClass('active');
                const $slide = $link.closest('.slide');
                const $submenu = $slide.closest('.slide-menu');
                if ($submenu.length) {
                    const $parentSlide = $submenu.closest('.slide.has-sub');
                    if ($parentSlide.length) {
                        $parentSlide.addClass('active open');
                        const $parentLink = $parentSlide.find('a.side-menu__item').first();
                        if ($parentLink.length) {
                            $parentLink.addClass('active');
                        }
                    }
                }
            }
        });
    });
</script>