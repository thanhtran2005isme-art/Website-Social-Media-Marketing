<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php');

// Cấu hình phân trang
$items_per_page = 10;

// Phân trang cho lịch sử hoa hồng
$page_commission = isset($_GET['page_commission']) && is_numeric($_GET['page_commission']) ? (int)$_GET['page_commission'] : 1;
$offset_commission = ($page_commission - 1) * $items_per_page;
$total_commission_records = $db->num_rows("SELECT id FROM affiliate_conversions");
$total_commission_pages = ceil($total_commission_records / $items_per_page);

// Phân trang cho lịch sử rút tiền
$page_withdrawal = isset($_GET['page_withdrawal']) && is_numeric($_GET['page_withdrawal']) ? (int)$_GET['page_withdrawal'] : 1;
$offset_withdrawal = ($page_withdrawal - 1) * $items_per_page;
$total_withdrawal_records = $db->num_rows("SELECT id FROM withdrawals");
$total_withdrawal_pages = ceil($total_withdrawal_records / $items_per_page);

// Phân trang cho danh sách đối tác liên kết
$page_affiliate = isset($_GET['page_affiliate']) && is_numeric($_GET['page_affiliate']) ? (int)$_GET['page_affiliate'] : 1;
$offset_affiliate = ($page_affiliate - 1) * $items_per_page;
$total_affiliate_records = $db->num_rows("SELECT id FROM affiliates");
$total_affiliate_pages = ceil($total_affiliate_records / $items_per_page);

// Lấy lịch sử hoa hồng với phân trang
$commission_history = $db->get_list("SELECT ac.id, ac.amount, ac.commission, ac.status, ac.converted_at, a.affiliate_code, u.username
    FROM affiliate_conversions ac
    LEFT JOIN affiliates a ON ac.affiliate_code = a.affiliate_code
    LEFT JOIN users u ON a.user_id = u.id
    ORDER BY ac.converted_at DESC
    LIMIT $items_per_page OFFSET $offset_commission");

// Lấy lịch sử rút tiền với phân trang
$withdrawal_history = $db->get_list("SELECT w.id, w.amount, w.bank_name, w.account_holder, w.account_number, w.status, w.created_at, u.username
    FROM withdrawals w
    LEFT JOIN users u ON w.user_id = u.id
    ORDER BY w.created_at DESC
    LIMIT $items_per_page OFFSET $offset_withdrawal");

// Lấy thống kê tổng quan
$total_affiliates = $db->num_rows("SELECT id FROM affiliates");
$total_clicks = $db->num_rows("SELECT id FROM affiliate_clicks");
$total_commission_result = $db->get_row("SELECT SUM(commission) as total_commission FROM affiliate_conversions WHERE status = 'approved'");
$total_commission = $total_commission_result['total_commission'] ?? 0;
$total_withdrawn_result = $db->get_row("SELECT SUM(amount) as total_withdrawn FROM withdrawals WHERE status = 'approved'");
$total_withdrawn = $total_withdrawn_result['total_withdrawn'] ?? 0;
$total_referred = $db->num_rows("SELECT id FROM users WHERE referred_by != ''");
$total_registrations = $total_referred;

// Lấy danh sách đối tác liên kết
$affiliates = $db->get_list("SELECT a.affiliate_code, u.username, 
    (SELECT COUNT(*) FROM affiliate_clicks WHERE affiliate_code = a.affiliate_code) as clicks,
    (SELECT SUM(commission) FROM affiliate_conversions WHERE affiliate_code = a.affiliate_code AND status = 'approved') as commission,
    (SELECT COUNT(*) FROM users WHERE referred_by = a.affiliate_code) as referred,
    (SELECT SUM(amount) FROM withdrawals WHERE user_id = a.user_id AND status = 'approved') as withdrawn
    FROM affiliates a
    LEFT JOIN users u ON a.user_id = u.id
    ORDER BY a.created_at DESC
    LIMIT $items_per_page OFFSET $offset_affiliate");

// Lấy lịch sử hoa hồng với phân trang
$commission_history = $db->get_list("SELECT ac.id, ac.amount, ac.commission, ac.status, ac.converted_at, a.affiliate_code, u.username
    FROM affiliate_conversions ac
    LEFT JOIN affiliates a ON ac.affiliate_code = a.affiliate_code
    LEFT JOIN users u ON a.user_id = u.id
    ORDER BY ac.converted_at DESC
    LIMIT $items_per_page OFFSET $offset_commission");

// Lấy lịch sử rút tiền với phân trang
$withdrawal_history = $db->get_list("SELECT w.id, w.amount, w.bank_name, w.account_holder, w.account_number, w.status, w.created_at, u.username
    FROM withdrawals w
    LEFT JOIN users u ON w.user_id = u.id
    ORDER BY w.created_at DESC
    LIMIT $items_per_page OFFSET $offset_withdrawal");
?>

<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Tiếp thị liên kết</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Quản lý tiếp thị liên kết </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Thống kê</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <!-- Tổng quan -->
        <div class="row g-4">
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="avatar avatar-lg avatar-info rounded-circle border-0">
                                <img src="/assets/images/card-2.png" width="50px" />
                            </div>
                            <div class="total-projects ms-3">
                                <h2 class="text-info mb-1"><?= number_format($total_affiliates); ?></h2>
                                <span class="fw-semibold text-secondary">Tổng đối tác</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="avatar avatar-lg avatar-info rounded-circle border-0">
                                <img src="/assets/images/click.png" width="50px" />
                            </div>
                            <div class="total-projects ms-3">
                                <h2 class="text-info mb-1"><?= number_format($total_clicks); ?></h2>
                                <span class="fw-semibold text-secondary">Tổng lượt click</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="avatar avatar-lg avatar-info rounded-circle border-0">
                                <img src="/assets/images/wallet.png" width="50px" />
                            </div>
                            <div class="total-projects ms-3">
                                <h2 class="text-info mb-1"><?= formatCurrencyF($total_commission); ?></h2>
                                <span class="fw-semibold text-secondary">Tổng hoa hồng</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="avatar avatar-lg avatar-info rounded-circle border-0">
                                <img src="/assets/images/3d-wallet.png" width="50px" />
                            </div>
                            <div class="total-projects ms-3">
                                <h2 class="text-info mb-1"><?= formatCurrencyF($total_withdrawn); ?></h2>
                                <span class="fw-semibold text-secondary">Tổng đã rút</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="avatar avatar-lg avatar-info rounded-circle border-0">
                                <img src="/assets/images/add-user.png" width="50px" />
                            </div>
                            <div class="total-projects ms-3">
                                <h2 class="text-info mb-1"><?= number_format($total_referred); ?></h2>
                                <span class="fw-semibold text-secondary">Tổng người giới thiệu</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="avatar avatar-lg avatar-info rounded-circle border-0">
                                <img src="/assets/images/user.png" width="50px" />
                            </div>
                            <div class="total-projects ms-3">
                                <h2 class="text-info mb-1"><?= number_format($total_registrations); ?></h2>
                                <span class="fw-semibold text-secondary">Tổng lượt đăng ký</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Danh sách đối tác -->
        <div class="row">
            <div class="col-md-12">
                <div class="card custom-card overflow-hidden">
                    <div class="card-header justify-content-between">
                        <div class="card-title">Danh sách đối tác liên kết</div>
                    </div>
                    <div class="card-body p-2 pt-1">
                        <div class="table-responsive">
                            <table class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead>
                                    <tr>
                                        <th>Tên người dùng</th>
                                        <th>Mã liên kết</th>
                                        <th>Lượt click</th>
                                        <th>Hoa hồng</th>
                                        <th>Người giới thiệu</th>
                                        <th>Đã rút</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($affiliates)): ?>
                                        <tr>
                                            <td colspan="6" class="text-center text-muted">Chưa có đối tác liên kết.</td>
                                        </tr>
                                    <?php else: ?>
                                        <?php foreach ($affiliates as $affiliate): ?>
                                            <tr>
                                                <td><?= htmlspecialchars($affiliate['username'] ?? 'N/A'); ?></td>
                                                <td><?= htmlspecialchars($affiliate['affiliate_code']); ?></td>
                                                <td><?= number_format($affiliate['clicks']); ?></td>
                                                <td><?= formatCurrencyF($affiliate['commission'] ?? 0); ?></td>
                                                <td><?= number_format($affiliate['referred']); ?></td>
                                                <td><?= formatCurrencyF($affiliate['withdrawn'] ?? 0); ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- Phân trang danh sách đối tác liên kết -->

                        <?php if ($total_affiliate_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page_affiliate > 1): ?>
                                    <a href="?page_affiliate=<?= $page_affiliate - 1; ?>&page_commission=<?= $page_commission; ?>&page_withdrawal=<?= $page_withdrawal; ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $total_affiliate_pages; $i++): ?>
                                    <a class="<?= $i === $page_affiliate ? 'active' : ''; ?>" href="?page_affiliate=<?= $i; ?>&page_commission=<?= $page_commission; ?>&page_withdrawal=<?= $page_withdrawal; ?>">
                                        <?= $i; ?>
                                    </a>
                                <?php endfor; ?>
                                <?php if ($page_affiliate < $total_affiliate_pages): ?>
                                    <a href="?page_affiliate=<?= $page_affiliate + 1; ?>&page_commission=<?= $page_commission; ?>&page_withdrawal=<?= $page_withdrawal; ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
        <!-- Lịch sử hoa hồng -->
        <div class="row">
            <div class="col-md-12">
                <div class="card custom-card overflow-hidden">
                    <div class="card-header justify-content-between">
                        <div class="card-title">Lịch sử hoa hồng</div>
                    </div>
                    <div class="card-body p-2 pt-1">
                        <div class="table-responsive">
                            <table class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Người dùng</th>
                                        <th>Mã liên kết</th>
                                        <th>Số tiền giao dịch</th>
                                        <th>Hoa hồng</th>
                                        <th>Trạng thái</th>
                                        <th>Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($commission_history)): ?>
                                        <tr>
                                            <td colspan="7" class="text-center text-muted">Chưa có lịch sử hoa hồng.</td>
                                        </tr>
                                    <?php else: ?>
                                        <?php foreach ($commission_history as $record): ?>
                                            <tr>
                                                <td><?= htmlspecialchars($record['id']); ?></td>
                                                <td><?= htmlspecialchars($record['username'] ?? 'N/A'); ?></td>
                                                <td><?= htmlspecialchars($record['affiliate_code']); ?></td>
                                                <td><?= formatCurrencyF($record['amount']); ?></td>
                                                <td><?= formatCurrencyF($record['commission']); ?></td>
                                                <td>
                                                    <?= display_service_admin($record['status']) ?>
                                                </td>
                                                <td><?= date('d/m/Y H:i:s', strtotime($record['converted_at'])); ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>

                        <?php if ($total_commission_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page_commission > 1): ?>
                                    <a href="?page_affiliate=<?= $page_affiliate; ?>&page_commission=<?= $page_commission - 1; ?>&page_withdrawal=<?= $page_withdrawal; ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $total_commission_pages; $i++): ?>
                                    <a class="<?= $i === $page_commission ? 'active' : ''; ?>" href="?page_affiliate=<?= $page_affiliate; ?>&page_commission=<?= $i; ?>&page_withdrawal=<?= $page_withdrawal; ?>">
                                        <?= $i; ?>
                                    </a>
                                <?php endfor; ?>
                                <?php if ($page_commission < $total_commission_pages): ?>
                                    <a href="?page_affiliate=<?= $page_affiliate; ?>&page_commission=<?= $page_commission + 1; ?>&page_withdrawal=<?= $page_withdrawal; ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>

                    </div>
                </div>
            </div>
        </div>
        <!-- Lịch sử rút tiền -->
        <div class="row">
            <div class="col-md-12">
                <div class="card custom-card overflow-hidden">
                    <div class="card-header justify-content-between">
                        <div class="card-title">Lịch sử rút tiền</div>
                    </div>
                    <div class="card-body p-2 pt-1">
                        <div class="table-responsive">
                            <table class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Người dùng</th>
                                        <th>Số tiền</th>
                                        <th>Ngân hàng</th>
                                        <th>Tên chủ tài khoản</th>
                                        <th>Số tài khoản</th>
                                        <th>Trạng thái</th>
                                        <th>Thời gian</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($withdrawal_history)): ?>
                                        <tr>
                                            <td colspan="9" class="text-center text-muted">Chưa có lịch sử rút tiền.</td>
                                        </tr>
                                    <?php else: ?>
                                        <?php foreach ($withdrawal_history as $withdrawal): ?>
                                            <tr>
                                                <td><?= htmlspecialchars($withdrawal['id']); ?></td>
                                                <td><?= htmlspecialchars($withdrawal['username'] ?? 'N/A'); ?></td>
                                                <td><?= formatCurrencyF($withdrawal['amount']); ?></td>
                                                <td><?= htmlspecialchars($withdrawal['bank_name']); ?></td>
                                                <td><?= htmlspecialchars($withdrawal['account_holder']); ?></td>
                                                <td><?= htmlspecialchars($withdrawal['account_number']); ?></td>
                                                <td>
                                                    <?= display_service_admin($withdrawal['status']) ?>
                                                </td>
                                                <td><?= date('d/m/Y H:i:s', strtotime($withdrawal['created_at'])); ?></td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editStatusModal" onclick="setWithdrawalId(<?= $withdrawal['id']; ?>, '<?= $withdrawal['status']; ?>')">
                                                        <i class="fa fa-pencil"></i> Chỉnh sửa
                                                    </button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- Phân trang lịch sử rút tiền -->

                        <?php if ($total_withdrawal_pages > 1): ?>
                            <div class="pagination">
                                <?php if ($page_withdrawal > 1): ?>
                                    <a href="?page_affiliate=<?= $page_affiliate; ?>&page_commission=<?= $page_commission; ?>&page_withdrawal=<?= $page_withdrawal - 1; ?>" class="nav-btn"><i class="fa fa-arrow-left"></i></a>
                                <?php endif; ?>
                                <?php for ($i = 1; $i <= $total_withdrawal_pages; $i++): ?>
                                    <a class="<?= $i === $page_withdrawal ? 'active' : ''; ?>" href="?page_affiliate=<?= $page_affiliate; ?>&page_commission=<?= $page_commission; ?>&page_withdrawal=<?= $i; ?>">
                                        <?= $i; ?>
                                    </a>
                                <?php endfor; ?>
                                <?php if ($page_withdrawal < $total_withdrawal_pages): ?>
                                    <a href="?page_affiliate=<?= $page_affiliate; ?>&page_commission=<?= $page_commission; ?>&page_withdrawal=<?= $page_withdrawal + 1; ?>" class="nav-btn"><i class="fa fa-arrow-right"></i></a>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal chỉnh sửa trạng thái -->
<div class="modal fade" id="editStatusModal" tabindex="-1" aria-labelledby="editStatusModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editStatusModalLabel">Chỉnh sửa trạng thái rút tiền</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateStatusForm">
                    <input type="hidden" name="withdrawal_id" id="withdrawal_id">
                    <input type="hidden" name="update_withdrawal_status" value="1">
                    <div class="mb-3">
                        <label for="status" class="form-label">Trạng thái</label>
                        <select class="form-control" name="status" id="status" required>
                            <option value="pending">Chờ xử lý</option>
                            <option value="completed">Hoàn thành</option>
                            <option value="cancelled">Đã huỷ</option>
                        </select>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="submitStatusUpdate()">Cập nhật</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function setWithdrawalId(id, currentStatus) {
        document.getElementById('withdrawal_id').value = id;
        document.getElementById('status').value = currentStatus;
    }

    function submitStatusUpdate() {
        const form = document.getElementById('updateStatusForm');
        const formData = new FormData(form);

        Notiflix.Confirm.show(
            'Xác nhận cập nhật',
            `Bạn có chắc chắn muốn cập nhật trạng thái đơn rút tiền"?`,
            'Có',
            'Không',
            function okCb() {
                Notiflix.Loading.standard('Đang xử lý...');
                $.ajax({
                    url: '/model/admin/referal/update',
                    type: 'POST',
                    data: formData,
                    dataType: 'json',
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        Notiflix.Loading.remove();
                        if (response.status === 'success') {
                            Notiflix.Notify.success('Cập nhật đơn hàng thành công');
                            setTimeout(() => location.reload(), 1000);
                        } else {
                            Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi cập nhật');
                        }
                    },
                    error: function() {
                        Notiflix.Loading.remove();
                        Notiflix.Notify.failure('Lỗi kết nối server');
                    }
                });
            },
            function cancelCb() {
                // Do nothing
            }
        );
    }
</script>

<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php');
$db->dis_connect();
?>