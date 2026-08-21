<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;
$name = isset($_GET['name']) ? Anti_xss($_GET['name']) : '';
$status = isset($_GET['status']) ? Anti_xss($_GET['status']) : '';

$where = [];
if (!empty($name)) {
    $where[] = "name LIKE '%$name%'";
}
if ($status === 'active') {
    $where[] = "status = 1";
} elseif ($status === 'inactive') {
    $where[] = "status = 0";
}
$where_clause = !empty($where) ? "WHERE " . implode(" AND ", $where) : "";

$total_platforms = $db->get_row("SELECT COUNT(*) as total FROM `social_media`")['total'];
$active_platforms = $db->get_row("SELECT COUNT(*) as total FROM `social_media` WHERE status = 1")['total'];
$inactive_platforms = $db->get_row("SELECT COUNT(*) as total FROM `social_media` WHERE status = 0")['total'];

$total_websites = $db->get_row("SELECT COUNT(*) as total FROM `social_media` $where_clause")['total'];
$total_pages = ceil($total_websites / $items_per_page);
$flatforms = $db->get_list("SELECT * FROM `social_media` $where_clause ORDER BY `id` DESC LIMIT $offset, $items_per_page");
?>
<div class="content-body">
    <!-- row -->
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Nền tảng</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Nền tảng</a></li>
        </ol>

    </div>
    <div class="container-fluid">
        <div class="row">
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
                            <h2 class="text-info mb-1"><?= $total_platforms ?></h2>
                            <span class="fw-semibold text-secondary">Tổng nền tảng</span>
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
                                <h2 class="text-success mb-1"><?= $active_platforms ?></h2>
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
                                <h2 class="text-danger mb-1"><?= $inactive_platforms ?></h2>
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
                        <h4 class="card-title">Nền tảng</h4>
                        <div class="clearfix">
                            <div class="d-inline-block m-1" id="employeesTableExcelBTN"></div>
                            <a href="/admin/social-media/create" class="btn btn-primary btn-sm m-1" role="button">+ Thêm mới</a>
                        </div>
                    </div>
                    <div class="card-header d-block pb-2">
                        <form action="" method="get" class="row align-items-end">
                            <div class="col-xxl-2 col-xl-3 col-sm-6 col-lg-4 mb-3">
                                <label class="form-label">Tên nền tảng</label>
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
                                <a href="/admin/social-media" class="btn btn-danger light ms-2" type="button">Reset</a>
                            </div>
                        </form>
                    </div>
                    <div class="card-body table-card-body px-0 pt-0 pb-2 p-3">
                        <div class="table-responsive">
                            <table id="employeesTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="mw-120">ID</th>
                                        <th class="mw-150">Nền tảng</th>
                                        <th class="mw-150">Trạng thái</th>
                                        <th class="mw-100">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($flatforms)): ?>
                                        <?php foreach ($flatforms as $flatform): ?>
                                            <tr data-id="<?= $flatform['id'] ?>">
                                                <td><span><?= $flatform['id'] ?></span></td>
                                                <td>
                                                    <div class="d-flex">
                                                        <img src="<?= $flatform['icon'] ?>" class="avatar avatar-sm me-2" alt="">
                                                        <div class="clearfix">
                                                            <h6 class="mb-0"><?= $flatform['name'] ?></h6>
                                                            <small>Web Designer</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><?= $flatform['status'] == 1 ? '<span class="badge badge-success light">Hiển thị</span>' : '<span class="badge badge-danger light">Ẩn</span>' ?></td>
                                                <td>
                                                    <a href="/admin/social-media/edit/<?= $flatform['id'] ?>" type="button" class="btn btn-primary btn-square-2 btn-sm"><i class="fas fa-pencil-alt"></i></a>
                                                    <button type="button" class="btn btn-danger btn-square-2 btn-sm ms-1 delete-btn"><i class="fas fa-trash-alt"></i></button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="4" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có nền tảng nào được tạo</p>
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
    $(document).ready(function() {
        $('.delete-btn').on('click', function() {
            const row = $(this).closest('tr');
            const id = row.data('id');

            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa nền tảng này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');

                    $.ajax({
                        url: '/model/admin/delete',
                        type: 'POST',
                        data: {
                            id: id,
                            action: 'removeFlatform'
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success('Xóa nền tảng thành công');
                                row.fadeOut(300, function() {
                                    $(this).remove();
                                    if ($('#employeesTable tbody tr').length === 0) {
                                        $('#employeesTable tbody').html(`
                                        <tr>
                                            <td colspan="4" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có nền tảng nào được tạo</p>
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
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>