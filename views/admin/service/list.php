<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
$items_per_page = 100;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;
$name = isset($_GET['name']) ? Anti_xss($_GET['name']) : '';
$status = isset($_GET['status']) ? Anti_xss($_GET['status']) : '';
$provider = isset($_GET['provider']) ? Anti_xss($_GET['provider']) : '';

$where_clause = "";
$conditions = [];

if (!empty($status)) {
    if ($status === 'active') {
        $conditions[] = "s.service_status = 1";
    } elseif ($status === 'inactive') {
        $conditions[] = "s.service_status = 0";
    }
}

if (!empty($provider)) {
    $provider = intval($provider);
    $conditions[] = "p.id = $provider";
}

// Thêm điều kiện tìm kiếm theo tên dịch vụ
if (!empty($name)) {
    $conditions[] = "s.service_title LIKE '%$name%'";
}

if (!empty($conditions)) {
    $where_clause = "AND " . implode(" AND ", $conditions);
}
$sql = "
    SELECT 
        c.*,
        s.id AS service_id,
        s.category_id,
        s.api_provider_id,
        s.service_title,
        s.price,
        s.drip_feed,
        s.service_status,
        s.min_amount,
        s.max_amount,
        p.id AS provider_id,
        p.api_name AS provider_name
    FROM categories c
    INNER JOIN services s ON c.id = s.category_id
    LEFT JOIN api_providers p ON s.api_provider_id = p.id
    WHERE EXISTS (
        SELECT 1 
        FROM services s2 
        WHERE s2.category_id = c.id
    )
    $where_clause
    ORDER BY c.id DESC
";
$count_sql = "
    SELECT COUNT(DISTINCT c.id) as total
    FROM categories c
    INNER JOIN services s ON c.id = s.category_id
    LEFT JOIN api_providers p ON s.api_provider_id = p.id
    WHERE EXISTS (
        SELECT 1 
        FROM services s2 
        WHERE s2.category_id = c.id
    )
    $where_clause
";
$total = $db->get_row($count_sql)['total'] ?? 0;
$total_pages = ceil($total / $items_per_page);
$categories = $db->get_list($sql);
$groupedCategories = [];
foreach ($categories as $row) {
    $catId = $row['id'];
    if (!isset($groupedCategories[$catId])) {
        $groupedCategories[$catId] = [
            'id' => $row['id'],
            'category_title' => $row['category_title'],
            'service' => []
        ];
    }
    $groupedCategories[$catId]['service'][] = [
        'id' => $row['service_id'],
        'service_title' => $row['service_title'],
        'price' => $row['price'],
        'drip_feed' => $row['drip_feed'],
        'service_status' => $row['service_status'],
        'min_amount' => $row['min_amount'],
        'max_amount' => $row['max_amount'],
        'provider' => $row['provider_name'] ? ['api_name' => $row['provider_name']] : null
    ];
}
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Dịch vụ</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Dịch vụ</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="d-grid d-sm-flex justify-content-md-end align-items-sm-center gap-2 mb-4">
                <div id="datatableCounterInfo" style="display: none;">
                    <div class="d-sm-flex justify-content-lg-end align-items-sm-center">
                        <span class="d-block d-sm-inline-block fs-5 me-3 mb-2 mb-sm-0">
                            <span id="datatableCounter">0</span>
                            <?php echo lang("Selected"); ?>
                        </span>
                        <div class="btn-group">
                            <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButtonDark"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-sharp fa-solid fa-list-ul me-2"></i><?php echo lang("Thao tác"); ?>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButtonDark">
                                <a class="dropdown-item btn btn-outline-danger mb-2 mb-sm-0 me-2 multiple-delete"
                                    href="javascript:void(0)">
                                    <i class="fa fa-trash"></i> <?php echo lang("Xoá"); ?>
                                </a>
                                <a class="dropdown-item btn btn-outline-success mb-2 mb-sm-0 me-2 active-multiple"
                                    href="javascript:void(0)">
                                    <i class="fa fa-check"></i> <?php echo lang("Hoạt động"); ?>
                                </a>
                                <a class="dropdown-item btn btn-outline-danger mb-2 mb-sm-0 me-2 inactive-multiple"
                                    href="javascript:void(0)">
                                    <i class="fa fa-ban"></i> <?php echo lang("Không hoạt động"); ?>
                                </a>
                                <a class="dropdown-item btn btn-outline-info mb-2 mb-sm-0 me-2 price-update-btn"
                                    href="javascript:void(0)"
                                    data-bs-toggle="modal" data-bs-target="#priceUpdateModal">
                                    <i class="fa-light fa-dollar-sign"></i> <?php echo lang("Cập nhật số tiền"); ?>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="/admin/service/create" type="button" class="btn btn-primary"><i class="fa fa-plus me-1"></i>Thêm mới</a>
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#importServiceModal"><i class="fa fa-plus me-1"></i>Nhập dịch vụ</button>
                <div class="dropdown">
                    <button type="button" class="btn btn-secondary w-100" id="dropdownMenuClickable" data-bs-auto-close="false" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-filter me-1"></i> Tìm kiếm </button>
                    <div class="dropdown-menu dropdown-menu-sm-end dropdown-card card-dropdown-filter-centered filter_dropdown" aria-labelledby="dropdownMenuClickable">
                        <div class="card">
                            <div class="card-header card-header-content-between">
                                <h5 class="card-header-title">Tìm kiếm dịch vụ</h5>
                                <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm ms-2" id="filter_close_btn">
                                    <i class="fa fa-close"></i>
                                </button>
                            </div>

                            <div class="card-body">
                                <form action="" method="GET">
                                    <div class="row">
                                        <div class="col-12 mb-4">
                                            <span class="text-cap text-body">Tên dịch vụ</span>
                                            <input type="text" class="form-control" name="name" id="service_filter_input" value="<?= $name ?>" autocomplete="off">
                                        </div>
                                        <div class="col-12 tom-select-custom mb-4">
                                            <span class="text-cap text-body">Nhà cung cấp</span>
                                            <select class="selectpicker form-select" name="provider" autocomplete="off">
                                                <option value="">Chọn nhà cung cấp</option>
                                                <?php foreach ($db->get_list("SELECT * FROM `api_providers` WHERE `status` = 1 ORDER BY `id` DESC") as $api): ?>
                                                    <option value="<?= $api['id'] ?>" <?= $api['id'] == $provider ? 'selected' : '' ?>><?= $api['api_name'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="col-sm-12 mb-5">
                                            <small class="text-cap text-body">Trạng thái</small>
                                            <div class="tom-select-custom">
                                                <select class="selectpicker form-select" name="status" id="status">
                                                    <option value="">All</option>
                                                    <option value="active" <?= $status == "active" ? 'selected' : '' ?>>Hoạt động</option>
                                                    <option value="inactive" <?= $status == "inactive" ? 'selected' : '' ?>>Không hoạt động</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-grid">
                                        <button type="submit" id="filter_button" class="btn btn-primary">Apply</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-12">

                <?php if (!empty($groupedCategories)): ?>
                    <?php foreach ($groupedCategories as $key => $category): ?>
                        <div class="accordion mb-3" id="accordionService">
                            <div class="accordion-item shadow-md p-2 mb-4 bg-white rounded border-0">
                                <div class="accordion-header" id="heading<?php echo $key; ?>">
                                    <a class="accordion-button <?php echo $key != 0 ? 'collapsed' : ''; ?> text-secondary" role="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#collapse<?php echo $key; ?>" aria-expanded="<?php echo $key == 0 ? 'true' : 'false'; ?>"
                                        aria-controls="collapse<?php echo $key; ?>">
                                        <?php echo lang($category['category_title']); ?>
                                    </a>
                                </div>
                                <div id="collapse<?php echo $key; ?>" class="accordion-collapse collapse <?php echo $key == 0 ? 'show' : ''; ?>"
                                    aria-labelledby="heading<?php echo $key; ?>"
                                    data-bs-parent="#accordionService">
                                    <div class="accordion-body">
                                        <div class="table-responsive datatable-custom mt-3">
                                            <table id="datatable-<?php echo $key; ?>"
                                                class="js-datatable table table-borderless table-nowrap table-align-middle">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th class="table-column-pe-0">
                                                            <div class="form-check">
                                                                <input class="form-check-input check-all tic-check check-all-tic"
                                                                    type="checkbox"
                                                                    name="check-all"
                                                                    id="cat-tic-<?php echo $key; ?>">
                                                                <label class="form-check-label" for="cat-tic-<?php echo $key; ?>"></label>
                                                            </div>
                                                        </th>
                                                        <th><?php echo lang('ID'); ?></th>
                                                        <th><?php echo lang('Dịch vụ'); ?></th>
                                                        <th><?php echo lang('Nhà cung cấp'); ?></th>
                                                        <th><?php echo lang('Giá'); ?></th>
                                                        <th><?php echo lang('Drip Feed'); ?></th>
                                                        <th><?php echo lang('Trạng thái'); ?></th>
                                                        <th><?php echo lang('Thao tác'); ?></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php foreach ($category['service'] as $service): ?>
                                                        <tr>
                                                            <td class="table-column-pe-0">
                                                                <input type="checkbox" id="chk-<?php echo $service['id']; ?>"
                                                                    class="form-check-input row-tic tic-check row-tic-check"
                                                                    name="check[]"
                                                                    value="<?php echo $service['id']; ?>"
                                                                    data-id="<?php echo $service['id']; ?>">
                                                            </td>
                                                            <td><?php echo $service['id']; ?></td>
                                                            <td><?php echo lang(strLimit($service['service_title'], 100)); ?></td>
                                                            <td><?php echo $service['provider'] ? $service['provider']['api_name'] : 'Manual'; ?></td>
                                                            <td><?= formatCurrencyF($service['price']); ?></td>
                                                            <td>
                                                                <span class="badge bg-soft-<?php echo $service['drip_feed'] == 1 ? 'primary' : 'secondary'; ?> text-<?php echo $service['drip_feed'] == 1 ? 'primary' : 'secondary'; ?>">
                                                                    <span class="legend-indicator bg-<?php echo $service['drip_feed'] == 1 ? 'primary' : 'secondary'; ?>"></span>
                                                                    <?php echo $service['drip_feed'] == 1 ? 'Active' : 'Inactive'; ?>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span class="badge bg-soft-<?php echo $service['service_status'] == 1 ? 'success' : 'danger'; ?> text-<?php echo $service['service_status'] == 1 ? 'success' : 'danger'; ?>">
                                                                    <span class="legend-indicator bg-<?php echo $service['service_status'] == 1 ? 'success' : 'danger'; ?>"></span>
                                                                    <?php echo $service['service_status'] == 1 ? 'Active' : 'Inactive'; ?>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <a href="/admin/service/edit/<?= $service['id'] ?>" class="btn btn-square-2 btn-primary light btn-sm">
                                                                    <i class="fa fa-pen "></i>
                                                                </a>
                                                                <div class="btn-group" role="group">

                                                                    <div class="dropdown">
                                                                        <button class="btn btn-sm btn-dark light btn-square-2" type="button" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false" fdprocessedid="q4fxh9">
                                                                            <i class="fa-solid fa-ellipsis-vertical"></i>
                                                                        </button>
                                                                        <div class="dropdown-menu dropdown-menu-end" style="">
                                                                            <a class="dropdown-item status-change" href="javascript:void(0)"
                                                                                data-route="/admin/service/status/change/<?php echo $service['id']; ?>"
                                                                                data-text="<?php echo $service['service_status'] == 0 ? 'activate' : 'deactivate'; ?>"
                                                                                data-status="<?php echo $service['service_status']; ?>">
                                                                                <i class="fa <?php echo $service['service_status'] == 1 ? 'fa-ban' : 'fa-check'; ?> dropdown-item-icon"></i>
                                                                                <?= $service['service_status'] == 0 ? 'Kích hoạt' : 'Tạm ngưng'; ?>
                                                                            </a>
                                                                            <a class="dropdown-item service-info" href="javascript:void(0)"
                                                                                data-name="<?php echo $service['service_title']; ?>"
                                                                                data-rate_per="<?php echo $service['price']; ?>"
                                                                                data-order_limit="<?php echo $service['min_amount'] . ' - ' . $service['max_amount']; ?>">
                                                                                <i class="fa fa-square dropdown-item-icon"></i> <?php echo lang("Thông tin"); ?>
                                                                            </a>
                                                                            <a class="dropdown-item deleteBtn" href="javascript:void(0)"
                                                                                data-id="<?= $service['id']; ?>">
                                                                                <i class="fa fa-trash-can dropdown-item-icon"></i> <?php echo lang("Xoá"); ?>
                                                                            </a>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </td>
                                                        </tr>
                                                    <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr class="odd">
                        <td valign="top" colspan="8" class="dataTables_empty">
                            <div class="text-center p-4">
                                <img src="/assets/images/empty.png" width="100" />
                                <p>Chưa có dịch vụ nào được tạo</p>
                            </div>
                        </td>
                    </tr>
                <?php endif; ?>
                <?php if ($total_pages > 1): ?>
                    <div class="pagination">
                        <?php if ($page > 1): ?>
                            <a href="?page=<?php echo $page - 1; ?>&name=<?= $name ?>&provider=<?= $provider ?>&status=<?= $status ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                        <?php endif; ?>
                        <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                            <a href="?page=<?php echo $i; ?>&name=<?= $name ?>&provider=<?= $provider ?>&status=<?= $status ?>" class="<?php echo $i === $page ? 'active' : ''; ?>">
                                <?php echo $i; ?>
                            </a>
                        <?php endfor; ?>
                        <?php if ($page < $total_pages): ?>
                            <a href="?page=<?php echo $page + 1; ?>&name=<?= $name ?>&provider=<?= $provider ?>&status=<?= $status ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
                        <?php endif; ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>

<!-- Modal Price Update -->
<div class="modal fade" id="priceUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="priceUpdateModalLabel">
                    Xác nhận cập nhật giá
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/model/admin/service/price-update" method="post" class="priceUpdateRoute">
                <div class="modal-body">
                    <p class="text-dark">Bạn có muốn cập nhật giá dịch vụ này không?</p>
                    <label class="form-label">Chọn phần trăm tăng</label>
                    <div class="tom-select-custom">
                        <select class="selectpicker form-select" id="price_percentage_increase" autocomplete="off">
                            <option value="0" selected>0%</option>
                            <?php for ($i = 1; $i <= 1000; $i++): ?>
                                <option value="<?= $i ?>"><?= $i ?> %</option>
                            <?php endfor; ?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary price-update">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="importServiceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="importServiceModalLabel">
                    Xác nhận nhập dịch vụ
                </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/admin/api-services" method="post" class="getServiceRoute" id="importServiceForm">
                <div class="modal-body">
                    <label for="apiProviderLabel" class="form-label">Nhà cung cấp API</label>
                    <div class="mb-4">
                        <select class="selectpicker form-select" name="api_provider_id" id="api_provider_id" autocomplete="off">
                            <option value="">Chọn nhà cung cấp</option>
                            <?php
                            // Giả sử $db là đối tượng database của bạn
                            foreach ($db->get_list("SELECT * FROM `api_providers` WHERE `status` = 1 ORDER BY `id` DESC") as $api): ?>
                                <option value="<?= htmlspecialchars($api['id']) ?>"><?= htmlspecialchars($api['api_name']) ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('importServiceForm');

        form.addEventListener('submit', function(e) {
            e.preventDefault(); // Ngăn form submit mặc định

            // Lấy giá trị từ select
            const apiProviderId = document.getElementById('api_provider_id').value;

            if (!apiProviderId) {
                Notiflix.Notify.failure('Vui lòng chọn nhà cung cấp API!');
                return;
            }
            Notiflix.Loading.standard('Đang xử lý...');
            $.ajax({
                url: '/model/admin/service/api-services',
                type: 'POST',
                data: {
                    api_provider_id: encodeURIComponent(apiProviderId),
                },
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status === 'success') {
                        Notiflix.Notify.success(response.msg);
                        setTimeout("location.href = '/admin/service/api-services';", 2000);
                    } else {
                        Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra');
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi kết nối server');
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function() {
        // Hàm cập nhật trạng thái hiển thị của Action button và số lượng chọn
        function updateActionButton() {
            var checkedCount = $('.row-tic-check:checked').length;
            $('#datatableCounter').text(checkedCount);
            if (checkedCount > 0) {
                $('#datatableCounterInfo').show();
            } else {
                $('#datatableCounterInfo').hide();
            }
        }

        // Xử lý Check All cho từng bảng
        $('.check-all-tic').on('change', function() {
            var table = $(this).closest('table');
            var isChecked = $(this).is(':checked');
            table.find('.row-tic-check').prop('checked', isChecked);
            updateActionButton();
        });

        // Xử lý khi checkbox dòng thay đổi
        $('.row-tic-check').on('change', function() {
            var table = $(this).closest('table');
            var allChecked = table.find('.row-tic-check').length === table.find('.row-tic-check:checked').length;
            table.find('.check-all-tic').prop('checked', allChecked);
            updateActionButton();
        });

        // Hàm lấy danh sách ID đã chọn
        function getSelectedIds() {
            return $('.row-tic-check:checked').map(function() {
                return $(this).val();
            }).get();
        }


        // Xử lý Status Change (Activate/Deactivate)
        $('.status-change').on('click', function() {
            var $this = $(this);
            var route = $this.data('route');
            var status = $this.data('status');
            var text = $this.data('text');
            var newStatus = status == 0 ? 1 : 0;

            Notiflix.Confirm.show(
                'Xác nhận thay đổi trạng thái',
                'Bạn có chắc chắn muốn ' + (text == 'activate' ? 'kích hoạt' : 'hủy kích hoạt') + ' dịch vụ này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: route,
                        type: 'POST',
                        data: {
                            status: newStatus,
                            _token: $('input[name="_token"]').val()
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Thay đổi trạng thái thành công');
                                var $row = $this.closest('tr');
                                var $badge = $row.find('.badge');
                                if (newStatus == 1) {
                                    $badge.removeClass('bg-soft-danger text-danger').addClass('bg-soft-success text-success')
                                        .html('<span class="legend-indicator bg-success"></span> Active');
                                    $this.find('i').removeClass('fa-square-check').addClass('fa-ban');
                                    $this.text('Mark As Deactivate');
                                    $this.data('status', 1);
                                    $this.data('text', 'deactivate');
                                } else {
                                    $badge.removeClass('bg-soft-success text-success').addClass('bg-soft-danger text-danger')
                                        .html('<span class="legend-indicator bg-danger"></span> Inactive');
                                    $this.find('i').removeClass('fa-ban').addClass('fa-square-check');
                                    $this.text('Mark As Activate');
                                    $this.data('status', 0);
                                    $this.data('text', 'activate');
                                }
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {}
            );
        });
        // Xử lý Service Info (Description)
        $('.service-info').on('click', function() {
            var name = $(this).data('name');
            var rate_per = $(this).data('rate_per');
            var order_limit = $(this).data('order_limit');

            Notiflix.Report.info(
                'Thông tin dịch vụ',
                '<strong>Tên:</strong> ' + name + '<br>' +
                '<strong>Giá:</strong> $' + parseFloat(rate_per).toFixed(2) + '<br>' +
                '<strong>Giới hạn đơn hàng:</strong> ' + order_limit,
                'Đóng',
                function cb() {}
            );
        });
        $('.deleteBtn').on('click', function() {
            var $this = $(this);
            var id = $this.data('id');

            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa dịch vụ này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/service/multiple-destroy',
                        type: 'POST',
                        data: {
                            'ids[]': [id]
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Xóa dịch vụ thành công');
                                $this.closest('tr').fadeOut(300, function() {
                                    $(this).remove();
                                });
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi xóa');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {}
            );
        });

        // Xử lý Delete multiple
        $('.multiple-delete').on('click', function() {
            var selectedIds = getSelectedIds();
            if (selectedIds.length === 0) return;

            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa các dịch vụ đã chọn?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/service/multiple-destroy',
                        type: 'POST',
                        data: {
                            ids: selectedIds
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Xóa dịch vụ thành công');
                                selectedIds.forEach(function(id) {
                                    $('#chk-' + id).closest('tr').fadeOut(300, function() {
                                        $(this).remove();
                                    });
                                });
                                updateActionButton();
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi xóa');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {}
            );
        });

        // Xử lý Active multiple
        $('.active-multiple').on('click', function() {
            var selectedIds = getSelectedIds();
            if (selectedIds.length === 0) return;

            Notiflix.Confirm.show(
                'Xác nhận kích hoạt',
                'Bạn có chắc chắn muốn kích hoạt các dịch vụ đã chọn?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/service/multiple-status',
                        type: 'POST',
                        data: {
                            ids: selectedIds,
                            status: 1
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Kích hoạt dịch vụ thành công');
                                selectedIds.forEach(function(id) {
                                    var $row = $('#chk-' + id).closest('tr');
                                    $row.find('.badge').removeClass('bg-soft-danger text-danger').addClass('bg-soft-success text-success')
                                        .html('<span class="legend-indicator bg-success"></span> Active');
                                });
                                updateActionButton();
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi kích hoạt');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {}
            );
        });

        // Xử lý Inactive multiple
        $('.inactive-multiple').on('click', function() {
            var selectedIds = getSelectedIds();
            if (selectedIds.length === 0) return;

            Notiflix.Confirm.show(
                'Xác nhận hủy kích hoạt',
                'Bạn có chắc chắn muốn hủy kích hoạt các dịch vụ đã chọn?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/service/multiple-status',
                        type: 'POST',
                        data: {
                            ids: selectedIds,
                            status: 0
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Hủy kích hoạt dịch vụ thành công');
                                selectedIds.forEach(function(id) {
                                    var $row = $('#chk-' + id).closest('tr');
                                    $row.find('.badge').removeClass('bg-soft-success text-success').addClass('bg-soft-danger text-danger')
                                        .html('<span class="legend-indicator bg-danger"></span> Inactive');
                                });
                                updateActionButton();
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi hủy kích hoạt');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {}
            );
        });

        // Xử lý Price Update
        $('.priceUpdateRoute').on('submit', function(e) {
            e.preventDefault();
            var selectedIds = getSelectedIds();
            if (selectedIds.length === 0) return;

            var percentage = $('#price_percentage_increase').val();
            console.log(percentage);
            Notiflix.Loading.standard('Đang xử lý...');
            $.ajax({
                url: $(this).attr('action'),
                type: 'POST',
                data: {
                    ids: selectedIds,
                    price_percentage_increase: percentage
                },
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status === 'success') {
                        Notiflix.Notify.success('Cập nhật giá thành công');
                        $('#priceUpdateModal').modal('hide');
                        selectedIds.forEach(function(id) {
                            var $row = $('#chk-' + id).closest('tr');
                            $row.find('td:nth-child(5)').text(currencyPosition(response.updated_prices[id]));
                        });
                        updateActionButton();
                    } else {
                        Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi cập nhật giá');
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi kết nối server');
                }
            });
        });

        // Các script khác giữ nguyên
        $('.toggle-api-key').on('click', function() {
            const $row = $(this).closest('tr');
            const $hidden = $row.find('.api-key-hidden');
            const $full = $row.find('.api-key-full');
            const $icon = $(this).find('i');
            if ($hidden.is(':visible')) {
                $hidden.hide();
                $full.show();
                $icon.removeClass('fa-eye').addClass('fa-eye-slash');
            } else {
                $hidden.show();
                $full.hide();
                $icon.removeClass('fa-eye-slash').addClass('fa-eye');
            }
        });

    });
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>