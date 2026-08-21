<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
header('Content-Type: application/json');
if (!$user) {
    echo json_encode(['status' => 'error', 'error' => 'Unauthorized']);
    exit;
}
$new_api_key = bin2hex(random_bytes(16));
$db->query("UPDATE users SET api_token = '{$new_api_key}' WHERE id = '{$data_user['id']}'");
die(json_encode(['status' => 'success', 'api_key' => $new_api_key]));
?>