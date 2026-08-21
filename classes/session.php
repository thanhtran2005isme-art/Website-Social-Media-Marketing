<?php
 
// Lớp session
class Session {
    // Hàm bắt đầu session
    public function start()
    {
        @session_start([
            'cookie_lifetime' => 86400,
            'cookie_secure' => true,
            'cookie_httponly' => true,
            'cookie_samesite' => 'Strict',
            'use_strict_mode' => true,
        ]);
    }
 
    // Hàm lưu session 
    public function send($user){
        $_SESSION['user'] = $user;
    }
    
    // Hàm lấy dữ liệu session
    public function get(){
        if (isset($_SESSION['user']))
        {
            $user = $_SESSION['user'];
        }else{
            $user = '';
        }
        return $user;
    }
    
    // Hàm xoá session
    public function destroy(){
        @session_destroy();
    }
}
 
?>