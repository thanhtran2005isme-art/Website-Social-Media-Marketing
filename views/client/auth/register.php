<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMM Panel - Đăng ký</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome CDN cho icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Notiflix CDN -->
    <link href="https://cdn.jsdelivr.net/npm/notiflix@3/dist/notiflix-3.2.7.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/notiflix@3/dist/notiflix-3.2.7.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script
        src="https://challenges.cloudflare.com/turnstile/v0/api.js?onload=onloadTurnstileCallback"
        defer></script>
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
            <p class="text-gray-600">Đăng ký tài khoản mới</p>
        </div>

        <!-- Form đăng ký -->
        <form id="registerForm">
            <div class="mb-4">
                <label for="username" class="block text-sm font-medium text-gray-700">Tài khoản đăng nhập</label>
                <input type="hidden" name="_token" value="<?= generate_csrf_token() ?>" />
                <input
                    type="text"
                    id="username"
                    name="username"
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Nhập tài khoản"
                    required>
            </div>

            <div class="mb-4">
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input
                    type="email"
                    id="email"
                    name="email"
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Nhập email"
                    required>
            </div>

            <div class="mb-4">
                <label for="password" class="block text-sm font-medium text-gray-700">Mật khẩu</label>
                <input
                    type="password"
                    id="password"
                    name="password"
                  
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Nhập mật khẩu"
                    required>
            </div>


            <div class="mb-6">
                <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Xác nhận mật khẩu</label>
                <input
                    type="password"
                    id="confirmPassword"
                    name="confirmPassword"
                   
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Xác nhận mật khẩu"
                    required>
            </div>
            <div class="flex justify-center mb-3">
                <div class="cf-turnstile" data-sitekey="<?= htmlspecialchars($general_data['captcha_siteKey']) ?>"></div>
            </div>

            <button
                type="submit"
                class="w-full bg-indigo-600 text-white py-2 px-4 rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-offset-2 mb-4">
                Đăng ký
            </button>
        </form>

        <!-- Link đăng nhập -->
        <p class="mt-2 text-center text-sm text-gray-600">
            Đã có tài khoản?
            <a href="/login" class="text-indigo-600 hover:underline">Đăng nhập ngay</a>
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
            $('#registerForm').on('submit', function(e) {
                e.preventDefault();
                const form = this;
                const formData = $(form).serialize();
                const password = $('#password').val();
                const confirmPassword = $('#confirmPassword').val();

                if (!password || !confirmPassword) {
                    Notiflix.Notify.failure('Vui lòng nhập đầy đủ thông tin!');
                    return;
                }

                if (password !== confirmPassword) {
                    Notiflix.Notify.failure('Mật khẩu xác nhận không khớp!');
                    return;
                }

                Notiflix.Loading.circle('Đang xử lý đăng ký...');

                $.ajax({
                    url: '/model/register', 
                    type: 'POST',
                    data: formData,
                    success: function(data) {
                        Notiflix.Loading.remove();
                        if (data.success) {
                            Notiflix.Notify.success('Đăng ký thành công! Vui lòng đăng nhập.');
                            setTimeout(() => {
                                window.location.href = '/login';
                            }, 2000);
                        } else {
                            Notiflix.Notify.failure(data.message || 'Đăng ký thất bại!');
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