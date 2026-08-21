<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');

use PragmaRX\Google2FA\Google2FA;

$client = new Google_Client();
$client->setClientId(GOOGLE_CLIENT_ID);
$client->setClientSecret(GOOGLE_CLIENT_SECRET);
$client->setRedirectUri(GOOGLE_REDIRECT_URL);
$client->addScope("email");
$client->addScope("profile");

if (isset($_GET['code'])) {
    $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
    if (!$client->isAccessTokenExpired()) {
        $client->setAccessToken($token);
        $google_oauth = new Google\Service\Oauth2($client);
        $google_account_info = $google_oauth->userinfo->get();
        $userEmail =  Anti_xss($google_account_info->email);
        $userName =  Anti_xss($google_account_info->name);
        $userId =  Anti_xss($google_account_info->id);
        $user = $db->get_row("SELECT * FROM `users` WHERE `email`='$userEmail' AND `provider`='google' AND `provider_id`='$userId' AND `google_id`='$userId'");
        if (!$user) {
            $google2fa = new Google2FA();
            $create = $db->insert("users", [
                'username' => $userEmail,
                'email' => $userEmail,
                'password' => password_hash(random('QWERTYUIOPASDGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789', 10), PASSWORD_BCRYPT, ['cost' => 12]),
                'provider'      => 'google',
                'provider_id'      => $userId,
                'google_id'      => $userId,
                'currency_code' => 'VND',
                'two_fa_code' => $google2fa->generateSecretKey(),
                'created_at' => gettime(),
                'updated_at' => gettime()
            ]);
            if ($create) {
                $user_id = $db->get_id_insert();
                
                $session->send(getRowRealtime('users', $user_id, 'username'));
                new Redirect('/user/dashboard');
            } else {
                die(JsonMsg('error', 'Hệ thống lỗi rồi, inbox admin đi nào'));
            }
        } else {

            $db->update("users", array(
                'currency_code' => 'VND',
                'login_attempts' => 0,
            ), " `id` = '" . $user['id'] . "' ");
            $session->send($user['username']);
            new Redirect('/user/dashboard');
        }
    } else {
        new Redirect($client->createAuthUrl());
    }
} else {
    new Redirect($client->createAuthUrl());
}
