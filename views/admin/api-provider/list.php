<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;
$name = isset($_GET['name']) ? Anti_xss($_GET['name']) : '';
$status = isset($_GET['status']) ? Anti_xss($_GET['status']) : '';

$where = [];
if (!empty($name)) {
    $where[] = "api_name LIKE '%$name%'";
}
if ($status === 'active') {
    $where[] = "status = 1";
} elseif ($status === 'inactive') {
    $where[] = "status = 0";
}
$where_clause = !empty($where) ? "WHERE " . implode(" AND ", $where) : "";

$total_providers = $db->get_row("SELECT COUNT(*) as total FROM `api_providers`")['total'];
$active_providers = $db->get_row("SELECT COUNT(*) as total FROM `api_providers` WHERE status = 1")['total'];
$inactive_providers = $db->get_row("SELECT COUNT(*) as total FROM `api_providers` WHERE status = 0")['total'];

$total_api_providers = $db->get_row("SELECT COUNT(*) as total FROM `api_providers` $where_clause")['total'];
$total_pages = ceil($total_api_providers / $items_per_page);
$api_providers = $db->get_list("SELECT * FROM `api_providers` $where_clause ORDER BY `id` DESC LIMIT $offset, $items_per_page");
?>
<div class="content-body">
    <!-- row -->
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Nhà cung cấp API</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Nhà cung cấp API</a></li>
        </ol>

    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="alert alert-warning outline-dashed border-2 py-3 px-3 mt-3 mb-3 mb-0 text-dark d-flex align-items-center">
                    <div class="clearfix">
                        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M15 30C18.9782 30 22.7936 28.4196 25.6066 25.6066C28.4196 22.7936 30 18.9782 30 15C30 11.0218 28.4196 7.20644 25.6066 4.3934C22.7936 1.58035 18.9782 0 15 0C11.0218 0 7.20644 1.58035 4.3934 4.3934C1.58035 7.20644 0 11.0218 0 15C0 18.9782 1.58035 22.7936 4.3934 25.6066C7.20644 28.4196 11.0218 30 15 30ZM12.6562 19.6875H14.0625V15.9375H12.6562C11.877 15.9375 11.25 15.3105 11.25 14.5312C11.25 13.752 11.877 13.125 12.6562 13.125H15.4688C16.248 13.125 16.875 13.752 16.875 14.5312V19.6875H17.3438C18.123 19.6875 18.75 20.3145 18.75 21.0938C18.75 21.873 18.123 22.5 17.3438 22.5H12.6562C11.877 22.5 11.25 21.873 11.25 21.0938C11.25 20.3145 11.877 19.6875 12.6562 19.6875ZM15 7.5C15.4973 7.5 15.9742 7.69754 16.3258 8.04918C16.6775 8.40081 16.875 8.87772 16.875 9.375C16.875 9.87228 16.6775 10.3492 16.3258 10.7008C15.9742 11.0525 15.4973 11.25 15 11.25C14.5027 11.25 14.0258 11.0525 13.6742 10.7008C13.3225 10.3492 13.125 9.87228 13.125 9.375C13.125 8.87772 13.3225 8.40081 13.6742 8.04918C14.0258 7.69754 14.5027 7.5 15 7.5Z" fill="#FF8A11"></path>
                        </svg>
                    </div>
                    <div class="mx-3">
                        <h6 class="mb-0 fw-semibold">Cronjob đồng bộ giá dịch vụ</h6>
                        <p class="mb-0">https://<?= $_SERVER['SERVER_NAME'] ?>/task/services/sync-prices</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-sm-6">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="avatar avatar-lg avatar-success rounded-circle border-0">
                            <svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M32.8961 26.5849C34.1612 26.5849 35.223 27.629 35.0296 28.8783C33.8947 36.2283 27.6026 41.6855 20.0138 41.6855C11.6178 41.6855 4.8125 34.8803 4.8125 26.4862C4.8125 19.5704 10.0664 13.1283 15.9816 11.6717C17.2526 11.3579 18.5553 12.252 18.5553 13.5605C18.5553 22.4263 18.8533 24.7197 20.5368 25.9671C22.2204 27.2145 24.2 26.5849 32.8961 26.5849Z" stroke="var(--bs-info)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M41.1733 19.2019C41.2739 13.5059 34.2772 4.32428 25.7509 4.48217C25.0877 4.49402 24.5568 5.04665 24.5272 5.70783C24.3121 10.3914 24.6022 16.4605 24.764 19.2118C24.8134 20.0684 25.4864 20.7414 26.341 20.7907C29.1693 20.9526 35.4594 21.1736 40.0759 20.4749C40.7035 20.3802 41.1634 19.8355 41.1733 19.2019Z" stroke="var(--bs-info)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                            </svg>
                        </div>
                        <div class="ms-3">
                            <h2 class="text-info mb-1"><?= $total_providers ?></h2>
                            <span class="fw-semibold text-secondary">Tổng nhà cung cấp</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="avatar avatar-lg avatar-info rounded-circle border-0">
                                <svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M32.8961 26.5849C34.1612 26.5849 35.223 27.629 35.0296 28.8783C33.8947 36.2283 27.6026 41.6855 20.0138 41.6855C11.6178 41.6855 4.8125 34.8803 4.8125 26.4862C4.8125 19.5704 10.0664 13.1283 15.9816 11.6717C17.2526 11.3579 18.5553 12.252 18.5553 13.5605C18.5553 22.4263 18.8533 24.7197 20.5368 25.9671C22.2204 27.2145 24.2 26.5849 32.8961 26.5849Z" stroke="var(--bs-success)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M41.1733 19.2019C41.2739 13.5059 34.2772 4.32428 25.7509 4.48217C25.0877 4.49402 24.5568 5.04665 24.5272 5.70783C24.3121 10.3914 24.6022 16.4605 24.764 19.2118C24.8134 20.0684 25.4864 20.7414 26.341 20.7907C29.1693 20.9526 35.4594 21.1736 40.0759 20.4749C40.7035 20.3802 41.1634 19.8355 41.1733 19.2019Z" stroke="var(--bs-success)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                </svg>
                            </div>
                            <div class="total-projects ms-3">
                                <h2 class="text-success mb-1"><?= $active_providers ?></h2>
                                <span class="fw-semibold text-secondary">Đang hoạt động</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-4 col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="avatar avatar-lg avatar-danger rounded-circle border-0">
                                <svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M32.8961 26.5849C34.1612 26.5849 35.223 27.629 35.0296 28.8783C33.8947 36.2283 27.6026 41.6855 20.0138 41.6855C11.6178 41.6855 4.8125 34.8803 4.8125 26.4862C4.8125 19.5704 10.0664 13.1283 15.9816 11.6717C17.2526 11.3579 18.5553 12.252 18.5553 13.5605C18.5553 22.4263 18.8533 24.7197 20.5368 25.9671C22.2204 27.2145 24.2 26.5849 32.8961 26.5849Z" stroke="var(--bs-danger)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M41.1733 19.2019C41.2739 13.5059 34.2772 4.32428 25.7509 4.48217C25.0877 4.49402 24.5568 5.04665 24.5272 5.70783C24.3121 10.3914 24.6022 16.4605 24.764 19.2118C24.8134 20.0684 25.4864 20.7414 26.341 20.7907C29.1693 20.9526 35.4594 21.1736 40.0759 20.4749C40.7035 20.3802 41.1634 19.8355 41.1733 19.2019Z" stroke="var(--bs-danger)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                </svg>
                            </div>
                            <div class="total-projects ms-3">
                                <h2 class="text-danger mb-1"><?= $inactive_providers ?></h2>
                                <span class="fw-semibold text-secondary">Không hoạt động</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Nhà cung cấp API</h4>
                        <div class="clearfix">
                            <div class="d-inline-block m-1" id="employeesTableExcelBTN"></div>
                            <a href="/admin/api-provider/create" class="btn btn-primary btn-sm m-1" role="button">+ Thêm mới</a>
                        </div>
                    </div>
                    <div class="card-header d-block pb-2">
                        <form action="" method="get" class="row align-items-end">
                            <div class="col-xxl-2 col-xl-3 col-sm-6 col-lg-4 mb-3">
                                <label class="form-label">Tên nhà cung cấp</label>
                                <input type="text" class="form-control" name="name" value="<?= $name ?>">
                            </div>
                            <div class="col-xxl-2 col-xl-3 col-sm-6 col-lg-4 mb-3">
                                <label class="form-label">Trạng thái</label>
                                <select name="status" class="selectpicker form-select">
                                    <option value="">All</option>
                                    <option value="active" <?= $status == "active" ? 'selected' : '' ?>>Hoạt động</option>
                                    <option value="inactive" <?= $status == "inactive" ? 'selected' : '' ?>>Không hoạt động</option>
                                </select>
                            </div>

                            <div class="col-xxl-2 col-xl-3 col-sm-6 col-lg-4 mb-3">
                                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                <a href="/admin/api-provider" class="btn btn-danger light ms-2" type="button">Reset</a>
                            </div>
                        </form>
                    </div>
                    <div class="card-body table-card-body px-0 pt-0 pb-2 p-3">
                        <div class="table-responsive">
                            <table id="employeesTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="mw-120">ID</th>
                                        <th class="mw-150">Tên nhà cung cấp</th>
                                        <th class="mw-150">API KEY</th>
                                        <th class="mw-150">Số dư</th>
                                        <th class="mw-150">% Tăng giá</th>
                                        <th>Đồng bộ dịch vụ</th>
                                        <th>Nhập dịch vụ</th>
                                        <th class="mw-150">Trạng thái</th>
                                        <th class="mw-100">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($api_providers)): ?>
                                        <?php foreach ($api_providers as $api): ?>
                                            <tr data-id="<?= $api['id'] ?>" onchange="updateForm('<?= $api['id']; ?>')">
                                                <td><span><?= $api['id'] ?></span></td>
                                                <td><span><?= $api['api_name'] ?></span></td>
                                                <td>
                                                    <span class="api-key-hidden">********</span>
                                                    <span class="api-key-full" style="display: none;"><?= $api['api_key'] ?></span>
                                                    <button type="button" class="btn btn-link btn-sm toggle-api-key p-0 ms-2" title="Toggle API Key">
                                                        <i class="fas fa-eye"></i>
                                                    </button>
                                                </td>
                                                <td><span><?= formatCurrencyF($api['balance'] * $api['conversion_rate']) ?></span></td>
                                                <td><span><?= $api['price_percentage_increase'] ?>%</span></td>
                                                <td>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="auto_sync<?= $api['id']; ?>" value="1" <?= $api['auto_sync'] == 1 ? 'checked' : '' ?>>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="auto_import<?= $api['id']; ?>" value="1" <?= $api['auto_import'] == 1 ? 'checked' : '' ?>>
                                                    </div>
                                                </td>
                                                <td><?= $api['status'] == 1 ? '<span class="badge badge-success light">Hiển thị</span>' : '<span class="badge badge-danger light">Ẩn</span>' ?></td>
                                                <td>
                                                    <a href="/admin/api-provider/edit/<?= $api['id'] ?>" type="button" class="btn btn-primary btn-square-2 btn-sm"><i class="fas fa-pencil-alt me-1"></i>Sửa</a>
                                                    <button type="button" class="btn btn-danger btn-square-2 btn-sm ms-1 delete-btn"><i class="fas fa-trash-alt me-1"></i>Xoá</button>
                                                    <button type="button" class="btn btn-info btn-square-2 btn-sm ms-1 update-balance-btn" title="Cập nhật số dư"><i class="fas fa-sync-alt me-1"></i>Số dư</button>
                                                    <button type="button" class="btn btn-dark btn-square-2 btn-sm ms-1 update-price-btn" title="Cập nhật giá tiền"><i class="fas fa-sync-alt me-1"></i>Giá tiền</button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="9" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có nhà cung cấp nào được tạo</p>
                                            </td>
                                        </tr>
                                    <?php endif; ?>

                                </tbody>
                            </table>
                        </div>
                        <?php if ($total_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page > 1): ?>
                                    <a href="?page=<?php echo $page - 1; ?>&name=<?= $name ?>&status=<?= $status ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                    <a href="?page=<?php echo $i; ?>&name=<?= $name ?>&status=<?= $status ?>" class="<?php echo $i === $page ? 'active' : ''; ?>">
                                        <?php echo $i; ?>
                                    </a>
                                <?php endfor; ?>
                                <?php if ($page < $total_pages): ?>
                                    <a href="?page=<?php echo $page + 1; ?>&name=<?= $name ?>&status=<?= $status ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>
    function updateForm(id) {
        $.ajax({
            url: "/model/admin/provider/update/table",
            method: "POST",
            dataType: "JSON",
            data: {
                id: id,
                auto_sync: $('#auto_sync' + id + ':checked').val(),
                auto_import: $('#auto_import' + id + ':checked').val()
            },
            success: function(result) {
                if (result.status == 'success') {
                    Notiflix.Notify.success(result.msg);
                } else {
                    Notiflix.Notify.failure(result.msg);
                }
            },
            error: function() {
                Notiflix.Notify.failure(result);
                location.reload();
            }
        });
    }
</script>
<script>
    $(document).ready(function() {
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
    $(document).ready(function() {
        $('.delete-btn').on('click', function() {
            const row = $(this).closest('tr');
            const id = row.data('id');

            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa nhà cung cấp này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');

                    $.ajax({
                        url: '/model/admin/delete',
                        type: 'POST',
                        data: {
                            id: id,
                            action: 'removeProvider'
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success('Xóa nhà cung cấp thành công');
                                row.fadeOut(300, function() {
                                    $(this).remove();
                                    if ($('#employeesTable tbody tr').length === 0) {
                                        $('#employeesTable tbody').html(`
                                        <tr>
                                            <td colspan="9" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có nhà cung cấp nào được tạo</p>
                                            </td>
                                        </tr>
                                    `);
                                    }
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
                function cancelCb() {
                    // Do nothing on cancel
                }
            );
        });
    });
    $(document).ready(function() {
        $('.update-balance-btn').on('click', function() {
            const row = $(this).closest('tr');
            const id = row.data('id');
            const apiName = row.find('td:eq(1) span').text(); // Get provider name

            Notiflix.Confirm.show(
                'Xác nhận cập nhật số dư',
                `Bạn có chắc chắn muốn cập nhật số dư cho nhà cung cấp "${apiName}"?`,
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang cập nhật số dư...');

                    $.ajax({
                        url: '/model/admin/provider/update',
                        type: 'POST',
                        data: {
                            id: id
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success('Cập nhật số dư thành công');
                                // Update the balance in the table
                                row.find('td:eq(3) span').text(response.balance);
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi cập nhật số dư');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {
                    // Do nothing on cancel
                }
            );
        });
    });
    $(document).ready(function() {
        $('.update-price-btn').on('click', function() {
            const row = $(this).closest('tr');
            const id = row.data('id');
            const apiName = row.find('td:eq(1) span').text();

            Notiflix.Confirm.show(
                'Xác nhận đồng bộ giá tiền',
                `Bạn có chắc chắn muốn đồng bộ giá tiền dịch vụ của nhà cung cấp "${apiName}"?`,
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang đồng bộ giá tiền...');

                    $.ajax({
                        url: '/model/admin/provider/update-price',
                        type: 'POST',
                        data: {
                            provider: id
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status === 'success') {
                                Notiflix.Notify.success(response.msg);
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi đồng bộ giá tiền');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {

                }
            );
        });
    });
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>