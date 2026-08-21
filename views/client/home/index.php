<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Thống kê - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<?php
// Tính tổng tiền nạp trong tháng hiện tại
$current_month = date('Y-m'); // Lấy năm-tháng hiện tại (e.g., 2025-04)
$total_deposit_month = $db->get_row("
    SELECT SUM(amount) as total 
    FROM `transactions` 
    WHERE `user_id` = '{$data_user['id']}' 
    AND `transactional_type` = 'bank' 
    AND DATE_FORMAT(created_at, '%Y-%m') = '$current_month'
")['total'] ?? 0;

$status_counts = $db->get_list("
SELECT 
    status,
    COUNT(*) as total
FROM `orders`
WHERE `user_id` = '{$data_user['id']}'
GROUP BY status
");
$status_data = [
    'Pending' => 0,
    'Processing' => 0,
    'Completed' => 0,
    'Cancelled' => 0,
    'Refund' => 0,
    'Error' => 0,
    'Other' => 0
];
$total_orders = 0;
foreach ($status_counts as $row) {
    $status = ucfirst(strtolower($row['status'])); // Normalize status (e.g., 'pending' to 'Pending')
    if (array_key_exists($status, $status_data)) {
        $status_data[$status] = (int)$row['total'];
    } else {
        $status_data['Other'] += (int)$row['total']; // Any unrecognized status goes to 'Other'
    }
    $total_orders += (int)$row['total'];
}

// Fetch data for Bar Chart (Orders by Status per Day)
$current_date = date('Y-m-d'); // Current date (e.g., 2025-04-18)
$days_in_month = date('d', strtotime($current_date)); // Number of days up to today
$bar_chart_data = [];
$labels = [];
for ($i = 1; $i <= $days_in_month; $i++) {
    $labels[] = "Ngày $i";
    $day = sprintf('%02d', $i); // Format day as 2 digits (e.g., 01, 02)
    $date = "2025-04-$day"; // Adjust year/month as needed
    $daily_data = $db->get_list("
    SELECT 
        status,
        COUNT(*) as total
    FROM `orders`
    WHERE `user_id` = '{$data_user['id']}'
    AND DATE(created_at) = '$date'
    GROUP BY status
");
    $day_data = [
        'Pending' => 0,
        'Processing' => 0,
        'Completed' => 0,
        'Cancelled' => 0,
        'Refund' => 0,
        'Error' => 0,
        'Other' => 0
    ];
    foreach ($daily_data as $row) {
        $status = ucfirst(strtolower($row['status']));
        if (array_key_exists($status, $day_data)) {
            $day_data[$status] = (int)$row['total'];
        } else {
            $day_data['Other'] += (int)$row['total'];
        }
    }
    $bar_chart_data[] = $day_data;
}
$orders = $db->get_list("
SELECT o.*, s.service_title AS service_name 
FROM `orders` o 
LEFT JOIN `services` s ON o.service_id = s.id 
WHERE `user_id` = '{$data_user['id']}'
ORDER BY o.id DESC 
LIMIT 5
");
?>
<div class="main-content app-content">
    <div class="container-fluid"> <!-- Page Header -->
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Bảng thống kê</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Bảng thống kê</h1>
            </div>

        </div>
        <!-- <div class="card border border-primary border-opacity-25 shadow-none custom-card mb-3 bg-primary-transparent">
            <div class="card-body">
                Demo code
            </div>
        </div> -->
        <div class="row row-cols row-cols-xl-5 mb-3">
            <div class="col-xl-8">
                <div class="row row-cols row-cols-xl-5 mb-3">
                    <div class="col-xl-4">
                        <div class="card custom-card">
                            <div class="card-body">
                                <div class="d-flex gap-3 align-items-center">
                                    <div class="flex-fill">
                                        <p class="text-muted fw-medium mb-2">Số dư khả dụng</p>
                                        <h4 class="mb-1"><?= formatCurrency($data_user['balance']) ?></h4>
                                    </div> <span class="avatar avatar-rounded bg-success-gradient text-white"><i class="bi bi-currency-dollar fs-17"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="card custom-card">
                            <div class="card-body">
                                <div class="d-flex gap-3 align-items-center">
                                    <div class="flex-fill">
                                        <p class="text-muted fw-medium mb-2">Tổng tiền nạp tháng</p>
                                        <h4 class="mb-1"><?= formatCurrency($total_deposit_month) ?></h4>
                                    </div>
                                    <span class="avatar avatar-rounded bg-danger-gradient text-white"><i class="bi bi-bar-chart-line fs-17"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="card custom-card ">
                            <div class="card-body">
                                <div class="d-flex gap-3 align-items-center">
                                    <div class="flex-fill">
                                        <p class="text-muted fw-medium mb-2">Tổng đơn hàng</p>
                                        <h4 class="mb-1"><?= format_cash($db->get_row("SELECT COUNT(id) as total FROM orders WHERE `user_id` = '{$data_user['id']}'")['total'] ?? 0); ?></h4>
                                    </div> <span class="avatar avatar-rounded bg-primary-gradient text-white"><i class="bi bi-bar-chart-line fs-17"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card custom-card">
                            <div class="card-header">
                                <div class="card-title">Thống kê đơn hàng</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="chart-container">
                                            <canvas id="orderStatusBarChart"></canvas>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="chart-container">
                                            <canvas id="orderStatusChart"></canvas>
                                            <div class="chart-total">
                                                <span>3736</span>
                                                <small>TOTAL</small>
                                            </div>
                                        </div>
                                        <!-- Legend -->
                                        <ul class="legend-list mt-3">
                                            <li><span class="legend-color" style="background-color: #ffc107;"></span> Pending</li>
                                            <li><span class="legend-color" style="background-color: #007bff;"></span> Processing</li>
                                            <li><span class="legend-color" style="background-color: #28a745;"></span> Completed</li>
                                            <li><span class="legend-color" style="background-color: #f7b6d2;"></span> Cancelled</li>
                                            <li><span class="legend-color" style="background-color: #6c757d;"></span> Refund</li>
                                            <li><span class="legend-color" style="background-color: #dc3545;"></span> Error</li>
                                            <li><span class="legend-color" style="background-color: #17a2b8;"></span> Other</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="col-xl-4">
                <div class="card custom-card main-dashboard-banner main-dashboard-banner2 overflow-hidden">
                    <div class="card-body p-4">
                        <div class="row justify-content-between">
                            <div class="col-xxl-8 col-xl-4 col-lg-5 col-md-5 col-sm-5">
                                <h4 class="mb-3 fw-medium text-fixed-white">Tăng trưởng vượt bậc với SMM</h4>
                                <p class="mb-3 text-fixed-white fs-11">Mua ngay dịch vụ SMM để quản lý mạng xã hội hiệu quả, tăng tương tác và tiếp cận khách hàng nhanh chóng!</p>
                                <a href="/user/order/create" class="btn btn-primary1 shadow"><i class="bi bi-cart-plus"></i> Mua ngay</a>
                            </div>
                            <div class="col-xxl-4 col-xl-7 col-lg-7 col-md-7 col-sm-7 d-sm-block d-none text-end my-auto">
                                <img src="/assets/images/media.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card custom-card">
                    <div class="card-header justify-content-between">
                        <div class="card-title"> Đơn hàng gần đây </div> <a href="/user/orders" class="btn btn-light btn-wave btn-sm text-muted waves-effect waves-light">Xem tất cả</a>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled recent-activity-list">
                            <?php foreach ($orders as $order): ?>
                                <li>
                                    <div role="button" onclick="location.href='/user/orders?service=<?= $order['service_id'] ?>&status=&date_start=&date_end=';">
                                        <div class="fw-medium fs-14"><?= $order['service_name'] ?></div> <span class="fs-12 activity-time"> <?= timeAgo2($order['created_at']) ?> </span>
                                    </div> <span class="d-block text-danger"> Số lượng: <?= $order['quantity'] ?> <span class="text-primary fw-medium">Giá tiền: <?= formatCurrencyF($order['price']) ?></span></span>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="modal_notification" tabindex="-1" aria-labelledby="notificationModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 overflow-hidden">
            <div class="modal-header p-3">
                <h4 class="card-title mb-0" id="notificationModalLabel">
                    <i class="ri-notification-3-line me-2"></i>Thông báo hệ thống
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <?= $db->setting('system_notification') ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger"
                    id="dontShowAgainBtn">Không hiển thị lại trong 2 giờ</button>
            </div>
        </div>
    </div>
</div>
<?= $db->setting('plugin_chat') ?>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var modal = document.getElementById('modal_notification');
        var dontShowAgainBtn = document.getElementById('dontShowAgainBtn');
        var modalClosedTime = localStorage.getItem('modalClosedTime');

        if (!modalClosedTime || (Date.now() - parseInt(modalClosedTime) > 2 * 60 * 60 * 1000)) {
            var bootstrapModal = new bootstrap.Modal(modal);
            bootstrapModal.show();
        }
        dontShowAgainBtn.addEventListener('click', function() {
            localStorage.setItem('modalClosedTime', Date.now());
            var bootstrapModal = bootstrap.Modal.getInstance(modal);
            bootstrapModal.hide();
        });
    });
</script>
<script>
    // Data for Doughnut Chart
    const statusData = <?php echo json_encode(array_values($status_data)); ?>;
    const totalOrders = <?php echo $total_orders; ?>;

    // Data for Bar Chart
    const barChartLabels = <?php echo json_encode($labels); ?>;
    const barChartData = <?php echo json_encode($bar_chart_data); ?>;

    // Doughnut Chart
    const ctx = document.getElementById('orderStatusChart').getContext('2d');
    const orderStatusChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['Pending', 'Processing', 'Completed', 'Cancelled', 'Refund', 'Error', 'Other'],
            datasets: [{
                data: statusData,
                backgroundColor: [
                    '#ffc107', // Pending
                    '#007bff', // Processing
                    '#28a745', // Completed
                    '#f7b6d2', // Cancelled
                    '#6c757d', // Refund
                    '#dc3545', // Error
                    '#17a2b8' // Other
                ],
                borderWidth: 2,
                borderColor: '#fff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            rotation: -90,
            circumference: 180,
            cutout: '70%',
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            let label = context.label || '';
                            let value = context.raw || 0;
                            let total = <?php echo $total_orders; ?>;
                            let percentage = ((value / total) * 100).toFixed(1);
                            return `${label}: ${value} (${percentage}%)`;
                        }
                    }
                }
            }
        }
    });

    // Bar Chart
    const ctxBar = document.getElementById('orderStatusBarChart').getContext('2d');
    const orderStatusBarChart = new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: barChartLabels,
            datasets: [{
                    label: 'Pending',
                    data: barChartData.map(day => day.Pending),
                    backgroundColor: '#ffc107'
                },
                {
                    label: 'Processing',
                    data: barChartData.map(day => day.Processing),
                    backgroundColor: '#007bff'
                },
                {
                    label: 'Completed',
                    data: barChartData.map(day => day.Completed),
                    backgroundColor: '#28a745'
                },
                {
                    label: 'Cancelled',
                    data: barChartData.map(day => day.Cancelled),
                    backgroundColor: '#f7b6d2'
                },
                {
                    label: 'Refund',
                    data: barChartData.map(day => day.Refund),
                    backgroundColor: '#6c757d'
                },
                {
                    label: 'Error',
                    data: barChartData.map(day => day.Error),
                    backgroundColor: '#dc3545'
                },
                {
                    label: 'Other',
                    data: barChartData.map(day => day.Other),
                    backgroundColor: '#17a2b8'
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    title: {
                        display: true,
                        text: 'Số lượng đơn hàng'
                    },
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });

    // Update total orders in the chart-total div
    document.querySelector('.chart-total span').textContent = totalOrders;
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>