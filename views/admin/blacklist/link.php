<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>

<?php
// Xử lý thêm liên kết mới
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['link']) && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }

    $link = Anti_xss($_POST['link']);
    $reason = isset($_POST['reason']) ? Anti_xss($_POST['reason']) : '';

    // Kiểm tra liên kết hợp lệ
    if (!filter_var($link, FILTER_VALIDATE_URL)) {
        alertBack("Liên kết không hợp lệ!");
    }

    $data = [
        'link' => $link,
        'reason' => $reason,
        'created_at' => date('Y-m-d H:i:s'),
        'updated_at' => date('Y-m-d H:i:s')
    ];

    if ($db->insert('blacklist_links', $data)) {
        alertBack("Thêm liên kết vào danh sách đen thành công!", true);
    } else {
        alertBack("Lỗi khi thêm liên kết!");
    }
}

// Phân trang và tìm kiếm
$items_per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $items_per_page;
$reason = isset($_GET['reason']) ? Anti_xss($_GET['reason']) : '';
$link = isset($_GET['link']) ? Anti_xss($_GET['link']) : '';
$start_date = isset($_GET['start_date']) ? Anti_xss($_GET['start_date']) : '';
$end_date = isset($_GET['end_date']) ? Anti_xss($_GET['end_date']) : '';

if (!empty($start_date) && !preg_match('/^\d{4}-\d{2}-\d{2}$/', $start_date)) {
    $start_date = '';
}
if (!empty($end_date) && !preg_match('/^\d{4}-\d{2}-\d{2}$/', $end_date)) {
    $end_date = '';
}

$where = [];
if (!empty($reason)) {
    $where[] = "reason LIKE '%$reason%'";
}
if (!empty($link)) {
    $where[] = "link LIKE '%$link%'";
}
if (!empty($start_date)) {
    $where[] = "created_at >= '$start_date 00:00:00'";
}
if (!empty($end_date)) {
    $where[] = "created_at <= '$end_date 23:59:59'";
}

$where_clause = !empty($where) ? "WHERE " . implode(" AND ", $where) : "";

$total = $db->get_row("SELECT COUNT(*) as total FROM `blacklist_links` $where_clause")['total'];
$total_pages = ceil($total / $items_per_page);
$blacklist = $db->get_list("SELECT * FROM `blacklist_links` $where_clause ORDER BY id DESC LIMIT $offset, $items_per_page");
?>

<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li><h5 class="bc-title">Danh sách đen liên kết</h5></li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
                Home </a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Danh sách đen liên kết</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Danh sách đen liên kết</h4>
                        <div class="ms-auto d-flex align-items-center">
                            <button type="button" class="btn btn-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#addBlacklistModal">Thêm mới</button>
                            <div class="dropdown">
                                <button type="button" class="btn btn-secondary btn-sm w-100" id="dropdownMenuClickable" data-bs-auto-close="false" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-filter me-1"></i> Tìm kiếm </button>
                                <div class="dropdown-menu dropdown-menu-sm-end dropdown-card card-dropdown-filter-centered filter_dropdown" aria-labelledby="dropdownMenuClickable">
                                    <div class="card">
                                        <div class="card-header card-header-content-between">
                                            <h5 class="card-header-title">Tìm kiếm</h5>
                                            <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm ms-2" id="filter_close_btn">
                                                <i class="fa fa-close"></i>
                                            </button>
                                        </div>
                                        <div class="card-body">
                                            <form action="" method="GET">
                                                <div class="row">
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">Liên kết</span>
                                                        <input type="text" class="form-control" name="link" value="<?= $link ?>" autocomplete="off">
                                                    </div>
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">Lý do</span>
                                                        <input type="text" class="form-control" name="reason" value="<?= $reason ?>" autocomplete="off">
                                                    </div>
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">Từ ngày</span>
                                                        <input type="date" class="form-control" name="start_date" value="<?= $start_date ?>">
                                                    </div>
                                                    <div class="col-12 mb-4">
                                                        <span class="text-cap text-body">Đến ngày</span>
                                                        <input type="date" class="form-control" name="end_date" value="<?= $end_date ?>">
                                                    </div>
                                                </div>
                                                <div class="d-grid">
                                                    <button type="submit" id="filter_button" class="btn btn-primary mb-3">Tìm kiếm</button>
                                                    <a href="/admin/blacklist/link" type="button" id="filter_button" class="btn btn-danger">Bỏ lọc</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal để thêm liên kết -->
                    <div class="modal fade" id="addBlacklistModal" tabindex="-1" aria-labelledby="addBlacklistModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addBlacklistModalLabel">Thêm liên kết vào danh sách đen</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="addBlacklistForm" method="POST" action="">
                                        <div class="mb-3">
                                            <label for="link" class="form-label">Liên kết <span class="text-danger">*</span></label>
                                            <input type="url" class="form-control" id="link" name="link" required placeholder="Ví dụ: https://example.com">
                                        </div>
                                        <div class="mb-3">
                                            <label for="reason" class="form-label">Lý do (tùy chọn)</label>
                                            <textarea class="form-control" id="reason" name="reason" rows="4" placeholder="Nhập lý do chặn liên kết"></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Thêm liên kết</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-card-body px-0 pt-0 pb-2 p-3">
                        <div class="table-responsive">
                            <table id="linksTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="mw-120">ID</th>
                                        <th class="mw-300">LIÊN KẾT</th>
                                        <th class="mw-150">LÝ DO</th>
                                        <th class="mw-150">THỜI GIAN</th>
                                        <th class="mw-150">THAO TÁC</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($blacklist)): ?>
                                        <?php foreach ($blacklist as $item): ?>
                                            <tr data-id="<?= $item['id'] ?>">
                                                <td><span><?= $item['id'] ?></span></td>
                                                <td><a href="<?= $item['link'] ?>" target="_blank"><?= $item['link'] ?></a></td>
                                                <td><span><?= $item['reason'] ?></span></td>
                                                <td><?= $item['created_at'] ?></td>
                                                <td>
                                                    <button type="button" class="btn btn-danger btn-square-2 btn-sm ms-1 delete-btn"><i class="fas fa-trash-alt"></i></button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="5" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có liên kết nào trong danh sách đen</p>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <?php if ($total_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page > 1): ?>
                                    <a href="?page=<?php echo $page - 1; ?>&reason=<?= $reason ?>&link=<?= $link ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                    <a href="?page=<?php echo $i; ?>&reason=<?= $reason ?>&link=<?= $link ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="<?php echo $i === $page ? 'active' : ''; ?>">
                                        <?php echo $i; ?>
                                    </a>
                                <?php endfor; ?>
                                <?php if ($page < $total_pages): ?>
                                    <a href="?page=<?php echo $page + 1; ?>&reason=<?= $reason ?>&link=<?= $link ?>&start_date=<?= $start_date ?>&end_date=<?= $end_date ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
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
document.getElementById('addBlacklistForm').addEventListener('submit', function(event) {
    const linkInput = document.getElementById('link').value.trim();
    const urlPattern = /^(https?:\/\/)?([\w-]+\.)+[\w-]+(\/[\w- ./?%&=]*)?$/;
    if (!urlPattern.test(linkInput)) {
        event.preventDefault();
        alert('Vui lòng nhập liên kết hợp lệ!');
    }
});
</script>
<script>
    $(document).ready(function() {
        $('.delete-btn').on('click', function() {
            const row = $(this).closest('tr');
            const id = row.data('id');

            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa link này khỏi danh sách chặn?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');

                    $.ajax({
                        url: '/model/admin/delete',
                        type: 'POST',
                        data: {
                            id: id,
                            action: 'removeLink'
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success('Xóa thành công');
                                row.fadeOut(300, function() {
                                    $(this).remove();
                                    if ($('#linksTable tbody tr').length === 0) {
                                        $('#linksTable tbody').html(`
                                        <tr>
                                            <td colspan="5" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có danh sách link nào được tạo</p>
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