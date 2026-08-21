<?php 
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Đơn hàng - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<?php
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;

$service_id = isset($_GET['service']) ? Anti_xss($_GET['service']) : '';
$status = isset($_GET['status']) ? Anti_xss($_GET['status']) : '';
$date_start = isset($_GET['date_start']) ? Anti_xss($_GET['date_start']) : '';
$date_end = isset($_GET['date_end']) ? Anti_xss($_GET['date_end']) : '';

$where_conditions = ["o.user_id = '{$data_user['id']}'"];
if ($service_id) {
    $where_conditions[] = "o.service_id = '$service_id'";
}
if ($status) {
    $where_conditions[] = "o.status = '$status'";
}
if ($date_start && $date_end) {
    $where_conditions[] = "o.created_at BETWEEN '$date_start 00:00:00' AND '$date_end 23:59:59'";
}
$where_clause = !empty($where_conditions) ? 'WHERE ' . implode(' AND ', $where_conditions) : '';

$stats_query = "
    SELECT 
        (SELECT COUNT(*) FROM `orders` o $where_clause) as total_orders,
        (SELECT COUNT(*) FROM `orders` o $where_clause AND o.status = 'processing') as processing_orders,
        (SELECT COUNT(*) FROM `orders` o $where_clause AND o.status = 'canceled') as canceled_orders,
        (SELECT COUNT(*) FROM `orders` o $where_clause AND o.status = 'pending') as pending_orders
";
$stats = $db->get_row($stats_query);
$total_orders = $stats['total_orders'] ?? 0;
$processing_orders = $stats['processing_orders'] ?? 0;
$canceled_orders = $stats['canceled_orders'] ?? 0;
$pending_orders = $stats['pending_orders'] ?? 0;

$total_pages = ceil($total_orders / $items_per_page);

$orders = $db->get_list("
    SELECT o.*, s.service_title AS service_name 
    FROM `orders` o 
    LEFT JOIN `services` s ON o.service_id = s.id 
    $where_clause
    ORDER BY o.id DESC 
    LIMIT $offset, $items_per_page
");
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
                <h1 class="page-title fw-medium fs-18 mb-0">Tất cả đơn hàng</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-6">
                <div class="card custom-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="flex-fill">
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="avatar avatar-rounded bg-primary-gradient text-white"><i class="bi bi-bar-chart-line fs-17"></i></span>
                                </div>
                                <p class="flex-fill text-muted fs-14 mb-0">Tổng đơn hàng</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="fs-24 fw-medium mb-0 d-flex align-items-center"><?= number_format($total_orders, 0, ',', '.') ?></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-6">
                <div class="card custom-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="flex-fill">
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="avatar avatar-rounded bg-success-gradient text-white"><i class="bi bi-bar-chart-line fs-17"></i></span>
                                </div>
                                <p class="flex-fill text-muted fs-14 mb-0">Đang chạy</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="fs-24 fw-medium mb-0 d-flex align-items-center"><?= number_format($processing_orders, 0, ',', '.') ?></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-6">
                <div class="card custom-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="flex-fill">
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="avatar avatar-rounded bg-primary2-gradient text-white"><i class="bi bi-bar-chart-line fs-17"></i></span>
                                </div>
                                <p class="flex-fill text-muted fs-14 mb-0">Bị huỷ</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="fs-24 fw-medium mb-0 d-flex align-items-center"><?= number_format($canceled_orders, 0, ',', '.') ?></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-6">
                <div class="card custom-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="flex-fill">
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="avatar avatar-rounded bg-primary3-gradient text-white"><i class="bi bi-bar-chart-line fs-17"></i></span>
                                </div>
                                <p class="flex-fill text-muted fs-14 mb-0">Đang chờ</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="fs-24 fw-medium mb-0 d-flex align-items-center"><?= number_format($pending_orders, 0, ',', '.') ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row g-4 pulse-loader">
            <div class="col-xl-12">
                <div class="card custom-card">
                    <div class="card-header justify-content-between">
                        <div class="card-title"> Tất cả đơn hàng </div>
                    </div>
                    <div class="card-body p-0">
                        <form class="row g-3 p-3" id="order-filter-form" method="GET" action="">
                            <div class="col-md-3">
                                <select class="js-example-placeholder-single form-control" name="service" id="service-select">
                                    <option value="" <?= empty($service_id) ? 'selected' : '' ?>>Chọn dịch vụ</option>
                                    <?php foreach ($db->get_list("SELECT * FROM `services` WHERE `service_status` ORDER BY `id` DESC") as $service): ?>
                                        <option value="<?= htmlspecialchars($service['id']) ?>" <?= $service_id == $service['id'] ? 'selected' : '' ?>>
                                            <?= htmlspecialchars($service['service_title']) ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select class="js-example-placeholder-single form-control" name="status" id="status-select">
                                    <option value="" <?= empty($status) ? 'selected' : '' ?>>Chọn trạng thái</option>
                                    <option value="pending" <?= $status == 'pending' ? 'selected' : '' ?>>Đang chờ</option>
                                    <option value="processing" <?= $status == 'processing' ? 'selected' : '' ?>>Đang hoạt động</option>
                                    <option value="completed" <?= $status == 'completed' ? 'selected' : '' ?>>Hoàn thành</option>
                                    <option value="canceled" <?= $status == 'canceled' ? 'selected' : '' ?>>Đã huỷ</option>
                                    <option value="refund" <?= $status == 'refund' ? 'selected' : '' ?>>Hoàn tiền</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-text text-muted"><i class="ri-calendar-line"></i></div>
                                        <input type="text" class="form-control flatpickr-input" id="daterange" placeholder="Chọn mốc thời gian" readonly="readonly" value="<?= $date_start && $date_end ? htmlspecialchars("$date_start to $date_end") : '' ?>">
                                        <input type="hidden" name="date_start" id="date_start" value="<?= htmlspecialchars($date_start) ?>">
                                        <input type="hidden" name="date_end" id="date_end" value="<?= htmlspecialchars($date_end) ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-primary-gradient"><i class="bi bi-search me-1"></i>Tìm kiếm</button>
                                <button class="btn btn-danger-gradient" id="clear-filter"><i class="bi bi-x-circle me-1"></i>Bỏ lọc</button>
                            </div>

                        </form>
                        <div class="p-3">
                            <button class="btn btn-dark btn-sm btn-wave waves-effect waves-light" id="bulk-update-btn" disabled>
                                Cập nhật tất cả
                            </button>
                            <button class="btn btn-info btn-sm btn-wave waves-effect waves-light" id="bulk-copy-btn" disabled>
                                Sao chép đơn hàng
                            </button>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-nowrap">
                                <thead>
                                    <tr>
                                        <th scope="col"><input type="checkbox" class="form-check-input check-all" id="select-all-orders"></th>
                                        <th scope="col">ID</th>
                                        <th scope="col">Dịch vụ</th>
                                        <th scope="col">Số tiền</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Bắt đầu</th>
                                        <th scope="col">Còn lại</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($orders)): ?>
                                        <?php foreach ($orders as $order): ?>
                                            <tr>
                                                <td class="product-checkbox"><input class="form-check-input order-checkbox" type="checkbox" value="<?= htmlspecialchars($order['id']) ?>"></td>
                                                <td><?= htmlspecialchars($order['id']) ?></td>
                                                <td>
                                                    <div class="d-flex gap-2">
                                                        <span class="avatar avatar-md"><img src="/assets/images/shopping-bag.png" class="" alt="..."></span>
                                                        <div>
                                                            <a href="javascript:void(0);" class="fw-semibold mb-0 d-flex align-items-center">
                                                            <span class="badge bg-danger-gradient"><?=$order['service_id']?></span> - <?= htmlspecialchars($order['service_name'] ?? 'N/A') ?>
                                                            </a>
                                                            <a href="<?= htmlspecialchars($order['link']) ?>" target="_blank" class="fs-12 d-block text-muted"><?= htmlspecialchars($order['link']) ?></a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><?= formatCurrencyF($order['price']) ?></td>
                                                <td><?= htmlspecialchars($order['quantity']) ?></td>
                                                <td><?= htmlspecialchars($order['start_counter'] ?? 'N/A') ?></td>
                                                <td><?= htmlspecialchars($order['remains'] ?? 'N/A') ?></td>
                                                <td>
                                                    <?= getStatusClass($order['status']) ?>
                                                </td>
                                                <td>
                                                    <div class="dropdown">
                                                        <a aria-label="anchor" href="javascript:void(0);" class="btn btn-sm btn-light btn-icon" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <i class="fe fe-more-vertical"></i>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li><a class="dropdown-item update-order" href="javascript:void(0);" data-id="<?= htmlspecialchars($order['id']) ?>">Cập nhật</a></li>
                                                            <li><a class="dropdown-item" href="/user/order/create?category_id=<?=$order['category_id']?>&service_id=<?=$order['service_id']?>">Đặt hàng lại</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="9" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có đơn hàng nào</p>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer border-top-0">
                        <div class="d-flex align-items-center">
                            <div> Showing <?= min($items_per_page, count($orders)) ?> Entries <i class="bi bi-arrow-right ms-2 fw-semibold"></i> </div>
                            <div class="ms-auto d-flex align-items-center gap-2">

                                <nav aria-label="Page navigation" class="pagination-style-4">
                                    <ul class="pagination mb-0">
                                        <li class="page-item <?= $page <= 1 ? 'disabled' : '' ?>">
                                            <a class="page-link" href="?page=<?= $page - 1 ?>&service=<?= urlencode($service_id) ?>&status=<?= urlencode($status) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"> Prev </a>
                                        </li>
                                        <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                            <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                                                <a class="page-link" href="?page=<?= $i ?>&service=<?= urlencode($service_id) ?>&status=<?= urlencode($status) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"><?= $i ?></a>
                                            </li>
                                        <?php endfor; ?>
                                        <li class="page-item <?= $page >= $total_pages ? 'disabled' : '' ?>">
                                            <a class="page-link text-primary" href="?page=<?= $page + 1 ?>&service=<?= urlencode($service_id) ?>&status=<?= urlencode($status) ?>&date_start=<?= urlencode($date_start) ?>&date_end=<?= urlencode($date_end) ?>"> Next </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="copyOrderModal" tabindex="-1" aria-labelledby="copyOrderModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="copyOrderModalLabel">Sao chép mã đơn hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>Mã đơn hàng:</strong></p>
                <p id="orderIdsText"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger-gradient" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-success-gradient" id="copyOrderIdsBtn">Sao chép</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        Notiflix.Notify.init();
        Notiflix.Confirm.init({
            titleColor: '#ff5549',
            okButtonBackground: '#ff5549',
            cancelButtonBackground: '#a9a9a9'
        });
        $("#daterange").flatpickr({
            mode: "range",
            dateFormat: "Y-m-d",
            onChange: function(selectedDates, dateStr, instance) {
                if (selectedDates.length === 2) {
                    $('#date_start').val(instance.formatDate(selectedDates[0], 'Y-m-d'));
                    $('#date_end').val(instance.formatDate(selectedDates[1], 'Y-m-d'));
                }
            }
        });
        

        $('#order-filter-form').on('submit', function(e) {
            e.preventDefault();
            const formData = $(this).serialize();
            window.location.href = '?' + formData;
        });

        $('#clear-filter').on('click', function() {
          
            $('#service-select').val('').trigger('change');
            $('#status-select').val('').trigger('change');
            $('#daterange').val('');
            $('#date_start').val('');
            $('#date_end').val('');

            const $serviceSelect = $('#service-select');
            const $statusSelect = $('#status-select');
            if ($serviceSelect.data('select2')) {
                $serviceSelect.select2('close');
            }
            if ($statusSelect.data('select2')) {
                $statusSelect.select2('close');
            }

            window.location.href = '?page=1';
        });

        const $selectAllCheckbox = $('#select-all-orders');
        const $orderCheckboxes = $('.order-checkbox');

        $selectAllCheckbox.on('change', function() {
            $orderCheckboxes.prop('checked', this.checked);
            toggleBulkUpdateButton();
        });

        $orderCheckboxes.on('change', toggleBulkUpdateButton);

        function toggleBulkUpdateButton() {
            const anyChecked = $orderCheckboxes.is(':checked');
            $('#bulk-update-btn').prop('disabled', !anyChecked);
            $('#bulk-copy-btn').prop('disabled', !anyChecked);
        }
        $('.copy-order').on('click', function() {
            const orderId = $(this).data('id');
            $('#orderIdsText').text(orderId);
            $('#copyOrderModal').modal('show');
        });

        $('#bulk-copy-btn').on('click', function() {
            const selectedOrders = $orderCheckboxes.filter(':checked').map(function() {
                return this.value;
            }).get();

            if (selectedOrders.length === 0) {
                Notiflix.Notify.warning('Vui lòng chọn ít nhất một đơn hàng!');
                return;
            }

            $('#orderIdsText').text(selectedOrders.join(','));
            $('#copyOrderModal').modal('show');
        });

       
        $('#copyOrderIdsBtn').on('click', function() {
            const textToCopy = $('#orderIdsText').text();
            navigator.clipboard.writeText(textToCopy).then(() => {
                Notiflix.Notify.success('Đã sao chép mã đơn hàng!');
                //$('#copyOrderModal').modal('hide');
            }).catch(err => {
                Notiflix.Notify.failure('Lỗi khi sao chép: ' + err);
            });
        });
      
        $('.update-order').on('click', function() {
            const orderId = $(this).data('id');

            Notiflix.Confirm.show(
                'Xác nhận cập nhật',
                `Bạn có chắc muốn cập nhật đơn hàng #${orderId}?`,
                'Có',
                'Không',
                function() {
                    Notiflix.Loading.circle('Đang xử lý...');
                    $.ajax({
                        url: '/model/order/update',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            order_id: orderId
                        }),
                        dataType: 'json',
                        success: function(data) {
                            Notiflix.Loading.remove();
                            if (data.success) {
                                Notiflix.Notify.success('Cập nhật đơn hàng thành công!');
                                setTimeout(() => location.reload(), 1000);
                            } else {
                                Notiflix.Notify.failure(data.message || 'Cập nhật thất bại!');
                            }
                        },
                        error: function(xhr, status, error) {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi: ' + (xhr.responseJSON?.message || error));
                        }
                    });
                },
                function() {
                    Notiflix.Notify.info('Hủy cập nhật.');
                }
            );
        });

        $('#bulk-update-btn').on('click', function() {
            const selectedOrders = $orderCheckboxes.filter(':checked').map(function() {
                return this.value;
            }).get();

            if (selectedOrders.length === 0) {
                Notiflix.Notify.warning('Vui lòng chọn ít nhất một đơn hàng!');
                return;
            }

            Notiflix.Confirm.show(
                'Xác nhận cập nhật hàng loạt',
                `Bạn có chắc muốn cập nhật ${selectedOrders.length} đơn hàng?`,
                'Có',
                'Không',
                function() {
                    Notiflix.Loading.circle('Đang xử lý...');
                    $.ajax({
                        url: '/model/order/update',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            order_ids: selectedOrders
                        }),
                        dataType: 'json',
                        success: function(data) {
                            Notiflix.Loading.remove();
                            if (data.success) {
                                Notiflix.Notify.success('Cập nhật hàng loạt thành công!');
                                setTimeout(() => location.reload(), 1000);
                            } else {
                                Notiflix.Notify.failure(data.message || 'Cập nhật thất bại!');
                            }
                        },
                        error: function(xhr, status, error) {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi: ' + (xhr.responseJSON?.message || error));
                        }
                    });
                },
                function() {
                    Notiflix.Notify.info('Hủy cập nhật.');
                }
            );
        });
    });
</script>

<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>