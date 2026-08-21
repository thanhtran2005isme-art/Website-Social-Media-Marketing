<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php');

$current_year = date('Y'); // Gets the current year (e.g., 2025)
$current_month = date('m'); // Gets the current month (e.g., 05 for May)
// Hàm tính tỷ lệ phần trăm cho progress bar
function calculateProgress($current, $total)
{
    return $total > 0 ? round(($current / $total) * 100) : 0;
}

// Thống kê thành viên
$total_users = $db->num_rows("SELECT * FROM users");
$today_users = $db->num_rows("SELECT * FROM users WHERE DATE(created_at) = CURDATE()") ?: 0;
$total_balance = $db->get_row("SELECT SUM(balance) as total FROM users")['total'] ?? 0;

// Giả sử bảng `transactions` lưu thông tin nạp tiền (nếu không có, bạn cần điều chỉnh)
$total_deposits = $db->get_row("SELECT SUM(amount) as total FROM transactions WHERE transactional_type = 'bank'")['total'] ?? 0;
$today_deposits = $db->get_row("SELECT SUM(amount) as total FROM transactions WHERE transactional_type = 'bank' AND DATE(created_at) = CURDATE()")['total'] ?? 0;
$month_deposits = $db->get_row("SELECT SUM(amount) as total FROM transactions WHERE transactional_type = 'bank' AND YEAR(created_at) = $current_year AND MONTH(created_at) = $current_month")['total'] ?? 0;

// Thống kê đơn hàng
$total_orders = $db->num_rows("SELECT * FROM orders");
$total_payment = $db->get_row("SELECT SUM(price) as total FROM orders")['total'] ?? 0;
$month_orders = $db->num_rows("SELECT * FROM orders WHERE YEAR(created_at) = $current_year AND MONTH(created_at) = $current_month");
$week_orders = $db->num_rows("
    SELECT * FROM orders 
    WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
    AND YEAR(created_at) = $current_year 
    AND MONTH(created_at) = $current_month
");
$today_orders = $db->num_rows("SELECT * FROM orders WHERE DATE(created_at) = CURDATE()") ?: 0;
$pending_orders = $db->num_rows("SELECT * FROM orders WHERE status = 'pending'") ?: 0;

// Thống kê lợi nhuận
$total_revenue = $db->get_row("SELECT SUM(price) as total FROM orders WHERE status = 'completed'")['total'] ?? 0;
$total_profit = $db->get_row("SELECT SUM(price - (SELECT price FROM services WHERE services.id = orders.service_id)) as total FROM orders WHERE status = 'completed'")['total'] ?? 0;
$month_revenue = $db->get_row("SELECT SUM(price) as total FROM orders WHERE status = 'completed' AND YEAR(created_at) = $current_year AND MONTH(created_at) = $current_month")['total'] ?? 0;
$month_profit = $db->get_row("SELECT SUM(price - (SELECT price FROM services WHERE services.id = orders.service_id)) as total FROM orders WHERE status = 'completed' AND YEAR(created_at) = $current_year AND MONTH(created_at) = $current_month")['total'] ?? 0;
$today_revenue = $db->get_row("SELECT SUM(price) as total FROM orders WHERE status = 'completed' AND DATE(created_at) = CURDATE()")['total'] ?? 0;
$today_profit = $db->get_row("SELECT SUM(price - (SELECT price FROM services WHERE services.id = orders.service_id)) as total FROM orders WHERE status = 'completed' AND DATE(created_at) = CURDATE()")['total'] ?? 0;
?>

<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Thống kê</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Thống kê</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="col-xl-12">
            <figure class="bg-primary-subtle border-start border-3 border-primary p-3 rounded text-dark">
                <blockquote class="blockquote">
                    Phiên bản hiện tại: <b class="text-danger">2.6</b>
                </blockquote>
                <figcaption class="blockquote-footer mb-0">
                    Hệ thống sẽ tự động cập nhật phiên bản mới khi bạn truy cập trang này
                </figcaption>
            </figure>
        </div>
        <div class="col-xl-12">
            <figure class="bg-warning-subtle border-start border-3 border-warning p-4 rounded text-dark">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <blockquote class="blockquote mb-0" style="font-size: 1.5rem; font-weight: bold;">
                        Cronjob Hệ Thống
                    </blockquote>
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#cronSetupModal">
                        Hướng dẫn thiết lập
                    </button>
                </div>
                <ul class="list-unstyled mb-0">
                    <li class="mb-4">
                        <figcaption class="blockquote-footer mb-0">
                            <strong style="font-size: 1.2rem;">URL:</strong> <span style="font-size: 1.1rem;">https://<?php echo $_SERVER['SERVER_NAME']; ?>/task/order/update</span><br>
                            <small class="cron-note" style="font-size: 1rem;">Tự động cập nhật trạng thái đơn hàng từ các nhà cung cấp API, chạy định kỳ để đồng bộ dữ liệu.</small>
                        </figcaption>
                    </li>
                    <li class="mb-0">
                        <figcaption class="blockquote-footer mb-0">
                            <strong style="font-size: 1.2rem;">URL:</strong> <span style="font-size: 1.1rem;">https://<?php echo $_SERVER['SERVER_NAME']; ?>/task/services/import</span><br>
                            <small class="cron-note" style="font-size: 1rem;">Tự động lấy và thêm các dịch vụ mới từ tất cả nhà cung cấp API vào hệ thống, đồng thời tạo danh mục nếu chưa có.</small>
                        </figcaption>
                    </li>
                </ul>
            </figure>
        </div>
        <h5>Thống Kê Thành Viên</h5>
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Tổng thành viên</h6>
                                <h3><?php echo $total_users; ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/user.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Đăng ký hôm nay</h6>
                                <h3><?php echo $today_users; ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/add-user.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Tổng số dư</h6>
                                <h3><?php echo number_format($total_balance, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/wallet.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Tổng tiền nạp</h6>
                                <h3><?php echo number_format($total_deposits, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/money-bag.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">


                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Nạp Hôm Nay</h6>
                                <h3><?php echo number_format($today_deposits, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/3d-wallet.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Nạp Tháng <?= date('m/Y') ?></h6>
                                <h3><?php echo number_format($month_deposits, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/lost.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <h5>Thống Kê Đơn Hàng</h5>
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Tổng Đơn Hàng</h6>
                                <h3><?php echo $total_orders; ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/order.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Tổng thanh toán</h6>
                                <h3><?php echo number_format($total_payment, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/order-pay.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Đơn hàng tháng <?= date('m/Y') ?></h6>
                                <h3><?php echo $month_orders; ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/purchase-order.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Đơn Hàng Tuần Này</h6>
                                <h3><?php echo $week_orders; ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/approved-order.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Đơn Hàng Hôm Nay</h6>
                                <h3><?= $today_orders; ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/manifest.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Đơn hàng chờ xử lý</h6>
                                <h3><?php echo $pending_orders; ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/shopping-list.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <h5>Thống Kê Lợi Nhuận</h5>
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Tổng Doanh Thu</h6>
                                <h3><?php echo number_format($total_revenue, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/3d.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Tổng Lợi Nhuận</h6>
                                <h3><?php echo number_format($total_profit, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/bar-chart.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Doanh thu tháng <?= date('m/Y') ?></h6>
                                <h3><?php echo number_format($month_revenue, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/pie-chart.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Lợi nhuận tháng <?= date('m/Y') ?></h6>
                                <h3><?php echo number_format($month_profit, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/bar-chart2.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Doanh thu hôm nay</h6>
                                <h3><?php echo number_format($today_revenue, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/bar-chart3.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body px-3 pt-3">
                        <div class="d-flex justify-content-between">
                            <div class="clearfix">
                                <h6 class="mb-0">Lợi nhuận hôm nay</h6>
                                <h3><?php echo number_format($today_profit, 2); ?></h3>
                            </div>
                            <div class="avatar avatar-sm avatar-primary border-0">
                                <img src="/assets/images/statistic.png" width="40px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="cronSetupModal" tabindex="-1" aria-labelledby="cronSetupModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cronSetupModalLabel">Hướng dẫn thiết lập Cron Job trên cPanel</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Cron job là các tác vụ tự động chạy định kỳ để đảm bảo hệ thống hoạt động trơn tru. Dưới đây là hướng dẫn thiết lập cron job trong cPanel:</p>
                <ol>
                    <li>Đăng nhập vào tài khoản cPanel của bạn.</li>
                    <li>Trong mục <strong>Advanced</strong> (Nâng cao), nhấp vào <strong>Cron Jobs</strong>.</li>
                    <li>Trong phần <strong>Add New Cron Job</strong>:
                        <ul>
                            <li>Chọn <strong>Common Settings</strong>: <code>Every minute (* * * * *)</code> để cron chạy mỗi phút.</li>
                            <li>Trong trường <strong>Command</strong>, nhập lệnh curl cho từng cron job (sao chép từ bên dưới).</li>
                        </ul>
                    </li>
                    <li>Nhấn <strong>Add New Cron Job</strong> để lưu.</li>
                </ol>
                <h6>Danh sách lệnh Cron Job</h6>
                <div class="mb-3">
                    <label class="form-label">Cập nhật đơn hàng (mỗi phút):</label>
                    <div class="input-group">
                        <input type="text" class="form-control" value="curl -s https://<?php echo $_SERVER['SERVER_NAME']; ?>/task/order/update" readonly>
                        <button class="btn btn-outline-secondary copy-btn" type="button" data-clipboard-text="curl -s https://<?php echo $_SERVER['SERVER_NAME']; ?>/task/order/update">Sao chép</button>
                    </div>
                    <small class="text-muted">Cập nhật trạng thái đơn hàng từ API, chạy mỗi phút.</small>
                </div>
                <div class="mb-3">
                    <label class="form-label">Thêm dịch vụ mới (mỗi phút):</label>
                    <div class="input-group">
                        <input type="text" class="form-control" value="curl -s https://<?php echo $_SERVER['SERVER_NAME']; ?>/task/services/import" readonly>
                        <button class="btn btn-outline-secondary copy-btn" type="button" data-clipboard-text="curl -s https://<?php echo $_SERVER['SERVER_NAME']; ?>/task/services/import">Sao chép</button>
                    </div>
                    <small class="text-muted">Tự động lấy và thêm dịch vụ mới từ API, chạy mỗi phút.</small>
                </div>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const copyButtons = document.querySelectorAll('.copy-btn');
        copyButtons.forEach(button => {
            button.addEventListener('click', function() {
                const textToCopy = this.getAttribute('data-clipboard-text');
                navigator.clipboard.writeText(textToCopy).then(() => {
                    this.textContent = 'Đã sao chép!';
                    this.classList.remove('btn-outline-secondary');
                    this.classList.add('btn-success');
                    setTimeout(() => {
                        this.textContent = 'Sao chép';
                        this.classList.remove('btn-success');
                        this.classList.add('btn-outline-secondary');
                    }, 2000);
                }).catch(err => {
                    console.error('Lỗi sao chép:', err);
                    alert('Không thể sao chép, vui lòng thử lại.');
                });
            });
        });
    });
</script>

<?php
$db->dis_connect();
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php');
?>