<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Tiếp thị liên kết - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php');

$user_id = $user ? $data_user['id'] : 0;

$affiliate = $db->get_row("SELECT affiliate_code FROM affiliates WHERE user_id = '$user_id'");
$affiliate_code = $affiliate ? $affiliate['affiliate_code'] : '';
$affiliate_link = $affiliate_code ? "https://" . $_SERVER['SERVER_NAME'] . "/reffer?aff=" . $affiliate_code : '';

$clicks = 0;
$total_commission = 0;
$total_referred = 0;
$total_registrations = 0;
$history = [];

if ($affiliate_code) {
    // Đếm lượt click
    $clicks = $db->num_rows("SELECT id FROM affiliate_clicks WHERE affiliate_code = '$affiliate_code'");

    // Tính tổng hoa hồng
    $commission_result = $db->get_row("SELECT SUM(commission) as total_commission FROM affiliate_conversions WHERE affiliate_code = '$affiliate_code' AND status = 'approved'");
    $total_commission = $commission_result['total_commission'] ?? 0;

    // Tổng người đã giới thiệu
    $total_referred = $db->num_rows("SELECT id FROM users WHERE referred_by = '$affiliate_code'");

    // Tổng lượt đăng ký
    $total_registrations = $db->num_rows("SELECT id FROM users WHERE referred_by = '$affiliate_code'");

    // Lấy lịch sử hoa hồng
    $history = $db->get_list("SELECT id, amount, commission, status, converted_at FROM affiliate_conversions WHERE affiliate_code = '$affiliate_code' ORDER BY converted_at DESC");
}
$total_withdrawn = 0;
if ($affiliate_code) {
    $withdrawn_result = $db->get_row("SELECT SUM(amount) as total_withdrawn FROM withdrawals WHERE user_id = '$user_id' AND status = 'approved'");
    $total_withdrawn = $withdrawn_result['total_withdrawn'] ?? 0;
}
// Xử lý đăng ký đối tác liên kết
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['register_affiliate']) && !$affiliate_code) {
    $affiliate_code = uniqid('aff_');
    $data = [
        'user_id' => $user_id,
        'affiliate_code' => $affiliate_code,
        'created_at' => date('Y-m-d H:i:s')
    ];

    $db->begin_transaction();
    try {
        if ($db->insert('affiliates', $data)) {
            $db->commit();
            $affiliate_link = "https://" . $_SERVER['SERVER_NAME'] . "/reffer?aff=" . $affiliate_code;
            $_SESSION['success_message'] = "Đăng ký đối tác liên kết thành công! Mã của bạn: $affiliate_code";
            new Redirect($_SERVER['REQUEST_URI']);
        } else {
            $db->rollback();
            $_SESSION['error_message'] = "Lỗi: Không thể đăng ký đối tác liên kết.";
        }
    } catch (Exception $e) {
        $db->rollback();
        $_SESSION['error_message'] = "Lỗi: " . $e->getMessage();
    }
}

$_SESSION['csrf_token'] = bin2hex(random_bytes(32));
?>

<div class="main-content app-content">
    <div class="container-fluid">
        <!-- Page Header -->
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tiếp thị liên kết</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Tiếp thị liên kết</h1>
            </div>

        </div>
        <!-- Thông báo -->
        <?php if (isset($_SESSION['success_message'])): ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <?= $_SESSION['success_message'];
                unset($_SESSION['success_message']); ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>
        <?php if (isset($_SESSION['error_message'])): ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <?= $_SESSION['error_message'];
                unset($_SESSION['error_message']); ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>
        <?php if ($affiliate_code): ?>
            <div class="row g-4 pulse-loader">
                <div class="col-md-6 col-6 col-lg-4 col-xl">
                    <div class="card custom-card overflow-hidden">
                        <div class="card-body text-center"> <span class="avatar avatar-md bg-success-gradient svg-white avatar-rounded"><i class="bi bi-percent fs-17"></i></span>
                            <p class="mb-1 mt-3 fw-medium">Tỉ lệ hoa hồng</p>
                            <h4 class="fw-semibold"><?= $data_user['referral_percent'] ?>%</h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-6 col-lg-4 col-xl">
                    <div class="card custom-card overflow-hidden">
                        <div class="card-body text-center"> <span class="avatar avatar-md bg-primary-gradient svg-white avatar-rounded"><i class="bi bi-hand-index-thumb fs-17"></i></span>
                            <p class="mb-1 mt-3 fw-medium">Tổng lượt click</p>
                            <h4 class="fw-semibold"><?= number_format($clicks); ?></h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-6 col-lg-4 col-xl">
                    <div class="card custom-card overflow-hidden">
                        <div class="card-body text-center"> <span class="avatar avatar-md bg-primary1-gradient svg-white avatar-rounded"><i class="bi bi-currency-dollar fs-17"></i></span>
                            <p class="mb-1 mt-3 fw-medium">Số dư hoa hồng</p>
                            <h4 class="fw-semibold"><?= formatCurrencyF($data_user['balance_referred']) ?></h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-6 col-lg-4 col-xl">
                    <div class="card custom-card overflow-hidden">
                        <div class="card-body text-center"> <span class="avatar avatar-md bg-primary1-gradient svg-white avatar-rounded"><i class="bi bi-credit-card fs-17"></i></span>
                            <p class="mb-1 mt-3 fw-medium">Hoa hồng đã rút</p>
                            <h4 class="fw-semibold"><?= formatCurrencyF($total_withdrawn); ?></h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-6 col-lg-4 col-xl">
                    <div class="card custom-card overflow-hidden">
                        <div class="card-body text-center"> <span class="avatar avatar-md bg-primary2-gradient svg-white avatar-rounded"><i class="bi bi-person-add fs-17"></i></span>
                            <p class="mb-1 mt-3 fw-medium">Tổng người giới thiệu</p>
                            <h4 class="fw-semibold"><?= number_format($total_referred); ?></h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-6 col-lg-4 col-xl">
                    <div class="card custom-card overflow-hidden">
                        <div class="card-body text-center"> <span class="avatar avatar-md bg-primary3-gradient svg-white avatar-rounded"><i class="bi bi-person-fill fs-17"></i></span>
                            <p class="mb-1 mt-3 fw-medium">Tổng lượt đăng ký</p>
                            <h4 class="fw-semibold"><?= number_format($total_registrations); ?></h4>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between">
                            <div class="card-title"> Thông tin tiếp thị liên kết</div>
                        </div>
                        <div class="card-body p-3">
                            <div class="row mb-4">
                                <div class="col-md-12 mb-3">
                                    <label class="form-label fw-bold"><i class="bi bi-code me-1"></i>Mã liên kết</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bi bi-tag"></i></span>
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($affiliate_code); ?>" readonly>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="form-label fw-bold"><i class="bi bi-globe me-1"></i>Liên kết liên kết</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($affiliate_link); ?>" readonly>
                                        <button class="btn btn-outline-secondary" onclick="copyToClipboard('<?= htmlspecialchars($affiliate_link); ?>')"><i class="bi bi-copy"></i> Sao chép</button>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-4">
                                    <div class="card">
                                        <div class="card-header">
                                            <h6 class="card-title"><i class="fas fa-share-alt me-2"></i>Chia sẻ liên kết</h6>
                                        </div>
                                        <div class="card-body text-center">
                                            <p class="text-muted">Chia sẻ liên kết của bạn để mời thêm người dùng!</p>
                                            <div class="social-share">
                                                <a href="https://www.facebook.com/sharer/sharer.php?u=<?= urlencode($affiliate_link); ?>" target="_blank" class="btn btn-primary btn-sm"><i class="fab fa-facebook-f me-1"></i>Facebook</a>
                                                <a href="https://twitter.com/intent/tweet?url=<?= urlencode($affiliate_link); ?>&text=Tham%20gia%20ngay%20với%20liên%20kết%20tiếp%20thị%20của%20tôi!" target="_blank" class="btn btn-info btn-sm"><i class="fab fa-twitter me-1"></i>Twitter</a>
                                                <a href="https://api.whatsapp.com/send?text=<?= urlencode('Tham gia ngay với liên kết tiếp thị của tôi: ' . $affiliate_link); ?>" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fab fa-whatsapp me-1"></i>WhatsApp</a>
                                                <a href="https://t.me/share/url?url=<?= urlencode($affiliate_link); ?>&text=Tham%20gia%20ngay%20với%20liên%20kết%20tiếp%20thị%20của%20tôi!" target="_blank" class="btn btn-telegram btn-sm"><i class="fab fa-telegram-plane me-1"></i>Telegram</a>
                                                <a href="https://www.linkedin.com/sharing/share-offsite/?url=<?= urlencode($affiliate_link); ?>" target="_blank" class="btn btn-linkedin btn-sm"><i class="fab fa-linkedin-in me-1"></i>LinkedIn</a>
                                                <a href="https://pinterest.com/pin/create/button/?url=<?= urlencode($affiliate_link); ?>&description=Tham%20gia%20ngay%20với%20liên%20kết%20tiếp%20thị%20của%20tôi!" target="_blank" class="btn btn-pinterest btn-sm"><i class="fab fa-pinterest-p me-1"></i>Pinterest</a>
                                                <a href="mailto:?subject=Tham%20gia%20tiếp%20thị%20liên%20kết&body=Tham%20gia%20ngay%20với%20liên%20kết%20của%20tôi:%20<?= urlencode($affiliate_link); ?>" class="btn btn-email btn-sm"><i class="fas fa-envelope me-1"></i>Email</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card custom-card">
                        <div class="card-header justify-content-between">
                            <div class="card-title"> Rút tiền hoa hồng</div>
                        </div>
                        <div class="card-body p-3">
                            <p class="fw-bold"><i class="fas fa-wallet me-1"></i>Số dư: <span class="text-danger"><?= formatCurrencyF($data_user['balance_referred']) ?></span></p>
                            <form id="withdrawForm" method="POST">
                                <input type="hidden" name="csrf_token" value="<?= $_SESSION['csrf_token']; ?>">
                                <input type="hidden" name="withdraw" value="1">
                                <div class="mb-3">
                                    <label for="bank_name" class="form-label">Ngân hàng <span class="text-danger">*</span></label>
                                    <select class="form-control" id="bank_name" name="bank_name" required>
                                        <option value="">Chọn ngân hàng</option>
                                        <option value="Vietcombank">Vietcombank</option>
                                        <option value="Techcombank">Techcombank</option>
                                        <option value="BIDV">BIDV</option>
                                        <option value="VietinBank">VietinBank</option>
                                        <option value="MB Bank">MB Bank</option>
                                        <option value="ACB">ACB</option>
                                        <option value="VPBank">VPBank</option>
                                        <option value="Sacombank">Sacombank</option>
                                        <option value="TPBank">TPBank</option>
                                        <option value="Agribank">Agribank</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="account_holder" class="form-label">Tên chủ tài khoản <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="account_holder" name="account_holder" required>
                                </div>
                                <div class="mb-3">
                                    <label for="account_number" class="form-label">Số tài khoản <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="account_number" name="account_number" required>
                                </div>
                                <div class="mb-3">
                                    <label for="amount" class="form-label">Số tiền rút <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" id="amount" name="amount" min="10000" step="1000" required>
                                    <small class="form-text text-muted">Tối thiểu <?= formatCurrencyF($affiliate_config['min_withdraw']) ?>, tối đa <?= formatCurrencyF($affiliate_config['max_withdraw']) ?>.</small>
                                </div>
                                <button type="button" class="btn btn-primary w-100" onclick="submitWithdraw()"><i class="fas fa-money-check-alt me-1"></i>Rút tiền</button>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card custom-card overflow-hidden">
                        <div class="card-header justify-content-between">
                            <div class="card-title"> Lịch sử hoa hồng </div>
                        </div>
                        <div class="card-body p-0 pt-1">
                            <div class="table-responsive">
                                <table class="table text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Số tiền giao dịch</th>
                                            <th>Hoa hồng</th>
                                            <th>Trạng thái</th>
                                            <th>Thời gian</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if (empty($history)): ?>
                                            <tr>
                                                <td colspan="5" class="text-center text-muted">Chưa có lịch sử hoa hồng.</td>
                                            </tr>
                                        <?php else: ?>
                                            <?php foreach ($history as $record): ?>
                                                <tr>
                                                    <td><?= htmlspecialchars($record['id']); ?></td>
                                                    <td><?= formatCurrencyF($record['amount']); ?></td>
                                                    <td><?= formatCurrencyF($record['commission']); ?></td>
                                                    <td>
                                                        <?= getStatusClass($record['status']) ?>
                                                    </td>
                                                    <td><?= date('d/m/Y H:i:s', strtotime($record['converted_at'])); ?></td>
                                                </tr>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card custom-card overflow-hidden">
                        <div class="card-header justify-content-between">
                            <div class="card-title"> Lịch sử rút tiền </div>
                        </div>
                        <div class="card-body p-0 pt-1">
                            <div class="table-responsive">
                                <table class="table text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Số tiền</th>
                                            <th>Ngân hàng</th>
                                            <th>Tên chủ tài khoản</th>
                                            <th>Số tài khoản</th>
                                            <th>Trạng thái</th>
                                            <th>Thời gian</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $withdrawals = $db->get_list("SELECT id, amount, bank_name, account_holder, account_number, status, created_at FROM withdrawals WHERE user_id = '$user_id' ORDER BY created_at DESC");
                                        if (empty($withdrawals)):
                                        ?>
                                            <tr>
                                                <td colspan="7" class="text-center text-muted">Chưa có lịch sử rút tiền.</td>
                                            </tr>
                                        <?php else: ?>
                                            <?php foreach ($withdrawals as $withdrawal): ?>
                                                <tr>
                                                    <td><?= htmlspecialchars($withdrawal['id']); ?></td>
                                                    <td><?= formatCurrencyF($withdrawal['amount']); ?></td>
                                                    <td><?= htmlspecialchars($withdrawal['bank_name']); ?></td>
                                                    <td><?= htmlspecialchars($withdrawal['account_holder']); ?></td>
                                                    <td><?= htmlspecialchars($withdrawal['account_number']); ?></td>
                                                    <td>
                                                        <?= getStatusClass($withdrawal['status']) ?>
                                                    </td>
                                                    <td><?= date('d/m/Y H:i:s', strtotime($withdrawal['created_at'])); ?></td>
                                                </tr>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php else: ?>
            <div class="text-center">
                <i class="fas fa-info-circle fa-3x text-primary mb-3"></i>
                <p class="lead">Bạn chưa đăng ký làm đối tác liên kết.</p>
                <form method="POST">
                    <input type="hidden" name="register_affiliate" value="1">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-user-plus me-1"></i>Đăng ký ngay</button>
                </form>
            </div>
        <?php endif; ?>
    </div>
</div>

<script>
    function copyToClipboard(text) {
        navigator.clipboard.writeText(text).then(() => {
            Notiflix.Notify.success('Đã sao chép liên kết!');
        });
    }

    function submitWithdraw() {
        const form = document.getElementById('withdrawForm');
        const amount = document.getElementById('amount').value;
        const bankName = document.getElementById('bank_name').value;
        const accountHolder = document.getElementById('account_holder').value;
        const accountNumber = document.getElementById('account_number').value;

        if (!amount || !bankName || !accountHolder || !accountNumber) {
            Notiflix.Notify.failure('Vui lòng điền đầy đủ thông tin.');
            return;
        }

        Notiflix.Confirm.show(
            'Xác nhận rút tiền',
            `Bạn muốn rút ${$formatCurrency(amount)} về tài khoản ${accountHolder} (${bankName})?`,
            'Xác nhận',
            'Hủy',
            function() {
                Notiflix.Loading.standard('Đang xử lý...');

                $.ajax({
                    url: '/model/withdraw_process',
                    type: 'POST',
                    data: $(form).serialize(),
                    dataType: 'json',
                    success: function(data) {
                        Notiflix.Loading.remove();
                        if (data.success) {
                            Notiflix.Notify.success(data.message);
                            setTimeout(function() {
                                window.location.reload();
                            }, 2000);
                        } else {
                            Notiflix.Notify.failure(data.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        Notiflix.Loading.remove();
                        Notiflix.Notify.failure('Đã xảy ra lỗi khi xử lý yêu cầu.');
                        console.error('Error:', error);
                    }
                });
            },
            function() {
                Notiflix.Notify.info('Đã hủy yêu cầu rút tiền.');
            }, {
                width: '400px',
                titleColor: '#28a745',
                okButtonBackground: '#28a745',
                cancelButtonBackground: '#dc3545',
            }
        );
    }

    // Xóa loading khi trang tải xong
    document.addEventListener('DOMContentLoaded', function() {
        Notiflix.Loading.remove();
    });
</script>

</script>

<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php');
$db->dis_connect();
?>