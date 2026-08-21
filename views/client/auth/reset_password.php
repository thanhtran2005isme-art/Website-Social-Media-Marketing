<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');

$token = Anti_xss($_GET['token'] ?? '');
if (empty($token)) {
    die('Liên kết không hợp lệ hoặc đã hết hạn!');
}

$db->connect();
$reset = $db->get_row("SELECT email, expires_at FROM password_resets WHERE token = '" . $token . "'");
if (!$reset || strtotime($reset['expires_at']) < time()) {
    die('Liên kết không hợp lệ hoặc đã hết hạn!');
}

$user = $db->get_row("SELECT id, username FROM users WHERE email = '" . $reset['email'] . "'");
if (!$user) {
    die('Tài khoản không tồn tại!');
}
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lại mật khẩu - SMM Panel</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Notiflix CDN -->
    <link href="https://cdn.jsdelivr.net/npm/notiflix@3/dist/notiflix-3.2.7.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/notiflix@3/dist/notiflix-3.2.7.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-image: linear-gradient(135deg, #667eea 0, #764ba2 100%);
        }
    </style>
</head>

<body class="flex items-center justify-center min-h-screen p-3">
    <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
        <!-- Logo hoặc tiêu đề -->
        <div class="text-center mb-6">
            <div class="flex justify-center">
                <img src="https://<?= $_SERVER['SERVER_NAME'] . $general_data['logo_light'] ?>" width="200px" />
            </div>
            <p class="text-gray-600">Đặt lại mật khẩu của bạn</p>
        </div>

        <!-- Form đặt lại mật khẩu -->
        <form id="resetPasswordForm">
            <input type="hidden" name="_token" value="<?= htmlspecialchars(generate_csrf_token()) ?>" />
            <input type="hidden" name="token" value="<?= htmlspecialchars($token) ?>" />
            <div class="mb-4">
                <label for="password" class="block text-sm font-medium text-gray-700">Mật khẩu mới</label>
                <input
                    type="password"
                    id="password"
                    name="password"
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Nhập mật khẩu mới"
                    required>
            </div>

            <div class="mb-6">
                <label for="password_confirmation" class="block text-sm font-medium text-gray-700">Xác nhận mật khẩu</label>
                <input
                    type="password"
                    id="password_confirmation"
                    name="password_confirmation"
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Xác nhận mật khẩu"
                    required>
            </div>

            <button
                type="submit"
                class="w-full bg-indigo-600 text-white py-2 px-4 rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 mb-4">
                Đặt lại mật khẩu
            </button>
        </form>

        <!-- Link quay lại đăng nhập -->
        <p class="mt-4 text-center text-sm text-gray-600">
            Đã nhớ mật khẩu?
            <a href="/login" class="text-indigo-600 hover:underline">Quay lại đăng nhập</a>
        </p>
    </div>

    <script>
        Notiflix.Notify.init({
            width: '300px',
            position: 'right-top',
            timeout: 3000,
            fontSize: '14px',
            borderRadius: '8px',
        });

        Notiflix.Loading.init({
            className: 'notiflix-loading',
            zindex: 4000,
            backgroundColor: 'rgba(0,0,0,0.8)',
            rtl: false,
            fontFamily: 'Quicksand',
            cssAnimation: true,
            cssAnimationDuration: 400,
            clickToClose: false,
            customSvgUrl: null,
            customSvgCode: null,
            svgSize: '80px',
            svgColor: '#32c682',
            messageID: 'NotiflixLoadingMessage',
            messageFontSize: '15px',
            messageMaxLength: 34,
            messageColor: '#dcdcdc',
        });

        $(document).ready(function() {
            $('#resetPasswordForm').on('submit', function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                const password = $('#password').val();
                const passwordConfirmation = $('#password_confirmation').val();

                if (!password || password.length < 6) {
                    Notiflix.Notify.failure('Mật khẩu phải có ít nhất 6 ký tự!');
                    return;
                }

                if (password !== passwordConfirmation) {
                    Notiflix.Notify.failure('Mật khẩu xác nhận không khớp!');
                    return;
                }

                Notiflix.Loading.hourglass('Đang xử lý đặt lại mật khẩu...');

                $.ajax({
                    url: '/model/reset-password',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    success: function(data) {
                        Notiflix.Loading.remove();
                        if (data.status === 'success') {
                            Notiflix.Notify.success(data.msg);
                            setTimeout(() => {
                                window.location.href = '/login';
                            }, 2000);
                        } else {
                            Notiflix.Notify.failure(data.msg || 'Lỗi không xác định');
                        }
                    },
                    error: function(xhr, status, error) {
                        Notiflix.Loading.remove();
                        Notiflix.Notify.failure('Có lỗi xảy ra: ' + error);
                    }
                });
            });
        });
    </script>
</body>

</html>