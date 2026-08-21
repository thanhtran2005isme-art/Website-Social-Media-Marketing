<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';

header('Content-Type: application/json');

// Check if the request is POST and has the withdraw parameter
if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['withdraw'])) {
    echo json_encode(['success' => false, 'message' => 'Yêu cầu không hợp lệ.']);
    exit;
}

if (!$user) {
    echo json_encode(['success' => false, 'message' => 'Bạn cần đăng nhập để thực hiện rút tiền.']);
    exit;
}
if ($general_data['status_demo'] == 1) {
    echo json_encode(['success' => false, 'message' => 'Đây là trang web demo bạn không thể thực hiện thao tác']);
    exit;
}
$user_id =$data_user['id'];
$amount = floatval(Anti_xss($_POST['amount']));
$bank_name = Anti_xss($_POST['bank_name']);
$account_holder = Anti_xss($_POST['account_holder']);
$account_number = Anti_xss($_POST['account_number']);
$csrf_token = Anti_xss($_POST['csrf_token']);

// Kiểm tra CSRF token
if (!isset($_SESSION['csrf_token']) || $_SESSION['csrf_token'] !== $csrf_token) {
    echo json_encode(['success' => false, 'message' => 'Yêu cầu không hợp lệ.']);
    exit;
}

// Kiểm tra dữ liệu
if ($amount <= 0 || empty($bank_name) || empty($account_holder) || empty($account_number)) {
    echo json_encode(['success' => false, 'message' => 'Vui lòng điền đầy đủ thông tin.']);
    exit;
}

try {
    $db->begin_transaction();

    // Kiểm tra yêu cầu rút tiền trùng lặp
    $existing_withdrawal = $db->get_row("SELECT id FROM withdrawals WHERE user_id = '$user_id' AND amount = '$amount' AND bank_name = '$bank_name' AND account_holder = '$account_holder' AND account_number = '$account_number' AND status = 'pending' AND created_at > NOW() - INTERVAL 5 MINUTE");
    if ($existing_withdrawal) {
        $db->rollback();
        echo json_encode(['success' => false, 'message' => 'Yêu cầu rút tiền tương tự đang chờ xử lý. Vui lòng thử lại sau.']);
        exit;
    }

    if ($amount < $affiliate_config['min_withdraw'] || $amount > $affiliate_config['max_withdraw']) {
        $min_withdraw = formatCurrencyF($affiliate_config['min_withdraw']);
        $max_withdraw = formatCurrencyF($affiliate_config['max_withdraw']);
        echo json_encode(['success' => false, 'message' => "Số tiền rút phải từ $min_withdraw đến $max_withdraw VND."]);
        exit;
    }

    // Lấy thông tin số dư và version
    $user_data = $db->get_row("SELECT balance_referred, version FROM users WHERE id = '$user_id' FOR UPDATE"); // Use FOR UPDATE to lock the row
    if (!$user_data) {
        $db->rollback();
        echo json_encode(['success' => false, 'message' => 'Không tìm thấy thông tin người dùng.']);
        exit;
    }

    $current_balance = $user_data['balance_referred'];
    $current_version = $user_data['version'];

    // Kiểm tra số dư
    if ($current_balance < $amount) {
        $db->rollback();
        echo json_encode(['success' => false, 'message' => 'Số dư không đủ để rút.']);
        exit;
    }

    // Trừ số dư và tăng version
    $new_version = $current_version + 1;
    $update_result = $db->query("UPDATE users SET balance_referred = balance_referred - '$amount', version = '$new_version' WHERE id = '$user_id' AND version = '$current_version'");
    if (!$update_result) {
        $db->rollback();
        echo json_encode(['success' => false, 'message' => 'Số dư đã thay đổi. Vui lòng thử lại.']);
        exit;
    }
    $trx_id = generateOrderNumber();
    $transaction_data = [
        'trx_id' => $trx_id,
        'user_id' => $user_id,
        'trx_type' => '-',
        'amount' => $amount,
        'remarks' => 'Withdrawal request #' . $trx_id,
        'charge' => 0,
        'created_at' => gettime(),
        'updated_at' => gettime()
    ];
    if (!$db->insert('transactions', $transaction_data)) {
        throw new Exception("Không thể ghi nhận giao dịch.");
    }
    // Ghi nhận yêu cầu rút tiền
    $withdrawal_data = [
        'user_id' => $user_id,
        'amount' => $amount,
        'bank_name' => $bank_name,
        'account_holder' => $account_holder,
        'account_number' => $account_number,
        'status' => 'pending',
        'created_at' => date('Y-m-d H:i:s')
    ];
    if (!$db->insert('withdrawals', $withdrawal_data)) {
        throw new Exception("Không thể ghi nhận yêu cầu rút tiền.");
    }

    $db->commit();
    echo json_encode(['success' => true, 'message' => 'Yêu cầu rút tiền đã được gửi. Vui lòng chờ xử lý.']);
} catch (Exception $e) {
    $db->rollback();
    error_log("Withdrawal error: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Lỗi: ' . $e->getMessage()]);
}

$db->dis_connect();
