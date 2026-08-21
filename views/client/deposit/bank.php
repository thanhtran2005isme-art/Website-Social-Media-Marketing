<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Nạp ngân hàng tự động - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php');

$transactions = $db->get_list("SELECT * FROM transactions WHERE user_id = '{$data_user['id']}' AND `transactional_type` = 'bank' ORDER BY created_at DESC");

// Fetch list of banks supporting VietQR
$banks = $db->get_list("SELECT * FROM banks ORDER BY name ASC");
?>

<div class="main-content app-content">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Nạp tiền qua chuyển khoản</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Nạp tiền qua chuyển khoản</h1>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-12">
                <div class="alert alert-info mb-4">
                    <h6 class="alert-heading">Lưu ý khi nạp tiền:</h6>
                    <ul>
                        <li>Vui lòng ghi đúng <strong>nội dung chuyển khoản</strong> được cung cấp cho từng ngân hàng để hệ thống tự động xác nhận giao dịch.</li>
                        <li>Giao dịch có thể mất vài phút để được xử lý. Vui lòng kiểm tra lịch sử giao dịch để xác nhận.</li>
                        <li>Liên hệ chúng tôi nếu gặp vấn đề.</li>
                    </ul>
                </div>
            </div>

            <!-- List of Supported Banks -->
            <div class="mb-4">
                <h6 class="fw-bold">Danh sách ngân hàng hỗ trợ VietQR</h6>
                <p>Dưới đây là danh sách các ngân hàng tại Việt Nam hỗ trợ thanh toán qua mã VietQR:</p>
                <div class="row">
                    <?php if (empty($banks)): ?>
                        <div class="col-12">
                            <p class="text-center">Không có ngân hàng nào được tìm thấy.</p>
                        </div>
                    <?php else: ?>
                        <?php foreach ($banks as $bank): ?>
                            <?php $encoded_account_holder = urlencode($bank['account_holder']); ?>
                            <div class="col-md-4 col-sm-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="text-center mb-3">
                                            <img src="https://api.vietqr.io/img/<?= htmlspecialchars($bank['code']) ?>.png" alt="<?= htmlspecialchars($bank['name']) ?> Logo" class="img-fluid mb-2" style="max-height: 50px;">
                                        </div>
                                        <p><strong>Ngân hàng:</strong> <?= htmlspecialchars($bank['name']) ?></p>
                                        <p><strong>Chủ tài khoản:</strong> <?= htmlspecialchars($bank['account_holder']) ?></p>
                                        <p>
                                            <strong>Số tài khoản:</strong>
                                            <span id="account-number-<?= htmlspecialchars($bank['id']) ?>"><?= htmlspecialchars($bank['account_number']) ?></span>
                                            <button class="btn btn-sm btn-outline-success ms-2 copy-btn"
                                                data-clipboard-target="#account-number-<?= htmlspecialchars($bank['id']) ?>"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Sao chép số tài khoản">
                                                <i class="bi bi-clipboard"></i>
                                            </button>
                                        </p>
                                        <p>
                                            <strong>Nội dung chuyển khoản:</strong>
                                            <span id="transfer-content-<?= htmlspecialchars($bank['id']) ?>"><?= $bank['prefix_autobank'] . htmlspecialchars($data_user['id']) ?></span>
                                            <button class="btn btn-sm btn-outline-success ms-2 copy-btn"
                                                data-clipboard-target="#transfer-content-<?= htmlspecialchars($bank['id']) ?>"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Sao chép nội dung chuyển khoản">
                                                <i class="bi bi-clipboard"></i>
                                            </button>
                                        </p>
                                        <div class="text-center">
                                            <img src="https://api.vietqr.io/image/<?= htmlspecialchars($bank['code']) ?>-<?= htmlspecialchars($bank['account_number']) ?>-compact.png?accountName=<?= $encoded_account_holder ?>&amount=0&addInfo=<?= $bank['prefix_autobank'] . htmlspecialchars($data_user['id']) ?>" alt="<?= htmlspecialchars($bank['name']) ?> QR Code" class="img-fluid" style="max-width: 250px;">
                                            <p class="mt-2">Quét mã QR để chuyển khoản</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </div>
            </div>

            <!-- Transaction History -->
            <div>
                <h6 class="fw-bold">Lịch sử nạp tiền qua chuyển khoản</h6>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>Thời gian</th>
                                <th>Số tiền</th>
                                <th>Nội dung</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (empty($transactions)): ?>
                                <tr>
                                    <td colspan="4" class="text-center">Chưa có giao dịch nào.</td>
                                </tr>
                            <?php else: ?>
                                <?php foreach ($transactions as $transaction): ?>
                                    <?php $formatted_amount = formatCurrencyF($transaction['amount']) ?>
                                    <tr>
                                        <td><?= htmlspecialchars($transaction['created_at']) ?></td>
                                        <td><?= htmlspecialchars($formatted_amount) ?></td>
                                        <td><?= htmlspecialchars($transaction['remarks']) ?></td>
                                        <td><span class="badge bg-success-gradient">Thành công</span></td>
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

<!-- JavaScript for Copy Functionality -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize Bootstrap tooltips
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

        // Handle copy button clicks
        document.querySelectorAll('.copy-btn').forEach(button => {
            button.addEventListener('click', function() {
                const targetId = this.getAttribute('data-clipboard-target');
                const targetElement = document.querySelector(targetId);
                const textToCopy = targetElement.textContent;

                navigator.clipboard.writeText(textToCopy).then(() => {
                    // Update tooltip to show "Copied!"
                    const tooltip = bootstrap.Tooltip.getInstance(this);
                    tooltip.setContent({
                        '.tooltip-inner': 'Đã sao chép!'
                    });
                    setTimeout(() => {
                        tooltip.setContent({
                            '.tooltip-inner': this.getAttribute('title')
                        });
                    }, 2000);
                }).catch(err => {
                    console.error('Copy failed:', err);
                });
            });
        });
    });
</script>

<?php
// Close database connection
$db->dis_connect();
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php');
?>