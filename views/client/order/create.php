<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Tạo đơn hàng mới - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<?php

$category_id = isset($_GET['category_id']) ? Anti_xss($_GET['category_id']) : '';
$service_id = isset($_GET['service_id']) ? Anti_xss($_GET['service_id']) : '';
$social_id = '';

if (!empty($category_id)) {
    $category_id = intval($category_id);
    $category = $db->get_row("SELECT social_media_id FROM categories WHERE id = $category_id");
    $social_id = $category['social_media_id'] ?? '';
}
?>

<div class="main-content app-content new_order">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Đơn hàng</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Đặt đơn hàng</h1>
            </div>

        </div>
        <div class="row mb-4">
            <div class="col-xl-12">
                <div class="alert svg-primary alert-primary alert-dismissible fade show custom-alert-icon shadow-sm" role="alert">
                    <?=$db->setting('thongbao_taodon')?>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card custom-card">
                    <div class="card-body">
                        <div class="row g-3">
                            <?php foreach ($db->get_list("SELECT * FROM `social_media` WHERE `status` = 1 ORDER BY `id` ASC") as $flatform): ?>
                                <div class="col-lg-3 col-md-4 col-sm-3 col-3">
                                    <button type="button" class="social-btn <?= $social_id == $flatform['id'] ? 'active' : ''; ?>" data-social-id="<?= $flatform['id'] ?>">
                                        <img class="social-media-img" src="<?= $flatform['icon'] ?>" alt="<?= $flatform['name'] ?>">
                                        <span class="title-social"><?= $flatform['name'] ?></span>
                                    </button>
                                </div>
                            <?php endforeach; ?>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="row g-4 pulse-loader">
            <div class="col-md-6">
                <div class="card custom-card">
                    <div class="card-body">
                        <form id="payment-form">
                            <input type="hidden" name="csrf_token" value="<?= generate_csrf_token(); ?>">
                            <div class="row g-3">
                                <div class="col-12">
                                    <label class="form-label">Phân loại</label>
                                    <select class="js-example-placeholder-single js-states form-control select2-hidden-accessible" name="categories" tabindex="-1" aria-hidden="true">
                                        <option disabled="" selected="" value="">Chọn nền tảng trước khi chọn phân loại</option>

                                    </select>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Dịch vụ</label><select class="js-example-placeholder-single js-states form-control select2-hidden-accessible" name="service" tabindex="-1" aria-hidden="true">
                                        <option disabled="" selected="" value="">Chọn dịch vụ</option>

                                    </select>
                                </div>
                                <div class="col-12">
                                    <label for="link" class="form-label">Liên kết</label>
                                    <input type="hidden" class="form-control" id="price_per_1" value="0">
                                    <input type="text" class="form-control" id="link" placeholder="www.example.com/your_profile_identity" autocomplete="off">
                                </div>
                                <div class="col-12" id="show_amount">
                                    <label for="quantity" class="form-label">Số lượng</label>
                                    <input type="number" class="form-control" id="quantity" value="1000">
                                </div>
                                <!-- <div class="col-12 drip_feed d-block">
                                    <label class="form-label">Drip-Feed</label>
                                    <div class="custom-switch-btn w-md-25">
                                        <input type="checkbox" name="drip_feed" class="form-check-input" id="status" value="0">
                                        <label class="custom-switch-checkbox-label" for="status"><span class="custom-switch-checkbox-inner"></span><span class="custom-switch-checkbox-switch"></span></label>
                                    </div>
                                </div> -->
                                <!-- <div class="drip_feed_check d-block d-block">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="drip_feed"><label class="form-label">Runs</label><input type="number" id="runs" class="form-control" value=""><span class="text-danger runs"></span></div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="drip_feed"><label class="form-label">Interval (in minutes)</label><input type="number" class="form-control" value=""><span class="text-danger interval"></span></div>
                                        </div>
                                    </div>
                                    <div class="drip_feed mt-3"><label class="form-label">Total Quantity</label><input type="text" class="form-control total_quantity" name="total_quantity" disabled="" value="0"></div>
                                </div> -->
                                <div class="col-12" id="show_comment">
                                    <label for="" class="form-label">Viết Bình luận (1 comment mỗi dòng):</label>
                                    <textarea class="form-control" placeholder="Nên lưu nháp bình luận đã nhập ra ngoài để đề phòng đơn hàng bị lỗi hoặc có thể sử dụng lại lần sau" rows="3" id="comment"></textarea>
                                </div>
                                <div class="col-12" id="show_comment_username">
                                    <label for="" class="form-label">Tên của người bình luận:</label>
                                    <input class="form-control" id="comment_username"></input>
                                </div>
                                <div class="col-12" id="show_mentionUsernames">
                                    <label for="" class="form-label">Chúng tôi sẽ lựa chọn ngẫu nhiên các comments từ danh sách bạn đã nhập để nhận xét vào các bài đăng của bạn trong tháng:</label>
                                    <textarea class="form-control" id="mentionUsernames" rows="3"></textarea>
                                </div>
                                <div class="col-12" id="show_hashtags">
                                    <label for="" class="form-label">Mô tả video</label>
                                    <textarea class="form-control" id="hashtags" rows="3"></textarea>
                                </div>
                                <div class="col-12" id="show_list">
                                    <label for="" class="form-label">List</label>
                                    <textarea class="form-control" id="list" rows="3"></textarea>
                                </div>
                                <div class="col-12">
                                    <label for="" class="form-label">Mã giảm giá nếu có</label>
                                    <div class="custom-form-group mb-3">
                                        <input type="text" class="form-control form-control-md" id="coupon_code" name="coupon_code" placeholder="Mã giảm giá">
                                        <button class="btn btn-primary btn-sm border-0 custom-form-btn" type="button">Áp dụng</button>
                                    </div>
                                </div>
                                <div class="card custom-card card-style-6 border shadow-none mb-xl-0">
                                    <div class="card-body p-3">
                                        <div class="total-payment">
                                            <h4>Tổng tiền thanh toán</h4>
                                            <p class="amount"><span id="total_payment">0</span></p>
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary mt-30">Thanh Toán Ngay</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card custom-card">

                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12"><label for="Service-name" class="form-label">Tên dịch vụ</label><input type="text" class="form-control" id="service_name" disabled=""></div>
                            <div class="col-12">
                                <div class="row g-3">
                                    <div class="col-lg-4 col-md-6">
                                        <label for="Minimum Amount" class="form-label">Mua tối thiểu</label>
                                        <input type="text" class="form-control" id="min_amount" disabled="">
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <label for="Maximum Amount" class="form-label">Mua tối đa</label>
                                        <input type="text" class="form-control" id="max_amount" disabled="">
                                    </div>
                                    <div class="col-lg-4 col-md-6"><label for="Price per 1k" class="form-label">Giá tiền / 1k</label>
                                        <input type="text" class="form-control" id="price_per_1k" disabled="">
                                    </div>
                                    <div class="col-lg-4 col-md-6"><label for="" class="form-label">Thời gian trung bình</label>
                                        <input type="text" class="form-control" id="avg_time" disabled="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-2">
                                <label for="Description" class="form-label">Mô tả</label>
                                <div id="description" class="bg-light p-2" disabled="">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#show_comment").hide();
        $("#show_hashtags").hide();
        $("#show_amount").show();
        $("#show_list").hide();
        $("#show_comment_username").hide();
        $("#show_mentionUsernames").hide();
        $('.js-example-placeholder-single').select2();
        let appliedCoupon = null;
        $('.social-btn').on('click', function() {
            $('.social-btn').removeClass('active');
            $(this).addClass('active');

            let socialMediaId = $(this).data('social-id');
            if (socialMediaId) {
                loadCategories(socialMediaId);
            }
        });

        $('select[name="categories"]').on('change', function() {
            let categoryId = $(this).val();
            if (categoryId) {
                loadServices(categoryId);
            }
        });

        $('select[name="service"]').on('change', function() {
            let serviceId = $(this).val();
            if (serviceId) {
                loadServiceDetails(serviceId);
            }
        });

        function calculateTotalPayment() {
            let serviceType = $('#service_name').data('service-type') || '';
            let pricePer1 = parseFloat($('#price_per_1').val()) || 0;
            let totalPayment = 0;

            if (serviceType === 'Custom Comments') {
                let comments = $('#comment').val().trim();
                let commentLines = comments ? comments.split('\n').filter(line => line.trim() !== '').length : 0;
                totalPayment = commentLines * pricePer1;
            } else {
                let quantity = parseInt($('#quantity').val()) || 0;
                totalPayment = quantity * pricePer1;
            }

            if (appliedCoupon) {
                if (appliedCoupon.discount_type === 'percentage') {
                    totalPayment -= totalPayment * (appliedCoupon.discount_value / 100);
                } else {
                    totalPayment -= appliedCoupon.discount_value;
                }
                totalPayment = Math.max(0, totalPayment);
            }

            $('#total_payment').text($formatCurrency(totalPayment));
            return totalPayment;
        }

        $('#quantity').on('input change', function() {
            let quantity = parseInt($(this).val()) || 0;
            let minAmount = parseInt($('#min_amount').val()) || 0;
            let maxAmount = parseInt($('#max_amount').val()) || Infinity;
            calculateTotalPayment();
        });
        $('#comment').on('input change', function() {
            calculateTotalPayment();
        });

        function loadCategories(socialMediaId) {
            Notiflix.Loading.circle('Đang tải danh mục...');
            $.ajax({
                url: '/model/load/categories',
                type: 'POST',
                data: {
                    social_media_id: socialMediaId
                },
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status === "success" && response.data.length > 0) {
                        let categorySelect = $('select[name="categories"]');
                        categorySelect.empty();
                        categorySelect.append('<option disabled selected value="">Select Category</option>');
                        $.each(response.data, function(index, category) {
                            categorySelect.append(
                                `<option value="${category.id}" data-name="${category.name}" data-icon="${category.icon || ''}">${category.name}</option>`
                            );
                        });
                        categorySelect.select2({
                            templateResult: formatCategoryOption,
                            templateSelection: formatCategorySelection,
                            minimumResultsForSearch: -1 // Disable search if not needed
                        });
                        <?php if (!empty($category_id)): ?>
                            categorySelect.val('<?php echo $category_id; ?>').trigger('change');
                        <?php else: ?>
                            categorySelect.val(response.data[0].id).trigger('change');
                        <?php endif; ?>
                    } else {
                        Notiflix.Notify.failure('Không có danh mục nào!');
                        $('select[name="categories"]').empty().append('<option disabled selected value="">Select Category</option>');
                        $('select[name="service"]').empty().append('<option disabled selected value="">Chọn dịch vụ</option>');
                        clearServiceDetails();
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Có lỗi xảy ra khi tải danh mục!');
                }
            });
        }
        // Format dropdown options
        function formatCategoryOption(category) {
            if (!category.id) {
                return category.text; // For placeholder
            }
            let iconHtml = category.element.dataset.icon ?
                `<img src="${category.element.dataset.icon}" alt="icon" style="width: 20px; height: 20px; margin-right: 5px;" />` :
                '';
            let $option = $(`<span>${iconHtml}${category.element.dataset.name}</span>`);
            return $option;
        }

        // Format selected option
        function formatCategorySelection(category) {
            if (!category.id) {
                return category.text; // For placeholder
            }
            let iconHtml = category.element.dataset.icon ?
                `<img src="${category.element.dataset.icon}" alt="icon" style="width: 20px; height: 20px; margin-right: 5px;" />` :
                '';
            let $selection = $(`<span>${iconHtml}${category.element.dataset.name}</span>`);
            return $selection;
        }

        function loadServices(categoryId) {
            Notiflix.Loading.circle('Đang tải dịch vụ...');
            $.ajax({
                url: '/model/load/services',
                type: 'POST',
                data: {
                    category_id: categoryId
                },
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status == "success" && response.data.length > 0) {
                        let serviceSelect = $('select[name="service"]');
                        serviceSelect.empty();
                        serviceSelect.append('<option disabled value="">Chọn dịch vụ</option>');
                        $.each(response.data, function(index, service) {
                            serviceSelect.append(
                                `<option value="${service.id}" data-id="${service.id}"  data-name="${service.name}" data-price="${service.price}" data-icon="${service.icon || ''}">ID ${service.id} - ${service.name} - ${service.price}</option>`
                            );
                        });

                        serviceSelect.select2({
                            templateResult: formatServiceOption,
                            templateSelection: formatServiceSelection,
                            minimumResultsForSearch: -1 // Disable search if not needed
                        });
                        <?php if (!empty($service_id)): ?>
                            serviceSelect.val('<?php echo $service_id; ?>').trigger('change');
                        <?php else: ?>
                            serviceSelect.val(response.data[0].id).trigger('change');
                        <?php endif; ?>

                    } else {
                        Notiflix.Notify.failure('Không tải được dịch vụ!');
                        $('select[name="service"]').empty().append('<option disabled selected value="">Chọn dịch vụ</option>');
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Có lỗi xảy ra!');
                }
            });
        }

        function formatServiceOption(service) {
            if (!service.id) {
                return service.text; // For placeholder
            }
            let iconHtml = service.element.dataset.icon ?
                `<img src="${service.element.dataset.icon}" alt="icon" style="width: 20px; height: 20px; margin-right: 5px;" />` :
                '';
            let $option = $(
                `<span>${iconHtml} ID ${service.element.dataset.id} - ${service.element.dataset.name} - <span style="color: #ff4307;">${service.element.dataset.price}</span></span>`
            );
            return $option;
        }

        // Format selected option
        function formatServiceSelection(service) {
            if (!service.id) {
                return service.text; // For placeholder
            }
            let iconHtml = service.element.dataset.icon ?
                `<img src="${service.element.dataset.icon}" alt="icon" style="width: 20px; height: 20px; margin-right: 5px;" />` :
                '';
            let $selection = $(
                `<span>${iconHtml} ID ${service.element.dataset.id} - ${service.element.dataset.name} - <span style="color: #ff4307;">${service.element.dataset.price}</span></span>`
            );
            return $selection;
        }

        function loadServiceDetails(serviceId) {
            Notiflix.Loading.circle('Đang tải chi tiết dịch vụ...');
            $.ajax({
                url: '/model/load/service_details',
                type: 'POST',
                data: {
                    service_id: serviceId
                },
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status == "success") {
                        $('#service_name').val(response.data.name).data('service-type', response.data.service_type);
                        $('#min_amount').val(response.data.min_amount);
                        $('#max_amount').val(response.data.max_amount);
                        $('#price_per_1k').val(response.data.price_formatted);
                        $('#price_per_1').val(response.data.price_per_1);
                        $('#total_payment').html(response.data.price_formatted);
                        $('#description').html(response.data.description);
                        $('#avg_time').val(response.data.avg_time);
                        $('#price').val(response.data.price_formatted || '0.00');

                        $("#show_comment").hide();
                        $("#show_hashtags").hide();
                        $("#show_list").hide();
                        $("#show_amount").show();
                        $("#show_comment_username").hide();
                        $("#show_mentionUsernames").hide();

                        if (response.data.service_type == 'Custom Comments') {
                            $("#show_comment").show();
                            $("#show_amount").hide();
                            $('#comment').val('');
                            calculateTotalPayment();
                        } else if (response.data.service_type == 'Comment Likes') {
                            $("#show_comment_username").show();
                        } else if (response.data.service_type == 'Mentions') {
                            $("#show_mentionUsernames").show();
                        } else if (response.data.service_type == 'Mentions Hashtag') {
                            $("#show_hashtags").show();
                        } else if (response.data.service_type == 'Package') {
                            $("#show_amount").hide();
                        } else if (response.data.service_type == 'Special') {
                            $("#show_list").show();
                        } else {
                            calculateTotalPayment();
                        }
                    } else {
                        Notiflix.Notify.failure('Không tải được chi tiết dịch vụ!');
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Có lỗi xảy ra!');
                }
            });
        }

        function formatNumber(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        $('.custom-form-btn').on('click', function() {
            let couponCode = $('#coupon_code').val().trim();
            let quantity = 0;
            let serviceId = $('select[name="service"]').val();
            let serviceType = $('#service_name').data('service-type') || '';

            if (serviceType === 'Custom Comments') {
                let comments = $('#comment').val().trim();
                quantity = comments ? comments.split('\n').filter(line => line.trim() !== '').length : 0;
            } else {
                quantity = parseInt($('#quantity').val()) || 0;
            }

            if (!couponCode) {
                Notiflix.Notify.warning('Vui lòng nhập mã coupon!');
                return;
            }
            if (!serviceId) {
                Notiflix.Notify.warning('Vui lòng chọn dịch vụ!');
                return;
            }
            if (quantity <= 0) {
                Notiflix.Notify.warning('Số lượng không hợp lệ!');
                return;
            }

            Notiflix.Loading.circle('Đang kiểm tra coupon...');
            $.ajax({
                url: '/model/check_coupon',
                method: "POST",
                data: {
                    coupon_code: couponCode,
                    quantity: quantity,
                    service_id: serviceId
                },
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status == "success") {
                        appliedCoupon = {
                            code: couponCode,
                            discount_type: response.discount_type,
                            discount_value: response.discount_value,
                            final_price: parseFloat(response.final_price.replace(',', ''))
                        };
                        Notiflix.Notify.success(`Coupon hợp lệ! Giảm ${response.discount_amount}. Giá cuối: ${response.final_price}`);
                        calculateTotalPayment();
                    } else {
                        appliedCoupon = null;
                        Notiflix.Notify.failure(response.msg);
                        calculateTotalPayment();
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi khi kiểm tra coupon!');
                    appliedCoupon = null;
                    calculateTotalPayment();
                }
            });
        });
        $('#payment-form').on('submit', function(e) {
            e.preventDefault();

            let serviceName = $('#service_name').val() || 'Chưa chọn dịch vụ';
            let serviceType = $('#service_name').data('service-type') || '';
            let quantity = 0;

            if (serviceType === 'Custom Comments') {
                let comments = $('#comment').val().trim();
                quantity = comments ? comments.split('\n').filter(line => line.trim() !== '').length : 0;
            } else {
                quantity = parseInt($('#quantity').val()) || 0;
            }

            let totalPayment = $('#total_payment').text() || '0 VNĐ';

            if (serviceName.length > 50) {
                serviceName = serviceName.substring(0, 47) + '...';
            }

            let confirmMessage = `
            Bạn có chắc chắn muốn thanh toán?<br><br>
            <strong>Dịch vụ:</strong> ${serviceName}<br>
            <strong>Số lượng:</strong> ${formatNumber(quantity)}<br>
            <strong>Tổng thanh toán:</strong> ${totalPayment}
            ${appliedCoupon ? `<br><strong>Mã coupon:</strong> ${appliedCoupon.code}` : ''}
        `;

            let formData = new FormData();
            formData.append('category', $('select[name="categories"]').val() || '');
            formData.append('service', $('select[name="service"]').val() || '');
            formData.append('link', $('#link').val() || '');
            formData.append('quantity', quantity);
            formData.append('check', true);
            formData.append('drip_feed', $('#status').is(':checked'));
            formData.append('runs', $('#runs').val() || 0);
            formData.append('interval', $('#interval').val() || '');
            formData.append('comments', $('#comment').val() || '');
            formData.append('list', $('#list').val() || '');
            formData.append('hashtag', $('#hashtag').val() || '');
            formData.append('mention_username', $('#mentionUsernames').val() || '');
            formData.append('comment_username', $('#comment_username').val() || '');
            formData.append('coupon_code', $('#coupon_code').val() || '');
            formData.append('csrf_token', $('#payment-form [name="csrf_token"]').val() || '');

            Notiflix.Confirm.show(
                'Xác nhận thanh toán',
                confirmMessage,
                'Xác nhận',
                'Hủy',
                function() {
                    Notiflix.Loading.circle('Đang xử lý thanh toán...');
                    $.ajax({
                        url: '/model/process_payment',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Thanh toán thành công!');
                                $('#payment-form')[0].reset();
                                $('select[name="categories"]').val('').trigger('change');
                                $('#total_payment').text('0');
                                setTimeout(function() {
                                    window.location.reload();
                                }, 2000);
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Thanh toán thất bại!');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Có lỗi xảy ra khi xử lý thanh toán!');
                        }
                    });
                },
                function() {
                    Notiflix.Notify.info('Đã hủy thanh toán.');
                }
            );
        });

        <?php if (!empty($social_id)): ?>
            $('.social-btn').removeClass('active');
            $('.social-btn[data-social-id="<?php echo $social_id; ?>"]').addClass('active');
            loadCategories('<?php echo $social_id; ?>');
        <?php else: ?>
            let firstSocialBtn = $('.social-btn').first();
            if (firstSocialBtn.length) {
                firstSocialBtn.addClass('active');
                let firstSocialId = firstSocialBtn.data('social-id');
                if (firstSocialId) {
                    loadCategories(firstSocialId);
                }
            }
        <?php endif; ?>
    });
</script>

<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>