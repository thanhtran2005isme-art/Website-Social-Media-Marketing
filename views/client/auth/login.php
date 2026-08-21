<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            <p class="text-gray-600">Đăng nhập vào hệ thống</p>
        </div>

        <!-- Form đăng nhập -->
        <form id="loginForm">
            <div class="mb-4">
                <label for="username" class="block text-sm font-medium text-gray-700">Tài khoản đăng nhập</label>
                <input type="hidden" name="_token" value="<?= generate_csrf_token() ?>" />
                <input
                    type="text"
                    id="username"
                    name="username"
                    value="<?=$general_data['status_demo'] == 1 ? 'chicken':''?>"
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Nhập tên người dùng"
                    required>
            </div>

            <div class="mb-6">
                <label for="password" class="block text-sm font-medium text-gray-700">Mật khẩu</label>
                <input
                    type="password"
                    id="password"
                    name="password"
                    value="<?=$general_data['status_demo'] == 1 ? '12345678':''?>"
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Nhập mật khẩu"
                    required>
            </div>

            <div class="flex items-center justify-between mb-6">
                <div class="flex items-center">
                    <input
                        id="remember"
                        type="checkbox"
                        class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded">
                    <label for="remember" class="ml-2 block text-sm text-gray-900">Ghi nhớ tôi</label>
                </div>
                <a href="#" id="forgot-password-link" class="text-sm text-indigo-600 hover:underline">Quên mật khẩu?</a>
            </div>
            <div class="flex justify-center mb-3">
                <div class="cf-turnstile" data-sitekey="<?= htmlspecialchars($general_data['captcha_siteKey']) ?>"></div>
            </div>

            <button
                type="submit"
                class="w-full bg-indigo-600 text-white py-2 px-4 rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-offset-2 mb-4">
                Đăng nhập
            </button>

            <!-- Nút đăng nhập bằng Google -->
            <a href="/login/google"
                type="button"
                class="w-full bg-white text-gray-700 py-2 px-4 border border-gray-300 rounded-md hover:bg-gray-50 focus:outline-none focus:ring-offset-2 flex items-center justify-center">
                <i class="fab fa-google mr-2 text-red-500"></i>
                Đăng nhập bằng Google
            </a>
        </form>

        <!-- Link đăng ký -->
        <p class="mt-4 text-center text-sm text-gray-600">
            Chưa có tài khoản?
            <a href="/register" class="text-indigo-600 hover:underline">Đăng ký ngay</a>
        </p>
    </div>
    <div id="modal2fa" class="fixed inset-0 bg-gray-900 bg-opacity-50 hidden items-center justify-center z-50">
        <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-sm">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-lg font-semibold text-gray-900">Xác thực 2 lớp</h3>
                <button id="2fa-modal-close" class="text-gray-500 hover:text-gray-700">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <p class="text-sm text-gray-600 mb-4">Vui lòng nhập mã 6 chữ số từ ứng dụng xác thực (như Google Authenticator).</p>
            <div class="mb-4">
                <label for="totp-code" class="block text-sm font-medium text-gray-700">Mã xác thực</label>
                <input
                    type="text"
                    id="totp-code"
                    class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    placeholder="Nhập mã 6 chữ số"
                    maxlength="6"
                    required>
                <input type="hidden" id="2fa-user-id">
            </div>
            <div class="flex justify-end space-x-2">
                <button id="2fa-modal-close-btn" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300">Hủy</button>
                <button id="2fa-submit-btn" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700">Xác thực</button>
            </div>
        </div>
    </div>
    <div id="forgot-password-modal" class="fixed inset-0 bg-gray-900 bg-opacity-50 hidden items-center justify-center z-50">
        <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-sm">
            <form id="forgotPasswordForm">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-semibold text-gray-900">Khôi phục mật khẩu</h3>
                    <button type="button" id="forgot-password-modal-close" class="text-gray-500 hover:text-gray-700">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <p class="text-sm text-gray-600 mb-4">Nhập địa chỉ email của bạn để nhận liên kết đặt lại mật khẩu.</p>
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                        placeholder="Nhập email"
                        required>
                    <input type="hidden" name="_token" value="<?= htmlspecialchars(generate_csrf_token()) ?>" />
                </div>
                <div class="flex justify-center mb-3">
                    <div class="cf-turnstile" data-sitekey="<?= htmlspecialchars($general_data['captcha_siteKey']) ?>"></div>
                </div>
                <div class="flex justify-end space-x-2">
                    <button type="button" id="forgot-password-modal-close-btn" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300">Hủy</button>
                    <button type="submit" id="forgot-password-submit-btn" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700">Gửi</button>
                </div>
            </form>
        </div>
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
            $('#loginForm').on('submit', function(e) {
                e.preventDefault();
                const form = this;
                const formData = $(form).serialize();
                const username = $('#username').val();
                const password = $('#password').val();

                if (!username || !password) {
                    Notiflix.Notify.failure('Vui lòng nhập đầy đủ thông tin!');
                    return;
                }

                Notiflix.Loading.circle('Đang xử lý đăng nhập...');

                $.ajax({
                    url: '/model/login',
                    type: 'POST',
                    dataType: 'json',
                    data: formData,
                    success: function(data) {
                        Notiflix.Loading.remove();
                        if (data.status == "success") {
                            Notiflix.Notify.success('Đăng nhập thành công, đang chuyển hướng tới trang quản lý.');
                            setTimeout(() => {
                                window.location.href = '/user/order/create';
                            }, 2000);
                        } else if (data.status == '2fa_required') {
                            $('#modal2fa').removeClass('hidden').addClass('flex');
                            $('#2fa-user-id').val(data.user_id);
                        } else {
                            Notiflix.Notify.failure(data.msg);
                        }
                    },
                    error: function(xhr, status, error) {
                        Notiflix.Loading.remove();
                        Notiflix.Notify.failure('Có lỗi xảy ra: ' + error);
                    }
                });
            });

            $('#2fa-submit-btn').click(function() {
                const totpCode = $('#totp-code').val().trim();
                const userId = $('#2fa-user-id').val();
                if (!totpCode || totpCode.length !== 6 || !/^\d+$/.test(totpCode)) {
                    Notiflix.Notify.failure('Vui lòng nhập mã 6 chữ số hợp lệ');
                    return;
                }

                const formData = new FormData();
                formData.append('totp_code', totpCode);
                formData.append('user_id', userId);
                Notiflix.Loading.circle('Đang xác thực 2FA...');
                $.ajax({
                    url: '/model/verify/2fa',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        Notiflix.Loading.remove();
                        if (response.status === "success") {
                            Notiflix.Notify.success(response.msg);
                            setTimeout(() => window.location.href = '/user/order/create', 1500);
                        } else {
                            Notiflix.Notify.failure(response.msg || 'Lỗi không xác định');
                        }
                    },
                    error: function(xhr, status, error) {
                        Notiflix.Loading.remove();
                        Notiflix.Notify.failure('Lỗi kết nối: ' + error);
                    }
                });
            });
            $('#forgotPasswordForm').on('submit', function(e) {
                e.preventDefault();
                const form = this;
                const formData = $(form).serialize();
                const email = $('#email').val().trim();
               
                if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                    Notiflix.Notify.failure('Vui lòng nhập địa chỉ email hợp lệ!');
                    return;
                }

                Notiflix.Loading.circle('Đang gửi yêu cầu khôi phục...');
                $.ajax({
                    url: '/model/forgot-password',
                    type: 'POST',
                    data: formData,
                    dataType: 'json',
                    success: function(data) {
                        Notiflix.Loading.remove();
                        if (data.status === 'success') {
                            Notiflix.Notify.success(data.msg);
                            $('#forgot-password-modal').removeClass('flex').addClass('hidden');
                            $('#email').val('');
                        } else {
                            Notiflix.Notify.failure(data.msg || 'Lỗi không xác định');
                        }
                    },
                    error: function(xhr, status, error) {
                        Notiflix.Loading.remove();
                        Notiflix.Notify.failure('Lỗi kết nối: ' + error);
                    }
                });
            });

            $('#forgot-password-modal-close, #forgot-password-modal-close-btn').click(function() {
                $('#forgot-password-modal').removeClass('flex').addClass('hidden');
                $('#email').val('');
            });

            $('#2fa-modal-close, #2fa-modal-close-btn').click(function() {
                $('#modal2fa').removeClass('flex').addClass('hidden');
                $('#totp-code').val('');
                $('#2fa-user-id').val('');
            });

            $('#forgot-password-link').click(function(e) {
                e.preventDefault();
                $('#forgot-password-modal').removeClass('hidden').addClass('flex');
                $('#email').focus();
            });
        });
    </script>
</body>

</html>