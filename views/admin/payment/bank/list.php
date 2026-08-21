<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;

$total_banks = $db->get_row("SELECT COUNT(*) as total FROM `banks`")['total'];
$total_pages = ceil($total_banks / $items_per_page);
$banks = $db->get_list("SELECT * FROM `banks` ORDER BY `id` DESC LIMIT $offset, $items_per_page");
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Ngân hàng</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Ngân hàng</a></li>
        </ol>

    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Danh sách ngân hàng</h4>
                        <div class="clearfix">
                            
                            <a href="/admin/payment-methods/bank/create" class="btn btn-primary btn-sm" role="button">+ Thêm mới</a>
                        </div>
                    </div>
                
                    <div class="card-body table-card-body px-0 pt-0 pb-2 p-3">
                        <div class="table-responsive">
                            <table id="employeesTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="mw-120">ID</th>
                                        <th class="mw-150">Ngân hàng</th>
                                        <th class="mw-150">Chủ tài khoản</th>
                                        <th class="mw-150">Số tài khoản</th>
                                        <th class="mw-150">Nội dung nạp</th>
                                        <th class="mw-150">Link cron</th>
                                        <th class="mw-100">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($banks)): ?>
                                        <?php foreach ($banks as $bank): ?>
                                            <tr data-id="<?= $bank['id'] ?>">
                                                <td><span><?= $bank['id'] ?></span></td>
                                                <td>
                                                    <div class="d-flex">
                                                        <img src="/assets/images/default.png" class="avatar avatar-sm me-2" alt="">
                                                        <div class="clearfix">
                                                            <h6 class="mb-0"><?= $bank['name'] ?></h6>
                                                            <small><?= $bank['code'] ?></small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><span><?= $bank['account_holder'] ?></span></td>
                                                <td><span><?= $bank['account_number'] ?></span></td>
                                                <td><span><?= $bank['prefix_autobank'] ?></span></td>
                                                <td><span>https://<?php echo $_SERVER['SERVER_NAME']; ?>/task/deposit/check?type=<?= $bank['code'] ?></span></td>
                                                <td>
                                                    <a href="/admin/payment-methods/bank/edit/<?= $bank['id'] ?>" type="button" class="btn btn-primary btn-square-2 btn-sm"><i class="fas fa-pencil-alt"></i></a>
                                                    <button type="button" class="btn btn-danger btn-square-2 btn-sm ms-1 delete-btn"><i class="fas fa-trash-alt"></i></button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="4" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có danh mục nào được tạo</p>
                                            </td>
                                        </tr>
                                    <?php endif; ?>

                                </tbody>
                            </table>
                        </div>
                        <?php if ($total_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page > 1): ?>
                                    <a href="?page=<?php echo $page - 1; ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                    <a href="?page=<?php echo $i; ?>" class="<?php echo $i === $page ? 'active' : ''; ?>">
                                        <?php echo $i; ?>
                                    </a>
                                <?php endfor; ?>
                                <?php if ($page < $total_pages): ?>
                                    <a href="?page=<?php echo $page + 1; ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
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
                'Bạn có chắc chắn muốn xóa ngân hàng này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');

                    $.ajax({
                        url: '/model/admin/delete',
                        type: 'POST',
                        data: {
                            id: id,
                            action: 'removeBank'
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success('Xóa ngân hàng thành công');
                                row.fadeOut(300, function() {
                                    $(this).remove();
                                    if ($('#employeesTable tbody tr').length === 0) {
                                        $('#employeesTable tbody').html(`
                                        <tr>
                                            <td colspan="6" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có ngân hàng nào được tạo</p>
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