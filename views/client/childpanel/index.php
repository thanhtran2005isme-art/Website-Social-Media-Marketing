<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Tạo website riêng - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php');
?>

<div class="main-content app-content">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tạo website riêng</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Tạo website riêng</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card custom-card">
                    <div class="card-header">
                        <h5 class="card-title">Nhập tên miền để tạo Child Panel</h5>
                    </div>
                    <div class="card-body">

                        <form method="POST">
                            <div class="mb-3">
                                <label for="domain" class="form-label">Tên miền</label>
                                <input type="text" class="form-control" id="domain" name="domain" placeholder="Ví dụ: example.com" required>
                                <small class="form-text text-muted">Nhập tên miền bạn muốn sử dụng cho Child Panel.</small>
                            </div>
                            <button type="button" class="btn btn-primary" id="childpanel-btn">Tạo Child Panel</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card custom-card">
                    <div class="card-header">
                        <h5 class="card-title">Lưu ý về Cloudflare Nameservers</h5>
                    </div>
                    <div class="card-body">
                        <p>Để Child Panel hoạt động chính xác, bạn cần đảm bảo domain chính (ví dụ: <code>example.com</code>) đã được trỏ về nameservers của Cloudflare. Thực hiện các bước sau:</p>
                        <ol>
                            <li>Đăng nhập vào nhà cung cấp tên miền của bạn (ví dụ: GoDaddy, Namecheap).</li>
                            <li>Tìm phần quản lý DNS hoặc Nameservers.</li>
                            <li>Thay đổi nameservers thành các giá trị do Cloudflare cung cấp. Ví dụ:
                                <ul>
                                    <li><code>hank.ns.cloudflare.com</code></li>
                                    <li><code>june.ns.cloudflare.com</code></li>
                                </ul>
                                <small>Lưu ý: Nameservers thực tế sẽ được cung cấp khi bạn thêm domain vào Cloudflare.</small>
                            </li>
                            <li>Chờ 24-48 giờ để DNS propagate.</li>
                            <li>Xác nhận domain đã sử dụng nameservers Cloudflare trong Cloudflare Dashboard > Overview.</li>
                        </ol>
                        <div class="alert alert-primary">
                            <strong>Quan trọng:</strong> Nếu domain chính chưa trỏ về Cloudflare, bạn không thể tạo subdomain cho Child Panel. Liên hệ hỗ trợ nếu cần hướng dẫn thêm.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
   
    $('#childpanel-btn').click(function() {
        const formData = new FormData();
        formData.append('domain', $('#domain').val());
       
        Notiflix.Loading.circle('Đang xử lý...');
        $.ajax({
            url: '/model/childpanel',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                Notiflix.Loading.remove();
                if (response.status == "success") {
                    Notiflix.Notify.success(response.msg);
                    $('#domain').val('');
                } else {
                    Notiflix.Notify.failure(response.msg || 'Lỗi không xác định');
                }
            },
            error: function(xhr, status, error) {
                Notiflix.Loading.remove();
                Notiflix.Notify.failure('Lỗi kết nối: ' + error);
            }
        });
    });
});
</script>
<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php');
?>