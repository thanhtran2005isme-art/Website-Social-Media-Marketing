<?php 
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Tạo đơn hàng số lượng lớn - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<div class="main-content app-content new_order">
    <div class="container-fluid">
        <!-- Page Header -->
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Đơn hàng</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Đặt hàng số lượng lớn</h1>
            </div>
           
        </div>

        <div class="row g-4 pulse-loader">
            <div class="col-md-6">
                <div class="card custom-card">
                    <div class="card-header">
                        <h4>Đặt hàng số lượng lớn</h4>
                    </div>
                    <div class="card-body">
                        <form id="mass-order-form" method="POST">
                            <div class="row g-3">
                                <div class="col-12 mb-2">
                                    <label for="txa-data-order" class="form-label">Nhập mỗi đơn hàng là một dòng theo định dạng bên dưới</label>
                                    <textarea id="txa-data-order" name="orders" class="form-control" placeholder="service_id | link | quantity
service_id | link | quantity | comment1 / comment2 / comment3 / ... (Separate by /)
service_id | link | quantity | suggest video list
service_id | link | quantity | keyword search
service_id | link | quantity | suggest video list | keyword search (Mix views)" rows="15"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary mt-3">Thanh Toán Ngay</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card custom-card">
                    <div class="card-header">
                        <h4>Mass Order hoạt động như thế nào?</h4>
                    </div>
                    <div class="card-body">
                        <p><strong>Đặt hàng số lượng lớn (Mass Order)</strong> cho phép bạn gửi nhiều đơn hàng cùng lúc để tăng tương tác trên mạng xã hội như lượt thích, lượt xem, bình luận, hoặc người theo dõi.</p>
                        <h5>Cách sử dụng:</h5>
                        <ul>
                            <li>Nhập mỗi đơn hàng trên một dòng trong ô bên trái.</li>
                            <li>Định dạng: <code>service_id | link | quantity</code> hoặc bổ sung bình luận/keyword nếu cần.</li>
                            <li>Ví dụ:
                                <ul>
                                    <li><code>1 | https://instagram.com/p/abc | 1000</code> (1000 likes)</li>
                                    <li><code>2 | https://youtube.com/watch?v=xyz | 5000 | comment1 / comment2</code> (5000 views + comments)</li>
                                    <li><code>3 | https://tiktok.com/video/123 | 2000 | keyword search</code> (2000 views với từ khóa)</li>
                                </ul>
                            </li>
                            <li>Nhấn "Thanh Toán Ngay" để xử lý tất cả đơn hàng.</li>
                        </ul>
                        <h5>Lưu ý:</h5>
                        <ul>
                            <li>Kiểm tra số dư tài khoản trước khi đặt hàng.</li>
                            <li>Đảm bảo <code>service_id</code> hợp lệ (xem danh sách dịch vụ).</li>
                            <li>Link phải đúng định dạng URL của nền tảng (Instagram, YouTube, v.v.).</li>
                            <li>Số lượng phải nằm trong giới hạn của dịch vụ (min/max).</li>
                        </ul>
                        <p>Sau khi đặt hàng, bạn có thể theo dõi trạng thái trong mục "Tất cả đơn hàng".</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        // Initialize Notiflix
        Notiflix.Notify.init();
        Notiflix.Loading.init({
            svgColor: '#ff5549'
        });

        // Handle form submission via AJAX
        $('#mass-order-form').on('submit', function(e) {
            e.preventDefault();

            // Client-side validation
            var orders = $('#txa-data-order').val().trim();
            if (!orders) {
                Notiflix.Notify.warning('Vui lòng nhập ít nhất một đơn hàng.');
                return;
            }
            var lines = orders.split('\n').filter(line => line.trim());
            for (var i = 0; i < lines.length; i++) {
                var parts = lines[i].split('|').map(part => part.trim());
                if (parts.length < 3 || !/^\d+$/.test(parts[0]) || !/^https?:\/\//.test(parts[1]) || !/^\d+$/.test(parts[2])) {
                    Notiflix.Notify.warning(`Dòng ${i + 1}: Định dạng không hợp lệ.`);
                    return;
                }
            }
            // Show loading
            Notiflix.Loading.standard('Đang xử lý đơn hàng...');

            // Send AJAX request
            $.ajax({
                url: '/model/order/mass-create',
                method: 'POST',
                data: $(this).serialize(),
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.success) {
                        Notiflix.Notify.success(response.message);
                        $('#txa-data-order').val(''); // Clear textarea
                    } else {
                        Notiflix.Notify.failure(response.message);
                    }
                    if (response.errors && response.errors.length > 0) {
                        response.errors.forEach(function(error) {
                            Notiflix.Notify.failure(error);
                        });
                    }
                },
                error: function(xhr, status, error) {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi: ' + (xhr.responseJSON?.message || error));
                }
            });
        });
    });
</script>

<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>