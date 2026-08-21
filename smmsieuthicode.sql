-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th1 12, 2026 lúc 02:33 PM
-- Phiên bản máy phục vụ: 8.0.24
-- Phiên bản PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `smmsieuthicode`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_access` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `image`, `image_driver`, `phone`, `address`, `admin_access`, `last_login`, `last_seen`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '$2y$10$SO42YHlHb5T4g0w3fdqO3OKhz/AnUPiY7xtn1pN1UmGK0466gGETm', 'adminProfileImage/M8OqVZo7MGBPLQU7TLMGZoT712hSfz.webp', 'local', '+4455541455', 'NY City, USA', NULL, '2025-01-04 17:31:50', '2025-01-04 21:32:52', 1, 'VVc48297Zty0UT0tBRuG1pDpSgXNGSQJJM7wb9FDomoZgFrtCDTamW9Q2SaT', NULL, '2025-01-04 15:32:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `affiliates`
--

CREATE TABLE `affiliates` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `affiliate_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `affiliates`
--

INSERT INTO `affiliates` (`id`, `user_id`, `affiliate_code`, `created_at`) VALUES
(2, 1, 'aff_6803b3963039c', '2025-04-19 14:30:46'),
(4, 3, 'aff_68064d448b956', '2025-04-21 13:51:00'),
(5, 7, 'aff_680905dbac59b', '2025-04-23 15:23:07'),
(6, 2, 'aff_6816e39f34aa1', '2025-05-04 03:48:47'),
(7, 18, 'aff_681c4b5a9fb8f', '2025-05-08 17:12:42'),
(8, 22, 'aff_681c536596582', '2025-05-08 17:47:01'),
(9, 27, 'aff_681c6356c2bcd', '2025-05-08 18:55:02'),
(10, 29, 'aff_681c6bef63457', '2025-05-08 19:31:43'),
(11, 30, 'aff_681c6c51c6eb9', '2025-05-08 19:33:21'),
(12, 34, 'aff_681c8d16a7dc0', '2025-05-08 21:53:10'),
(13, 51, 'aff_681d8c0722887', '2025-05-09 16:00:55'),
(14, 37, 'aff_681ef4e246e0d', '2025-05-10 17:40:34'),
(15, 79, 'aff_681f6778dd7dc', '2025-05-11 01:49:28'),
(16, 95, 'aff_6820bb5c499d5', '2025-05-12 01:59:40'),
(17, 99, 'aff_68210af35a7f7', '2025-05-12 07:39:15'),
(18, 134, 'aff_68261c8e8f8b9', '2025-05-16 03:55:42'),
(19, 156, 'aff_682a2593578f4', '2025-05-19 05:23:15'),
(20, 172, 'aff_682de6c075174', '2025-05-22 01:44:16'),
(21, 176, 'aff_682ed3028f63f', '2025-05-22 18:32:18'),
(22, 126, 'aff_6832c306d95d5', '2025-05-25 18:13:10'),
(23, 198, 'aff_6834a02660a2f', '2025-05-27 04:08:54'),
(24, 199, 'aff_6835b68ad455d', '2025-05-27 23:56:42'),
(25, 230, 'aff_683fc379cfedb', '2025-06-04 03:54:33'),
(26, 256, 'aff_684b6bd4abb99', '2025-06-13 00:07:48'),
(27, 257, 'aff_684b74103c063', '2025-06-13 00:42:56'),
(28, 283, 'aff_6853c0976088f', '2025-06-19 07:47:35'),
(29, 297, 'aff_685f3de945b49', '2025-06-28 00:57:13'),
(30, 234, 'aff_686e498f4223b', '2025-07-09 10:50:55'),
(31, 284, 'aff_6887803c3b72d', '2025-07-28 13:50:52'),
(32, 75, 'aff_68a21b6628926', '2025-08-17 18:11:50'),
(33, 380, 'aff_68befadcab15e', '2025-09-08 15:48:44'),
(34, 405, 'aff_68ece8e1f0780', '2025-10-13 18:56:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `affiliate_clicks`
--

CREATE TABLE `affiliate_clicks` (
  `id` int NOT NULL,
  `affiliate_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `affiliate_clicks`
--

INSERT INTO `affiliate_clicks` (`id`, `affiliate_code`, `ip_address`, `clicked_at`) VALUES
(1, 'aff_6803b3963039c', '::1', '2025-04-19 15:29:24'),
(2, 'aff_6803b3963039c', '::1', '2025-04-21 12:50:28'),
(3, 'aff_681ef4e246e0d', '172.71.124.235', '2025-05-10 17:40:47'),
(4, 'aff_682ed3028f63f', '172.68.211.105', '2025-05-22 18:32:28'),
(5, 'aff_684b74103c063', '172.68.165.132', '2025-06-13 00:44:16'),
(6, 'aff_684b74103c063', '172.68.165.138', '2025-06-13 00:44:52'),
(7, 'aff_683fc379cfedb', '172.70.196.136', '2025-06-13 14:46:01'),
(8, 'aff_683fc379cfedb', '172.70.196.133', '2025-06-13 15:02:55'),
(9, 'aff_683fc379cfedb', '162.158.179.117', '2025-06-13 23:37:49'),
(10, 'aff_685f3de945b49', '172.68.164.73', '2025-06-28 00:57:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `affiliate_conversions`
--

CREATE TABLE `affiliate_conversions` (
  `id` int NOT NULL,
  `affiliate_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `converted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `affiliate_conversions`
--

INSERT INTO `affiliate_conversions` (`id`, `affiliate_code`, `amount`, `commission`, `status`, `converted_at`) VALUES
(4, 'aff_6803b3963039c', 5000.00, 250.00, 'completed', '2025-04-20 14:47:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `api_providers`
--

CREATE TABLE `api_providers` (
  `id` bigint UNSIGNED NOT NULL,
  `api_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversion_rate` double(18,8) NOT NULL DEFAULT '0.00000000',
  `rate_per_1k` int DEFAULT '1',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `auto_sync` int DEFAULT '1',
  `auto_import` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price_percentage_increase` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

CREATE TABLE `authors` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:inactive, 1:active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`id`, `image`, `image_driver`, `status`, `created_at`, `updated_at`) VALUES
(1, 'blog/km09l8i4tKYofMkcTQ0tZHXtBCZxYY.webp', 'local', 1, '2024-08-30 18:45:11', '2024-10-02 02:17:36'),
(2, 'blog/THqaDKUZB00Ca1xKHi4QEYPscMW0Wz.webp', 'local', 1, '2024-08-30 20:01:57', '2024-08-30 20:01:57'),
(3, 'blog/mZmD4vDGOfqk2J2hxj4UuRgyyI93sb.webp', 'local', 1, '2024-11-07 04:31:20', '2024-11-07 04:31:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author_details`
--

CREATE TABLE `author_details` (
  `id` bigint UNSIGNED NOT NULL,
  `author_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `social_media` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `author_details`
--

INSERT INTO `author_details` (`id`, `author_id`, `language_id`, `name`, `slug`, `address`, `description`, `social_media`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Harry Porter', 'harry-porter', 'London, United Kingdom', '<p>Harry Porter is a blog author known for his insightful and engaging content. He often writes about technology, programming, and web development, providing practical solutions and tutorials for developers. His expertise spans areas like Laravel, Vue.js, and various web frameworks, making his articles valuable for both beginners and experienced developers.</p>', '[{\"social_media_name\":\"Facebook\",\"icon\":\"fab fa-accessible-icon\",\"link\":\"https:\\/\\/facebook.com\\/\"},{\"social_media_name\":\"Twitter\",\"icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/x.com\\/\"},{\"social_media_name\":\"Linkedin\",\"icon\":\"fab fa-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/\"},{\"social_media_name\":\"Instagram\",\"icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}]', '2024-08-30 18:45:11', '2024-10-02 02:19:02'),
(2, 2, 1, 'Jubayer Islam', 'jubayer-islam', 'Dhaka, Bangladesh', '<p>Jubayer Islam is a blog author known for his insightful and engaging content. He often writes about technology, programming, and web development, providing practical solutions and tutorials for developers. His expertise spans areas like Laravel, Vue.js, and various web frameworks, making his articles valuable for both beginners and experienced developers.</p>', '[{\"social_media_name\":\"Facebook\",\"icon\":\"fab fa-facebook-f\",\"link\":\"https:\\/\\/facebook.com\\/\"},{\"social_media_name\":\"Twitter\",\"icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/x.com\\/\"},{\"social_media_name\":\"Linkedin\",\"icon\":\"fab fa-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/\"},{\"social_media_name\":\"Instagram\",\"icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}]', '2024-08-30 20:01:57', '2024-10-30 02:41:40'),
(8, 3, 1, 'Hermione Granger', 'hermione-granger', 'Dublin, Ireland', '<p>Passionate about transforming complex ideas into engaging stories, Hermione Granger is a skilled blog writer with a knack for creating content that resonates with readers.A voracious reader and meticulous researcher, they have a talent for weaving facts into compelling narratives that inform and enchant.</p>', '[{\"social_media_name\":\"Facebook\",\"icon\":\"fab fa-accessible-icon\",\"link\":\"https:\\/\\/facebook.com\\/\"},{\"social_media_name\":\"Twitter\",\"icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/x.com\\/\"},{\"social_media_name\":\"Linkedin\",\"icon\":\"fab fa-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/\"},{\"social_media_name\":\"Instagram\",\"icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}]', '2024-11-07 04:31:20', '2024-11-07 04:31:20'),
(9, 3, 2, 'Hermione Granger', 'hermione-granger', 'Dublin, Ireland', '<p>Apasionada por transformar ideas complejas en historias atractivas, Hermione Granger es una hábil escritora de blogs con una habilidad especial para crear contenido que resuene en los lectores. Lectora voraz e investigadora meticulosa, tiene talento para entrelazar hechos en narrativas convincentes que informan y encantan.</p>', '[{\"social_media_name\":\"Facebook\",\"icon\":\"fab fa-accessible-icon\",\"link\":\"https:\\/\\/facebook.com\\/\"},{\"social_media_name\":\"Twitter\",\"icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/x.com\\/\"},{\"social_media_name\":\"Linkedin\",\"icon\":\"fab fa-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/\"},{\"social_media_name\":\"Instagram\",\"icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}]', '2024-11-07 04:32:50', '2024-11-07 04:34:18'),
(10, 2, 2, 'Jubayer Islam', 'jubayer-islam', 'Dhaka, Bangladesh', '<p>Jubayer Islam es un autor de blog conocido por su contenido revelador y atractivo. A menudo escribe sobre tecnología, programación y desarrollo web, brindando soluciones prácticas y tutoriales para desarrolladores. Su experiencia abarca áreas como Laravel, Vue.js y varios marcos web, lo que hace que sus artículos sean valiosos tanto para principiantes como para desarrolladores experimentados.</p>', '[{\"social_media_name\":\"Facebook\",\"icon\":\"fab fa-facebook-f\",\"link\":\"https:\\/\\/facebook.com\\/\"},{\"social_media_name\":\"Twitter\",\"icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/x.com\\/\"},{\"social_media_name\":\"Linkedin\",\"icon\":\"fab fa-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/\"},{\"social_media_name\":\"Instagram\",\"icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}]', '2024-11-07 04:44:15', '2024-11-07 04:44:15'),
(11, 1, 2, 'Harry Porter', 'harry-porter', 'London, United Kingdom', '<p>Harry Porter es un autor de blogs conocido por su contenido interesante y revelador. A menudo escribe sobre tecnología, programación y desarrollo web, brindando soluciones prácticas y tutoriales para desarrolladores. Su experiencia abarca áreas como Laravel, Vue.js y varios marcos web, lo que hace que sus artículos sean valiosos tanto para principiantes como para desarrolladores experimentados.</p>', '[{\"social_media_name\":\"Facebook\",\"icon\":\"fab fa-accessible-icon\",\"link\":\"https:\\/\\/facebook.com\\/\"},{\"social_media_name\":\"Twitter\",\"icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/x.com\\/\"},{\"social_media_name\":\"Linkedin\",\"icon\":\"fab fa-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/\"},{\"social_media_name\":\"Instagram\",\"icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}]', '2024-11-07 04:46:50', '2024-11-07 04:46:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banks`
--

CREATE TABLE `banks` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_holder` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix_autobank` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banks`
--

INSERT INTO `banks` (`id`, `name`, `code`, `account_holder`, `account_number`, `prefix_autobank`, `token`, `created_at`) VALUES
(13, 'Ngân hàng TMCP Á Châu', 'ACB', 'LE VAN KHANH', '15873021', 'tsr', 'bb326ee2cccc93c30c7d656f3de0e83b', '2025-05-08 16:49:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `basic_controls`
--

CREATE TABLE `basic_controls` (
  `id` bigint UNSIGNED NOT NULL,
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_dashboard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_panel_price` double(8,2) NOT NULL DEFAULT '0.00',
  `admin_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_currency_position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left' COMMENT 'left, right',
  `has_space_between_currency_and_amount` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => no space, 1 => space',
  `is_force_ssl` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active\r\n',
  `is_maintenance_mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => off, 1 => on',
  `paginate` int DEFAULT NULL,
  `strong_password` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => disable, 1 => enable',
  `fraction_number` int DEFAULT NULL,
  `sender_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_email_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `push_notification` tinyint(1) NOT NULL DEFAULT '0',
  `in_app_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `email_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `email_verification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `sms_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `sms_verification` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `tawk_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tawk_status` tinyint(1) NOT NULL DEFAULT '0',
  `fb_messenger_status` tinyint(1) NOT NULL DEFAULT '0',
  `fb_app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_page_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_recaptcha` tinyint(1) DEFAULT '0' COMMENT '0 =>inactive, 1 => active ',
  `google_recaptcha` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>inactive, 1 =>active',
  `manual_recaptcha_admin_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active ',
  `manual_recaptcha_login` tinyint(1) DEFAULT '0' COMMENT '0 = inactive, 1 = active',
  `manual_recaptcha_register` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = inactive, 1 = active',
  `google_recaptcha_admin_login` tinyint(1) DEFAULT '0' COMMENT '0 = inactive, 1 = active',
  `google_recaptcha_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = inactive, 1 = active',
  `google_recaptcha_register` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = inactive, 1 = active',
  `measurement_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analytic_status` tinyint(1) DEFAULT NULL,
  `error_log` tinyint(1) DEFAULT NULL,
  `is_active_cron_notification` tinyint(1) DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_driver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon_driver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_logo_driver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_dark_mode_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_dark_mode_logo_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_layer_access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_layer_auto_update_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_layer_auto_update` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coin_market_cap_app_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coin_market_cap_auto_update_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_market_cap_auto_update` tinyint(1) DEFAULT NULL,
  `deposit_commission` tinyint DEFAULT '0' COMMENT '0 => active, 1 => deactive',
  `automatic_currency_update_permission` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `auto_currency_update` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => off, 1 => on',
  `date_time_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookie_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookie_sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookie_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookie_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: active, 0: inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `basic_controls`
--

INSERT INTO `basic_controls` (`id`, `theme`, `user_dashboard`, `site_title`, `time_zone`, `base_currency`, `currency_symbol`, `child_panel_price`, `admin_prefix`, `is_currency_position`, `has_space_between_currency_and_amount`, `is_force_ssl`, `is_maintenance_mode`, `paginate`, `strong_password`, `registration`, `fraction_number`, `sender_email`, `sender_email_name`, `email_description`, `push_notification`, `in_app_notification`, `email_notification`, `email_verification`, `sms_notification`, `sms_verification`, `tawk_id`, `tawk_status`, `fb_messenger_status`, `fb_app_id`, `fb_page_id`, `manual_recaptcha`, `google_recaptcha`, `manual_recaptcha_admin_login`, `manual_recaptcha_login`, `manual_recaptcha_register`, `google_recaptcha_admin_login`, `google_recaptcha_login`, `google_recaptcha_register`, `measurement_id`, `analytic_status`, `error_log`, `is_active_cron_notification`, `logo`, `logo_driver`, `favicon`, `favicon_driver`, `admin_logo`, `admin_logo_driver`, `admin_dark_mode_logo`, `admin_dark_mode_logo_driver`, `currency_layer_access_key`, `currency_layer_auto_update_at`, `currency_layer_auto_update`, `coin_market_cap_app_key`, `coin_market_cap_auto_update_at`, `coin_market_cap_auto_update`, `deposit_commission`, `automatic_currency_update_permission`, `auto_currency_update`, `date_time_format`, `cookie_title`, `cookie_sub_title`, `cookie_url`, `cookie_status`, `created_at`, `updated_at`) VALUES
(1, 'light_green', 'user_dashboard_style_one', 'SMM Matrix', 'Asia/Dhaka', 'USD', '$', 0.00, 'admin', 'right', 1, 0, 0, 20, 0, 1, 2, 'support@achi.com', 'Bug Admin', '<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n<meta name=\"viewport\" content=\"width=device-width\">\r\n<style type=\"text/css\">\r\n    @media only screen and (min-width: 620px) {\r\n        * [lang=x-wrapper] h1 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h3 {\r\n        }\r\n\r\n        * [lang=x-layout__inner] p,\r\n        * [lang=x-layout__inner] ol,\r\n        * [lang=x-layout__inner] ul {\r\n        }\r\n\r\n        * div [lang=x-size-8] {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important\r\n        }\r\n\r\n        * div [lang=x-size-9] {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important\r\n        }\r\n\r\n        * div [lang=x-size-10] {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important\r\n        }\r\n\r\n        * div [lang=x-size-11] {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-12] {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-13] {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-14] {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-15] {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important\r\n        }\r\n\r\n        * div [lang=x-size-16] {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important\r\n        }\r\n\r\n        * div [lang=x-size-17] {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-20] {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * div [lang=x-size-22] {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important\r\n        }\r\n\r\n        * div [lang=x-size-24] {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important\r\n        }\r\n\r\n        * div [lang=x-size-26] {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * div [lang=x-size-28] {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important\r\n        }\r\n\r\n        * div [lang=x-size-30] {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important\r\n        }\r\n\r\n        * div [lang=x-size-32] {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important\r\n        }\r\n\r\n        * div [lang=x-size-34] {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-36] {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-40] {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important\r\n        }\r\n\r\n        * div [lang=x-size-44] {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important\r\n        }\r\n\r\n        * div [lang=x-size-48] {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important\r\n        }\r\n\r\n        * div [lang=x-size-56] {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important\r\n        }\r\n\r\n        * div [lang=x-size-64] {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important\r\n        }\r\n    }\r\n</style>\r\n<style type=\"text/css\">\r\n    body {\r\n        margin: 0;\r\n        padding: 0;\r\n    }\r\n\r\n    table {\r\n        border-collapse: collapse;\r\n        table-layout: fixed;\r\n    }\r\n\r\n    * {\r\n        line-height: inherit;\r\n    }\r\n\r\n    [x-apple-data-detectors],\r\n    [href^=\"tel\"],\r\n    [href^=\"sms\"] {\r\n        color: inherit !important;\r\n        text-decoration: none !important;\r\n    }\r\n\r\n    .wrapper .footer__share-button a:hover,\r\n    .wrapper .footer__share-button a:focus {\r\n        color: #ffffff !important;\r\n    }\r\n\r\n    .btn a:hover,\r\n    .btn a:focus,\r\n    .footer__share-button a:hover,\r\n    .footer__share-button a:focus,\r\n    .email-footer__links a:hover,\r\n    .email-footer__links a:focus {\r\n        opacity: 0.8;\r\n    }\r\n\r\n    .preheader,\r\n    .header,\r\n    .layout,\r\n    .column {\r\n        transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;\r\n    }\r\n\r\n    .layout,\r\n    .header {\r\n        max-width: 400px !important;\r\n        -fallback-width: 95% !important;\r\n        width: calc(100% - 20px) !important;\r\n    }\r\n\r\n    div.preheader {\r\n        max-width: 360px !important;\r\n        -fallback-width: 90% !important;\r\n        width: calc(100% - 60px) !important;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        Float: none !important;\r\n    }\r\n\r\n    .column {\r\n        max-width: 400px !important;\r\n        width: 100% !important;\r\n    }\r\n\r\n    .fixed-width.has-border {\r\n        max-width: 402px !important;\r\n    }\r\n\r\n    .fixed-width.has-border .layout__inner {\r\n        box-sizing: border-box;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        width: 50% !important;\r\n    }\r\n\r\n    .ie .btn {\r\n        width: 100%;\r\n    }\r\n\r\n    .ie .column,\r\n    [owa] .column,\r\n    .ie .gutter,\r\n    [owa] .gutter {\r\n        display: table-cell;\r\n        float: none !important;\r\n        vertical-align: top;\r\n    }\r\n\r\n    .ie div.preheader,\r\n    [owa] div.preheader,\r\n    .ie .email-footer,\r\n    [owa] .email-footer {\r\n        max-width: 560px !important;\r\n        width: 560px !important;\r\n    }\r\n\r\n    .ie .snippet,\r\n    [owa] .snippet,\r\n    .ie .webversion,\r\n    [owa] .webversion {\r\n        width: 280px !important;\r\n    }\r\n\r\n    .ie .header,\r\n    [owa] .header,\r\n    .ie .layout,\r\n    [owa] .layout,\r\n    .ie .one-col .column,\r\n    [owa] .one-col .column {\r\n        max-width: 600px !important;\r\n        width: 600px !important;\r\n    }\r\n\r\n    .ie .fixed-width.has-border,\r\n    [owa] .fixed-width.has-border,\r\n    .ie .has-gutter.has-border,\r\n    [owa] .has-gutter.has-border {\r\n        max-width: 602px !important;\r\n        width: 602px !important;\r\n    }\r\n\r\n    .ie .two-col .column,\r\n    [owa] .two-col .column {\r\n        width: 300px !important;\r\n    }\r\n\r\n    .ie .three-col .column,\r\n    [owa] .three-col .column,\r\n    .ie .narrow,\r\n    [owa] .narrow {\r\n        width: 200px !important;\r\n    }\r\n\r\n    .ie .wide,\r\n    [owa] .wide {\r\n        width: 400px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter .column,\r\n    [owa] .two-col.x_has-gutter .column {\r\n        width: 290px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter .column,\r\n    [owa] .three-col.x_has-gutter .column,\r\n    .ie .has-gutter .narrow,\r\n    [owa] .has-gutter .narrow {\r\n        width: 188px !important;\r\n    }\r\n\r\n    .ie .has-gutter .wide,\r\n    [owa] .has-gutter .wide {\r\n        width: 394px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter.has-border .column,\r\n    [owa] .two-col.x_has-gutter.x_has-border .column {\r\n        width: 292px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter.has-border .column,\r\n    [owa] .three-col.x_has-gutter.x_has-border .column,\r\n    .ie .has-gutter.has-border .narrow,\r\n    [owa] .has-gutter.x_has-border .narrow {\r\n        width: 190px !important;\r\n    }\r\n\r\n    .ie .has-gutter.has-border .wide,\r\n    [owa] .has-gutter.x_has-border .wide {\r\n        width: 396px !important;\r\n    }\r\n\r\n    .ie .fixed-width .layout__inner {\r\n        border-left: 0 none white !important;\r\n        border-right: 0 none white !important;\r\n    }\r\n\r\n    .ie .layout__edges {\r\n        display: none;\r\n    }\r\n\r\n    .mso .layout__edges {\r\n        font-size: 0;\r\n    }\r\n\r\n    .layout-fixed-width,\r\n    .mso .layout-full-width {\r\n        background-color: #ffffff;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n\r\n        .column,\r\n        .gutter {\r\n            display: table-cell;\r\n            Float: none !important;\r\n            vertical-align: top;\r\n        }\r\n\r\n        div.preheader,\r\n        .email-footer {\r\n            max-width: 560px !important;\r\n            width: 560px !important;\r\n        }\r\n\r\n        .snippet,\r\n        .webversion {\r\n            width: 280px !important;\r\n        }\r\n\r\n        .header,\r\n        .layout,\r\n        .one-col .column {\r\n            max-width: 600px !important;\r\n            width: 600px !important;\r\n        }\r\n\r\n        .fixed-width.has-border,\r\n        .fixed-width.ecxhas-border,\r\n        .has-gutter.has-border,\r\n        .has-gutter.ecxhas-border {\r\n            max-width: 602px !important;\r\n            width: 602px !important;\r\n        }\r\n\r\n        .two-col .column {\r\n            width: 300px !important;\r\n        }\r\n\r\n        .three-col .column,\r\n        .column.narrow {\r\n            width: 200px !important;\r\n        }\r\n\r\n        .column.wide {\r\n            width: 400px !important;\r\n        }\r\n\r\n        .two-col.has-gutter .column,\r\n        .two-col.ecxhas-gutter .column {\r\n            width: 290px !important;\r\n        }\r\n\r\n        .three-col.has-gutter .column,\r\n        .three-col.ecxhas-gutter .column,\r\n        .has-gutter .narrow {\r\n            width: 188px !important;\r\n        }\r\n\r\n        .has-gutter .wide {\r\n            width: 394px !important;\r\n        }\r\n\r\n        .two-col.has-gutter.has-border .column,\r\n        .two-col.ecxhas-gutter.ecxhas-border .column {\r\n            width: 292px !important;\r\n        }\r\n\r\n        .three-col.has-gutter.has-border .column,\r\n        .three-col.ecxhas-gutter.ecxhas-border .column,\r\n        .has-gutter.has-border .narrow,\r\n        .has-gutter.ecxhas-border .narrow {\r\n            width: 190px !important;\r\n        }\r\n\r\n        .has-gutter.has-border .wide,\r\n        .has-gutter.ecxhas-border .wide {\r\n            width: 396px !important;\r\n        }\r\n    }\r\n\r\n    @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {\r\n        .fblike {\r\n            background-image: url(https://i3.createsend1.com/static/eb/customise/13-the-blueprint-3/images/fblike@2x.png) !important;\r\n        }\r\n\r\n        .tweet {\r\n            background-image: url(https://i4.createsend1.com/static/eb/customise/13-the-blueprint-3/images/tweet@2x.png) !important;\r\n        }\r\n\r\n        .linkedinshare {\r\n            background-image: url(https://i6.createsend1.com/static/eb/customise/13-the-blueprint-3/images/lishare@2x.png) !important;\r\n        }\r\n\r\n        .forwardtoafriend {\r\n            background-image: url(https://i5.createsend1.com/static/eb/customise/13-the-blueprint-3/images/forward@2x.png) !important;\r\n        }\r\n    }\r\n\r\n    @media (max-width: 321px) {\r\n        .fixed-width.has-border .layout__inner {\r\n            border-width: 1px 0 !important;\r\n        }\r\n\r\n        .layout,\r\n        .column {\r\n            min-width: 320px !important;\r\n            width: 320px !important;\r\n        }\r\n\r\n        .border {\r\n            display: none;\r\n        }\r\n    }\r\n\r\n    .mso div {\r\n        border: 0 none white !important;\r\n    }\r\n\r\n    .mso .w560 .divider {\r\n        margin-left: 260px !important;\r\n        margin-right: 260px !important;\r\n    }\r\n\r\n    .mso .w360 .divider {\r\n        margin-left: 160px !important;\r\n        margin-right: 160px !important;\r\n    }\r\n\r\n    .mso .w260 .divider {\r\n        margin-left: 110px !important;\r\n        margin-right: 110px !important;\r\n    }\r\n\r\n    .mso .w160 .divider {\r\n        margin-left: 60px !important;\r\n        margin-right: 60px !important;\r\n    }\r\n\r\n    .mso .w354 .divider {\r\n        margin-left: 157px !important;\r\n        margin-right: 157px !important;\r\n    }\r\n\r\n    .mso .w250 .divider {\r\n        margin-left: 105px !important;\r\n        margin-right: 105px !important;\r\n    }\r\n\r\n    .mso .w148 .divider {\r\n        margin-left: 54px !important;\r\n        margin-right: 54px !important;\r\n    }\r\n\r\n    .mso .font-avenir,\r\n    .mso .font-cabin,\r\n    .mso .font-open-sans,\r\n    .mso .font-ubuntu {\r\n        font-family: sans-serif !important;\r\n    }\r\n\r\n    .mso .font-bitter,\r\n    .mso .font-merriweather,\r\n    .mso .font-pt-serif {\r\n        font-family: Georgia, serif !important;\r\n    }\r\n\r\n    .mso .font-lato,\r\n    .mso .font-roboto {\r\n        font-family: Tahoma, sans-serif !important;\r\n    }\r\n\r\n    .mso .font-pt-sans {\r\n        font-family: \"Trebuchet MS\", sans-serif !important;\r\n    }\r\n\r\n    .mso .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper .size-8 {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important;\r\n        }\r\n\r\n        .wrapper .size-9 {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important;\r\n        }\r\n\r\n        .wrapper .size-10 {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important;\r\n        }\r\n\r\n        .wrapper .size-11 {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-12 {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-13 {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-14 {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-15 {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important;\r\n        }\r\n\r\n        .wrapper .size-16 {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important;\r\n        }\r\n\r\n        .wrapper .size-17 {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-18 {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-20 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important;\r\n        }\r\n\r\n        .wrapper .size-22 {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important;\r\n        }\r\n\r\n        .wrapper .size-24 {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important;\r\n        }\r\n\r\n        .wrapper .size-26 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important;\r\n        }\r\n\r\n        .wrapper .size-28 {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important;\r\n        }\r\n\r\n        .wrapper .size-30 {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important;\r\n        }\r\n\r\n        .wrapper .size-32 {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important;\r\n        }\r\n\r\n        .wrapper .size-34 {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-36 {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-40 {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important;\r\n        }\r\n\r\n        .wrapper .size-44 {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important;\r\n        }\r\n\r\n        .wrapper .size-48 {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important;\r\n        }\r\n\r\n        .wrapper .size-56 {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important;\r\n        }\r\n\r\n        .wrapper .size-64 {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important;\r\n        }\r\n    }\r\n\r\n    .mso .size-8,\r\n    .ie .size-8 {\r\n        font-size: 8px !important;\r\n        line-height: 14px !important;\r\n    }\r\n\r\n    .mso .size-9,\r\n    .ie .size-9 {\r\n        font-size: 9px !important;\r\n        line-height: 16px !important;\r\n    }\r\n\r\n    .mso .size-10,\r\n    .ie .size-10 {\r\n        font-size: 10px !important;\r\n        line-height: 18px !important;\r\n    }\r\n\r\n    .mso .size-11,\r\n    .ie .size-11 {\r\n        font-size: 11px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-12,\r\n    .ie .size-12 {\r\n        font-size: 12px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-13,\r\n    .ie .size-13 {\r\n        font-size: 13px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-14,\r\n    .ie .size-14 {\r\n        font-size: 14px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-15,\r\n    .ie .size-15 {\r\n        font-size: 15px !important;\r\n        line-height: 23px !important;\r\n    }\r\n\r\n    .mso .size-16,\r\n    .ie .size-16 {\r\n        font-size: 16px !important;\r\n        line-height: 24px !important;\r\n    }\r\n\r\n    .mso .size-17,\r\n    .ie .size-17 {\r\n        font-size: 17px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-18,\r\n    .ie .size-18 {\r\n        font-size: 18px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-20,\r\n    .ie .size-20 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important;\r\n    }\r\n\r\n    .mso .size-22,\r\n    .ie .size-22 {\r\n        font-size: 22px !important;\r\n        line-height: 31px !important;\r\n    }\r\n\r\n    .mso .size-24,\r\n    .ie .size-24 {\r\n        font-size: 24px !important;\r\n        line-height: 32px !important;\r\n    }\r\n\r\n    .mso .size-26,\r\n    .ie .size-26 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important;\r\n    }\r\n\r\n    .mso .size-28,\r\n    .ie .size-28 {\r\n        font-size: 28px !important;\r\n        line-height: 36px !important;\r\n    }\r\n\r\n    .mso .size-30,\r\n    .ie .size-30 {\r\n        font-size: 30px !important;\r\n        line-height: 38px !important;\r\n    }\r\n\r\n    .mso .size-32,\r\n    .ie .size-32 {\r\n        font-size: 32px !important;\r\n        line-height: 40px !important;\r\n    }\r\n\r\n    .mso .size-34,\r\n    .ie .size-34 {\r\n        font-size: 34px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-36,\r\n    .ie .size-36 {\r\n        font-size: 36px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-40,\r\n    .ie .size-40 {\r\n        font-size: 40px !important;\r\n        line-height: 47px !important;\r\n    }\r\n\r\n    .mso .size-44,\r\n    .ie .size-44 {\r\n        font-size: 44px !important;\r\n        line-height: 50px !important;\r\n    }\r\n\r\n    .mso .size-48,\r\n    .ie .size-48 {\r\n        font-size: 48px !important;\r\n        line-height: 54px !important;\r\n    }\r\n\r\n    .mso .size-56,\r\n    .ie .size-56 {\r\n        font-size: 56px !important;\r\n        line-height: 60px !important;\r\n    }\r\n\r\n    .mso .size-64,\r\n    .ie .size-64 {\r\n        font-size: 64px !important;\r\n        line-height: 63px !important;\r\n    }\r\n\r\n    .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n</style>\r\n\r\n<title></title>\r\n<!--[if !mso]><!-->\r\n<style type=\"text/css\">\r\n    @import url(https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400);\r\n</style>\r\n<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400\" rel=\"stylesheet\" type=\"text/css\">\r\n<!--<![endif]-->\r\n<style type=\"text/css\">\r\n    body {\r\n        background-color: #f5f7fa\r\n    }\r\n\r\n    .mso h1 {\r\n    }\r\n\r\n    .mso h1 {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso h2 {\r\n    }\r\n\r\n    .mso h3 {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .btn a {\r\n    }\r\n\r\n    .mso .btn a {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .logo {\r\n    }\r\n\r\n    .mso .logo {\r\n        font-family: Tahoma, sans-serif !important\r\n    }\r\n\r\n    .logo a:hover,\r\n    .logo a:focus {\r\n        color: #859bb1 !important\r\n    }\r\n\r\n    .mso .layout-has-border {\r\n        border-top: 1px solid #b1c1d8;\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .layout-has-bottom-border {\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .border,\r\n    .ie .border {\r\n        background-color: #b1c1d8\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper h1 {\r\n        }\r\n\r\n        .wrapper h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        .wrapper h2 {\r\n        }\r\n\r\n        .wrapper h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        .wrapper h3 {\r\n        }\r\n\r\n        .column p,\r\n        .column ol,\r\n        .column ul {\r\n        }\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important\r\n    }\r\n\r\n    .mso h3,\r\n    .ie h3 {\r\n    }\r\n\r\n    .mso .layout__inner p,\r\n    .ie .layout__inner p,\r\n    .mso .layout__inner ol,\r\n    .ie .layout__inner ol,\r\n    .mso .layout__inner ul,\r\n    .ie .layout__inner ul {\r\n    }\r\n</style>\r\n<meta name=\"robots\" content=\"noindex,nofollow\">\r\n\r\n<meta property=\"og:title\" content=\"Just One More Step\">\r\n\r\n<link href=\"https://css.createsend1.com/css/social.min.css?h=0ED47CE120160920\" media=\"screen,projection\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n<div class=\"wrapper\" style=\"min-width: 320px;background-color: #f5f7fa;\" lang=\"x-wrapper\">\r\n    <div class=\"preheader\" style=\"margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;\">\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #c4e5dc;\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-left: 20px;margin-right: 20px;margin-top: 24px;margin-bottom: 24px;\">\r\n                        <h1 style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            <img style=\"width: 200px;\" src=\"https://bug-finder.s3.ap-southeast-1.amazonaws.com/assets/logo/header-logo.svg\" data-filename=\"imageedit_76_3542310111.png\"></h1>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n                <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\" lang=\"x-layout__inner\">\r\n                    <div class=\"column\" style=\"text-align: left; background: rgb(237, 241, 235); line-height: 21px; max-width: 600px; min-width: 320px; width: 320px;\">\r\n\r\n                        <div style=\"color: rgb(96, 102, 109); font-size: 14px; margin-left: 20px; margin-right: 20px; margin-top: 24px;\">\r\n                            <div style=\"line-height:10px;font-size:1px\">&nbsp;</div>\r\n                        </div>\r\n\r\n                        <div style=\"margin-left: 20px; margin-right: 20px;\">\r\n\r\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 16px; margin-bottom: 0px;\"><strong>Hello [[name]],</strong></p>\r\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 20px; margin-bottom: 20px;\"><strong>[[message]]</strong></p>\r\n                            <p style=\"margin-top: 20px; margin-bottom: 20px;\"><strong style=\"color: rgb(96, 102, 109); font-size: 14px;\">Sincerely,<br>Team&nbsp;</strong><font color=\"#60666d\"><b>Bug Finder</b></font></p>\r\n                        </div>\r\n\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #2c3262; margin-bottom: 20px\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-top: 5px;margin-bottom: 5px;\">\r\n                        <p style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #ffffff;font-size: 16px;line-height: 35px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            2024 ©  All Right Reserved</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n        </div>\r\n\r\n\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', 0, 0, 0, 0, 0, 0, 'OSLDSF4D', 0, 0, 'KLSDKF789', '654646977', 0, 0, 0, 0, 0, 0, 0, 0, 'aaaaaa', 1, 0, 0, 'logo/Y9bryb3btRgfyeLtk3smwwSrDmu0oD.webp', 'local', 'logo/6fy9Cq0wSqPrQN9uDckKixCAzo14oA.webp', 'local', 'logo/FSJKfpMkv1eY3OJ2TvTxXAh1OZnDYo.webp', 'local', 'logo/9EJNj2XgfhX9vXxPN7Keoz6HSJicPV.webp', 'local', 'dfsgdfg', 'everyMinute', '0', '726ffba5-8523-4071-92d4-1775dbc', 'everyMinute', 0, 0, 0, 0, 'Y/m/d', 'We use cookies!', 'We use cookies to ensure that give you the best experience on your website.', 'https://smm-matrix.bugfinder.app/', 1, '2023-06-13 18:35:41', '2025-01-04 15:13:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blacklist_emails`
--

CREATE TABLE `blacklist_emails` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `reason` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blacklist_ips`
--

CREATE TABLE `blacklist_ips` (
  `id` int NOT NULL,
  `ip` varchar(200) NOT NULL,
  `reason` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blacklist_links`
--

CREATE TABLE `blacklist_links` (
  `id` int NOT NULL,
  `link` varchar(255) NOT NULL,
  `reason` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `views` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_image_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_image_two_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breadcrumb_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breadcrumb_image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breadcrumb_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `page_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `og_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `author_id`, `views`, `thumbnail_image`, `thumbnail_image_driver`, `thumbnail_image_two`, `thumbnail_image_two_driver`, `description_image`, `description_image_driver`, `breadcrumb_image`, `breadcrumb_image_driver`, `breadcrumb_status`, `status`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `og_description`, `meta_robots`, `meta_image`, `meta_image_driver`, `created_at`, `updated_at`) VALUES
(2, 4, 2, '70', 'blog/8q42uXD6TAHHhFLFhBeix8kyFSIeGO.webp', 'local', 'blog/aitarOij2XHiOhBXp11ff9RebDTvn1.webp', 'local', 'blog/ydUfHK8kuakWLwOMqeMZAGap4gD3Ct.webp', 'local', 'blog/TtvxVtsZmoOAqhJGAHbATmBjzwx6HX.webp', 'local', '1', 1, 'Blog Details', NULL, NULL, NULL, NULL, '\"follow\"', NULL, NULL, '2024-03-16 10:07:00', '2024-10-30 09:36:39'),
(3, 2, 2, '116', 'blog/roaSHy1Sxsv4klZLY58zUxk7BCQNmE.webp', 'local', 'blog/WT3Hbq21ahpqAHNF2B8gibIDvZYsdn.webp', 'local', 'blog/St7lvQ6qi6AwyaLiit2aBsgi9XRjyc.webp', 'local', 'blog/MkvG9RK1Nz29Wq2aF78PxPJXlaa821.webp', 'local', '1', 1, 'Blog Details', NULL, NULL, NULL, NULL, '\"index\"', NULL, NULL, '2024-03-16 10:10:51', '2024-12-22 05:39:26'),
(4, 4, 1, '9', 'blog/r1fv9EebUsRZLmVtuzj5icUviL2tBL.webp', 'local', 'blog/j1VFw4kVUb3ApJJ0nzSpn6bhSQPcjD.webp', 'local', 'blog/aI4l7O3YDec2zaesDnyuU9zte6OYbt.webp', 'local', 'blog/B8x9P4zvE1jEFqKFZDfM8GaC3TPdLp.webp', 'local', '1', 1, 'Blog Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-17 07:15:49', '2024-10-30 02:44:03'),
(5, 5, 3, '2', 'blog/4yLFUsPTq1Jtz0HuR0AChFuCstHzFZ.webp', 'local', 'blog/UT87ZmP82YeeVI1JD0UKYokA63L8E9.webp', 'local', 'blog/XhzgcEFf07TnGOiBdYkZvQDgp0OtHT.webp', 'local', NULL, NULL, '0', 1, 'Blog Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 04:57:32', '2024-12-31 12:34:29'),
(6, 3, 1, '30', 'blog/L8tthqqonsqlVgc6ZioUBL2ndPkMyL.webp', 'local', 'blog/0UgpHKh7lRwGJzuNvdDv3FSVU6JJAh.webp', 'local', 'blog/pMS3YQQV0eis5dkNAdtud95OV2ggPP.webp', 'local', NULL, NULL, '0', 1, 'Blog Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 06:21:00', '2025-01-04 15:06:34'),
(7, 6, 1, '4', 'blog/bifTUyrA6LzRQ8eixOo23La8kj5LiF.webp', 'local', 'blog/zLPpK02lPWO6l2XNb3a31DxFnteUee.webp', 'local', 'blog/Y7XwyiZ9ttxC6J3FKhS9kSntZs43lk.webp', 'local', NULL, NULL, '0', 1, 'Blog Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-07 06:28:06', '2024-12-31 12:34:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:inactive, 1:active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-08-30 15:59:35', '2024-08-30 15:59:35'),
(2, 1, '2024-08-30 16:00:00', '2024-08-30 16:00:00'),
(3, 1, '2024-08-30 16:00:09', '2024-11-07 04:49:18'),
(4, 1, '2024-08-30 16:00:18', '2024-08-30 16:00:18'),
(5, 1, '2024-08-30 16:00:28', '2024-11-07 04:49:11'),
(6, 1, '2024-08-30 16:00:36', '2024-08-30 16:04:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog_category_details`
--

CREATE TABLE `blog_category_details` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blog_category_details`
--

INSERT INTO `blog_category_details` (`id`, `category_id`, `language_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Brand Management', 'brand-management', '2024-08-30 15:59:35', '2024-08-30 15:59:35'),
(2, 2, 1, 'Competitive Intelligence', 'competitive-intelligence', '2024-08-30 16:00:00', '2024-08-30 16:00:00'),
(3, 3, 1, 'Content Marketing', 'content-marketing', '2024-08-30 16:00:09', '2024-08-30 16:00:09'),
(4, 4, 1, 'Influencer Marketing', 'influencer-marketing', '2024-08-30 16:00:18', '2024-08-30 16:00:18'),
(5, 5, 1, 'Social Media Management', 'social-media-management', '2024-08-30 16:00:28', '2024-08-30 16:00:28'),
(6, 6, 1, 'Digital Marketing &amp; PR Tools', 'digital-marketing-amp-pr-tools', '2024-08-30 16:00:36', '2024-08-30 16:00:36'),
(7, 6, 2, 'Herramientas de marketing digital y relaciones públicas', 'herramientas-de-marketing-digital-y-relaciones-publicas', '2024-11-07 04:16:21', '2024-11-07 04:16:21'),
(8, 5, 2, 'Gestión de redes sociales', 'gestion-de-redes-sociales', '2024-11-07 04:16:38', '2024-11-07 04:16:38'),
(9, 4, 2, 'Marketing de influencers', 'marketing-de-influencers', '2024-11-07 04:16:49', '2024-11-07 04:16:49'),
(10, 3, 2, 'Marketing de contenidos', 'marketing-de-contenidos', '2024-11-07 04:17:08', '2024-11-07 04:17:08'),
(11, 2, 2, 'Inteligencia Competitiva', 'inteligencia-competitiva', '2024-11-07 04:17:22', '2024-11-07 04:17:22'),
(12, 1, 2, 'Gestión de marca', 'gestion-de-marca', '2024-11-07 04:17:39', '2024-11-07 04:17:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog_details`
--

CREATE TABLE `blog_details` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quote_author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blog_details`
--

INSERT INTO `blog_details` (`id`, `blog_id`, `language_id`, `title`, `slug`, `tags`, `description`, `quote`, `quote_author`, `created_at`, `updated_at`) VALUES
(5, 2, 1, 'Practical Tips and How To Guides', 'practical-tips-and-how-to-guides', '[\"Social Media\",\"Advertising\",\"Campaign\",\"LinkedIn\",\"Pinterest\",\"Analyses\"]', '<p>The Social Media Advertising category of a social marketing blog is dedicated to exploring the intricacies of leveraging paid advertising on various social media platforms to achieve marketing objectives. It covers a wide range of topics including ad formats, targeting options, budgeting strategies, ad creative best practices, and campaign optimization techniques. From beginner\'s guides to advanced tactics, this category provides insights into effectively utilizing platforms such as Facebook, Instagram, Twitter, LinkedIn, Pinterest, and others for advertising purposes. Readers can expect detailed analyses of case studies, updates on platform algorithms and policies, as well as tips for maximizing ROI and achieving business goals through social media advertising campaigns.<br></p>', 'The more time you spend contemplating what you should have done. you lose valuable time planning what you can and will do.', 'Lil Wayne', '2024-03-16 10:07:00', '2024-10-28 01:50:03'),
(6, 3, 1, 'Expert Opinions and Thought Leadership', 'expert-opinions-and-thought-leadership', '[\"Community Management\",\"Facebook\",\"Instagram\",\"Marketing\",\"Social Media\",\"Development\"]', '<p>The Community Manage category of a social marketing blog delves into the strategies, best practices, and tools necessary for fostering and nurturing online communities. It covers topics such as engaging with followers, building rapport, handling feedback and criticism, resolving conflicts, and cultivating a sense of belonging among community members. Additionally, this category explores the role of community managers in maintaining brand loyalty, driving user-generated content, and leveraging community insights for product development and marketing campaigns. Whether it\'s on social media platforms, forums, or other online spaces, readers can expect valuable insights on building and sustaining vibrant communities around their brands.<br></p>', 'Without leaps of imagination or dreaming, we lose the excitement of possibilities. Dreaming, after all is a form of planning.', 'Gloria Steinem', '2024-03-16 10:10:51', '2024-10-28 09:56:45'),
(7, 4, 1, 'Latest Trends and Industry Insights', 'latest-trends-and-industry-insights', '[\"Business\",\"Facebook\",\"Marketing\",\"Social Media\",\"Industry Insights\",\"Trends\",\"Technological\"]', 'The Latest Trends and Industry Insights category of a social marketing blog focuses on providing up-to-date analysis, commentary, and predictions regarding the ever-evolving landscape of social media marketing. This category explores emerging trends, innovative strategies, and shifts in consumer behavior that are shaping the industry. From the adoption of new platforms and features to the impact of cultural movements and technological advancements, readers can expect timely insights and expert perspectives to stay ahead of the curve and adapt their marketing efforts effectively.', 'What I find remarkable is that this next has been the industry\'s standard dummy text ever since some printer in the 1500s took a gallery', 'Douglas lyphe', '2024-03-17 07:15:49', '2024-10-28 01:49:40'),
(8, 4, 2, '¿Cómo sé si la batería de mi automóvil está agotada o recién descargada?', 'latest-trends-and-industry-insights', '[\"Bater\\u00eda\",\"descargada\"]', '<p>Una batería descargada significa que tiene poca energía, pero no necesariamente que no pueda repararse. Puede suceder si las luces o la radio se dejan encendidas durante períodos prolongados sin el motor en marcha. Estas son las señales a las que debe prestar atención: Arranque lento del motor Cuando intenta arrancar el vehículo, el motor arranca lentamente, con más diligencia de lo habitual o suena como si tuviera dificultades para arrancar. Esta suele ser la primera señal de que la batería podría estar descargada. Luces tenues y problemas eléctricos Si los faros delanteros o las luces del tablero de su automóvil son más tenues de lo habitual, o si tiene problemas con los componentes eléctricos de su automóvil, podría ser una señal de que la batería está descargada. Estos componentes requieren un cierto nivel de energía de la batería para funcionar correctamente.<br></p>', 'La mayoría de las baterías de coche tienen una vida útil de 3 a 5 años. Si su batería está dentro de este rango de antigüedad o más, es probable que se agote y necesite ser reemplazada.', 'Fill Foden', '2024-04-03 14:43:05', '2024-05-06 06:50:27'),
(9, 3, 2, 'Dominar el arte de la depilación con cera: una guía paso a paso para lograr un brillo brillante', 'expert-opinions-and-thought-leadership', '[\"Gu\\u00eda\",\"Brillar\",\"Servicio\"]', '<p>Comience su viaje hacia el dominio del cuidado del automóvil con una guía completa sobre cómo mantener el brillo impecable de su vehículo. En esta publicación de blog, profundizaremos en consejos prácticos y efectivos para mantener su automóvil con un aspecto digno de una exposición entre sesiones de detalles profesionales. Analice la importancia del lavado regular para eliminar la suciedad, los contaminantes y los excrementos de pájaros. Resalte las técnicas de lavado adecuadas y la importancia del secado minucioso para evitar manchas de agua. Comience su viaje hacia el dominio del cuidado del automóvil con una guía completa sobre cómo mantener el brillo impecable de su vehículo. En esta publicación de blog, profundizaremos en consejos prácticos y efectivos para mantener su automóvil con un aspecto digno de una exposición entre sesiones de detalles profesionales. Comience su viaje hacia el dominio del cuidado del automóvil con una guía completa sobre cómo mantener el brillo impecable de su vehículo. En esta publicación de blog, profundizaremos en consejos prácticos y efectivos para mantener su automóvil con un aspecto digno de una exposición entre sesiones de detalles profesionales.<br></p>', 'Más allá de la espuma Desentrañando los secretos del revestimiento cerámico para su vehículo', 'Kevin De Bruye', '2024-04-03 14:45:49', '2024-05-06 07:38:48'),
(10, 2, 2, 'Más allá de la espuma Desentrañando los secretos del revestimiento cerámico para su vehículo', 'practical-tips-and-how-to-guides', '[\"Veh\\u00edculo\",\"Cer\\u00e1mica\",\"Auto\"]', '<p>Comience su viaje hacia el dominio del cuidado del automóvil con una guía completa sobre cómo mantener el brillo impecable de su vehículo. En esta publicación de blog, profundizaremos en consejos prácticos y efectivos para mantener su automóvil con un aspecto digno de una exposición entre sesiones de detalles profesionales. Analice la importancia del lavado regular para eliminar la suciedad, los contaminantes y los excrementos de pájaros. Resalte las técnicas de lavado adecuadas y la importancia del secado minucioso para evitar manchas de agua. Comience su viaje hacia el dominio del cuidado del automóvil con una guía completa sobre cómo mantener el brillo impecable de su vehículo. En esta publicación de blog, profundizaremos en consejos prácticos y efectivos para mantener su automóvil con un aspecto digno de una exposición entre sesiones de detalles profesionales. Comience su viaje hacia el dominio del cuidado del automóvil con una guía completa sobre cómo mantener el brillo impecable de su vehículo. En esta publicación de blog, profundizaremos en consejos prácticos y efectivos para mantener su automóvil con un aspecto digno de una exposición entre sesiones de detalles profesionales.<br></p>', 'Comparta ideas sobre el mantenimiento del interior, incluida la aspiración, la limpieza de tapizados y la protección de superficies.', 'David Backham', '2024-04-03 14:52:37', '2024-05-06 07:49:55'),
(12, 5, 1, 'How to Measure the Success of Your Social Media Campaigns', 'how-to-measure-the-success-of-your-social-media-campaigns', '[\"Social Media Analytics\",\"Campaign Measurement\",\"SMM Metrics\"]', '<p>In today’s digital landscape, running a social media campaign is essential for brand visibility and growth. But without proper measurement, you can’t be sure if your efforts are truly paying off. Measuring success isn’t just about counting likes or shares; it’s about understanding the metrics that drive your business goals. Here’s a complete guide to measuring the success of your social media campaigns.<br><br>Learn how to accurately measure the success of your social media campaigns with our in-depth guide. Discover key metrics like engagement rate, reach, and conversions, and explore the best tools for tracking performance across platforms. Whether you\'re new to social media marketing or looking to refine your strategies, this guide will help you turn data into actionable insights for growth.</p>', 'Learn how to accurately measure the success of your social media campaigns with our in-depth guide', 'Fill Bosman', '2024-11-07 04:57:32', '2024-11-07 04:57:32'),
(13, 6, 1, 'How Social Media Marketing Panels Can Help Grow Your Business', 'how-social-media-marketing-panels-can-help-grow-your-business', '[\"SocialMediaMarketing\",\"SMMPanels\",\"DigitalMarketing\",\"SocialMediaGrowth\",\"BoostEngagement\"]', '<p>Discuss how purchasing initial engagement can help new or small businesses appear more popular and credible, making it easier to attract organic followers.Explain how SMM panels save time and resources by consolidating all services into one platform, offering packages that are more affordable than running extensive ad campaigns.<br><br>Describe how some advanced SMM panels offer targeted engagement services, allowing businesses to reach specific demographics or regional audiences.Discuss how an increased number of followers, likes, and comments serves as social proof, encouraging others to engage with the brand, improving brand trust and loyalty.</p>', 'In today’s digital age, social media presence is not just a luxury but a necessity for businesses looking to grow. Social Media Marketing Panels offer a powerful, cost-effective way to boost visibility and engagement, allowing brands to focus on creating meaningful connections with their audience.', 'Mike Tyson', '2024-11-07 06:21:00', '2024-11-07 06:21:00'),
(14, 7, 1, 'The Impact of Video Content on Social Media Engagement', 'the-impact-of-video-content-on-social-media-engagement', '[\"Video Content Marketing\",\"Social Media Engagement\",\"Brand Awareness\",\"Social Media Trends\"]', '<p>Video content has been proven to hold people’s attention far longer than other forms of media. Viewers are more likely to watch videos to the end and are also more likely to remember the message, making it a great way to build brand awareness.Videos are highly shareable, which helps them reach a larger audience. Whether it’s a funny clip, a touching story, or an educational tutorial, videos are one of the most shared forms of content on platforms like Facebook, Instagram, and LinkedIn.<br><br>Most social media algorithms prioritize video content, meaning videos often get more exposure than images or text. Platforms like Instagram and Facebook actively promote video posts, which results in more visibility, higher engagement, and greater reach for businesses using video effectively.Short-form videos, popularized by platforms like TikTok and Instagram Reels, are quick and engaging. These videos are often between 15-60 seconds long, capturing attention immediately and delivering bite-sized, impactful content. They’re perfect for product teasers, behind-the-scenes glimpses, or quick tutorials.</p>', 'Video content is the key to unlocking deeper engagement on social media. It captures attention, tells stories, and leaves lasting impressions, making it a powerful tool for brands looking to connect authentically with their audience.', 'Panaroma Lian', '2024-11-07 06:28:06', '2024-11-07 06:28:06'),
(15, 7, 2, 'El impacto del contenido de vídeo en la participación en las redes sociales', 'the-impact-of-video-content-on-social-media-engagement', '[\"Marketing de contenidos de v\\u00eddeo\",\"Participaci\\u00f3n en las redes sociales\",\"Conocimiento de la marca\",\"Tendencias de las redes sociales\"]', '<p>Se ha demostrado que el contenido de vídeo mantiene la atención de las personas por mucho más tiempo que otras formas de medios. Es más probable que los espectadores vean los videos hasta el final y también recuerden el mensaje, lo que lo convierte en una excelente manera de generar conciencia de marca. Los videos se pueden compartir fácilmente, lo que les ayuda a llegar a una audiencia más amplia. Ya sea un clip divertido, una historia conmovedora o un tutorial educativo, los videos son una de las formas de contenido más compartidas en plataformas como Facebook, Instagram y LinkedIn.<br><br>La mayoría de los algoritmos de las redes sociales dan prioridad al contenido de vídeo, lo que significa que los vídeos suelen tener más exposición que las imágenes o el texto. Plataformas como Instagram y Facebook promueven activamente publicaciones de video, lo que resulta en más visibilidad, mayor participación y mayor alcance para las empresas que usan videos de manera efectiva. Los videos de formato corto, popularizados por plataformas como TikTok e Instagram Reels, son rápidos y atractivos. Estos videos suelen tener entre 15 y 60 segundos de duración, captan la atención de inmediato y ofrecen contenido breve e impactante. Son perfectos para avances de productos, vistazos detrás de escena o tutoriales rápidos.</p>', 'El contenido de video es la clave para desbloquear una participación más profunda en las redes sociales. Capta la atención, cuenta historias y deja impresiones duraderas, lo que la convierte en una herramienta poderosa para las marcas que buscan conectarse auténticamente con su audiencia.', 'Panaroma Lian', '2024-11-07 06:31:42', '2024-11-07 06:31:42'),
(16, 6, 2, 'Cómo los paneles de marketing en redes sociales pueden ayudar a hacer crecer su negocio', 'how-social-media-marketing-panels-can-help-grow-your-business', '[\"Redes SocialesMarketing\",\"Paneles SMMP\",\"Marketing Digital\",\"Crecimiento de las redes sociales\",\"Impulsar el compromiso\"]', '<p>Analice cómo la adquisición de participación inicial puede ayudar a que las empresas nuevas o pequeñas parezcan más populares y creíbles, lo que facilita la atracción de seguidores orgánicos. Explique cómo los paneles SMM ahorran tiempo y recursos al consolidar todos los servicios en una sola plataforma, ofreciendo paquetes que son más asequibles que ejecutarlos de manera integral. campañas publicitarias.<br><br>Describa cómo algunos paneles SMM avanzados ofrecen servicios de participación específicos, lo que permite a las empresas llegar a grupos demográficos o audiencias regionales específicos. Analice cómo un mayor número de seguidores, me gusta y comentarios sirven como prueba social, animando a otros a interactuar con la marca, mejorando la confianza en la marca y lealtad.</p>', 'En la era digital actual, la presencia en las redes sociales no es sólo un lujo sino una necesidad para las empresas que buscan crecer. Los paneles de marketing en redes sociales ofrecen una forma potente y rentable de aumentar la visibilidad y la participación, permitiendo a las marcas centrarse en crear conexiones significativas con su audiencia.', 'Mike Tyson', '2024-11-07 06:35:42', '2024-11-07 06:35:42'),
(17, 5, 2, 'Cómo medir el éxito de sus campañas en las redes sociales', 'how-to-measure-the-success-of-your-social-media-campaigns', '[\"An\\u00e1lisis de redes sociales\",\"Medici\\u00f3n de campa\\u00f1a\",\"M\\u00e9tricas de SMM\"]', '<p>En el panorama digital actual, ejecutar una campaña en las redes sociales es esencial para la visibilidad y el crecimiento de la marca. Pero sin una medición adecuada, no puedes estar seguro de si tus esfuerzos realmente están dando sus frutos. Medir el éxito no se trata sólo de contar los \"me gusta\" o las acciones compartidas; se trata de comprender las métricas que impulsan sus objetivos comerciales. Aquí tienes una guía completa para medir el éxito de tus campañas en las redes sociales.<br><br>Aprenda cómo medir con precisión el éxito de sus campañas en las redes sociales con nuestra guía detallada. Descubra métricas clave como la tasa de participación, el alcance y las conversiones, y explore las mejores herramientas para realizar un seguimiento del rendimiento en todas las plataformas. Ya sea que sea nuevo en el marketing de redes sociales o esté buscando perfeccionar sus estrategias, esta guía lo ayudará a convertir los datos en información útil para el crecimiento.</p>', 'Aprenda cómo medir con precisión el éxito de sus campañas en las redes sociales con nuestra guía detallada', 'Fill Bosman', '2024-11-07 06:37:50', '2024-11-07 06:37:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card_transactions`
--

CREATE TABLE `card_transactions` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `telco` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `request_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fee` decimal(5,2) DEFAULT NULL,
  `real_amount` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `card_transactions`
--

INSERT INTO `card_transactions` (`id`, `user_id`, `telco`, `amount`, `code`, `serial`, `status`, `message`, `request_id`, `created_at`, `fee`, `real_amount`) VALUES
(1, 1, 'VIETTEL', 20000, '654654654654653', '10010081809618', 'error', 'CARD_NOT_EXISTED', '1745291975', '2025-04-22 03:19:36', 25.00, 0.00),
(2, 1, 'VIETTEL', 10000, '213229808065292', '10010948845347', 'success', 'Thẻ Đúng', '1745293182', '2025-04-22 03:39:44', 25.00, 7500.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `social_media_id` int DEFAULT NULL,
  `sort_by` int NOT NULL DEFAULT '1',
  `category_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `child_panels`
--

CREATE TABLE `child_panels` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `domain` varchar(255) NOT NULL,
  `panel_id` varchar(16) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configs`
--

CREATE TABLE `configs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `configs`
--

INSERT INTO `configs` (`id`, `name`, `value`, `domain`, `created_at`, `updated_at`) VALUES
(1, 'theme_settings', '{\"ladi_name\":null,\"order_form_type\":\"form_csr\"}', NULL, '2024-10-28 15:25:31', '2025-02-10 08:39:16'),
(2, 'general', '{\"title\":\"TopSubRe.Pro - H\\u1ec7 th\\u1ed1ng t\\u0103ng t\\u01b0\\u01a1ng t\\u00e1c M\\u1ea1ng x\\u00e3 h\\u1ed9i\",\"favicon\":\"\\/uploads\\/theme\\/b6b5271bcd62bc841121103acbdb58ec.png\",\"sidebar\":\"\\/uploads\\/theme\\/0c298ebca994ccceef8dcb0215f2d714.jpg\",\"keywords\":\"khosubvip,tangfollow,tanglike,subgiare,tangtuongtac,bufflike,bufftheodoi,topsubre\",\"client_id\":\"686890681827-51ckk39fpd3kpjv1gactsd7f0o840sce.apps.googleusercontent.com\",\"logo_dark\":\"\",\"logo_light\":\"\\/uploads\\/theme\\/86ba4face2aeb083feb5f8b7bbf0352e.png\",\"avatar_post\":\"\",\"avatar_user\":\"\",\"cover_photo\":\"\\/uploads\\/theme\\/94b431e9a78fa7897bb812344dd2cff6.png\",\"description\":\"Facebook,Instagram,TikTok,Youtube ... v.v.... gi\\u00e1 c\\u1ea1nh tranh th\\u1ecb tr\\u01b0\\u1eddng t\\u0103ng c\\u1ef1c r\\u1ebb l\\u00ean nhanh\",\"footer_link\":null,\"footer_text\":null,\"status_demo\":0,\"primary_lang\":\"vn\",\"client_secret\":\"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\",\"color_primary\":\"#23b878\",\"google_status\":\"1\",\"captcha_status\":\"1\",\"captcha_siteKey\":\"0x4AAAAAACL9XebqmWsrAdVi\",\"captcha_secretKey\":\"0x4AAAAAACL9XTeSPoBUWDyYmJwIuF9s3B8\",\"color_primary_hover\":\"#ffffff\"}', NULL, '2024-10-28 15:25:31', '2025-05-28 04:43:46'),
(3, 'version_code', '1.1.3', NULL, '2024-10-28 15:26:01', '2025-04-20 03:03:25'),
(4, 'time_cron_order', '\"2025-02-12T10:10:22.158203Z\"', NULL, '2024-10-28 15:26:01', '2025-02-12 10:10:22'),
(5, 'currency_settings', '{\"currency_code\":\"VND\",\"currency_symbol\":\"\\u20ab\",\"currency_position\":\"left\",\"currency_thousand_separator\":\"dot\",\"currency_decimal_separator\":\"comma\",\"currency_decimal\":\"0\",\"default_price_percentage_increase\":\"0\",\"auto_rounding_x_decimal_places\":\"1\",\"new_currecry_rate\":\"1\"}', NULL, '2024-10-28 15:26:01', '2024-12-30 14:06:41'),
(6, 'rank_discount', '{\"_token\":\"lzSkDoUYw2CBnC3TNBUclSVR1blAgMtDJ71mCVxx\",\"bronze\":\"0\",\"silver\":\"0\",\"gold\":\"0\",\"platinum\":\"0\",\"diamond\":\"0\",\"titanium\":\"0\",\"master\":\"0\",\"type\":\"rank_discount\"}', NULL, '2024-10-28 15:26:07', '2024-12-20 16:15:57'),
(7, 'contact_info', '{\"email\":null,\"facebook\":\"https:\\/\\/www.facebook.com\\/profile.php?id=61551073714185\",\"telegram\":\"https:\\/\\/t.me\\/MySupport_Smmlight\",\"phone_no\":\"0777330889\"}', NULL, '2024-10-28 15:26:07', '2025-01-29 07:23:35'),
(8, 'deposit_status', '{\"card\":\"1\",\"bank\":\"1\",\"paypal\":\"0\",\"crypto\":\"1\",\"perfect_money\":\"0\"}', NULL, '2024-10-28 15:26:07', '2025-02-05 15:58:24'),
(9, 'affiliate_config', '{\"min_withdraw\":100000,\"max_withdraw\":5000000,\"withdraw_status\":\"1\",\"type\":\"affiliate_config\"}', NULL, '2024-10-28 15:26:07', '2025-02-01 13:08:46'),
(10, 'rank_level', '{\"bronze\":\"100000\",\"silver\":\"300000\",\"gold\":\"500000\",\"platinum\":\"2000000\",\"diamond\":\"5000000\",\"titanium\":\"10000000\",\"features\":{\"bronze\":\"Khuy\\u1ebfn M\\u00e3i 1% Cho All D\\u1ecbch V\\u1ee5\\r\\nKh\\u00f4ng T\\u1ea1o \\u0110\\u01b0\\u1ee3c Site Con\",\"silver\":\"Khuy\\u1ebfn m\\u00e3i 2% Cho All D\\u1ecbch V\\u1ee5 \\r\\nT\\u1ea1o \\u0110\\u01b0\\u1ee3c Site Con\\r\\nKh\\u00f4ng T\\u1ea1o \\u0110\\u01b0\\u1ee3c Ch\\u00e1u\",\"gold\":\"Gi\\u1ea3m Gi\\u00e1 10% Cho All D\\u1ecbch V\\u1ee5 \\r\\nT\\u1ea1o \\u0110\\u01b0\\u1ee3c Site Con Ch\\u00e1u Ch\\u1eaft\"}}', NULL, '2024-10-28 15:26:57', '2024-12-11 11:07:14'),
(11, 'deposit_info', '{\"prefix\":\"hd\",\"discount\":0,\"min_amount\":2000}', NULL, '2024-10-28 15:33:04', '2025-02-12 17:31:46'),
(12, 'charging_card', '{\"fees\":{\"VIETTEL\":\"25\",\"VINAPHONE\":\"20\",\"MOBIFONE\":\"25\",\"ZING\":\"20\"},\"api_url\":\"https:\\/\\/thecard1s.vn\\/chargingws\\/v2\",\"partner_id\":\"6991880887\",\"partner_key\":\"372944e50706954819835dddb24a6069\"}', NULL, '2024-10-28 15:36:31', '2025-07-28 23:37:38'),
(13, 'smtp_server', '{\"host\":\"smtp.gmail.com\",\"port\":\"587\",\"user\":\"cskh.sieuthicode@gmail.com\",\"pass\":\"hhsrlcvlsbevjwve\",\"name\":null}', NULL, '2024-10-28 15:36:31', '2024-10-28 15:36:31'),
(14, 'telegram', '{\"chat_id\":\"-4638853699\",\"token\":\"5999417582:AAG8TfIDGBnF1SHpL5290rVuR5TGNiA-2vQ\"}', NULL, NULL, '2025-05-11 04:25:00'),
(17, 'landing_themes', '{\"landing1\": 0, \"landing2\": 1, \"landing3\": 0}', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contents`
--

CREATE TABLE `contents` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contents`
--

INSERT INTO `contents` (`id`, `name`, `theme`, `type`, `media`, `created_at`, `updated_at`) VALUES
(464, 'faq', 'light_green', 'single', '{\"button_link\":\"https:\\/\\/www.facebook.com\\/vpnfastvn\"}', '2025-05-01 13:18:16', '2025-05-08 22:10:56'),
(475, 'faq', 'light_green', 'multiple', NULL, '2025-05-01 14:55:42', '2025-05-01 14:55:42'),
(476, 'faq', 'light_green', 'multiple', NULL, '2025-05-01 14:56:16', '2025-05-01 14:56:16'),
(477, 'faq', 'light_green', 'multiple', NULL, '2025-05-01 14:56:33', '2025-05-01 14:56:33'),
(478, 'faq', 'light_green', 'multiple', NULL, '2025-05-01 14:56:51', '2025-05-01 14:56:51'),
(479, 'faq', 'light_green', 'multiple', NULL, '2025-05-01 14:57:05', '2025-05-01 14:57:05'),
(480, 'faq', 'light_green', 'multiple', NULL, '2025-05-01 14:57:18', '2025-05-01 14:57:18'),
(481, 'contact', 'light_green', 'single', '{\"map_link\":\"https:\\/\\/www.google.com\\/maps\\/\"}', '2025-05-02 02:48:37', '2025-05-08 16:45:27'),
(502, 'contact', 'light_green', 'multiple', '{\"icon\":\"<i class=\\\"bi bi-facebook\\\"><\\/i>\",\"link\":\"https:\\/\\/www.facebook.com\\/vpnfastvn\"}', '2025-05-02 03:34:14', '2025-05-02 03:34:14'),
(503, 'contact', 'light_green', 'multiple', '{\"icon\":\"<i class=\\\"bi bi-telegram\\\"><\\/i>\",\"link\":\"https:\\/\\/t.me\\/vankhanh1996\"}', '2025-05-02 03:35:30', '2025-05-02 03:35:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `content_details`
--

CREATE TABLE `content_details` (
  `id` bigint UNSIGNED NOT NULL,
  `content_id` bigint DEFAULT NULL,
  `language_id` bigint DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(874, 464, 1, '{\"title\":\"T\\u00f4i N\\u1ea1p Ti\\u1ec1n Nh\\u01b0ng Kh\\u00f4ng C\\u1ed9ng\",\"heading\":\"\",\"button_name\":\"Li\\u00ean H\\u1ec7 Admin\",\"button_link\":\"https:\\/\\/www.facebook.com\\/vpnfastvn\",\"description\":\"N\\u1ebfu \\u0110\\u01a1n H\\u00e0ng C\\u1ee7a B\\u1ea1n Kh\\u00f4ng Ch\\u1ea1y B\\u1ea1n C\\u00f3 Th\\u1ec3 G\\u1eedi M\\u00e3 \\u0110\\u01a1n Sang H\\u1ed7 Tr\\u1ee3 C\\u1ee7a Ch\\u00fang T\\u00f4i \\u0110\\u1ec3 Ki\\u1ec3m Tra Nh\\u00e9\"}', '2025-05-01 13:18:16', '2025-05-08 22:10:56'),
(885, 475, 1, '{\"question\":\"Trang web SMM c\\u1ee7a b\\u1ea1n cung c\\u1ea5p nh\\u1eefng d\\u1ecbch v\\u1ee5 g\\u00ec?\",\"answer\":\"Ch\\u00fang t\\u00f4i cung c\\u1ea5p m\\u1ed9t lo\\u1ea1t c\\u00e1c d\\u1ecbch v\\u1ee5 ti\\u1ebfp th\\u1ecb truy\\u1ec1n th\\u00f4ng x\\u00e3 h\\u1ed9i to\\u00e0n di\\u1ec7n, bao g\\u1ed3m ph\\u00e1t tri\\u1ec3n chi\\u1ebfn l\\u01b0\\u1ee3c, t\\u1ea1o n\\u1ed9i dung, qu\\u1ea3n l\\u00fd n\\u1ec1n t\\u1ea3ng, chi\\u1ebfn d\\u1ecbch qu\\u1ea3ng c\\u00e1o v\\u00e0 ph\\u00e2n t\\u00edch. Kh\\u00e1m ph\\u00e1 [Trang d\\u1ecbch v\\u1ee5] c\\u1ee7a ch\\u00fang t\\u00f4i \\u0111\\u1ec3 bi\\u1ebft t\\u1ed5ng quan chi ti\\u1ebft.\"}', '2025-05-01 14:55:42', '2025-05-01 14:55:42'),
(886, 476, 1, '{\"question\":\"T\\u00f4i c\\u00f3 th\\u1ec3 b\\u1eaft \\u0111\\u1ea7u s\\u1eed d\\u1ee5ng d\\u1ecbch v\\u1ee5 SMM c\\u1ee7a b\\u1ea1n nh\\u01b0 th\\u1ebf n\\u00e0o?\",\"answer\":\"B\\u1eaft \\u0111\\u1ea7u th\\u1eadt \\u0111\\u01a1n gi\\u1ea3n! Truy c\\u1eadp trang [B\\u1eaft \\u0111\\u1ea7u] c\\u1ee7a ch\\u00fang t\\u00f4i, \\u0111i\\u1ec1n v\\u00e0o bi\\u1ec3u m\\u1eabu v\\u00e0 nh\\u00f3m c\\u1ee7a ch\\u00fang t\\u00f4i s\\u1ebd li\\u00ean h\\u1ec7 v\\u1edbi b\\u1ea1n ngay \\u0111\\u1ec3 th\\u1ea3o lu\\u1eadn v\\u1ec1 m\\u1ee5c ti\\u00eau c\\u1ee7a b\\u1ea1n v\\u00e0 thi\\u1ebft k\\u1ebf chi\\u1ebfn l\\u01b0\\u1ee3c ph\\u00f9 h\\u1ee3p v\\u1edbi nhu c\\u1ea7u c\\u1ee5 th\\u1ec3 c\\u1ee7a b\\u1ea1n.\"}', '2025-05-01 14:56:16', '2025-05-01 14:56:16'),
(887, 477, 1, '{\"question\":\"B\\u1ea1n chuy\\u00ean v\\u1ec1 n\\u1ec1n t\\u1ea3ng truy\\u1ec1n th\\u00f4ng x\\u00e3 h\\u1ed9i n\\u00e0o?\",\"answer\":\"Chuy\\u00ean m\\u00f4n c\\u1ee7a ch\\u00fang t\\u00f4i tr\\u1ea3i r\\u1ed9ng tr\\u00ean nhi\\u1ec1u n\\u1ec1n t\\u1ea3ng truy\\u1ec1n th\\u00f4ng x\\u00e3 h\\u1ed9i l\\u1edbn, bao g\\u1ed3m nh\\u01b0ng kh\\u00f4ng gi\\u1edbi h\\u1ea1n \\u1edf Facebook, Instagram, Twitter, LinkedIn v\\u00e0 Pinterest. Ch\\u00fang t\\u00f4i \\u0111i\\u1ec1u ch\\u1ec9nh c\\u00e1c chi\\u1ebfn l\\u01b0\\u1ee3c c\\u1ee7a m\\u00ecnh \\u0111\\u1ec3 ph\\u00f9 h\\u1ee3p v\\u1edbi \\u0111\\u1ed9ng l\\u1ef1c \\u0111\\u1ed9c \\u0111\\u00e1o c\\u1ee7a t\\u1eebng n\\u1ec1n t\\u1ea3ng.\"}', '2025-05-01 14:56:33', '2025-05-01 14:56:33'),
(888, 478, 1, '{\"question\":\"L\\u00e0m th\\u1ebf n\\u00e0o \\u0111\\u1ec3 t\\u1ea1o n\\u1ed9i dung cho m\\u1ea1ng x\\u00e3 h\\u1ed9i?\",\"answer\":\"Quy tr\\u00ecnh t\\u1ea1o n\\u1ed9i dung c\\u1ee7a ch\\u00fang t\\u00f4i bao g\\u1ed3m vi\\u1ec7c hi\\u1ec3u th\\u01b0\\u01a1ng hi\\u1ec7u, \\u0111\\u1ed1i t\\u01b0\\u1ee3ng m\\u1ee5c ti\\u00eau v\\u00e0 m\\u1ee5c ti\\u00eau c\\u1ee7a b\\u1ea1n. Ch\\u00fang t\\u00f4i t\\u1ea1o ra n\\u1ed9i dung h\\u1ea5p d\\u1eabn v\\u00e0 c\\u00f3 th\\u1ec3 chia s\\u1ebb, bao g\\u1ed3m h\\u00ecnh \\u1ea3nh, video v\\u00e0 ch\\u00fa th\\u00edch, \\u0111\\u1ec3 t\\u0103ng c\\u01b0\\u1eddng s\\u1ef1 hi\\u1ec7n di\\u1ec7n v\\u00e0 t\\u01b0\\u01a1ng t\\u00e1c c\\u1ee7a th\\u01b0\\u01a1ng hi\\u1ec7u b\\u1ea1n.\"}', '2025-05-01 14:56:51', '2025-05-01 14:56:51'),
(889, 479, 1, '{\"question\":\"T\\u00f4i c\\u00f3 th\\u1ec3 theo d\\u00f5i hi\\u1ec7u qu\\u1ea3 chi\\u1ebfn d\\u1ecbch truy\\u1ec1n th\\u00f4ng x\\u00e3 h\\u1ed9i c\\u1ee7a m\\u00ecnh kh\\u00f4ng?\",\"answer\":\"Ch\\u1eafc ch\\u1eafn r\\u1ed3i. Ch\\u00fang t\\u00f4i cung c\\u1ea5p c\\u00e1c b\\u00e1o c\\u00e1o ph\\u00e2n t\\u00edch chi ti\\u1ebft theo d\\u00f5i hi\\u1ec7u su\\u1ea5t c\\u1ee7a c\\u00e1c chi\\u1ebfn d\\u1ecbch truy\\u1ec1n th\\u00f4ng x\\u00e3 h\\u1ed9i c\\u1ee7a b\\u1ea1n. C\\u00e1c b\\u00e1o c\\u00e1o n\\u00e0y bao g\\u1ed3m c\\u00e1c s\\u1ed1 li\\u1ec7u nh\\u01b0 ph\\u1ea1m vi ti\\u1ebfp c\\u1eadn, m\\u1ee9c \\u0111\\u1ed9 t\\u01b0\\u01a1ng t\\u00e1c, t\\u1ef7 l\\u1ec7 chuy\\u1ec3n \\u0111\\u1ed5i, v.v., cung c\\u1ea5p cho b\\u1ea1n nh\\u1eefng th\\u00f4ng tin chi ti\\u1ebft c\\u00f3 gi\\u00e1 tr\\u1ecb v\\u1ec1 hi\\u1ec7u qu\\u1ea3 c\\u1ee7a c\\u00e1c chi\\u1ebfn l\\u01b0\\u1ee3c c\\u1ee7a b\\u1ea1n.\"}', '2025-05-01 14:57:05', '2025-05-01 14:57:05'),
(890, 480, 1, '{\"question\":\"Th\\u00f4ng tin c\\u1ee7a t\\u00f4i c\\u00f3 an to\\u00e0n khi s\\u1eed d\\u1ee5ng d\\u1ecbch v\\u1ee5 c\\u1ee7a b\\u1ea1n kh\\u00f4ng?\",\"answer\":\"C\\u00f3, ch\\u00fang t\\u00f4i \\u01b0u ti\\u00ean t\\u00ednh b\\u1ea3o m\\u1eadt v\\u00e0 b\\u00ed m\\u1eadt c\\u1ee7a th\\u00f4ng tin c\\u1ee7a b\\u1ea1n. Trang web v\\u00e0 d\\u1ecbch v\\u1ee5 c\\u1ee7a ch\\u00fang t\\u00f4i k\\u1ebft h\\u1ee3p c\\u00e1c bi\\u1ec7n ph\\u00e1p b\\u1ea3o m\\u1eadt theo ti\\u00eau chu\\u1ea9n c\\u00f4ng nghi\\u1ec7p \\u0111\\u1ec3 b\\u1ea3o v\\u1ec7 d\\u1eef li\\u1ec7u c\\u1ee7a b\\u1ea1n.\"}', '2025-05-01 14:57:18', '2025-05-01 14:57:18'),
(891, 481, 1, '{\"heading\":\"TopSubRe.Pro - H\\u1ec7 th\\u1ed1ng t\\u0103ng t\\u01b0\\u01a1ng t\\u00e1c m\\u1ea1ng x\\u00e3 h\\u1ed9i\",\"short_description\":\"T\\u0103ng Like, Follow, View , Sub - Facebook,TikTok,Instagram,Telegram,Youtube ...v.v...\",\"form_heading\":\"\",\"form_short_description\":\"\",\"phone\":\"0397333616\",\"email\":\"support@tpsubre.pro\",\"address\":\"B\\u1ebfn Tre\",\"map_link\":\"https:\\/\\/www.google.com\\/maps\\/\"}', '2025-05-02 02:48:37', '2025-05-08 16:45:27'),
(897, 502, 1, '{\"name\":\"Facebook\"}', '2025-05-02 03:34:14', '2025-05-02 03:34:14'),
(898, 503, 1, '{\"name\":\"Telegram\"}', '2025-05-02 03:35:30', '2025-05-02 03:35:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL DEFAULT 'percentage',
  `discount_value` decimal(10,2) NOT NULL,
  `min_order_value` decimal(10,2) DEFAULT NULL,
  `max_order_value` decimal(10,2) DEFAULT NULL,
  `max_uses` int DEFAULT NULL,
  `used_count` int DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_thousand_separator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_decimal_separator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_decimal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_price_percentage_increase` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_rounding_x_decimal_places` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_auto_currency_convert` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_position` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_currecry_rate` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `currency_code`, `currency_symbol`, `currency_thousand_separator`, `currency_decimal_separator`, `currency_decimal`, `default_price_percentage_increase`, `auto_rounding_x_decimal_places`, `is_auto_currency_convert`, `currency_position`, `new_currecry_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Vietnamese', 'VND', '₫', 'comma', 'dot', '0', '0', '2', '0', 'left', 1, 1, '2024-07-06 00:47:28', '2024-07-17 22:47:39'),
(2, 'USD', 'USD', '$', 'dot', 'comma', '2', '0', '2', '0', 'right', 25980, 1, '2025-04-10 13:28:40', '2025-04-29 04:17:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `depositable_id` int DEFAULT NULL,
  `depositable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `child_panel_id` int DEFAULT NULL,
  `payment_method_id` bigint UNSIGNED DEFAULT NULL,
  `payment_method_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `payable_amount` decimal(18,8) NOT NULL DEFAULT '0.00000000' COMMENT 'Amount payed',
  `base_currency_charge` double(18,8) DEFAULT '0.00000000',
  `payable_amount_in_base_currency` double(18,8) NOT NULL DEFAULT '0.00000000',
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `trx_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=pending, 1=success, 2=request, 3=rejected',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => child panel user, 1 => main user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `draft_mass_orders`
--

CREATE TABLE `draft_mass_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `child_panel_id` int DEFAULT NULL,
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(18,8) NOT NULL DEFAULT '0.00000000',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 0 => invalid, 1 => valid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `file_storages`
--

CREATE TABLE `file_storages` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `driver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 => active, 0 => inactive',
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `file_storages`
--

INSERT INTO `file_storages` (`id`, `code`, `name`, `logo`, `driver`, `status`, `parameters`, `created_at`, `updated_at`) VALUES
(1, 's3', 'Amazon S3', 'driver/GJrBdvIxtnEprk0kHylgzNh6LcGcfOUcA205IIK5.png', 'local', 0, '{\"access_key_id\":\"xys6\",\"secret_access_key\":\"xys\",\"default_region\":\"xys5\",\"bucket\":\"xys6\",\"url\":\"xysds\"}', NULL, '2024-03-06 02:13:56'),
(2, 'sftp', 'SFTP', 'driver/q8E08YsobyRZGOLHHeKGhwysWsi25F186EbaNNRx.png', 'local', 0, '{\"sftp_username\":\"xys6\",\"sftp_password\":\"xys\"}', NULL, '2023-06-10 17:28:03'),
(3, 'do', 'Digitalocean Spaces', 'driver/iA8q685PBCnOAkmctLXZWhyqSoh7cJMOewpW4S8r.png', 'local', 0, '{\"spaces_key\":\"hj\",\"spaces_secret\":\"vh\",\"spaces_endpoint\":\"jk\",\"spaces_region\":\"sfo2\",\"spaces_bucket\":\"assets-coral\"}', NULL, '2023-06-10 17:45:21'),
(4, 'ftp', 'FTP', 'driver/wIwEOAJ45KgVGw0PL80WNfcbosB4IuUlxStfeHCX.png', 'local', 0, '{\"ftp_host\":\"xys6\",\"ftp_username\":\"xys\",\"ftp_password\":\"xys6\"}', NULL, '2023-06-10 17:27:43'),
(5, 'local', 'Local Storage', '', NULL, 1, NULL, NULL, '2024-03-06 02:13:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `fire_base_tokens`
--

CREATE TABLE `fire_base_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_id` int DEFAULT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_by` int DEFAULT '1',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: inactive, 1: active',
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `extra_parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `supported_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receivable_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `currency_type` tinyint(1) NOT NULL DEFAULT '1',
  `is_sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `environment` enum('test','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'live',
  `is_manual` tinyint(1) DEFAULT '1',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `sort_by`, `image`, `driver`, `status`, `parameters`, `currencies`, `extra_parameters`, `supported_currency`, `receivable_currencies`, `description`, `currency_type`, `is_sandbox`, `environment`, `is_manual`, `note`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'Paypal', 11, 'gateway/cCmKX4VMzHorJkQ9omsZdOLIZLXA56.avif', 'local', 0, '{\"cleint_id\":\"\",\"secret\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(2, 'stripe', 'Stripe ', 1, 'gateway/Fpn6DbOj8Kh0qEqmDcqzPLaYetzHdU.avif', 'local', 0, '{\"secret_key\":\"\",\"publishable_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}}', NULL, '[\"USD\",\"AUD\",\"GBP\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"9\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0.5\"},{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"1.51\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"GBP\",\"currency_symbol\":\"GBP\",\"conversion_rate\":\"0.77\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(3, 'skrill', 'Skrill', 4, 'gateway/sFW8RqOtyTiIo8369MLJFmMsfHtYHX.avif', 'local', 0, '{\"pay_to_email\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}}', NULL, '[\"AED\",\"AUD\",\"USD\",\"CAD\"]', '[{\"name\":\"AED\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"AUD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"20000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"32000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(4, 'perfectmoney', 'Perfect Money', 9, 'gateway/B1uwuCo5fk4FVyBSm8yxErDtezvo9R.avif', 'local', 0, '{\"passphrase\":\"\",\"payee_account\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(5, 'paytm', 'PayTM', 23, 'gateway/9OxY8ZDv4JGt3MS7zPEquDtQ9b1vWU.avif', 'local', 0, '{\"MID\":\"\",\"merchant_key\":\"\",\"WEBSITE\":\"\",\"INDUSTRY_TYPE_ID\":\"\",\"CHANNEL_ID\":\"\",\"environment_url\":\"\",\"process_transaction_url\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(6, 'payeer', 'Payeer', 17, 'gateway/7HTCjJpFcRmHqM1kJSpaRuTA0MzNqG.avif', 'local', 0, '{\"merchant_id\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}}', '{\"status\":\"ipn\"}', '[\"USD\",\"RUB\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"RUB\",\"currency_symbol\":\"RUD\",\"conversion_rate\":\"0.81\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(7, 'paystack', 'PayStack', 6, 'gateway/Km8ogMTUmpEdjbHRvLma7enfvafO3N.avif', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"NGN\":\"NGN\"}}', '{\"callback\":\"ipn\",\"webhook\":\"ipn\"}\r\n', '[\"USD\",\"NGN\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(8, 'voguepay', 'VoguePay', 33, 'gateway/x6HOsziQhmuJ7iu46zMKdBEewDSesm.avif', 'local', 0, '{\"merchant_id\":\"\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"ZAR\":\"ZAR\",\"JPY\":\"JPY\",\"INR\":\"INR\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PLN\":\"PLN\"}}\n\n\n\n\n\n\n\n\n', NULL, '[\"NGN\",\"EUR\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(9, 'flutterwave', 'Flutterwave', 5, 'gateway/SUpub5TEkx7MOcetX340zn7LGSH0Sa.avif', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\"}', '{\"0\":{\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}}', NULL, '[\"GHS\",\"NGN\",\"USD\"]', '[{\"name\":\"GHS\",\"currency_symbol\":\"GHS\",\"conversion_rate\":\"0.11\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(10, 'razorpay', 'RazorPay', 7, 'gateway/HvTfH2WAQtw0pcN4ZzssUT5l86FMCZ.avif', 'local', 0, '{\"key_id\":\"\",\"key_secret\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":84.08,\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(11, 'instamojo', 'instamojo', 14, 'gateway/rwXQ1P62ePQcvJBIUZRkHMumLbWF73.avif', 'local', 0, '{\"api_key\":\"\",\"auth_token\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(12, 'mollie', 'Mollie', 27, 'gateway/S83QZxmVtxCkvl8OGWFGgChxmUcQhc.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}}', NULL, '[\"AUD\",\"BRL\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"BRL\",\"currency_symbol\":\"BRL\",\"conversion_rate\":\"0.045\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(13, 'twocheckout', '2checkout', 12, 'gateway/bmAgQ5rUbx2rktlaztA89GEQCKYTxJ.avif', 'local', 0, '{\"merchant_code\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"DZD\":\"DZD\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BSD\":\"BSD\",\"BDT\":\"BDT\",\"BBD\":\"BBD\",\"BZD\":\"BZD\",\"BMD\":\"BMD\",\"BOB\":\"BOB\",\"BWP\":\"BWP\",\"BRL\":\"BRL\",\"GBP\":\"GBP\",\"BND\":\"BND\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"XCD\":\"XCD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JMD\":\"JMD\",\"JPY\":\"JPY\",\"KZT\":\"KZT\",\"KES\":\"KES\",\"LAK\":\"LAK\",\"MMK\":\"MMK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MOP\":\"MOP\",\"MYR\":\"MYR\",\"MVR\":\"MVR\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PGK\":\"PGK\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"WST\":\"WST\",\"SAR\":\"SAR\",\"SCR\":\"SCR\",\"SGD\":\"SGD\",\"SBD\":\"SBD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TRY\":\"TRY\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"USD\":\"USD\",\"VUV\":\"VUV\",\"VND\":\"VND\",\"XOF\":\"XOF\",\"YER\":\"YER\"}}', '{\"approved_url\":\"ipn\"}', '[\"AFN\",\"ARS\"]', '[{\"name\":\"AFN\",\"currency_symbol\":\"AFN\",\"conversion_rate\":\"0.63\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":\"3.24\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(14, 'authorizenet', 'Authorize.Net', 8, 'gateway/kY6uyYr0nPgU0SyM69Yy4ei7aAowCu.avif', 'local', 0, '{\"login_id\":\"\",\"current_transaction_key\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"USD\":\"USD\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(16, 'payumoney', 'PayUmoney', 28, 'gateway/TjSy1hfABIV2RzIRECRJcwmN04sGEh.avif', 'local', 0, '{\"merchant_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(17, 'mercadopago', 'Mercado Pago', 18, 'gateway/2UlZWhhkfVSWQepk1uBKecw4FrepZx.avif', 'local', 0, '{\"access_token\":\"\"}', '{\"0\":{\"ARS\":\"ARS\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"DOP\":\"DOP\",\"EUR\":\"EUR\",\"GTQ\":\"GTQ\",\"HNL\":\"HNL\",\"MXN\":\"MXN\",\"NIO\":\"NIO\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PYG\":\"PYG\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VES\":\"VES\"}}', NULL, '[\"ARS\"]', '[{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":\"3.24\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(18, 'coingate', 'Coingate', 19, 'gateway/uxKFypl7GtiL0YnJhshsLKyGzf2YKt.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(19, 'coinbasecommerce', 'Coinbase Commerce', 16, 'gateway/POaHQGEUctnNpM9YgAvIIwq0R9aXnw.avif', 'local', 0, '{\"api_key\":\"\",\"secret\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}}', '{\"webhook\":\"ipn\"}', '[\"AED\",\"ALL\"]', '[{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.033\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ALL\",\"currency_symbol\":\"ALL\",\"conversion_rate\":\"0.85\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(20, 'monnify', 'Monnify', 20, 'gateway/N9ZZ4F4YeYM4m78gZW0Gnm8HTu037v.avif', 'local', 0, '{\"api_key\":\"\",\"secret_key\":\"\",\"contract_code\":\"\"}', '{\"0\":{\"NGN\":\"NGN\"}}', NULL, '[\"NGN\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(22, 'coinpayments', 'CoinPayments', 21, 'gateway/truY5ILTjTIFunGBf7Hn5vcWSxYw6Q.avif', 'local', 0, '{\"merchant_id\":\"\",\"private_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"},\"1\":{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}}', '{\"callback\":\"ipn\"}', '[\"USD\",\"AUD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(23, 'blockchain', 'Blockchain', 24, 'gateway/20zn8YG4VPgOUSBQHvj0GeKMHwL4ZY.avif', 'local', 0, '{\"api_key\":\"\",\"xpub_code\":\"\"}', '{\"1\":{\"BTC\":\"BTC\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"50\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-01-04 15:16:23'),
(25, 'cashmaal', 'cashmaal', 25, 'gateway/7Y3IZE7VY61XHwNxRzrgWVFZx8zUu0.avif', 'local', 0, '{\"web_id\":\"\",\"ipn_key\":\"\"}', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', '[\"PKR\",\"USD\"]', '[{\"name\":\"PKR\",\"currency_symbol\":\"PKR\",\"conversion_rate\":\"2.56\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, NULL, '2025-01-04 15:16:23'),
(26, 'midtrans', 'Midtrans', 2, 'gateway/7fRFCClfGcMefCb35AVzgnEJevUi37.avif', 'local', 0, '{\"client_key\":\"\",\"server_key\":\"\"}', '{\"0\":{\"IDR\":\"IDR\"}}', '{\"payment_notification_url\":\"ipn\", \"finish redirect_url\":\"ipn\", \"unfinish redirect_url\":\"failed\",\"error redirect_url\":\"failed\"}', '[\"IDR\"]', '[{\"name\":\"IDR\",\"currency_symbol\":\"IDR\",\"conversion_rate\":\"141.38\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, '', '2020-09-08 21:05:02', '2025-01-04 15:16:23'),
(27, 'peachpayments', 'peachpayments', 34, 'gateway/4aJggeZFR2SBLYMw9DewRUOByPaRez.avif', 'local', 0, '{\"Authorization_Bearer\":\"\",\"Entity_ID\":\"\",\"Recur_Channel\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFA\":\"AFA\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZM\":\"AZM\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYR\":\"BYR\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CYP\":\"CYP\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EEK\":\"EEK\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHC\":\"GHC\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LTL\":\"LTL\",\"LVL\":\"LVL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MTL\":\"MTL\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZM\":\"MZM\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PTS\":\"PTS\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDD\":\"SDD\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SIT\":\"SIT\",\"SKK\":\"SKK\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SPL\":\"SPL\",\"SRD\":\"SRD\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMM\":\"TMM\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRL\":\"TRL\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TVD\":\"TVD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMK\":\"ZMK\",\"ZWD\":\"ZWD\"}}', NULL, '[\"CAD\",\"AED\"]', '[{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.033\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-09 03:05:02', '2025-01-04 15:16:23'),
(28, 'nowpayments', 'Nowpayments', 26, 'gateway/Z5wvvbRZN7nZUC6GgPTqMyf1lM2WBf.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"1\":{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}}', '{\"cron\":\"ipn\"}', '[\"ETH\",\"XEM\"]', '[{\"name\":\"ETH\",\"currency_symbol\":\"XEM\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"XEM\",\"currency_symbol\":\"ETH\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 0, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-04 15:16:23'),
(29, 'khalti', 'Khalti Payment', 29, 'gateway/x4BeAPBkYuM494NvWfAkrxTfk1tbUt.avif', 'local', 0, '{\"secret_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-04 15:16:23'),
(30, 'swagger', 'MAGUA PAY', 22, 'gateway/j8bFL5e5LOn6YkquKQiy6com8w1uj2.avif', 'local', 0, '{\"MAGUA_PAY_ACCOUNT\":\"\",\"MerchantKey\":\"\",\"Secret\":\"\"}', '{\"0\":{\"EUR\":\"EUR\"}}', NULL, '[\"EUR\"]', '[{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-04 15:16:23'),
(31, 'freekassa', 'Free kassa', 35, 'gateway/VqJR12ZLuhmisIpUbpm6p2OCqm4hHC.avif', 'local', 0, '{\"merchant_id\":\"\",\"merchant_key\":\"\",\"secret_word\":\"\",\"secret_word2\":\"\"}', '{\"0\":{\"RUB\":\"RUB\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"UAH\":\"UAH\",\"KZT\":\"KZT\"}}', '{\"ipn_url\":\"ipn\"}', '[\"RUB\",\"USD\"]', '[{\"name\":\"RUB\",\"currency_symbol\":\"RUB\",\"conversion_rate\":\"0.81\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-04 15:16:23'),
(32, 'konnect', 'Konnect', 30, 'gateway/DIWitJin1UBjkwTLrSPcstnUDGmTz3.avif', 'local', 0, '{\"api_key\":\"\",\"receiver_wallet_Id\":\"\"}', '{\"0\":{\"TND\":\"TND\",\"EUR\":\"EUR\",\"USD\":\"USD\"}}', '{\"webhook\":\"ipn\"}', '[\"USD\",\"TND\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"TND\",\"currency_symbol\":\"TND\",\"conversion_rate\":\"0.028\",\"min_limit\":\"1\",\"max_limit\":\"20000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"60000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-04 15:16:23'),
(33, 'mypay', 'Mypay Np', 32, 'gateway/kkBeSnA5MFdlLrrSOpF3dJp1JwMxIB.avif', 'local', 0, '{\"merchant_username\":\"\",\"merchant_api_password\":\"\",\"merchant_id\":\"\",\"api_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-04 15:16:23'),
(35, 'imepay', 'IME PAY', 10, 'gateway/YuBFrsBWuxf17sqB6z8y039xgdxyat.avif', 'local', 0, '{\"MerchantModule\":\"\",\"MerchantCode\":\"\",\"username\":\"\",\"password\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":134.51,\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"1.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-01-04 15:16:23'),
(36, 'cashonexHosted', 'Cashonex Hosted', 15, 'gateway/GAcL1CamWpPaeDGaD6aSInqXknXK50.avif', 'local', 0, '{\"idempotency_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:31:33', '2025-01-04 15:16:23'),
(37, 'cashonex', 'cashonex', 31, 'gateway/rbbey8zLDMKdNPftwRdOSY79eVEGLi.avif', 'local', 0, '{\"idempotency_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0.0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:34:54', '2025-01-04 15:16:23'),
(38, 'binance', 'Binance', 13, 'gateway/bZ7w2koAzATHG9gp8k6JzRhhusXTpH.avif', 'local', 0, '{\"mercent_api_key\":\"\",\"mercent_secret\":\"\"}', '{\"1\":{\"ADA\":\"ADA\",\"ATOM\":\"ATOM\",\"AVA\":\"AVA\",\"BCH\":\"BCH\",\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"BUSD\":\"BUSD\",\"CTSI\":\"CTSI\",\"DASH\":\"DASH\",\"DOGE\":\"DOGE\",\"DOT\":\"DOT\",\"EGLD\":\"EGLD\",\"EOS\":\"EOS\",\"ETC\":\"ETC\",\"ETH\":\"ETH\",\"FIL\":\"FIL\",\"FRONT\":\"FRONT\",\"FTM\":\"FTM\",\"GRS\":\"GRS\",\"HBAR\":\"HBAR\",\"IOTX\":\"IOTX\",\"LINK\":\"LINK\",\"LTC\":\"LTC\",\"MANA\":\"MANA\",\"MATIC\":\"MATIC\",\"NEO\":\"NEO\",\"OM\":\"OM\",\"ONE\":\"ONE\",\"PAX\":\"PAX\",\"QTUM\":\"QTUM\",\"STRAX\":\"STRAX\",\"SXP\":\"SXP\",\"TRX\":\"TRX\",\"TUSD\":\"TUSD\",\"UNI\":\"UNI\",\"USDC\":\"USDC\",\"USDT\":\"USDT\",\"WRX\":\"WRX\",\"XLM\":\"XLM\",\"XMR\":\"XMR\",\"XRP\":\"XRP\",\"XTZ\":\"XTZ\",\"XVS\":\"XVS\",\"ZEC\":\"ZEC\",\"ZIL\":\"ZIL\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"5\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2023-04-02 19:36:14', '2025-01-04 15:16:23'),
(39, 'cinetpay', 'CinetPay ', 36, 'gateway/9WCd4Kn4EvlDX8y4V3bEV7eazCTlla.avif', 'local', 0, '{\"apiKey\":\"\",\"site_id\":\"\"}', '{\"0\":{\"XOF\":\"XOF\",\"XAF\":\"XAF\",\"CDF\":\"CDF\",\"GNF\":\"GNF\",\"USD\":\"USD\"}}', 'NULL', '[\"XOF\"]', '[{\"name\":\"XOF\",\"currency_symbol\":\"XOF\",\"conversion_rate\":\"5.45\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2023-04-02 19:36:14', '2025-01-04 15:16:23'),
(40, 'bkash', 'Bkash ', 3, 'gateway/Hi2rsJIiOmjaIyfGSvQcpqtSyKHIuj.webp', 'local', 0, '{\"username\":\"\",\"password\":\"\",\"app_key\":\"\",\"app_secret\":\"\"}', '{\"0\":{\"BDT\":\"BDT\"}}', '', '[\"BDT\"]', '[{\"name\":\"BDT\",\"currency_symbol\":\"BDT\",\"conversion_rate\":\"100\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2023-04-02 19:36:14', '2025-01-04 15:16:23'),
(41, 'nagad', 'Nagad', 37, 'gateway/bJ6RRqJdGzXk6rgMeiIi9nsAy6sPEM.webp', 'local', 0, '{\"merchant_id\":\"\",\"merchant_phone\":\"\",\"public_key\":\"\",\"private_key\":\"\"}', '{\"0\":{\"BDT\":\"BDT\"}}', '', '[\"BDT\"]', '[{\"name\":\"BDT\",\"currency_symbol\":\"BDT\",\"conversion_rate\":\"100\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\".5\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2023-04-02 19:36:14', '2025-01-04 15:16:23'),
(42, 'toyyibpay', 'Toyyibpay', 38, 'gateway/lMJHSgtYaOzIUpnmygdK6gjZCcR5A2.webp', 'local', 0, '{\"category_code\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"MYR\":\"MYR\"}}', '', '[\"MYR\"]', '[{\"name\":\"MYR\",\"currency_symbol\":\"MYR\",\"conversion_rate\":\"4.27\",\"min_limit\":\"1\",\"max_limit\":\"1000000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2023-04-02 19:36:14', '2025-01-04 15:16:23'),
(1000, 'bank-transfer', 'Bank Transfer', 1, 'gateway/A2zYpiPKpPWcByCCys7mpnCugQEHvv.avif', 'local', 1, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_label\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_label\":\"Beneficiary Name\",\"type\":\"text\",\"validation\":\"required\"},\"NID\":{\"field_name\":\"NID\",\"field_label\":\"NID\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, NULL, '[\"USD\",\"EUR\"]', '[{\"currency\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"currency\":\"EUR\",\"conversion_rate\":\"0.92\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send from your payment gateway. Your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, 'Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.', NULL, '2024-12-22 11:35:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `in_app_notifications`
--

CREATE TABLE `in_app_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `in_app_notificationable_id` int NOT NULL,
  `in_app_notificationable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '0' COMMENT '1 => Active, 0 => Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `kycs`
--

INSERT INTO `kycs` (`id`, `name`, `slug`, `input_form`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Passport Verification', 'passport-verification', '{\"FullName\":{\"field_name\":\"FullName\",\"field_label\":\"Full Name\",\"type\":\"text\",\"validation\":\"required\"},\"PassportNumber\":{\"field_name\":\"PassportNumber\",\"field_label\":\"Passport Number\",\"type\":\"number\",\"validation\":\"required\"},\"DateOfBirth\":{\"field_name\":\"DateOfBirth\",\"field_label\":\"Date Of Birth\",\"type\":\"date\",\"validation\":\"optional\"},\"File\":{\"field_name\":\"File\",\"field_label\":\"File\",\"type\":\"file\",\"validation\":\"optional\"},\"Address\":{\"field_name\":\"Address\",\"field_label\":\"Address\",\"type\":\"textarea\",\"validation\":\"required\"}}', 0, '2024-05-30 06:36:35', '2025-01-04 14:44:14'),
(2, 'Address Verification', 'address-verification', '{\"Country\":{\"field_name\":\"Country\",\"field_label\":\"Country\",\"type\":\"text\",\"validation\":\"required\"},\"Capital\":{\"field_name\":\"Capital\",\"field_label\":\"Capital\",\"type\":\"text\",\"validation\":\"required\"},\"State\":{\"field_name\":\"State\",\"field_label\":\"State\",\"type\":\"text\",\"validation\":\"required\"}}', 0, '2024-07-04 04:00:53', '2024-10-31 04:33:27'),
(3, 'NID Verification', 'nid-verification', '{\"NIDNUMBER\":{\"field_name\":\"NIDNUMBER\",\"field_label\":\"NID NUMBER\",\"type\":\"number\",\"validation\":\"required\"},\"IMAGE\":{\"field_name\":\"IMAGE\",\"field_label\":\"IMAGE\",\"type\":\"file\",\"validation\":\"required\"}}', 0, '2024-10-07 02:48:08', '2024-11-08 11:12:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag_driver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => Inactive, 1 => Active',
  `rtl` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => Inactive, 1 => Active ',
  `default_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => Inactive, 1 => Active ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `flag_driver`, `status`, `rtl`, `default_status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'language/zKyVGhLfN88CaZqOB4kqE6ryEwKwE3.webp', 'local', 1, 0, 1, '2023-06-16 22:35:53', '2024-12-02 02:00:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `maintenance_modes`
--

CREATE TABLE `maintenance_modes` (
  `id` bigint UNSIGNED NOT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `maintenance_modes`
--

INSERT INTO `maintenance_modes` (`id`, `heading`, `description`, `image`, `image_driver`, `created_at`, `updated_at`) VALUES
(1, 'The website under maintenance!', '<p>We are currently undergoing scheduled maintenance to improve our services and enhance your user experience. During this time, our website/system will be temporarily unavailable.\r\n</p><p><br></p><p>\r\nWe apologize for any inconvenience this may cause and appreciate your patience. Please rest assured that we are working diligently to complete the maintenance as quickly as possible.</p>', 'maintenanceMode/3jXAnm42OZuYy3kVDcHKUjW3gyiG8eSo96rlgg19.png', 'local', '2023-10-03 22:44:32', '2024-02-05 04:00:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manage_menus`
--

CREATE TABLE `manage_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_section` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_items` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manage_menus`
--

INSERT INTO `manage_menus` (`id`, `theme`, `menu_section`, `menu_items`, `created_at`, `updated_at`) VALUES
(3, 'light_green', 'header', '[\"home\",\"about\",\"faq\",\"blogs\",\"service\",\"contact\"]', '2023-10-15 20:54:10', '2024-10-30 02:33:37'),
(4, 'light_green', 'footer', '{\"useful_link\":[\"home\",\"about\",\"faq\",\"blogs\",\"contact\"],\"support_link\":[\"api docs\",\"privacy &amp; policy\",\"terms and conditions\",\"refund policy\",\"cookie policy\"]}', '2023-10-15 20:54:10', '2024-10-30 03:31:45'),
(5, 'dark_voilet', 'header', '[\"home\",\"about\",\"faq\",\"blogs\",\"service\",\"contact\"]', '2023-10-15 20:54:10', '2024-10-30 04:41:42'),
(6, 'dark_voilet', 'footer', '{\"useful_link\":[\"home\",\"about\",\"faq\",\"blogs\",\"contact\"],\"support_link\":[\"api docs\",\"privacy &amp; policy\",\"terms and conditions\",\"refund policy\",\"cookie policy\"]}', '2023-10-15 20:54:10', '2024-10-30 06:34:48'),
(7, 'minimal', 'header', '[\"home\",\"about\",\"blogs\",\"Services\",\"contact\"]', '2023-10-15 20:54:10', '2024-10-30 07:49:31'),
(8, 'minimal', 'footer', '{\"useful_link\":[\"home\",\"about\",\"blogs\",\"faq\",\"contact\"],\"support_link\":[\"api docs\",\"privacy policy\",\"terms and  conditions\",\"refund policy\",\"cookie policy\"]}', '2023-10-15 20:54:10', '2024-10-30 09:28:04'),
(75, 'deep_blue', 'header', '[\"home\",\"about\",\"blogs\",\"Services\",\"contact\"]', '2023-10-15 20:54:10', '2024-10-30 14:33:39'),
(76, 'deep_blue', 'footer', '{\"useful_link\":[\"home\",\"about\",\"blogs\",\"faq\",\"contact\"],\"support_link\":[\"api docs\",\"privacy policy\",\"terms conditions\",\"refund policy\",\"cookie policy\"]}', '2023-10-15 20:54:10', '2024-10-30 14:56:50'),
(77, 'light_orange', 'header', '[\"home\",\"about\",\"faq\",\"blogs\",\"Services\",\"contact\"]', '2023-10-15 20:54:10', '2024-10-31 02:20:07'),
(78, 'light_orange', 'footer', '{\"useful_link\":[\"home\",\"about\",\"blogs\",\"faq\",\"contact\"],\"support_link\":[\"api docs\",\"privacy &amp; policy\",\"terms and conditions\",\"refund policy\",\"cookie policy\"]}', '2023-10-15 20:54:10', '2024-10-30 16:34:25'),
(79, 'dark_mode', 'header', '[\"home\",\"about\",\"blogs\",\"Services\",\"contact\"]', '2023-10-15 20:54:10', '2024-10-30 15:13:07'),
(80, 'dark_mode', 'footer', '{\"useful_link\":[\"home\",\"about\",\"blogs\",\"faq\",\"contact\"],\"support_link\":[\"api docs\",\"privacy &amp; policy\",\"terms and conditions\",\"refund policy\",\"cookie policy\"]}', '2023-10-15 20:54:10', '2024-10-30 16:02:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manual_sms_configs`
--

CREATE TABLE `manual_sms_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `action_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `form_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manual_sms_configs`
--

INSERT INTO `manual_sms_configs` (`id`, `action_method`, `action_url`, `header_data`, `param_data`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'https://rest.nexmo.com/sms/json', '{\"Content-Type\":\"application\\/x-www-form-urlencoded\"}', NULL, '{\"from\":\"Rownak\",\"text\":\"[[message]]\",\"to\":\"[[receiver]]\",\"api_key\":\"930cc608\",\"api_secret\":\"2pijsaMOUw5YKOK5\"}', NULL, '2023-10-19 03:03:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_07_064911_create_admins_table', 2),
(6, '2014_10_12_100000_create_password_resets_table', 3),
(7, '2023_06_10_061241_create_basic_controls_table', 4),
(8, '2023_06_10_123329_create_file_storages_table', 4),
(9, '2023_06_15_102426_create_firebase_notifies_table', 5),
(10, '2023_06_17_085447_create_languages_table', 6),
(11, '2023_06_19_082042_create_sms_controls_table', 7),
(12, '2023_06_20_080624_create_support_tickets_table', 8),
(13, '2023_06_20_080731_create_support_ticket_messages_table', 8),
(14, '2023_06_20_080833_create_support_ticket_attachments_table', 8),
(15, '2023_06_20_212143_create_fire_base_tokens_table', 9),
(16, '2023_06_21_124322_create_in_app_notifications_table', 10),
(17, '2023_06_22_084256_create_gateways_table', 11),
(18, '2023_07_15_162549_create_kycs_table', 12),
(19, '2023_07_17_094844_create_manage_pages_table', 13),
(20, '2023_07_17_101515_create_manage_sections_table', 14),
(21, '2023_07_18_084411_create_pages_table', 15),
(22, '2023_07_22_130913_create_manage_menus_table', 16),
(23, '2023_07_26_193156_create_email_controls_table', 17),
(24, '2023_08_10_153005_create_google_sheet_apis_table', 18),
(25, '2023_08_20_140757_create_contents_table', 19),
(26, '2023_08_20_140808_create_content_details_table', 19),
(27, '2023_08_20_140815_create_content_media_table', 19),
(28, '2023_09_07_151706_create_user_logins_table', 20),
(29, '2023_09_09_105217_create_transactions_table', 21),
(30, '2023_09_09_105305_create_payout_logs_table', 21),
(31, '2023_09_09_105353_create_funds_table', 21),
(32, '2023_09_19_131540_create_deposits_table', 22),
(33, '2023_09_20_093121_create_payouts_table', 23),
(34, '2023_09_21_085103_create_wallets_table', 24),
(35, '2023_10_01_125109_create_pages_table', 25),
(36, '2023_10_02_162152_create_page_details_table', 26),
(37, '2023_10_04_102054_create_maintenance_modes_table', 27),
(38, '2023_10_05_124404_create_email_templates_table', 28),
(39, '2023_10_05_124445_create_notify_templates_table', 28),
(40, '2023_10_05_132313_create_email_sms_templates_table', 29),
(41, '2023_10_05_145420_create_push_notification_templates_table', 30),
(42, '2023_10_05_150447_create_in_app_notification_templates_table', 31),
(43, '2023_10_19_140559_create_manual_sms_configs_table', 32),
(44, '2023_10_19_161530_create_jobs_table', 33),
(45, '2023_12_10_085818_create_blog_categories_table', 34),
(46, '2023_12_10_094858_create_blogs_table', 35),
(47, '2023_12_10_094925_create_blog_details_table', 35),
(48, '2024_05_07_075258_create_authors_table', 36),
(53, '2024_05_23_125210_add_some_column_to_blogs_table', 37),
(54, '2024_05_25_080924_create_subscribes_table', 38),
(57, '2024_05_30_084443_delete_description_column_api_providers_table', 40),
(58, '2024_05_30_092705_create_social_media_table', 41),
(64, '2024_06_10_101859_create_user_service_rates_table', 45),
(65, '2024_05_30_135032_create_categories_table', 46),
(66, '2024_06_01_134019_create_services_table', 47),
(67, '2024_05_26_135926_create_api_providers_table', 48),
(71, '2024_06_23_102936_create_orders_table', 49),
(77, '2024_06_25_133108_create_draft_mass_orders_table', 50),
(78, '2024_07_06_075626_create_notices_table', 51),
(80, '2024_06_09_075700_create_currencies_table', 52),
(81, '2024_07_07_154509_create_notice_details_table', 53),
(82, '2024_07_11_095238_create_referrals_table', 53),
(83, '2024_07_14_094409_create_referral_bonuses_table', 53),
(89, '2024_08_03_141041_create_page_seos_table', 55),
(97, '2024_08_11_103107_create_cookies_table', 61),
(110, '2024_08_30_214515_create_blog_categories_table', 69),
(111, '2024_08_30_214538_create_blog_category_details_table', 69),
(112, '2024_08_31_001521_create_authors_table', 70),
(113, '2024_08_31_001537_create_author_details_table', 70),
(114, '2024_05_23_001521_create_authors_table', 71),
(115, '2024_05_23_001537_create_author_details_table', 72),
(116, '2024_05_23_214515_create_blog_categories_table', 73),
(117, '2024_05_23_214538_create_blog_category_details_table', 73),
(119, '2024_11_02_074522_create_theme_colors_table', 74),
(143, '2025_01_08_164835_add_google_id_to_users_table', 75),
(144, '2025_01_12_175659_add_two_column_to_users_table', 75),
(145, '2025_01_30_114548_add_price_percentage_increase_to_services_table', 76),
(146, '2025_01_30_135323_add_original_price_to_services_table', 76);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notices`
--

CREATE TABLE `notices` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notice_details`
--

CREATE TABLE `notice_details` (
  `id` bigint UNSIGNED NOT NULL,
  `notice_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_keys` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `in_app` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `push` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mail = 0(inactive), mail = 1(active),\r\nsms = 0(inactive), sms = 1(active),\r\nin_app = 0(inactive), in_app = 1(active),\r\npush = 0(inactive), push = 1(active),\r\n ',
  `notify_for` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => user, 1 => admin, 2 => child panel',
  `lang_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `language_id`, `name`, `email_from`, `template_key`, `subject`, `short_keys`, `email`, `sms`, `in_app`, `push`, `status`, `notify_for`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'New User Added', 'support@achi.com', 'ADDED_USER', 'User has been joined.', '{\"username\":\"Username\"}', '[[username]] has been joined.', '[[username]] has been joined.', '[[username]] has been joined.', '[[username]] has been joined.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-10-03 07:20:18'),
(2, 1, 'Add Balance', 'support@achi.com', 'ADD_BALANCE', 'Your Account has been credited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '{\"mail\":\"0\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-10-03 07:20:18'),
(3, 1, 'Balance deducted by Admin', 'support@achi.com', 'DEDUCTED_BALANCE', 'Your Account has been debited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"mail\":\"0\",\"sms\":\"0\",\"in_app\":\"0\",\"push\":\"0\"}', 1, 'en', '2021-08-02 12:05:43', '2024-09-21 09:29:45'),
(4, 1, 'Support Ticket Create', 'support@achi.com', 'SUPPORT_TICKET_CREATE', 'Support Ticket Create', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', '[[username]] create a ticket\r\nTicket : [[ticket_id]]', '[[username]] create a ticket\r\nTicket : [[ticket_id]]', '[[username]] create a ticket\r\nTicket : [[ticket_id]]', '[[username]] create a ticket\r\nTicket : [[ticket_id]]', '{\"mail\":\"0\",\"sms\":\"0\",\"in_app\":\"0\",\"push\":\"0\"}', 1, 'en', '2021-08-02 12:05:43', '2024-12-05 08:30:21'),
(6, 1, 'Support Ticket Replied', 'support@achi.com', 'SUPPORT_TICKET_REPLIED', 'Support Ticket Replied', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2024-02-05 04:06:47'),
(7, 1, 'Admin Support Ticket Replied', 'support@achi.com', 'ADMIN_REPLIED_TICKET', 'Admin Support Ticket Replied', '{\"ticket_id\":\"Support Ticket ID\",\"ticket_subject\":\"Ticket Subject\",\"reply\":\"Reply Message\"}', 'Admin replied subject: [[ticket_subject]] message: [[reply]] Ticket : [[ticket_id]]', 'Admin replied subject: [[ticket_subject]] message: [[reply]]\r\nTicket : [[ticket_id]]', 'Admin replied subject: [[ticket_subject]] message: [[reply]]\nTicket : [[ticket_id]]', 'Admin replied subject: [[ticket_subject]] message: [[reply]]\nTicket: #[[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2021-08-02 12:05:43', '2024-02-05 04:06:47'),
(11, 1, 'KYC Approved', 'support@achi.com', 'KYC_APPROVED', 'Your KYC has been approved', '{\"username\":\"Username\"}', '[[username]] your kyc has been approved.', 'Your KYC has been approved.', 'Your KYC has been approved.', 'Your KYC has been approved.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(12, 1, 'KYC Rejected', 'support@achi.com', 'KYC_REJECTED', 'Your KYC has been rejected.', '{\"username\":\"Username\"}', '[[username]] your kyc has been rejected.', '[[username]] your kyc has been rejected.', '[[username]] your kyc has been rejected.', '[[username]] your kyc has been rejected.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(15, 1, 'Payment Request', 'support@achi.com', 'PAYMENT_REQUEST', 'Payment Request', '{\"gateway\":\"gateway\",\"currency\":\"currency\",\"username\":\"username\"}', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(16, 1, 'Payment Approved', 'support@achi.com', 'PAYMENT_APPROVED', 'Payment Approved', '{\"amount\":\"amount\",\"feedback\":\"Admin feedback\",\"charge\":\"Payment Charge\",\"transaction\":\"Transaction Id\",\"gateway_name\":\"Gateway Name\"}', '[[username]] deposit request [[amount]] via [[gateway]] has been approved.', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-03-07 04:18:55'),
(17, 1, 'Payment Rejected', 'support@achi.com', 'PAYMENT_REJECTED', 'Payment Rejected', '{\"amount\":\"amount\",\"feedback\":\"Admin feedback\",\"charge\",\"Payment Charge\",\"gateway_name\":\"Gateway Name\",\"transaction\":\"Transaction Id\"}', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(18, 1, 'Add Fund User', 'support@achi.com', 'ADD_FUND_USER_USER', 'Add Fund User', '{\"amount\":\"Request Amount\",\"transaction\":\"Transaction Number\"}', 'you add fund money amount [[amount]] . Transaction: #[[transaction]]', 'you add fund money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'you add fund money amount [[amount]]. Transaction: #[[transaction]]', 'you add fund money amount [[amount]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(19, 1, 'Add Fund User Admin', 'support@achi.com', 'ADD_FUND_USER_ADMIN', 'Add Fund User Admin', '{\"username\":\"Username\", \"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', '[[username]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]]. Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(24, 1, 'Reset Password Notification', 'support@achi.com', 'PASSWORD_RESET', 'Reset Password Notification', '{\"message\":\"message\"}', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(25, 1, 'Verification Code', 'support@achi.com', 'VERIFICATION_CODE', 'Verification Code', '{\"code\":\"code\"}', 'Your Email verification Code  [[code]]', 'Your SMS verification Code  [[code]]', 'Your Email verification Code  [[code]]', 'Your Email verification Code  [[code]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(26, 1, 'Two step enabled.', 'support@achi.com', 'TWO_STEP_ENABLED', 'Two step enabled.', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\",\"code\":\"code\"}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(27, 1, 'Two Step disabled', 'support@achi.com', 'TWO_STEP_DISABLED', 'Two Step disabled', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\"}', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(32, 1, 'Order Create', 'support@achi.com', 'ORDER_CREATE', 'Order created successfully.', '{\"price\":\"Order Price\", \"order_id\":\"Order id\",\"currency\":\"currency\",\"username\":\"username\"}', 'Order placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'Order placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'Order placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'Order placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(33, 1, 'Order Confirm', 'support@achi.com', 'CHILD_PANEL_USER_ORDER_CONFIRM', 'Your Order Has Been Confirmed', '{\"order_id\":\"order ID\",\"order_at\":\"order At\",\"service\":\"Service\", \"status\":\"status\",\"paid_amount\":\"paid amount\",\"transaction\":\"transaction ID\",\"remaining_balance\":\"Remaining Balance\",\"currency\":\"currency\"}', 'Your Order has been confirmed\n\n\nOrder Id [[order_id]] \n\nOrder At [[order_at]] \n\nService [[service]]\n\nStatus [[status]]\n\nPaid Amount [[paid_amount]] [[currency]]\n\nYour Current Balance [[remaining_balance]] [[currency]]\n\nTransaction: #[[transaction]]', 'Your Order has been confirmed\r\n\r\nOrder Id [[order_id]] \r\n\r\nOrder At [[order_at]] \r\n\r\nService [[service]]\r\n\r\nStatus [[status]]\r\n\r\nPaid Amount [[paid_amount]] [[currency]]\r\n\r\nYour Current Balance [[remaining_balance]] [[currency]]\r\n\r\nTransaction: #[[transaction]]', 'Order #[[order_id]] confirmed – Paid: [[paid_amount]] [[currency]], Status: [[status]].', 'Order #[[order_id]] confirmed – Paid: [[paid_amount]] [[currency]], Status: [[status]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(35, 1, 'Child Panel Place Order', 'support@achi.com', 'CHILD_PANEL_PLACE_ORDER', 'Child Panel Place Order.', '{\"order_id\":\"order ID\",\"order_at\":\"order At\",\"username\":\"username\"}', 'Child panel order #[[order_id]] has been placed at [[order_at]] by @[[username]].', 'Child panel order #[[order_id]] has been placed at [[order_at]] by @[[username]].', 'Child panel order #[[order_id]] has been placed at [[order_at]] by @[[username]].', 'Child panel order #[[order_id]] has been placed at [[order_at]] by @[[username]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(36, 1, 'Child Panel Order Confirm', 'support@achi.com', 'CHILD_PANEL_ORDER_CONFIRM', 'Child Panel Order Confirm.', '{\"order_id\":\"order ID\",\"order_at\":\"order At\",\"paid_amount\":\"paid amount\",\"transaction\":\"transaction ID\",\"remaining_balance\":\"Remaining Balance\",\"currency\":\"currency\"}', 'Order [[order_id]] placed on [[order_at]] has been confirmed. The paid amount is [[paid_amount]] [[currency]] with transaction ID [[transaction]]. Your remaining balance is [[remaining_balance]] [[currency]].', 'Order [[order_id]] placed on [[order_at]] has been confirmed. The paid amount is [[paid_amount]] [[currency]] with transaction ID [[transaction]]. Your remaining balance is [[remaining_balance]] [[currency]].', 'Order [[order_id]] placed on [[order_at]] has been confirmed. The paid amount is [[paid_amount]] [[currency]] with transaction ID [[transaction]]. Your remaining balance is [[remaining_balance]] [[currency]].', 'Order [[order_id]] placed on [[order_at]] has been confirmed. The paid amount is [[paid_amount]] [[currency]] with transaction ID [[transaction]]. Your remaining balance is [[remaining_balance]] [[currency]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(37, 1, 'Reject child panel order.', 'support@achi.com', 'REJECT_CHILD_PANEL_ORDER', 'Reject child panel order.', '{\"order_id\":\"order ID\",\"paid_amount\":\"paid amount\",\"transaction\":\"transaction ID\",\"currency\":\"currency\"}', 'Child panel order id #[[order_id]] has been rejected. The refunded amount is [[paid_amount]] [[currency]] with transaction ID [[transaction]].', 'Child panel order id #[[order_id]] has been rejected. The refunded amount is [[paid_amount]] [[currency]] with transaction ID [[transaction]].', 'Child panel order id #[[order_id]] has been rejected. The refunded amount is [[paid_amount]] [[currency]] with transaction ID [[transaction]].', 'Child panel order id #[[order_id]] has been rejected. The refunded amount is [[paid_amount]] [[currency]] with transaction ID [[transaction]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(38, 1, 'Approved child panel order.', 'support@achi.com', 'APPROVED_CHILD_PANEL_ORDER', 'Approved child panel order.', '{\"order_id\":\"order ID\", \"domain\":\"domain name\"}', 'The admin has approved your child panel order. The order ID is #[[order_id]], and the domain name is [[domain]].', 'The admin has approved your child panel order. The order ID is #[[order_id]], and the domain name is [[domain]].', 'The admin has approved your child panel order. The order ID is #[[order_id]], and the domain name is [[domain]].', 'The admin has approved your child panel order. The order ID is #[[order_id]], and the domain name is [[domain]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(39, 1, 'Approved renew request child panel.', 'support@achi.com', 'APPROVED_RENEW_REQUEST_CHILD_PANEL', 'Approved renew request child panel.', '{\"domain\":\"domain name\"}', 'The admin has approved your child panel renew request. The domain name is [[domain]].', 'The admin has approved your child panel renew request. The domain name is [[domain]].', 'The admin has approved your child panel renew request. The domain name is [[domain]].', 'The admin has approved your child panel renew request. The domain name is [[domain]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(40, 1, 'Rejected renew request child panel.', 'support@achi.com', 'REJECTED_RENEW_REQUEST_CHILD_PANEL', 'Rejected renew request child panel.', '{\"domain\":\"domain name\"}', 'The admin has rejected your child panel renew request. The domain name is [[domain]].', 'The admin has rejected your child panel renew request. The domain name is [[domain]].', 'The admin has rejected your child panel renew request. The domain name is [[domain]].', 'The admin has rejected your child panel renew request. The domain name is [[domain]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(41, 1, 'Add Balance', 'support@achi.com', 'CHILD_PANEL_USER_ADD_BALANCE', 'Your account has been credited.', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] credited to your account. \r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] credited to your account. \r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] credited to your account. \r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] credited to your account. \n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-10-03 07:20:18'),
(42, 1, 'Balance deducted by Admin', 'support@achi.com', 'CHILD_PANEL_DEDUCTED_BALANCE', 'Your Account has been debited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2024-09-21 09:29:45'),
(43, 1, 'The admin support ticket has been replied', 'support@achi.com', 'CHILD_PANEL_ADMIN_REPLIED_TICKET', 'The admin support ticket has been replied', '{\"ticket_id\":\"Support Ticket ID\",\"ticket_subject\":\"Ticket Subject\",\"reply\":\"Reply Message\"}', 'Admin replied to the ticket. Subject: [[ticket_subject]]. Message: [[reply]]. Ticket ID: [[ticket_id]].', 'Admin replied to the ticket. Subject: [[ticket_subject]]. Message: [[reply]]. Ticket ID: [[ticket_id]].', 'Admin replied to the ticket. Ticket ID: [[ticket_id]].', 'Admin replied to the ticket. Ticket ID: [[ticket_id]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2021-08-02 12:05:43', '2024-02-05 04:06:47'),
(45, 1, 'Child panel user create order', 'support@achi.com', 'CHILD_PANEL_USER_ORDER_CREATE', 'A child panel user order has been created', '{\"price\":\"Order Price\", \"order_id\":\"Order id\",\"currency\":\"currency\",\"username\":\"username\"}', 'The child panel user order was placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'The child panel user order was placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'The child panel user order was placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'The child panel user order was placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(47, 1, 'Order refill request', 'support@achi.com', 'ORDER_REFILL_REQUEST', 'Order refill request has been submitted.', '{\"order_id\":\"Order id\"}', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(52, 1, 'Resend fail order', 'support@achi.com', 'RESEND_FAIL_ORDER', 'Resend fail order', '{\"order_id\":\"ORDER ID\",\"child_panel\":\"Child Panel\"}', '[[child_panel]]: child panel resend order due to failure. Order ID: [[order_id]].', '[[child_panel]]: child panel resend order due to failure. Order ID: [[order_id]].', '[[child_panel]]: child panel resend order due to failure. Order ID: [[order_id]].', '[[child_panel]]: child panel resend order due to failure. Order ID: [[order_id]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2021-08-02 12:05:43', '2024-02-05 04:06:47'),
(53, 1, 'Refund for order', 'support@achi.com', 'REFUND_FOR_ORDER', 'Refund the user balance for the order.', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"main_balance\":\"Users Balance After this operation\", \"order_id\":\"Order Id\"}', '[[amount]] was debited from your account. \n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]\n\nRefunded for order.Order ID:[[order_id]]', '[[amount]] was debited from your account. \r\n\r\nYour Current Balance [[main_balance]]\r\n\r\nTransaction: #[[transaction]]\r\n\r\nRefunded for order.Order ID:[[order_id]]', '[[amount]] was debited from your account. Transaction: #[[transaction]].\r\nRefund for order [[order_id]].', '[[amount]] was debited from your account. Transaction: #[[transaction]].\r\nRefund for order [[order_id]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(54, 1, 'Child Panel Order Status Changed', 'support@achi.com', 'CHILD_PANEL_ORDER_STATUS_CHANGED', 'Order status changed', '{\"child_panel\":\"Child Panel\",\"order_id\":\"Order Id\",\"order_status\":\"Order Status\"}', 'Order status changed. Order ID: [[order_id]], status changed to [[order_status]].', 'Order status changed. Order ID: [[order_id]], status changed to [[order_status]].', 'Order status changed. Order ID: [[order_id]], status changed to [[order_status]].', 'Order status changed. Order ID: [[order_id]], status changed to [[order_status]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-12-18 07:35:45'),
(55, 1, 'Automatically renew the child panel.', 'support@achi.com', 'AUTOMATICALLY_RENEW_CHILD_PANEL', 'Automatically renew the child panel.', '{\"domain\":\"domain name\", \"username:username\"}', '@[[username]] Automatically renew the child panel. The domain name is [[domain]].', '@[[username]] Automatically renew the child panel. The domain name is [[domain]].', '@[[username]] Automatically renew the child panel. The domain name is [[domain]].', '@[[username]] Automatically renew the child panel. The domain name is [[domain]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(56, 1, 'Fail automatically renew the child panel.', 'support@achi.com', 'FAIL_AUTOMATICALLY_RENEW_CHILD_PANEL', 'Fail automatically renew the child panel.', '{\"domain\":\"domain name\", \"username:username\"}', '@[[username]] fails to renew the child panel automatically.', '@[[username]] fails to renew the child panel automatically.', '@[[username]] fails to renew the child panel automatically.', '@[[username]] fails to renew the child panel automatically.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(57, 1, 'User order has been created', 'support@achi.com', 'CHILD_PANEL_USER_ORDER_CREATE', 'A user order has been created', '{\"price\":\"Order Price\", \"order_id\":\"Order id\",\"currency\":\"currency\",\"username\":\"username\"}', 'Order placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'Order placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'Order placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', 'Order placed by [[username]].Order id is #[[order_id]] and order amount is [[price]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 2, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(58, 1, 'Add Fund User Admin', 'support@achi.com', 'ADD_FUND_USER_CHILD_PANEL_ADMIN', 'Add Fund User Admin', '{\"username\":\"username\", \"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', '[[username]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]]. Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '[[username]] add fund money amount [[amount]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 2, 'en', '2023-10-07 22:18:47', '2024-02-05 04:06:47'),
(59, 1, 'Order refill request', 'support@achi.com', 'ORDER_REFILL_REQUEST_CHILD_PANEL', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', '{\"order_id\":\"Order id\"}', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', 'Order refill request has been submitted.\r\nOrder ID:[[order_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 2, 'en', '2023-10-07 22:18:47', '2024-09-21 09:29:45'),
(60, 1, 'Support Ticket Create', 'support@achi.com', 'CHILD_PANEL_USER_SUPPORT_TICKET_CREATE', 'Support Ticket Create', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', '[[username]] create a ticket.\r\nTicket: [[ticket_id]]', '[[username]] create a ticket.\r\nTicket: [[ticket_id]]', '[[username]] create a ticket.\r\nTicket: [[ticket_id]]', '[[username]] create a ticket.\r\nTicket: [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 2, 'en', '2021-08-02 12:05:43', '2024-09-21 09:29:45'),
(62, 1, 'New User Added', 'support@achi.com', 'ADDED_USER_CHILD_PANEL', 'User has been joined.', 'New User Added', '[[username]] has been joined.', '[[username]] has been joined.', '[[username]] has been joined.', '[[username]] has been joined.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 2, 'en', '2023-10-07 22:18:47', '2024-10-03 07:20:18'),
(63, 1, 'Reset Password Notification', 'support@achi.com', 'PASSWORD_RESET_CHILD_PANEL_ADMIN', 'Reset Password Notification', '{\"message\":\"message\"}', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 2, 'en', '2023-10-07 22:18:47', '2024-12-05 08:27:19'),
(64, 1, 'Support Ticket Replied', 'support@achi.com', 'CHILD_PANEL_USER_TICKET_REPLIED', 'Support Ticket Replied', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 2, 'en', '2021-08-02 12:05:43', '2024-02-05 04:06:47'),
(66, 1, 'Suspended Child Panel', 'support@achi.com', 'SUSPENDED CHILD PANEL', 'Child Suspended Panel', '{\"username\":\"Username\", \"domain\":\"Domain\"}', 'Your child panel on the domain [[domain]] has been suspended.', 'Your child panel on the domain [[domain]] has been suspended.', 'Your child panel on the domain [[domain]] has been suspended.', 'Your child panel on the domain [[domain]] has been suspended.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2024-10-03 07:20:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `request_hash` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_panel_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `api_order_id` int DEFAULT NULL,
  `api_refill_id` int DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `price` double(18,8) DEFAULT NULL,
  `charge` double(18,8) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refill_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `agree` tinyint DEFAULT NULL,
  `start_counter` bigint DEFAULT NULL,
  `remains` bigint DEFAULT NULL,
  `runs` tinyint DEFAULT NULL,
  `interval` tinyint DEFAULT NULL,
  `drip_feed` tinyint DEFAULT NULL,
  `refilled_at` timestamp NULL DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refunded` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `og_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breadcrumb_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breadcrumb_image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breadcrumb_status` tinyint(1) DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `status` tinyint(1) DEFAULT '1' COMMENT '0 => unpublish, 1 => publish',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => admin create, 1 => developer create, 2 => create for menu, 3 => custom links',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `template_name`, `custom_link`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `og_description`, `meta_robots`, `meta_image`, `meta_image_driver`, `breadcrumb_image`, `breadcrumb_image_driver`, `breadcrumb_status`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'home', '/', 'light_green', NULL, 'Home', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Social Media Marketing\",\"SMM Services\",\"Buy Followers\",\"Increase Engagement\",\"Social Media Growth\",\"Instagram Followers\",\"Boost Social Media\",\"Affordable SMM\",\"Social Media Advertising\"]', 'Boost your social media presence with our powerful SMM Panel. Buy real, high-quality social media services like Instagram followers, Facebook likes, and more. Affordable and efficient marketing solutions for individuals, brands, and resellers.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,follow', NULL, NULL, NULL, 'local', 0, 1, 0, '2024-05-05 03:58:49', '2024-11-07 07:55:24'),
(2, 'about', 'about', 'light_green', NULL, 'About Us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/LKt5m14pnbg45ZiW5EOWVGRCc5r4hm.avif', 'local', 1, 1, 0, '2024-05-05 06:41:22', '2024-08-30 05:31:54'),
(3, 'faq', 'faq', 'light_green', NULL, 'Faq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/UHDS2jMazpG1rGoPaUj5JKLKoht7Sp.avif', 'local', 1, 1, 0, '2024-05-05 06:43:22', '2024-05-06 08:46:02'),
(4, 'blogs', 'blogs', 'light_green', NULL, 'Blogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/Q86SNAGPMy0hCHC7Qp71FHJRXaRk9D.avif', 'local', 1, 1, 0, '2024-05-05 06:43:55', '2024-10-30 02:40:38'),
(5, 'contact', 'contact', 'light_green', NULL, 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/9KlUw4PhTeffsoPJit5IMWvyw9hH7Q.avif', 'local', 1, 1, 0, '2024-05-05 06:44:24', '2024-05-06 08:46:26'),
(6, 'login', 'login', 'light_green', NULL, 'Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/1zb4JGjqFu99jvPlYYV0AT7osbchDx.avif', 'local', 1, 1, 2, '2024-05-25 03:09:52', '2024-10-02 08:36:52'),
(7, 'register', 'register', 'light_green', NULL, 'Register', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/WjBbtlS0Qequn1JP6J0yjKXfGb9Vkk.avif', 'local', 1, 1, 2, '2024-05-25 03:09:52', '2024-10-02 08:36:52'),
(8, 'service', 'services', 'light_green', NULL, 'Services', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Instagram Followers\",\"Facebook Likes\",\"Twitter Followers\",\"YouTube Views\",\"Social Media Boost\"]', 'Discover a wide range of SMM services to boost your social media presence. From Instagram followers to Facebook likes, we offer affordable, high-quality solutions to enhance your online profile, drive engagement, and grow your brand.', 'Explore our premium SMM services designed to accelerate your social media growth. Whether you need Instagram followers, Facebook likes, or YouTube views, our services provide the boost your social profiles need. Fast, reliable, and cost-effective solutions.', 'index,follow', NULL, NULL, 'pagesImage/z6fQyUFhp8DfDHIpPuGFIIWMX9HMCL.avif', 'local', 1, 1, 2, '2024-06-10 03:25:55', '2024-11-07 08:31:55'),
(9, 'privacy &amp; policy', 'privacy-policy', 'light_green', NULL, 'privacy &amp; policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/cdtS4ojCjxiNVxVR7UXVypoJj1TTXv.avif', 'local', 1, 1, 0, '2024-08-07 01:55:45', '2024-10-07 10:09:25'),
(10, 'terms and conditions', 'terms-and-conditions', 'light_green', NULL, 'Terms and Conditions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/unVXuKlbp9hFh4bz7WTNsK63rWxdOA.avif', 'local', 1, 1, 0, '2024-08-07 02:27:30', '2024-11-07 07:52:11'),
(11, 'Forgot Password', 'forgot-password', 'light_green', NULL, 'Forgot Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/ZnaDhWvbmfLtAeYFIKa1dEHilevvbb.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(12, 'Reset Password', 'reset-password', 'light_green', NULL, 'Reset Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/HgOThsYDoOlDT8C4m5CjfJv7p1WqUf.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(13, 'Email Verification', 'email-verification', 'light_green', NULL, 'Email Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/ILZlPXkpzw1ocqQBKOPxhjVVBRr6ba.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(14, 'SMS Verification', 'sms-verification', 'light_green', NULL, 'SMS Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/HJU3isCkWdPE6YOKgIlO0W6qJpcmDM.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(15, '2FA Verification', 'two-fa-verification', 'light_green', NULL, 'Two FA Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/oaamJEj10jubi442yn9fg8vXJMuY1x.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(17, 'home', '/', 'dark_voilet', NULL, 'Home', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Social Media Marketing\",\"SMM Services\",\"Buy Followers\",\"Boost Social Media\",\"Social Media Growth\"]', 'Boost your social media presence with our powerful SMM Panel. Buy real, high-quality social media services like Instagram followers, Facebook likes, and more. Affordable and efficient marketing solutions for individuals, brands, and resellers.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,follow', NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-01 03:53:09', '2024-11-07 08:00:52'),
(18, 'about', 'about', 'dark_voilet', NULL, 'About', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/O8Gp7kwE0BfWeaXf6VhsOqNhr5DOXo.avif', 'local', 1, 1, 0, '2024-10-01 04:08:21', '2024-10-01 10:28:32'),
(19, 'faq', 'faq', 'dark_voilet', NULL, 'Faq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/cbnxAar7TYPO5cXVlNRQztmTvMMNw1.avif', 'local', 1, 1, 0, '2024-10-01 10:26:17', '2024-10-07 09:20:21'),
(20, 'blogs', 'blogs', 'dark_voilet', NULL, 'Blogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/efNbIQP94BE3e3JQ8o2taABmZAcBR2.avif', 'local', 1, 1, 0, '2024-10-01 10:26:44', '2024-10-30 04:44:23'),
(21, 'contact', 'contact', 'dark_voilet', NULL, 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/LhYl8tkxiC8Pmefd3hCgSZWXcoxL84.avif', 'local', 1, 1, 0, '2024-10-01 10:27:33', '2024-10-02 02:23:26'),
(22, 'login', 'login', 'dark_voilet', NULL, 'Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/1zb4JGjqFu99jvPlYYV0AT7osbchDx.avif', 'local', 1, 1, 2, '2024-05-25 03:09:52', '2024-10-02 08:36:52'),
(23, 'register', 'register', 'dark_voilet', NULL, 'Register', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/WjBbtlS0Qequn1JP6J0yjKXfGb9Vkk.avif', 'local', 1, 1, 2, '2024-05-25 03:09:52', '2024-10-02 08:36:52'),
(24, 'service', 'services', 'dark_voilet', NULL, 'Services', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"TikTok Followers\",\"Social Media Growth\",\"Social Media Marketing\",\"Digital Marketing Services\",\"Social Media Services for Resellers\"]', 'Discover a wide range of SMM services to boost your social media presence. From Instagram followers to Facebook likes, we offer affordable, high-quality solutions to enhance your online profile, drive engagement, and grow your brand.', 'Discover a wide range of SMM services to boost your social media presence. From Instagram followers to Facebook likes, we offer affordable, high-quality solutions to enhance your online profile, drive engagement, and grow your brand.', 'index,follow', NULL, NULL, 'pagesImage/z6fQyUFhp8DfDHIpPuGFIIWMX9HMCL.avif', 'local', 1, 1, 2, '2024-06-10 03:25:55', '2024-11-07 08:30:31'),
(25, 'privacy &amp; policy', 'privacy-policy', 'dark_voilet', NULL, 'Privacy &amp; Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/yI8N0m3kyymhlr23qs9o2SKy7PyfGR.avif', 'local', 1, 1, 0, '2024-08-07 01:55:45', '2024-11-07 07:59:51'),
(26, 'terms and conditions', 'terms-and-conditions', 'dark_voilet', NULL, 'Terms and Conditions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/x5nUR4Ng1q7YhskFd61pbpUT3A8Cnd.avif', 'local', 1, 1, 0, '2024-08-07 02:27:30', '2024-11-07 07:59:35'),
(27, 'Forgot Password', 'forgot-password', 'dark_voilet', NULL, 'Forgot Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/ZnaDhWvbmfLtAeYFIKa1dEHilevvbb.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(28, 'Reset Password', 'reset-password', 'dark_voilet', NULL, 'Reset Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/HgOThsYDoOlDT8C4m5CjfJv7p1WqUf.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(29, 'Email Verification', 'email-verification', 'dark_voilet', NULL, 'Email Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/ILZlPXkpzw1ocqQBKOPxhjVVBRr6ba.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(30, 'SMS Verification', 'sms-verification', 'dark_voilet', NULL, 'SMS Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/HJU3isCkWdPE6YOKgIlO0W6qJpcmDM.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(31, '2FA Verification', 'two-fa-verification', 'dark_voilet', NULL, 'Two FA Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/oaamJEj10jubi442yn9fg8vXJMuY1x.avif', 'local', 1, 1, 2, '2024-08-30 05:23:29', '2024-10-02 08:36:52'),
(32, 'home', '/', 'minimal', NULL, 'Home', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Media Marketing\",\"SMM Services\",\"Increase Engagement\",\"Social Media Growth\",\"Instagram Followers\",\"Boost Social Media\"]', 'Boost your social media presence with our powerful SMM Panel. Buy real, high-quality social media services like Instagram followers, Facebook likes, and more. Affordable and efficient marketing solutions for individuals, brands, and resellers.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,follow', NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-27 01:43:11', '2024-11-07 08:03:20'),
(33, 'about', 'about', 'minimal', NULL, 'About', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/eFOXdbso4zULgtJhNDfyi3eYNf9bKW.avif', 'local', 1, 1, 0, '2024-10-27 02:36:47', '2024-10-30 07:44:48'),
(34, 'blogs', 'blogs', 'minimal', NULL, 'Blogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/eTCVjFIwHpNUXsD0JRjHarqKHfTpyk.avif', 'local', 1, 1, 0, '2024-10-28 03:14:24', '2024-11-07 03:26:06'),
(35, 'faq', 'faq', 'minimal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/wBUqFu0VI82VcQ9bV9eRH2iHkb2M1f.avif', 'local', 0, 1, 0, '2024-10-28 03:35:04', '2024-11-07 03:26:18'),
(36, 'contact', 'contact', 'minimal', NULL, 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/xGaUC2Wcqzx05qwCqgjzMzBTME7I7H.avif', 'local', 0, 1, 0, '2024-10-28 04:05:25', '2024-11-07 03:22:02'),
(37, 'Services', 'services', 'minimal', NULL, 'Services', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Social Media Boost\",\"Social Media Automation\",\"TikTok Followers\",\"Social Media Growth\",\"Social Media Marketing\"]', 'Discover a wide range of SMM services to boost your social media presence. From Instagram followers to Facebook likes, we offer affordable, high-quality solutions to enhance your online profile, drive engagement, and grow your brand.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,noindex', NULL, NULL, 'pagesImage/45q6wlUhZFP62X2bFqwFdVWWHIuNEo.avif', 'local', 1, 1, 1, '2024-10-28 04:15:09', '2024-11-07 08:28:43'),
(38, 'Login', 'login', 'minimal', NULL, 'Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/Wsbs003d4d8tVum7XoK73dUXNVQNIl.avif', 'local', 1, 1, 2, '2024-10-28 04:15:09', '2024-11-08 12:26:45'),
(39, 'Register', 'register', 'minimal', NULL, 'Register', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/Bx247OlunWjkEH8uPF3ZNJYaqUX4pF.avif', 'local', 1, 1, 2, '2024-10-28 04:15:09', '2024-11-08 12:26:55'),
(40, 'Forgot Password', 'forgot-password', 'minimal', NULL, 'Forgot Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/NAMQJb2q8JGGyMDIoWkKV0Pg0U5yoZ.avif', 'local', 1, 1, 2, '2024-10-28 04:15:09', '2024-11-08 12:26:22'),
(41, 'Reset Password', 'reset-password', 'minimal', NULL, 'Reset Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/qKRdjbisswV9CaEKWmlyIsb97idC8q.avif', 'local', 1, 1, 2, '2024-10-28 04:15:09', '2024-11-08 12:27:07'),
(42, 'Email Verification', 'email-verification', 'minimal', NULL, 'Email Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/bTP7dFJjB6LP3VuSTdK2xAYV4K8Hbw.avif', 'local', 1, 1, 2, '2024-10-28 04:15:09', '2024-11-08 12:27:22'),
(43, 'SMS Verification', 'sms-verification', 'minimal', NULL, 'SMS Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/Qt8VT1pWOJ2PSsQf7AbVls1KyIzIiw.avif', 'local', 1, 1, 2, '2024-10-28 04:15:09', '2024-11-08 12:27:34'),
(44, '2FA Verification', 'two-fa-verification', 'minimal', NULL, 'Two FA Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/gOcIfUUuPPjTyoWcq7uJvwh47XLTLf.avif', 'local', 1, 1, 2, '2024-10-28 04:15:09', '2024-11-08 12:27:45'),
(45, 'home', '/', 'deep_blue', NULL, 'Home', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Social Media Marketing\",\"Social Media Advertising\",\"Instagram Followers\",\"Increase Engagement\",\"Social Media Growth\"]', 'Boost your social media presence with our powerful SMM Panel. Buy real, high-quality social media services like Instagram followers, Facebook likes, and more. Affordable and efficient marketing solutions for individuals, brands, and resellers.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,follow', NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-28 08:21:39', '2024-11-07 08:04:51'),
(46, 'about', 'about', 'deep_blue', NULL, 'About Us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/zhAhGAK7twziB8eET0xP2xp1DPpxBv.avif', 'local', 1, 1, 0, '2024-10-28 10:14:47', '2024-10-28 10:28:22'),
(47, 'blogs', 'blogs', 'deep_blue', NULL, 'Blogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/QZeFG0M4WMS0LExa3u5urxx7HAVR9Z.avif', 'local', 1, 1, 0, '2024-10-28 10:17:30', '2024-10-28 10:28:36'),
(48, 'contact', 'contact', 'deep_blue', NULL, 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/CZJPQx3BZ1DmwLQUGhOVVhj6wcXiS4.avif', 'local', 0, 1, 0, '2024-10-28 10:35:22', '2024-11-07 03:43:50'),
(49, 'faq', 'faq', 'deep_blue', NULL, 'Faq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/j20zxnnJgATW91ovbqhYQm0dqwICM7.avif', 'local', 0, 1, 0, '2024-10-28 13:12:27', '2024-11-07 03:45:19'),
(50, 'Service', 'services', 'deep_blue', NULL, 'Services', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Instagram Followers\",\"Facebook Likes\",\"Twitter Followers\",\"YouTube Views\",\"TikTok Followers\"]', 'Boost your social media presence with our powerful SMM Panel. Buy real, high-quality social media services like Instagram followers, Facebook likes, and more. Affordable and efficient marketing solutions for individuals, brands, and resellers.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,follow', NULL, NULL, NULL, NULL, 0, 1, 1, '2024-10-29 03:45:41', '2024-11-07 08:27:23'),
(51, 'Login', 'login', 'deep_blue', NULL, 'Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 03:45:41', '2024-10-30 14:37:44'),
(52, 'Register', 'register', 'deep_blue', NULL, 'Register', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 03:45:41', '2024-10-30 14:47:52'),
(53, 'Forgot Password', 'forgot-password', 'deep_blue', NULL, 'Forgot Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 03:45:41', '2024-10-30 14:48:44'),
(54, 'Reset Password', 'reset-password', 'deep_blue', NULL, 'Reset Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 03:45:41', '2024-11-07 08:05:50'),
(55, 'Email Verification', 'email-verification', 'deep_blue', NULL, 'Email Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 03:45:41', '2024-11-07 08:06:05'),
(56, 'SMS Verification', 'sms-verification', 'deep_blue', NULL, 'SMS Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 03:45:41', '2024-11-07 08:06:16'),
(57, '2FA Verification', 'two-fa-verification', 'deep_blue', NULL, 'Two Fa Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 03:45:41', '2024-11-07 08:06:30'),
(58, 'home', '/', 'light_orange', NULL, 'Home', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Social Media Marketing\",\"SMM Services\",\"Increase Engagement\",\"Social Media Growth\",\"Boost Social Media\"]', 'Boost your social media presence with our powerful SMM Panel. Buy real, high-quality social media services like Instagram followers, Facebook likes, and more. Affordable and efficient marketing solutions for individuals, brands, and resellers.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,follow', NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-28 16:03:13', '2024-11-07 08:17:07'),
(59, 'about', 'about', 'light_orange', NULL, 'About', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/QRYMfhrinyUYNK7BpYQtHoWRKkVp7w.avif', 'local', 1, 1, 0, '2024-10-29 03:15:50', '2024-11-07 07:09:44'),
(60, 'blogs', 'blogs', 'light_orange', NULL, 'Blogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/u1lUlpu3VnrsxFakAFGtZRi9XCFMKi.avif', 'local', 1, 1, 0, '2024-10-29 03:16:42', '2024-11-07 07:09:53'),
(61, 'faq', 'faq', 'light_orange', NULL, 'Faq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/2BpMkxznZrgc1xpSXg0isO0sTruMvT.avif', 'local', 1, 1, 0, '2024-10-29 03:18:23', '2024-10-30 16:36:43'),
(62, 'contact', 'contact', 'light_orange', NULL, 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/vmmcrTskJL605x5tUU6AHe5lKk1gjE.avif', 'local', 1, 1, 0, '2024-10-29 03:30:49', '2024-10-30 16:36:54'),
(73, 'Service', 'services', 'light_orange', NULL, 'Services', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Instagram Followers\",\"Facebook Likes\",\"Twitter Followers\",\"Social Media Boost\",\"Social Media Marketing\"]', 'Discover a wide range of SMM services to boost your social media presence. From Instagram followers to Facebook likes, we offer affordable, high-quality solutions to enhance your online profile, drive engagement, and grow your brand.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,follow', NULL, NULL, 'pagesImage/OMCz6nRu2bR9bQmuAEJWE8JJao4tU2.avif', 'local', 1, 1, 1, '2024-10-29 03:50:21', '2024-11-07 08:22:28'),
(74, 'Login', 'login', 'light_orange', NULL, 'Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/26K0UcKxPgFgLWXS24K19gWk1P1unN.avif', 'local', 1, 1, 2, '2024-10-29 03:50:21', '2024-11-07 07:10:37'),
(75, 'Register', 'register', 'light_orange', NULL, 'Register', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/9hooViMlwKmSFj7YFgZ5oPdfk59iY5.avif', 'local', 1, 1, 2, '2024-10-29 03:50:21', '2024-11-07 07:10:48'),
(76, 'Forgot Password', 'forgot-password', 'light_orange', NULL, 'Forgot Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/bu3iJuHoPBAwXEUQCj1ynHj8jbB1I2.avif', 'local', 1, 1, 2, '2024-10-29 03:50:21', '2024-11-07 07:10:57'),
(77, 'Reset Password', 'reset-password', 'light_orange', NULL, 'Reset Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/uAqEVVbjcwwW5OZzdZmWnfFAxGWY4r.avif', 'local', 1, 1, 2, '2024-10-29 03:50:21', '2024-11-07 07:11:06'),
(78, 'Email Verification', 'email-verification', 'light_orange', NULL, 'Email Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/hbVvZzLkj6QANCXwLPtPBgHAtSWwJx.avif', 'local', 1, 1, 2, '2024-10-29 03:50:21', '2024-11-07 08:23:47'),
(79, 'SMS Verification', 'sms-verification', 'light_orange', NULL, 'SMS Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/OH4IARipWDQZYb2EECZ9fpdix8Df5D.avif', 'local', 1, 1, 2, '2024-10-29 03:50:21', '2024-10-30 16:37:35'),
(80, '2FA Verification', 'two-fa-verification', 'light_orange', NULL, 'Two FA Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/q5HPI65aiJStNwbFPpgMNlVkbqZqP7.avif', 'local', 1, 1, 2, '2024-10-29 03:50:21', '2024-10-30 16:36:22'),
(81, 'home', '/', 'dark_mode', NULL, 'Home', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"Instagram Followers\",\"Boost Social Media\",\"Affordable SMM\",\"Social Media Advertising\",\"Increase Engagement\"]', 'Boost your social media presence with our powerful SMM Panel. Buy real, high-quality social media services like Instagram followers, Facebook likes, and more. Affordable and efficient marketing solutions for individuals, brands, and resellers.', 'Elevate your online presence with our SMM Panel. Access top-quality services to grow your Instagram, Facebook, Twitter, and more. Fast, affordable, and reliable solutions for all your social media needs.', 'index,follow', NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-29 07:13:43', '2024-11-07 08:14:38'),
(82, 'about', 'about', 'dark_mode', NULL, 'About Us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-29 08:37:41', '2024-10-29 08:40:50'),
(83, 'blogs', 'blogs', 'dark_mode', NULL, 'Blogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-29 08:45:49', '2024-10-30 15:13:28'),
(84, 'contact', 'contact', 'dark_mode', NULL, 'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-29 08:50:04', '2024-10-29 09:06:02'),
(85, 'Service', 'services', 'dark_mode', NULL, 'Services', 'Affordable Social Media Marketing Services | Boost Your Online Presence', '[\"TikTok Followers\",\"Social Media Growth\",\"Social Media Marketing\",\"Facebook Likes\",\"Twitter Followers\"]', 'Discover a wide range of SMM services to boost your social media presence. From Instagram followers to Facebook likes, we offer affordable, high-quality solutions to enhance your online profile, drive engagement, and grow your brand.', 'Explore our premium SMM services designed to accelerate your social media growth. Whether you need Instagram followers, Facebook likes, or YouTube views, our services provide the boost your social profiles need. Fast, reliable, and cost-effective solutions.', 'index,follow', NULL, NULL, NULL, NULL, 0, 1, 1, '2024-10-29 09:06:57', '2024-11-07 08:26:15'),
(86, 'Login', 'login', 'dark_mode', NULL, 'Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 09:06:57', '2024-10-30 15:15:04'),
(87, 'Register', 'register', 'dark_mode', NULL, 'Register', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 09:06:57', '2024-10-30 15:14:53'),
(88, 'Forgot Password', 'forgot-password', 'dark_mode', NULL, 'Forgot Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 09:06:57', '2024-10-30 15:18:59'),
(89, 'Reset Password', 'reset-password', 'dark_mode', NULL, 'Reset Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 09:06:57', '2024-10-30 15:19:15'),
(90, 'Email Verification', 'email-verification', 'dark_mode', NULL, 'Email Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 09:06:57', '2024-10-30 15:19:32'),
(91, 'SMS Verification', 'sms-verification', 'dark_mode', NULL, 'SMS Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 09:06:57', '2024-10-30 15:19:52'),
(92, '2FA Verification', 'two-fa-verification', 'dark_mode', NULL, 'Two Fa Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, '2024-10-29 09:06:57', '2024-10-30 15:20:21'),
(93, 'refund policy', 'refund-policy', 'light_green', NULL, 'Refund Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/c18YBngsgfKlGW3EJ6xL11SBSg2ao9.avif', 'local', 1, 1, 0, '2024-10-30 02:49:16', '2024-10-30 16:06:06'),
(94, 'cookie policy', 'cookie-policy', 'light_green', NULL, 'Cookie Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/tOcG7KYBmxV7Qp16GaMWqZ55wA9es9.avif', 'local', 1, 1, 0, '2024-10-30 03:11:45', '2024-10-30 16:05:38'),
(96, 'api docs', 'api-docs', 'light_green', NULL, 'Api Docs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/gQM9aKbAswVudSo0JjjStpaHQm0rUb.avif', 'local', 1, 1, 0, '2024-10-30 03:31:33', '2024-10-30 16:04:59'),
(97, 'refund policy', 'refund-policy', 'dark_voilet', NULL, 'Refund Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/9MGnGRFKQIcQ0PltqFfIn4vzljQHKZ.avif', 'local', 1, 1, 0, '2024-10-30 06:30:55', '2024-11-07 15:56:39'),
(98, 'cookie policy', 'cookie-policy', 'dark_voilet', NULL, 'Cookie Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/bsplsXDwPaQgpWjJyJjBvh2f3Unf1x.avif', 'local', 1, 1, 0, '2024-10-30 06:31:32', '2024-11-07 15:56:03'),
(99, 'api docs', 'api-docs', 'dark_voilet', NULL, 'Api Docs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/SZ15E7Ov5BKJqqEffhNU5QDpswXvs3.avif', 'local', 1, 1, 0, '2024-10-30 06:33:59', '2024-11-07 15:55:37'),
(100, 'privacy policy', 'privacy-policy', 'minimal', NULL, 'Privacy Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/xXTTZOowsIBCSbaHW3hv73i7ZdmOQ6.webp', 'local', 1, 1, 0, '2024-10-30 09:22:37', '2024-10-30 09:36:14'),
(101, 'terms and  conditions', 'terms-and-conditions', 'minimal', NULL, 'Terms and Conditions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/osuZuff1fC3AplGDzGK8xZdeRjmzCH.webp', 'local', 1, 1, 0, '2024-10-30 09:23:48', '2024-10-30 09:35:57'),
(102, 'refund policy', 'refund-policy', 'minimal', NULL, 'Refund Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/yFaKdEKdyhcmPFX8XhoiTq4LNLw5u8.webp', 'local', 1, 1, 0, '2024-10-30 09:24:21', '2024-10-30 09:35:37'),
(103, 'cookie policy', 'cookie-policy', 'minimal', NULL, 'Cookie Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/rX5RwnoRkbjLgSA9gC5Gs8a5p9JHGS.webp', 'local', 1, 1, 0, '2024-10-30 09:25:04', '2024-10-30 09:34:56'),
(104, 'api docs', 'api-docs', 'minimal', NULL, 'Api Docs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/onen2nFgI5SCSxoXmhrDaineCTCgKo.webp', 'local', 1, 1, 0, '2024-10-30 09:27:22', '2024-10-30 09:34:43'),
(105, 'privacy policy', 'privacy-policy', 'deep_blue', NULL, 'Privacy Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 14:50:56', '2024-10-30 14:54:04'),
(106, 'terms conditions', 'terms-conditions', 'deep_blue', NULL, 'Terms Conditions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 14:51:39', '2024-10-30 14:54:18'),
(107, 'refund policy', 'refund-policy', 'deep_blue', NULL, 'Refund Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 14:52:13', '2024-10-30 14:54:32'),
(108, 'cookie policy', 'cookie-policy', 'deep_blue', NULL, 'Cookie Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 14:52:39', '2024-10-30 14:54:46'),
(109, 'api docs', 'api-docs', 'deep_blue', NULL, 'Api Docs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 14:56:40', '2024-10-30 14:57:12'),
(110, 'faq', 'faq', 'dark_mode', NULL, 'Faq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 15:48:46', '2024-10-30 15:52:08'),
(111, 'privacy policy', 'privacy-policy', 'dark_mode', NULL, 'Privacy Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 15:58:06', '2024-10-30 16:01:25'),
(112, 'terms and conditions', 'terms-and-conditions', 'dark_mode', NULL, 'Terms and Conditions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 15:58:31', '2024-10-30 16:06:42'),
(113, 'refund policy', 'refund-policy', 'dark_mode', NULL, 'Refund Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 15:58:55', '2024-10-30 16:01:04'),
(114, 'cookie policy', 'cookie-policy', 'dark_mode', NULL, 'Cookie Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 15:59:11', '2024-10-30 16:00:52'),
(115, 'api docs', 'api-docs', 'dark_mode', NULL, 'Api Docs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, '2024-10-30 16:00:30', '2024-10-30 16:00:42'),
(116, 'privacy &amp; policy', 'privacy-policy', 'light_orange', NULL, 'Privacy &amp; Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/Wx1W3mvz444XVHiUchynJ3UA3mglp5.webp', 'local', 1, 1, 0, '2024-10-30 16:30:21', '2024-10-30 16:35:37'),
(117, 'terms and conditions', 'terms-and-conditions', 'light_orange', NULL, 'Terms and Conditions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/UL2vUivmYaPJg5MUuOQOw56zo41HZe.webp', 'local', 1, 1, 0, '2024-10-30 16:30:47', '2024-10-30 16:35:26'),
(118, 'refund policy', 'refund-policy', 'light_orange', NULL, 'Refund Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/zey3nCMInelKZytgOGWlryCfRzMyPv.webp', 'local', 1, 1, 0, '2024-10-30 16:31:12', '2024-10-30 16:35:16'),
(119, 'cookie policy', 'cookie-policy', 'light_orange', NULL, 'Cookie Policy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/HTQsuq02bmolsw0EitlUe8Sl4YImdC.webp', 'local', 1, 1, 0, '2024-10-30 16:31:39', '2024-10-30 16:35:05'),
(120, 'api docs', 'api-docs', 'light_orange', NULL, 'Api Docs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pagesImage/v8CTRBc1Wsq4cOxXOZxX9MIIZnPAlx.webp', 'local', 1, 1, 0, '2024-10-30 16:33:38', '2024-10-30 16:34:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_details`
--

CREATE TABLE `page_details` (
  `id` bigint UNSIGNED NOT NULL,
  `page_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sections` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_details`
--

INSERT INTO `page_details` (`id`, `page_id`, `language_id`, `name`, `content`, `sections`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[service]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[why_choose_us]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[achievement]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_works]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"feature\",\"about\",\"service\",\"why_choose_us\",\"achievement\",\"how_it_works\",\"testimonial\",\"payment_partner\",\"blog\",\"footer\"]', '2024-05-05 03:58:49', '2024-07-02 02:46:19'),
(2, 2, 1, 'About', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"about\",\"feature\",\"faq\",\"testimonial\",\"blog\",\"footer\"]', '2024-05-05 06:41:22', '2024-11-07 08:33:18'),
(3, 3, 1, 'Faq', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\",\"footer\"]', '2024-05-05 06:43:22', '2024-05-05 06:43:22'),
(4, 4, 1, 'Blogs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"blog\",\"footer\"]', '2024-05-05 06:43:55', '2024-10-30 02:24:06'),
(5, 5, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[map]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact\",\"map\",\"footer\"]', '2024-05-05 06:44:24', '2024-05-05 06:44:24'),
(6, 6, 1, 'Login', NULL, NULL, '2024-05-25 03:12:00', '2024-05-25 03:12:00'),
(7, 7, 1, 'Register', NULL, NULL, '2024-05-25 03:12:18', '2024-05-25 03:12:18'),
(8, 8, 1, 'Services', NULL, NULL, '2024-06-10 03:29:32', '2024-10-30 02:23:48'),
(9, 9, 1, 'Privacy &amp; Policy', '<div><h3>Privacy Policy</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>How We Use Your Information</h5><p>We use your information to provide our services and maintain your account.</p><p>We use your information to understand how our services are used and make improvements.</p><p>We may use your contact information to send you important updates, newsletters, or respond to your inquiries.</p><p><br></p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Privacy Policy</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p><div class=\"policy-list mt-10\"><div class=\"item\"></div></div><h5><br></h5>', NULL, '2024-08-07 01:55:45', '2024-10-07 10:05:05'),
(10, 10, 1, 'Terms and Conditions', '<div><h3>Terms and Conditions</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>Modifications to the Terms</h5><p>We reserve the right to modify these terms at any time. It is your responsibility to review these terms regularly. Continued use of the service after any changes implies acceptance of the new terms.</p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Terms</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p>', NULL, '2024-08-07 02:27:30', '2024-10-07 10:19:30'),
(11, 11, 1, 'Forgot Password', NULL, NULL, '2024-08-30 05:35:22', '2024-08-30 05:35:22'),
(12, 12, 1, 'Reset Password', NULL, NULL, '2024-08-30 05:35:44', '2024-08-30 05:35:44'),
(13, 13, 1, 'Email Verification', NULL, NULL, '2024-08-30 05:36:01', '2024-08-30 05:36:01'),
(14, 14, 1, 'SMS Verification', NULL, NULL, '2024-08-30 05:36:15', '2024-08-30 05:36:15'),
(15, 15, 1, 'Two Fa Verification', NULL, NULL, '2024-08-30 05:37:01', '2024-10-01 01:35:19'),
(17, 17, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[service]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[why_choose_us]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[achievement]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_works]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"feature\",\"about\",\"service\",\"why_choose_us\",\"achievement\",\"how_it_works\",\"testimonial\",\"payment_partner\",\"blog\",\"footer\"]', '2024-10-01 03:53:09', '2024-10-01 09:28:49'),
(18, 18, 1, 'About', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"feature\",\"about\",\"faq\",\"testimonial\",\"footer\"]', '2024-10-01 04:08:21', '2024-11-07 02:53:46'),
(19, 19, 1, 'Faq', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\",\"footer\"]', '2024-10-01 10:26:17', '2024-10-01 10:26:17'),
(20, 20, 1, 'Blogs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"blog\",\"footer\"]', '2024-10-01 10:26:44', '2024-10-30 04:41:31'),
(21, 21, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact\",\"footer\"]', '2024-10-01 10:27:33', '2024-10-01 10:27:33'),
(22, 22, 1, 'Login', NULL, NULL, '2024-10-02 08:54:43', '2024-10-02 08:54:43'),
(23, 23, 1, 'Register', NULL, NULL, '2024-10-02 08:55:27', '2024-10-02 08:55:27'),
(24, 24, 1, 'Service', NULL, NULL, '2024-10-02 08:55:40', '2024-10-02 08:55:40'),
(25, 25, 1, 'Privacy &amp; Policy', '<div>\r\n                        <h3>Privacy Policy</h3></div>\r\n                    <p>\r\n                        At SMM, we value your privacy and are committed to protecting your personal\r\n                        information.\r\n                        This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide\r\n                        while using our classified ads\r\n                        platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p><span>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</span></p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>How We Use Your Information</h5><p>We use your information to provide our services and maintain your account.</p><p>We use your information to understand how our services are used and make improvements.</p><p>We may use your contact information to send you important updates, newsletters, or respond to your inquiries.</p><p><br></p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Privacy Policy</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p><div class=\"policy-list mt-10\">\r\n                        <div class=\"item\">\r\n                            </div></div><h5><br></h5>', NULL, '2024-10-02 08:58:08', '2024-10-07 10:04:07'),
(26, 30, 1, 'SMS Verification', NULL, NULL, '2024-10-02 09:02:58', '2024-10-02 09:02:58'),
(27, 31, 1, 'Two Fa Verification', NULL, NULL, '2024-10-02 09:03:10', '2024-10-02 09:03:10'),
(28, 29, 1, 'Email Verification', NULL, NULL, '2024-10-02 09:03:19', '2024-10-02 09:03:19'),
(29, 28, 1, 'Reset Password', NULL, NULL, '2024-10-02 09:03:27', '2024-10-02 09:03:27'),
(30, 27, 1, 'Forgot Password', NULL, NULL, '2024-10-02 09:03:34', '2024-10-02 09:03:34'),
(31, 26, 1, 'Terms And Conditions', '<div><h3>Terms and Conditions</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>Modifications to the Terms</h5><p>We reserve the right to modify these terms at any time. It is your responsibility to review these terms regularly. Continued use of the service after any changes implies acceptance of the new terms.</p><p><br></p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Terms</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p>', NULL, '2024-10-02 09:05:34', '2024-10-07 10:20:49'),
(32, 32, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_works]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[service]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[call_to_action]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"feature\",\"about\",\"how_it_works\",\"service\",\"counter\",\"call_to_action\",\"testimonial\",\"blog\",\"payment_partner\",\"footer\"]', '2024-10-27 01:43:11', '2024-10-28 02:19:28'),
(33, 33, 1, 'About', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"feature\",\"about\",\"counter\",\"testimonial\",\"payment_partner\",\"footer\"]', '2024-10-27 02:36:47', '2024-10-28 03:08:20'),
(34, 34, 1, 'Blogs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"blog\",\"footer\"]', '2024-10-28 03:14:24', '2024-10-30 07:49:01'),
(35, 35, 1, 'FAQ', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\",\"footer\"]', '2024-10-28 03:35:04', '2024-10-28 03:57:52'),
(36, 36, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact\",\"footer\"]', '2024-10-28 04:05:25', '2024-10-28 04:05:25'),
(37, 37, 1, 'Services', NULL, NULL, '2024-10-28 05:55:43', '2024-10-28 05:55:43'),
(38, 45, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[service]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_works]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[call_to_action]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"feature\",\"about\",\"service\",\"how_it_works\",\"counter\",\"call_to_action\",\"testimonial\",\"blog\",\"payment_partner\",\"footer\"]', '2024-10-28 08:21:39', '2024-10-28 10:06:39'),
(39, 46, 1, 'About', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"feature\",\"about\",\"counter\",\"testimonial\",\"payment_partner\",\"footer\"]', '2024-10-28 10:14:47', '2024-10-28 10:14:47'),
(40, 47, 1, 'Blogs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"blog\",\"footer\"]', '2024-10-28 10:17:30', '2024-10-28 10:17:30'),
(41, 48, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact\",\"footer\"]', '2024-10-28 10:35:22', '2024-10-28 10:35:22'),
(42, 49, 1, 'Faq', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\",\"footer\"]', '2024-10-28 13:12:27', '2024-10-28 14:25:45'),
(43, 58, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[service]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_works]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[call_to_action]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[news_letter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"feature\",\"about\",\"service\",\"how_it_works\",\"counter\",\"call_to_action\",\"testimonial\",\"blog\",\"payment_partner\",\"news_letter\",\"footer\"]', '2024-10-28 16:03:13', '2024-10-29 03:07:06'),
(44, 59, 1, 'About', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"feature\",\"about\",\"counter\",\"testimonial\",\"payment_partner\",\"footer\"]', '2024-10-29 03:15:50', '2024-10-29 03:15:50'),
(45, 60, 1, 'Blogs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"blog\",\"footer\"]', '2024-10-29 03:16:42', '2024-10-30 16:08:35'),
(46, 61, 1, 'Faq', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\",\"footer\"]', '2024-10-29 03:18:23', '2024-10-29 03:18:23'),
(47, 62, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[news_letter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact\",\"news_letter\",\"footer\"]', '2024-10-29 03:30:49', '2024-10-29 03:30:49'),
(48, 73, 1, 'Services', NULL, NULL, '2024-10-29 04:26:21', '2024-10-30 16:08:46'),
(49, 74, 1, 'Login', NULL, NULL, '2024-10-29 04:42:50', '2024-10-29 04:42:50'),
(50, 75, 1, 'Register', NULL, NULL, '2024-10-29 04:47:45', '2024-10-29 04:47:45'),
(51, 76, 1, 'Forgot Password', NULL, NULL, '2024-10-29 04:49:10', '2024-10-29 04:49:10');
INSERT INTO `page_details` (`id`, `page_id`, `language_id`, `name`, `content`, `sections`, `created_at`, `updated_at`) VALUES
(52, 81, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[service]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_works]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[call_to_action]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"feature\",\"about\",\"service\",\"how_it_works\",\"counter\",\"call_to_action\",\"testimonial\",\"blog\",\"payment_partner\",\"footer\"]', '2024-10-29 07:13:43', '2024-10-29 08:13:30'),
(53, 82, 1, 'About', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[feature]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[counter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[payment_partner]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"feature\",\"about\",\"counter\",\"testimonial\",\"payment_partner\",\"footer\"]', '2024-10-29 08:37:41', '2024-10-29 08:37:41'),
(54, 83, 1, 'Blogs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"blog\",\"footer\"]', '2024-10-29 08:45:49', '2024-10-30 15:12:58'),
(55, 84, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"contact\",\"footer\"]', '2024-10-29 08:50:04', '2024-10-29 08:50:04'),
(57, 85, 1, 'Services', NULL, NULL, '2024-10-29 09:19:01', '2024-10-29 09:19:01'),
(58, 93, 1, 'Refund Policy', '<p><strong><span style=\"font-size:24px;\">Refund Policy</span></strong><br></p><p><strong>1. Introduction</strong></p><p>Thank you for shopping with us. We strive to ensure that you are completely satisfied with your purchase. This refund policy outlines our procedures for processing refunds and returns.</p><p><strong>2. Refund Eligibility</strong></p><p>To be eligible for a refund, you must meet the following criteria:</p><ul><li>The item must be returned within  +14582252545 days of receipt.</li><li>The item must be in its original condition, unused, and with all original packaging and tags.</li><li>Proof of purchase is required to process any refund.<br><br></li></ul><p><strong>3. Non-Refundable Items</strong></p><p>The following items are non-refundable:</p><ul><li>Downloadable software or digital content</li><li>Custom-made or personalized items</li><li>Clearance or sale items<br><br></li></ul><p><strong>4. Refund Process</strong></p><p>If you meet the eligibility criteria, please follow these steps to request a refund:</p><ol><li>Contact our customer service team atupport@nextDestina.com or +14582252545 to initiate the return process.</li><li>Provide your order number and details of the item(s) you wish to return.</li><li>Our team will provide you with return instructions and a return authorization number.</li><li>Return the item(s) to the address provided, using a trackable shipping method. You are responsible for return shipping costs.</li></ol><p>Once we receive and inspect the returned item(s), we will process your refund within +14582252545 business days. The refund will be issued to the original payment method used for the purchase.<br><br></p><p><strong>5. Exchanges</strong></p><p>If you wish to exchange an item for a different size, color, or product, please follow the return process and place a new order for the desired item.<br><br></p><p><strong>6. Damaged or Defective Items</strong></p><p>If you receive a damaged or defective item, please contact our customer service team immediately. We will arrange for a replacement or refund, including any return shipping costs if applicable.<br><br></p><p><strong>7. Changes to This Policy</strong></p><p>We reserve the right to modify or update this refund policy at any time. Any changes will be posted on our website.<br><br></p><p><strong>8. Contact Us</strong></p><p>If you have any questions or concerns about our refund policy, please contact us at support@nextDestina.com or +14582252545.<br><br></p>', NULL, '2024-10-30 02:49:16', '2024-10-30 03:08:45'),
(59, 94, 1, 'Cookie Policy', '<p></p><h3>Cookie Policy</h3><p>We use cookies on our website to enhance your experience, personalize content, and analyze our traffic. By using our site, you consent to our use of cookies in accordance with this policy.<br><br></p><p><strong>1. What Are Cookies?</strong>\r\nCookies are small text files that are stored on your device when you visit a website. They help websites remember your preferences and activities to provide a more personalized and seamless experience.<br><br></p><p><strong>2. Types of Cookies We Use</strong></p><ul><li><strong>Essential Cookies:</strong> These cookies are necessary for the website to function properly, allowing you to navigate and use essential features.</li><li><strong>Performance Cookies:</strong> These cookies collect information on how you interact with our website, helping us optimize performance and improve user experience.</li><li><strong>Functional Cookies:</strong> These cookies enable additional functionality, such as remembering your preferences or settings.</li><li><strong>Targeting/Advertising Cookies:</strong> These cookies track your browsing habits and are used to deliver relevant advertisements based on your interests.<br><br></li></ul><p><strong>3. How We Use Cookies</strong>\r\nWe use cookies to:</p><ul><li>Provide a secure and effective browsing experience</li><li>Analyze user behavior and website performance</li><li>Customize content and advertisements based on your preferences<br><br></li></ul><p><strong>4. Third-Party Cookies</strong>\r\nWe may also use third-party cookies from partners such as advertising networks and analytics providers to help deliver content, monitor performance, and display ads relevant to you.<br><br></p><p><strong>5. Managing Cookies</strong>\r\nYou can manage your cookie preferences through your browser settings. You can choose to block or delete cookies; however, this may affect the functionality of certain parts of our website.<br><br></p><p><strong>6. Updates to This Policy</strong>\r\nWe may update this cookie policy from time to time. Any changes will be reflected on this page, and your continued use of our website will signify your acceptance of the updated terms.</p>', NULL, '2024-10-30 03:11:45', '2024-10-30 03:14:42'),
(60, 95, 1, 'Api Docs', NULL, NULL, '2024-10-30 03:25:51', '2024-10-30 03:25:51'),
(61, 96, 1, 'Api Docs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[api_docs]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"api_docs\",\"footer\"]', '2024-10-30 03:31:33', '2024-10-30 16:03:52'),
(62, 97, 1, 'Refund Policy', '<p><strong><span style=\"font-size:24px;\">Refund Policy</span></strong><br></p><p><strong>1. Introduction</strong></p><p>Thank you for shopping with us. We strive to ensure that you are completely satisfied with your purchase. This refund policy outlines our procedures for processing refunds and returns.</p><p><strong>2. Refund Eligibility</strong></p><p>To be eligible for a refund, you must meet the following criteria:</p><ul><li>The item must be returned within  +14582252545 days of receipt.</li><li>The item must be in its original condition, unused, and with all original packaging and tags.</li><li>Proof of purchase is required to process any refund.<br><br></li></ul><p><strong>3. Non-Refundable Items</strong></p><p>The following items are non-refundable:</p><ul><li>Downloadable software or digital content</li><li>Custom-made or personalized items</li><li>Clearance or sale items<br><br></li></ul><p><strong>4. Refund Process</strong></p><p>If you meet the eligibility criteria, please follow these steps to request a refund:</p><ol><li>Contact our customer service team atupport@nextDestina.com or +14582252545 to initiate the return process.</li><li>Provide your order number and details of the item(s) you wish to return.</li><li>Our team will provide you with return instructions and a return authorization number.</li><li>Return the item(s) to the address provided, using a trackable shipping method. You are responsible for return shipping costs.</li></ol><p>Once we receive and inspect the returned item(s), we will process your refund within +14582252545 business days. The refund will be issued to the original payment method used for the purchase.<br><br></p><p><strong>5. Exchanges</strong></p><p>If you wish to exchange an item for a different size, color, or product, please follow the return process and place a new order for the desired item.<br><br></p><p><strong>6. Damaged or Defective Items</strong></p><p>If you receive a damaged or defective item, please contact our customer service team immediately. We will arrange for a replacement or refund, including any return shipping costs if applicable.<br><br></p><p><strong>7. Changes to This Policy</strong></p><p>We reserve the right to modify or update this refund policy at any time. Any changes will be posted on our website.<br><br></p><p><strong>8. Contact Us</strong></p><p>If you have any questions or concerns about our refund policy, please contact us at support@nextDestina.com or +14582252545.<br><br></p>', NULL, '2024-10-30 06:30:56', '2024-10-30 06:30:56'),
(63, 98, 1, 'Cookie Policy', '<p></p><h3>Cookie Policy</h3><p>We use cookies on our website to enhance your experience, personalize content, and analyze our traffic. By using our site, you consent to our use of cookies in accordance with this policy.<br><br></p><p><strong>1. What Are Cookies?</strong>\r\nCookies are small text files that are stored on your device when you visit a website. They help websites remember your preferences and activities to provide a more personalized and seamless experience.<br><br></p><p><strong>2. Types of Cookies We Use</strong></p><ul><li><strong>Essential Cookies:</strong> These cookies are necessary for the website to function properly, allowing you to navigate and use essential features.</li><li><strong>Performance Cookies:</strong> These cookies collect information on how you interact with our website, helping us optimize performance and improve user experience.</li><li><strong>Functional Cookies:</strong> These cookies enable additional functionality, such as remembering your preferences or settings.</li><li><strong>Targeting/Advertising Cookies:</strong> These cookies track your browsing habits and are used to deliver relevant advertisements based on your interests.<br><br></li></ul><p><strong>3. How We Use Cookies</strong>\r\nWe use cookies to:</p><ul><li>Provide a secure and effective browsing experience</li><li>Analyze user behavior and website performance</li><li>Customize content and advertisements based on your preferences<br><br></li></ul><p><strong>4. Third-Party Cookies</strong>\r\nWe may also use third-party cookies from partners such as advertising networks and analytics providers to help deliver content, monitor performance, and display ads relevant to you.<br><br></p><p><strong>5. Managing Cookies</strong>\r\nYou can manage your cookie preferences through your browser settings. You can choose to block or delete cookies; however, this may affect the functionality of certain parts of our website.<br><br></p><p><strong>6. Updates to This Policy</strong>\r\nWe may update this cookie policy from time to time. Any changes will be reflected on this page, and your continued use of our website will signify your acceptance of the updated terms.</p>', NULL, '2024-10-30 06:31:32', '2024-10-30 06:31:32'),
(64, 99, 1, 'Api Docs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[api_docs]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"api_docs\",\"footer\"]', '2024-10-30 06:33:59', '2024-10-30 06:33:59'),
(65, 100, 1, 'Privacy Policy', '<div><h3>Privacy Policy</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>How We Use Your Information</h5><p>We use your information to provide our services and maintain your account.</p><p>We use your information to understand how our services are used and make improvements.</p><p>We may use your contact information to send you important updates, newsletters, or respond to your inquiries.</p><p><br></p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Privacy Policy</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p><div class=\"policy-list mt-10\"><div class=\"item\"></div></div><h5><br></h5>', NULL, '2024-10-30 09:22:37', '2024-10-30 09:22:37'),
(66, 101, 1, 'Terms and  Conditions', '<div><h3>Terms and Conditions</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>Modifications to the Terms</h5><p>We reserve the right to modify these terms at any time. It is your responsibility to review these terms regularly. Continued use of the service after any changes implies acceptance of the new terms.</p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Terms</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p>', NULL, '2024-10-30 09:23:48', '2024-10-30 09:23:48'),
(67, 102, 1, 'Refund Policy', '<p><strong><span style=\"font-size:24px;\">Refund Policy</span></strong><br></p><p><strong>1. Introduction</strong></p><p>Thank you for shopping with us. We strive to ensure that you are completely satisfied with your purchase. This refund policy outlines our procedures for processing refunds and returns.<br><br></p><p><strong>2. Refund Eligibility</strong></p><p>To be eligible for a refund, you must meet the following criteria:</p><ul><li>The item must be returned within  +14582252545 days of receipt.</li><li>The item must be in its original condition, unused, and with all original packaging and tags.</li><li>Proof of purchase is required to process any refund.<br><br></li></ul><p><strong>3. Non-Refundable Items</strong></p><p>The following items are non-refundable:</p><ul><li>Downloadable software or digital content</li><li>Custom-made or personalized items</li><li>Clearance or sale items<br><br></li></ul><p><strong>4. Refund Process</strong></p><p>If you meet the eligibility criteria, please follow these steps to request a refund:</p><ol><li>Contact our customer service team atupport@nextDestina.com or +14582252545 to initiate the return process.</li><li>Provide your order number and details of the item(s) you wish to return.</li><li>Our team will provide you with return instructions and a return authorization number.</li><li>Return the item(s) to the address provided, using a trackable shipping method. You are responsible for return shipping costs.</li></ol><p>Once we receive and inspect the returned item(s), we will process your refund within +14582252545 business days. The refund will be issued to the original payment method used for the purchase.<br><br></p><p><strong>5. Exchanges</strong></p><p>If you wish to exchange an item for a different size, color, or product, please follow the return process and place a new order for the desired item.<br><br></p><p><strong>6. Damaged or Defective Items</strong></p><p>If you receive a damaged or defective item, please contact our customer service team immediately. We will arrange for a replacement or refund, including any return shipping costs if applicable.<br><br></p><p><strong>7. Changes to This Policy</strong></p><p>We reserve the right to modify or update this refund policy at any time. Any changes will be posted on our website.<br><br></p><p><strong>8. Contact Us</strong></p><p>If you have any questions or concerns about our refund policy, please contact us at support@nextDestina.com or +14582252545.<br><br></p>', NULL, '2024-10-30 09:24:21', '2024-10-30 09:35:17'),
(68, 103, 1, 'Cookie Policy', '<p></p><h3>Cookie Policy</h3><p>We use cookies on our website to enhance your experience, personalize content, and analyze our traffic. By using our site, you consent to our use of cookies in accordance with this policy.<br><br></p><p><strong>1. What Are Cookies?</strong>\r\nCookies are small text files that are stored on your device when you visit a website. They help websites remember your preferences and activities to provide a more personalized and seamless experience.<br><br></p><p><strong>2. Types of Cookies We Use</strong></p><ul><li>Essential Cookies<strong>:</strong> These cookies are necessary for the website to function properly, allowing you to navigate and use essential features.</li><li>Performance Cookies<strong>:</strong> These cookies collect information on how you interact with our website, helping us optimize performance and improve user experience.</li><li>Functional Cookies<strong>:</strong> These cookies enable additional functionality, such as remembering your preferences or settings.</li><li>Targeting/Advertising Cookies<strong>:</strong> These cookies track your browsing habits and are used to deliver relevant advertisements based on your interests.<br><br></li></ul><p><strong>3. How We Use Cookies</strong>\r\nWe use cookies to:</p><ul><li>Provide a secure and effective browsing experience</li><li>Analyze user behavior and website performance</li><li>Customize content and advertisements based on your preferences<br><br></li></ul><p><strong>4. Third-Party Cookies</strong>\r\nWe may also use third-party cookies from partners such as advertising networks and analytics providers to help deliver content, monitor performance, and display ads relevant to you.<br><br></p><p><strong>5. Managing Cookies</strong>\r\nYou can manage your cookie preferences through your browser settings. You can choose to block or delete cookies; however, this may affect the functionality of certain parts of our website.<br><br></p><p><strong>6. Updates to This Policy</strong>\r\nWe may update this cookie policy from time to time. Any changes will be reflected on this page, and your continued use of our website will signify your acceptance of the updated terms.</p>', NULL, '2024-10-30 09:25:04', '2024-10-30 09:34:10'),
(69, 104, 1, 'Api Docs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[api_docs]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"api_docs\",\"footer\"]', '2024-10-30 09:27:22', '2024-10-30 09:27:22'),
(70, 50, 1, 'Services', NULL, NULL, '2024-10-30 14:30:18', '2024-10-30 14:30:18'),
(71, 51, 1, 'Login', NULL, NULL, '2024-10-30 14:37:44', '2024-10-30 14:37:44'),
(72, 52, 1, 'Register', NULL, NULL, '2024-10-30 14:47:52', '2024-10-30 14:47:52'),
(73, 53, 1, 'Forgot Password', NULL, NULL, '2024-10-30 14:48:26', '2024-10-30 14:48:26'),
(74, 105, 1, 'Privacy Policy', '<div><h3>Privacy Policy</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>How We Use Your Information</h5><p>We use your information to provide our services and maintain your account.</p><p>We use your information to understand how our services are used and make improvements.</p><p>We may use your contact information to send you important updates, newsletters, or respond to your inquiries.</p><p><br></p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Privacy Policy</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p><div class=\"policy-list mt-10\"><div class=\"item\"></div></div><h5><br></h5>', NULL, '2024-10-30 14:50:56', '2024-10-30 14:50:56'),
(75, 106, 1, 'Terms Conditions', '<div><h3>Terms and Conditions</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>Modifications to the Terms</h5><p>We reserve the right to modify these terms at any time. It is your responsibility to review these terms regularly. Continued use of the service after any changes implies acceptance of the new terms.</p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Terms</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p>', NULL, '2024-10-30 14:51:39', '2024-10-30 14:51:39'),
(76, 107, 1, 'Refund Policy', '<p><strong><span style=\"font-size:24px;\">Refund Policy</span></strong><br></p><p><strong>1. Introduction</strong></p><p>Thank you for shopping with us. We strive to ensure that you are completely satisfied with your purchase. This refund policy outlines our procedures for processing refunds and returns.</p><p><strong>2. Refund Eligibility</strong></p><p>To be eligible for a refund, you must meet the following criteria:</p><ul><li>The item must be returned within  +14582252545 days of receipt.</li><li>The item must be in its original condition, unused, and with all original packaging and tags.</li><li>Proof of purchase is required to process any refund.<br><br></li></ul><p><strong>3. Non-Refundable Items</strong></p><p>The following items are non-refundable:</p><ul><li>Downloadable software or digital content</li><li>Custom-made or personalized items</li><li>Clearance or sale items<br><br></li></ul><p><strong>4. Refund Process</strong></p><p>If you meet the eligibility criteria, please follow these steps to request a refund:</p><ol><li>Contact our customer service team atupport@nextDestina.com or +14582252545 to initiate the return process.</li><li>Provide your order number and details of the item(s) you wish to return.</li><li>Our team will provide you with return instructions and a return authorization number.</li><li>Return the item(s) to the address provided, using a trackable shipping method. You are responsible for return shipping costs.</li></ol><p>Once we receive and inspect the returned item(s), we will process your refund within +14582252545 business days. The refund will be issued to the original payment method used for the purchase.<br><br></p><p><strong>5. Exchanges</strong></p><p>If you wish to exchange an item for a different size, color, or product, please follow the return process and place a new order for the desired item.<br><br></p><p><strong>6. Damaged or Defective Items</strong></p><p>If you receive a damaged or defective item, please contact our customer service team immediately. We will arrange for a replacement or refund, including any return shipping costs if applicable.<br><br></p><p><strong>7. Changes to This Policy</strong></p><p>We reserve the right to modify or update this refund policy at any time. Any changes will be posted on our website.<br><br></p><p><strong>8. Contact Us</strong></p><p>If you have any questions or concerns about our refund policy, please contact us at support@nextDestina.com or +14582252545.<br><br></p>', NULL, '2024-10-30 14:52:13', '2024-10-30 14:52:13'),
(77, 108, 1, 'Cookie Policy', '<p></p><h3>Cookie Policy</h3><p>We use cookies on our website to enhance your experience, personalize content, and analyze our traffic. By using our site, you consent to our use of cookies in accordance with this policy.<br><br></p><p><strong>1. What Are Cookies?</strong>\r\nCookies are small text files that are stored on your device when you visit a website. They help websites remember your preferences and activities to provide a more personalized and seamless experience.<br><br></p><p><strong>2. Types of Cookies We Use</strong></p><ul><li><strong>Essential Cookies:</strong> These cookies are necessary for the website to function properly, allowing you to navigate and use essential features.</li><li><strong>Performance Cookies:</strong> These cookies collect information on how you interact with our website, helping us optimize performance and improve user experience.</li><li><strong>Functional Cookies:</strong> These cookies enable additional functionality, such as remembering your preferences or settings.</li><li><strong>Targeting/Advertising Cookies:</strong> These cookies track your browsing habits and are used to deliver relevant advertisements based on your interests.<br><br></li></ul><p><strong>3. How We Use Cookies</strong>\r\nWe use cookies to:</p><ul><li>Provide a secure and effective browsing experience</li><li>Analyze user behavior and website performance</li><li>Customize content and advertisements based on your preferences<br><br></li></ul><p><strong>4. Third-Party Cookies</strong>\r\nWe may also use third-party cookies from partners such as advertising networks and analytics providers to help deliver content, monitor performance, and display ads relevant to you.<br><br></p><p><strong>5. Managing Cookies</strong>\r\nYou can manage your cookie preferences through your browser settings. You can choose to block or delete cookies; however, this may affect the functionality of certain parts of our website.<br><br></p><p><strong>6. Updates to This Policy</strong>\r\nWe may update this cookie policy from time to time. Any changes will be reflected on this page, and your continued use of our website will signify your acceptance of the updated terms.</p>', NULL, '2024-10-30 14:52:39', '2024-10-30 14:52:39'),
(78, 109, 1, 'Api Docs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[api_docs]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"api_docs\",\"footer\"]', '2024-10-30 14:56:40', '2024-10-30 14:56:40'),
(79, 54, 1, 'Reset Password', NULL, NULL, '2024-10-30 14:58:37', '2024-10-30 14:58:37'),
(80, 55, 1, 'Email Verification', NULL, NULL, '2024-10-30 14:58:48', '2024-10-30 14:58:48'),
(81, 56, 1, 'SMS Verification', NULL, NULL, '2024-10-30 14:58:56', '2024-10-30 14:58:56'),
(82, 57, 1, 'Two Fa Verification', NULL, NULL, '2024-10-30 14:59:52', '2024-10-30 14:59:52'),
(83, 86, 1, 'Login', NULL, NULL, '2024-10-30 15:14:35', '2024-10-30 15:14:35'),
(84, 87, 1, 'Register', NULL, NULL, '2024-10-30 15:14:43', '2024-10-30 15:14:43'),
(85, 88, 1, 'Forgot Password', NULL, NULL, '2024-10-30 15:18:53', '2024-10-30 15:18:53'),
(86, 89, 1, 'Reset Password', NULL, NULL, '2024-10-30 15:19:09', '2024-10-30 15:19:09'),
(87, 90, 1, 'Email Verification', NULL, NULL, '2024-10-30 15:19:27', '2024-10-30 15:19:27'),
(88, 91, 1, 'SMS Verification', NULL, NULL, '2024-10-30 15:19:44', '2024-10-30 15:19:44'),
(89, 92, 1, 'Two Fa Verification', NULL, NULL, '2024-10-30 15:20:12', '2024-10-30 15:20:12'),
(90, 110, 1, 'Faq', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\",\"footer\"]', '2024-10-30 15:48:46', '2024-10-30 15:52:32'),
(91, 111, 1, 'Privacy Policy', '<div><h3>Privacy Policy</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>How We Use Your Information</h5><p>We use your information to provide our services and maintain your account.</p><p>We use your information to understand how our services are used and make improvements.</p><p>We may use your contact information to send you important updates, newsletters, or respond to your inquiries.</p><p><br></p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Privacy Policy</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p><div class=\"policy-list mt-10\"><div class=\"item\"></div></div><h5><br></h5>', NULL, '2024-10-30 15:58:06', '2024-10-30 15:58:06'),
(92, 112, 1, 'Terms and Conditions', '<div><h3>Terms and Conditions</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>Modifications to the Terms</h5><p>We reserve the right to modify these terms at any time. It is your responsibility to review these terms regularly. Continued use of the service after any changes implies acceptance of the new terms.</p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Terms</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p>', NULL, '2024-10-30 15:58:31', '2024-10-30 15:58:31'),
(93, 113, 1, 'Refund Policy', '<p><strong><span style=\"font-size:24px;\">Refund Policy</span></strong><br></p><p><strong>1. Introduction</strong></p><p>Thank you for shopping with us. We strive to ensure that you are completely satisfied with your purchase. This refund policy outlines our procedures for processing refunds and returns.</p><p><strong>2. Refund Eligibility</strong></p><p>To be eligible for a refund, you must meet the following criteria:</p><ul><li>The item must be returned within  +14582252545 days of receipt.</li><li>The item must be in its original condition, unused, and with all original packaging and tags.</li><li>Proof of purchase is required to process any refund.<br><br></li></ul><p><strong>3. Non-Refundable Items</strong></p><p>The following items are non-refundable:</p><ul><li>Downloadable software or digital content</li><li>Custom-made or personalized items</li><li>Clearance or sale items<br><br></li></ul><p><strong>4. Refund Process</strong></p><p>If you meet the eligibility criteria, please follow these steps to request a refund:</p><ol><li>Contact our customer service team atupport@nextDestina.com or +14582252545 to initiate the return process.</li><li>Provide your order number and details of the item(s) you wish to return.</li><li>Our team will provide you with return instructions and a return authorization number.</li><li>Return the item(s) to the address provided, using a trackable shipping method. You are responsible for return shipping costs.</li></ol><p>Once we receive and inspect the returned item(s), we will process your refund within +14582252545 business days. The refund will be issued to the original payment method used for the purchase.<br><br></p><p><strong>5. Exchanges</strong></p><p>If you wish to exchange an item for a different size, color, or product, please follow the return process and place a new order for the desired item.<br><br></p><p><strong>6. Damaged or Defective Items</strong></p><p>If you receive a damaged or defective item, please contact our customer service team immediately. We will arrange for a replacement or refund, including any return shipping costs if applicable.<br><br></p><p><strong>7. Changes to This Policy</strong></p><p>We reserve the right to modify or update this refund policy at any time. Any changes will be posted on our website.<br><br></p><p><strong>8. Contact Us</strong></p><p>If you have any questions or concerns about our refund policy, please contact us at support@nextDestina.com or +14582252545.<br><br></p>', NULL, '2024-10-30 15:58:55', '2024-10-30 15:58:55');
INSERT INTO `page_details` (`id`, `page_id`, `language_id`, `name`, `content`, `sections`, `created_at`, `updated_at`) VALUES
(94, 114, 1, 'Cookie Policy', '<p></p><h3>Cookie Policy</h3><p>We use cookies on our website to enhance your experience, personalize content, and analyze our traffic. By using our site, you consent to our use of cookies in accordance with this policy.<br><br></p><p><strong>1. What Are Cookies?</strong>\r\nCookies are small text files that are stored on your device when you visit a website. They help websites remember your preferences and activities to provide a more personalized and seamless experience.<br><br></p><p><strong>2. Types of Cookies We Use</strong></p><ul><li><strong>Essential Cookies:</strong> These cookies are necessary for the website to function properly, allowing you to navigate and use essential features.</li><li><strong>Performance Cookies:</strong> These cookies collect information on how you interact with our website, helping us optimize performance and improve user experience.</li><li><strong>Functional Cookies:</strong> These cookies enable additional functionality, such as remembering your preferences or settings.</li><li><strong>Targeting/Advertising Cookies:</strong> These cookies track your browsing habits and are used to deliver relevant advertisements based on your interests.<br><br></li></ul><p><strong>3. How We Use Cookies</strong>\r\nWe use cookies to:</p><ul><li>Provide a secure and effective browsing experience</li><li>Analyze user behavior and website performance</li><li>Customize content and advertisements based on your preferences<br><br></li></ul><p><strong>4. Third-Party Cookies</strong>\r\nWe may also use third-party cookies from partners such as advertising networks and analytics providers to help deliver content, monitor performance, and display ads relevant to you.<br><br></p><p><strong>5. Managing Cookies</strong>\r\nYou can manage your cookie preferences through your browser settings. You can choose to block or delete cookies; however, this may affect the functionality of certain parts of our website.<br><br></p><p><strong>6. Updates to This Policy</strong>\r\nWe may update this cookie policy from time to time. Any changes will be reflected on this page, and your continued use of our website will signify your acceptance of the updated terms.</p>', NULL, '2024-10-30 15:59:11', '2024-10-30 15:59:11'),
(95, 115, 1, 'Api Docs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[api_docs]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"api_docs\",\"footer\"]', '2024-10-30 16:00:30', '2024-10-30 16:00:30'),
(96, 116, 1, 'Privacy &amp; Policy', '<div><h3>Privacy Policy</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>How We Use Your Information</h5><p>We use your information to provide our services and maintain your account.</p><p>We use your information to understand how our services are used and make improvements.</p><p>We may use your contact information to send you important updates, newsletters, or respond to your inquiries.</p><p><br></p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Privacy Policy</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p><div class=\"policy-list mt-10\"><div class=\"item\"></div></div><h5><br></h5>', NULL, '2024-10-30 16:30:21', '2024-10-30 16:30:21'),
(97, 117, 1, 'Terms and Conditions', '<div><h3>Terms and Conditions</h3></div><p>At SMM, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and protect the data you provide while using our classified ads platform.<br><br></p><h5>Information We Collect</h5><p>We may collect personally identifiable information, such as your name, email address, phone number, and other information you provide when you register, contact us, or use our services.</p><p>We automatically collect information that your browser sends whenever you visit our website. This may include your IP address, browser type, browser version, the pages you visit, and the time and date of your visit.</p><p>We use cookies to collect information and improve your experience. You can configure your browser to block or disable cookies, but this may affect your ability to use our services.</p><p><br></p><h5>Modifications to the Terms</h5><p>We reserve the right to modify these terms at any time. It is your responsibility to review these terms regularly. Continued use of the service after any changes implies acceptance of the new terms.</p><h5>Data Sharing and Disclosure</h5><p>We may share your information with trusted third parties for purposes such as data analysis, payment processing, customer support, and other services. We do not sell, rent, or trade your personal information to third parties for marketing purposes.</p><p><br></p><h5>Security</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Changes to this Terms</h5><p>We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.</p><p><br></p><h5>Contact Us</h5><p>If you have any questions or concerns about this Privacy Policy, please contact us at demo@example.com</p><p><br></p>', NULL, '2024-10-30 16:30:47', '2024-10-30 16:30:47'),
(98, 118, 1, 'Refund Policy', '<p><strong><span style=\"font-size:24px;\">Refund Policy</span></strong><br></p><p><strong>1. Introduction</strong></p><p>Thank you for shopping with us. We strive to ensure that you are completely satisfied with your purchase. This refund policy outlines our procedures for processing refunds and returns.</p><p><strong>2. Refund Eligibility</strong></p><p>To be eligible for a refund, you must meet the following criteria:</p><ul><li>The item must be returned within  +14582252545 days of receipt.</li><li>The item must be in its original condition, unused, and with all original packaging and tags.</li><li>Proof of purchase is required to process any refund.<br><br></li></ul><p><strong>3. Non-Refundable Items</strong></p><p>The following items are non-refundable:</p><ul><li>Downloadable software or digital content</li><li>Custom-made or personalized items</li><li>Clearance or sale items<br><br></li></ul><p><strong>4. Refund Process</strong></p><p>If you meet the eligibility criteria, please follow these steps to request a refund:</p><ol><li>Contact our customer service team atupport@nextDestina.com or +14582252545 to initiate the return process.</li><li>Provide your order number and details of the item(s) you wish to return.</li><li>Our team will provide you with return instructions and a return authorization number.</li><li>Return the item(s) to the address provided, using a trackable shipping method. You are responsible for return shipping costs.</li></ol><p>Once we receive and inspect the returned item(s), we will process your refund within +14582252545 business days. The refund will be issued to the original payment method used for the purchase.<br><br></p><p><strong>5. Exchanges</strong></p><p>If you wish to exchange an item for a different size, color, or product, please follow the return process and place a new order for the desired item.<br><br></p><p><strong>6. Damaged or Defective Items</strong></p><p>If you receive a damaged or defective item, please contact our customer service team immediately. We will arrange for a replacement or refund, including any return shipping costs if applicable.<br><br></p><p><strong>7. Changes to This Policy</strong></p><p>We reserve the right to modify or update this refund policy at any time. Any changes will be posted on our website.<br><br></p><p><strong>8. Contact Us</strong></p><p>If you have any questions or concerns about our refund policy, please contact us at support@nextDestina.com or +14582252545.<br><br></p>', NULL, '2024-10-30 16:31:12', '2024-10-30 16:31:12'),
(99, 119, 1, 'Cookie Policy', '<p></p><h3>Cookie Policy</h3><p>We use cookies on our website to enhance your experience, personalize content, and analyze our traffic. By using our site, you consent to our use of cookies in accordance with this policy.<br><br></p><p><strong>1. What Are Cookies?</strong>\r\nCookies are small text files that are stored on your device when you visit a website. They help websites remember your preferences and activities to provide a more personalized and seamless experience.<br><br></p><p><strong>2. Types of Cookies We Use</strong></p><ul><li><strong>Essential Cookies:</strong> These cookies are necessary for the website to function properly, allowing you to navigate and use essential features.</li><li><strong>Performance Cookies:</strong> These cookies collect information on how you interact with our website, helping us optimize performance and improve user experience.</li><li><strong>Functional Cookies:</strong> These cookies enable additional functionality, such as remembering your preferences or settings.</li><li><strong>Targeting/Advertising Cookies:</strong> These cookies track your browsing habits and are used to deliver relevant advertisements based on your interests.<br><br></li></ul><p><strong>3. How We Use Cookies</strong>\r\nWe use cookies to:</p><ul><li>Provide a secure and effective browsing experience</li><li>Analyze user behavior and website performance</li><li>Customize content and advertisements based on your preferences<br><br></li></ul><p><strong>4. Third-Party Cookies</strong>\r\nWe may also use third-party cookies from partners such as advertising networks and analytics providers to help deliver content, monitor performance, and display ads relevant to you.<br><br></p><p><strong>5. Managing Cookies</strong>\r\nYou can manage your cookie preferences through your browser settings. You can choose to block or delete cookies; however, this may affect the functionality of certain parts of our website.<br><br></p><p><strong>6. Updates to This Policy</strong>\r\nWe may update this cookie policy from time to time. Any changes will be reflected on this page, and your continued use of our website will signify your acceptance of the updated terms.</p>', NULL, '2024-10-30 16:31:39', '2024-10-30 16:31:39'),
(100, 120, 1, 'Api Docs', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[api_docs]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"api_docs\",\"footer\"]', '2024-10-30 16:33:38', '2024-10-30 16:33:38'),
(101, 80, 1, 'Two FA Verification', NULL, NULL, '2024-10-30 16:36:11', '2024-10-30 16:36:11'),
(102, 78, 1, 'Email Verification', NULL, NULL, '2024-10-30 16:37:15', '2024-10-30 16:37:15'),
(103, 79, 1, 'SMS Verification', NULL, NULL, '2024-10-30 16:37:35', '2024-10-30 16:37:35'),
(104, 77, 1, 'Reset Password', NULL, NULL, '2024-10-30 16:38:02', '2024-10-30 16:38:02'),
(105, 38, 1, 'Login', NULL, NULL, '2024-11-06 04:30:21', '2024-11-06 04:30:21'),
(106, 39, 1, 'Register', NULL, NULL, '2024-11-06 04:30:33', '2024-11-06 04:30:33'),
(107, 40, 1, 'Forgot Password', NULL, NULL, '2024-11-06 04:30:52', '2024-11-06 04:30:52'),
(108, 41, 1, 'Reset Password', NULL, NULL, '2024-11-06 04:31:07', '2024-11-06 04:31:07'),
(109, 42, 1, 'Email Verification', NULL, NULL, '2024-11-06 04:31:13', '2024-11-06 04:31:13'),
(110, 43, 1, 'SMS Verification', NULL, NULL, '2024-11-06 04:31:27', '2024-11-06 04:31:27'),
(111, 44, 1, 'Two FA Verification', NULL, NULL, '2024-11-06 04:31:46', '2024-11-06 04:31:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_seos`
--

CREATE TABLE `page_seos` (
  `id` bigint UNSIGNED NOT NULL,
  `page_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `og_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_seos`
--

INSERT INTO `page_seos` (`id`, `page_name`, `meta_title`, `meta_keywords`, `meta_description`, `og_description`, `meta_robots`, `created_at`, `updated_at`) VALUES
(1, 'home', NULL, NULL, NULL, NULL, NULL, '2024-08-03 08:22:22', '2024-08-03 08:22:22'),
(2, 'about', 'sfdsfdsdf', '[\"sdfsdf\"]', 'sdfsdf', 'sdfdsf', 'nofollow', '2024-08-03 08:22:22', '2024-08-03 09:07:33'),
(3, 'faq', NULL, NULL, NULL, NULL, NULL, '2024-08-03 08:22:22', '2024-08-03 08:22:22'),
(4, 'service', NULL, NULL, NULL, NULL, NULL, '2024-08-03 08:22:22', '2024-08-03 08:22:22'),
(5, 'blog', NULL, NULL, NULL, NULL, NULL, '2024-08-03 08:22:22', '2024-08-03 08:22:22'),
(6, 'contact', NULL, NULL, NULL, NULL, NULL, '2024-08-03 08:22:22', '2024-08-03 08:22:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expires_at`, `created_at`) VALUES
(3, 'nhatloc200@gmail.com', 'b23f1d34daadf9113c16318e3e5c95b1becc48f897de2a45c66588c3c9f3e601', '2025-04-24 13:54:45', '2025-04-24 05:54:45'),
(5, 'lieutrung115@gmail.com', '7f25e368ac212eeddc0f5ae932d36b5722ae203f459d02c90e46cb6f6dc38464', '2025-05-25 15:00:42', '2025-05-25 18:00:42'),
(6, 'lieutrung115@gmail.com', '2a4b1ccf1a9d41b312f6778de22c02aacec983e25a9f05f338b684d872cfb525', '2025-05-25 15:01:13', '2025-05-25 18:01:13'),
(7, 'congdt2002@gmail.com', 'e212ad0122e85c36ae4bfacb998a457c73481b8dfe1a2f32ced5ddf491e084d3', '2025-05-28 00:16:55', '2025-05-28 03:16:55'),
(8, 'baotrinhcutis1tg@gmail.com', 'b8867011191244acb05e99cb5fc782c274226032cb44ac23049aad54479ef082', '2025-07-03 19:55:09', '2025-07-03 11:55:09'),
(9, 'baotrinhcutis1tg@gmail.com', '5bd2950985c1220d5f289d9b81e1f1fa4d651f0177e2e1cd981743f696994d2c', '2025-07-03 19:55:42', '2025-07-03 11:55:42'),
(11, 'congtrannika2002@gmail.com', '676f5c93ba6f0debe52f696fa609d5bfe225b395277917b3629e94758dd4471b', '2025-09-07 19:38:15', '2025-09-07 11:38:15'),
(12, 'congtrannika2002@gmail.com', '8d2cf06ac0b6d763f55f05c5dc1e87eb2e8a379bb9b13723629d37adc0890327', '2025-09-07 19:40:11', '2025-09-07 11:40:11'),
(13, 'congtrannika2002@gmail.com', '3961379768a09f0a4eb74a8ba3ae66f292bd008e232ba384c0ec974139f234e4', '2025-09-07 19:49:12', '2025-09-07 11:49:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `razorpay_contacts`
--

CREATE TABLE `razorpay_contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint UNSIGNED NOT NULL,
  `commission_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `percent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `referral_bonuses`
--

CREATE TABLE `referral_bonuses` (
  `id` bigint UNSIGNED NOT NULL,
  `from_user_id` int DEFAULT NULL,
  `to_user_id` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `main_balance` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `transaction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `service_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `min_amount` int DEFAULT NULL,
  `max_amount` int DEFAULT NULL,
  `original_price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_percentage_increase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `service_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `api_provider_id` int DEFAULT '0',
  `api_service_id` int DEFAULT '0',
  `api_provider_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drip_feed` tinyint DEFAULT NULL COMMENT '0 => false, 1 => true',
  `refill` tinyint NOT NULL DEFAULT '0' COMMENT '0 => false, 1 => true',
  `cancel` tinyint NOT NULL DEFAULT '0',
  `is_refill_automatic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => manual, 1 => automatic',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'title', 'TopSubRe.Pro - Hệ thống tăng tương tác Mạng xã hội'),
(2, 'keywords', 'khosubvip,tangfollow,tanglike,subgiare,tangtuongtac,bufflike,bufftheodoi,topsubre'),
(3, 'description', 'Tăng like, follow, view, comment cho Facebook, Instagram, TikTok, YouTube với SMM panel giá rẻ, an toàn, hỗ trợ 24/7.'),
(4, 'logo', '/uploads/68878eef57c17.png'),
(5, 'logo_mobile', '/uploads/68878eef57c87.png'),
(6, 'favicon', ''),
(7, 'captcha_status', '1'),
(8, 'captcha_site_key', '0x4AAAAAABbewevqHdX_l8Vd'),
(9, 'captcha_secret_key', '0x4AAAAAABbewVbR80I9gfEy5pJ7BhUf4iA'),
(10, 'smtp_user', 'cskh.sieuthicode@gmail.com'),
(11, 'smtp_pass', ''),
(12, 'smtp_host', 'smtp.gmail.com'),
(13, 'smtp_port', '587'),
(14, 'smtp_status', '1'),
(15, 'status_demo', '0'),
(22, 'system_notification', ''),
(25, 'thumbnail', ''),
(26, 'email_support', ''),
(27, 'status_email_login', '0'),
(28, 'hotline', ''),
(29, 'modal_thongbao', 'Hệ thống hoạt động ổn định. Mọi dịch vụ đặt đơn SMM Panel đều vận hành bình thường.'),
(30, 'thongbao_taodon', '<strong>Hệ thống hoạt động bình thường:</strong> Dịch vụ đặt đơn SMM Panel đang hoạt động ổn định. Bạn có thể tiến hành đặt đơn như bình thường.'),
(31, 'plugin_chat', ''),
(32, 'purchase_code', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_driver` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `social_media`
--

INSERT INTO `social_media` (`id`, `name`, `icon`, `icon_driver`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', '/uploads/platforms/1743997483_9rjnzbd98rt8s5we.gif', NULL, 1, '2025-04-07 03:44:43', '2025-04-07 03:44:43'),
(2, 'Tiktok', '/uploads/platforms/1743997511_ewzs0f9k8ic2932y.gif', NULL, 1, '2025-04-07 03:45:11', '2025-04-07 03:45:11'),
(3, 'Instagram', '/uploads/platforms/1743998325_15z7egnk0elz7gzm.gif', NULL, 1, '2025-04-07 03:58:45', '2025-04-07 03:58:45'),
(4, 'Telegram', '/uploads/platforms/1743998333_60b1c6a2-df7f-4734-b0e4-0e3a750967f4.gif', NULL, 1, '2025-04-07 03:58:53', '2025-04-07 03:58:53'),
(5, 'Youtube', '/uploads/platforms/1744001336_8af46643-e7da-4585-ae1f-d389efb218b9.gif', NULL, 1, '2025-04-07 03:59:02', '2025-04-07 04:48:56'),
(7, 'Twitch', '/uploads/platforms/1744129707_unnamed.png', NULL, 0, '2025-04-08 16:28:27', '2025-05-20 12:09:05'),
(8, 'Bigo', '/uploads/platforms/1744288999_1935f99ae382f0ddcdc61fab71e46e77.png', NULL, 0, '2025-04-10 12:43:19', '2025-05-20 12:09:14'),
(9, 'Kick', '/uploads/platforms/1744289034_iHJNtwy.png', NULL, 0, '2025-04-10 12:43:54', '2025-05-20 12:09:27'),
(10, 'Spotify', '/uploads/platforms/1744289133_6pGyeY1Fq8.gif', NULL, 0, '2025-04-10 12:45:33', '2025-05-20 12:09:36'),
(11, 'Shopee', '/uploads/platforms/1744289167_source.gif', NULL, 1, '2025-04-10 12:46:07', '2025-04-10 12:46:07'),
(12, 'Discord', '/uploads/platforms/1744289377_pfp.gif', NULL, 0, '2025-04-10 12:49:37', '2025-05-20 12:09:49'),
(13, 'Twitter', '/uploads/platforms/Twitter.gif', NULL, 1, '2025-04-10 12:51:00', '2025-04-10 12:51:00'),
(14, 'Google Map', 'https://images.seeklogo.com/logo-png/26/1/new-google-maps-icon-logo-png_seeklogo-268336.png', NULL, 1, NULL, NULL),
(15, 'WebTraffic', 'https://cdn-icons-png.flaticon.com/512/3954/3954725.png', NULL, 1, NULL, '2025-06-09 01:08:08'),
(16, 'Threads', 'https://i.pinimg.com/originals/6f/d1/4e/6fd14ef50860ed9dfa130112934177fc.gif', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `child_panel_id` int DEFAULT NULL,
  `ticket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0 =>  Open, 1 => Answered, 2 => Replied, 3 => Closed',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `support_ticket_attachments`
--

CREATE TABLE `support_ticket_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_message_id` int DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `support_ticket_messages`
--

CREATE TABLE `support_ticket_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theme_colors`
--

CREATE TABLE `theme_colors` (
  `id` bigint UNSIGNED NOT NULL,
  `light_green_primary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_green_secondary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_green_hero_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_violet_primary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_violet_secondary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimal_primary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimal_secondary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimal_sub_heading_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimal_bg_left_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimal_bg_right_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimal_button_left_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimal_bg_left_two_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimal_copy_right_bg_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deep_blue_primary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deep_blue_secondary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_mode_primary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_mode_secondary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_orange_primary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_orange_theme_light_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `light_orange_secondary_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `theme_colors`
--

INSERT INTO `theme_colors` (`id`, `light_green_primary_color`, `light_green_secondary_color`, `light_green_hero_color`, `dark_violet_primary_color`, `dark_violet_secondary_color`, `minimal_primary_color`, `minimal_secondary_color`, `minimal_sub_heading_color`, `minimal_bg_left_color`, `minimal_bg_right_color`, `minimal_button_left_color`, `minimal_bg_left_two_color`, `minimal_copy_right_bg_color`, `deep_blue_primary_color`, `deep_blue_secondary_color`, `dark_mode_primary_color`, `dark_mode_secondary_color`, `light_orange_primary_color`, `light_orange_theme_light_color`, `light_orange_secondary_color`, `created_at`, `updated_at`) VALUES
(1, '#706fc7', '#ffa200', '#0b07cf', '#f2a516', '#03292e', '#c64fff', '#fe5268', '#7b3fff', '#7b3fff', '#5900ff', '#c64fff', '#c64fff', '#1d43db', '#ff8503', '#000000', '#febd00', '#000000', '#fa673b', '#fb6738', '#fe5268', '2025-01-04 12:27:27', '2025-01-04 13:57:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` int UNSIGNED NOT NULL,
  `transactional_id` int DEFAULT NULL,
  `transactional_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `child_panel_id` int DEFAULT NULL,
  `amount` double(11,4) DEFAULT NULL,
  `balance` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(11,2) NOT NULL DEFAULT '0.00',
  `trx_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trx_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transactions`
--

INSERT INTO `transactions` (`id`, `transactional_id`, `transactional_type`, `user_id`, `child_panel_id`, `amount`, `balance`, `charge`, `trx_type`, `remarks`, `trx_id`, `created_at`, `updated_at`) VALUES
(52, NULL, NULL, 1, NULL, 2697.5600, NULL, 0.00, '-', 'Place order #69', 'T649535072025', '2025-05-07 02:40:39', '2025-05-07 02:40:39'),
(53, NULL, NULL, 2, NULL, 2697.5600, NULL, 0.00, '-', 'Place order #70', 'T649535072026', '2025-05-08 03:13:42', '2025-05-08 03:13:42'),
(54, NULL, NULL, 35, NULL, 35000.0000, NULL, 0.00, '+', 'ACB', 'T649535072027', '2025-05-08 22:06:46', '2025-05-08 22:06:46'),
(55, NULL, NULL, 35, NULL, 22200.0000, NULL, 0.00, '-', 'ACB', 'T649535072028', '2025-05-08 22:07:31', '2025-05-08 22:07:31'),
(56, NULL, NULL, 35, NULL, 12773.3860, NULL, 0.00, '-', 'Place order #71', 'T649535072029', '2025-05-08 22:27:58', '2025-05-08 22:27:58'),
(57, NULL, 'bank', 35, NULL, 12800.0000, NULL, 0.00, '+', 'topsubre35 GD 802188-050825 17:57:49', '9130', '2025-05-09 02:08:01', '2025-05-09 02:08:01'),
(58, NULL, NULL, 48, NULL, 8095.0000, NULL, 0.00, '+', 'app.khosubvip.top', 'T9131', '2025-05-09 13:14:48', '2025-05-09 13:14:48'),
(59, NULL, NULL, 50, NULL, 8044.0000, NULL, 0.00, '+', 'chuyển từ app.khosubvip.top', 'T9132', '2025-05-09 14:52:07', '2025-05-09 14:52:07'),
(60, NULL, NULL, 35, NULL, 12773.3860, NULL, 0.00, '+', 'Refund for partial order 71', 'T9133', '2025-05-09 16:19:11', '2025-05-09 16:19:11'),
(61, NULL, 'bank', 57, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre57 GD 922439-050925 19:46:28', '9152', '2025-05-09 23:47:05', '2025-05-09 23:47:05'),
(62, NULL, NULL, 57, NULL, 9482.3484, NULL, 0.00, '-', 'Place order #73', 'T9153', '2025-05-09 23:52:22', '2025-05-09 23:52:22'),
(63, NULL, NULL, 51, NULL, 9000.0000, NULL, 0.00, '+', 'cộng tiền', 'T9154', '2025-05-10 00:49:58', '2025-05-10 00:49:58'),
(64, NULL, 'bank', 51, NULL, 21000.0000, NULL, 0.00, '+', 'topsubre51 GD 353392-050925 21:05:25', '9156', '2025-05-10 01:06:05', '2025-05-10 01:06:05'),
(65, NULL, 'bank', 62, NULL, 20000.0000, NULL, 0.00, '+', 'IB TOPSUBRE62', '9161', '2025-05-10 13:13:04', '2025-05-10 13:13:04'),
(66, NULL, 'bank', 63, NULL, 30000.0000, NULL, 0.00, '+', 'MBVCB.9442154155.180053.topsubre63.CT tu 0821000041964 NGUYEN VAN HAU toi 15873021 LE VAN KHANH tai ACB GD 180053-051025 09:45:24', '9164', '2025-05-10 13:46:01', '2025-05-10 13:46:01'),
(67, NULL, NULL, 63, NULL, 26561.2000, NULL, 0.00, '-', 'Place order #74', 'T9165', '2025-05-10 13:53:40', '2025-05-10 13:53:40'),
(68, NULL, 'bank', 69, NULL, 9080.0000, NULL, 0.00, '+', 'ZP251300308010 250510000487525 topsubre69 GD 308010-051025 12:02:44', '9174', '2025-05-10 16:03:04', '2025-05-10 16:03:04'),
(69, NULL, NULL, 69, NULL, 2130.0000, NULL, 0.00, '-', 'Place order #75', 'T9175', '2025-05-10 16:05:43', '2025-05-10 16:05:43'),
(70, NULL, NULL, 69, NULL, 6949.9950, NULL, 0.00, '-', 'Place order #76', 'T9176', '2025-05-10 16:11:38', '2025-05-10 16:11:38'),
(71, NULL, 'bank', 69, NULL, 10000.0000, NULL, 0.00, '+', 'MBVCB.9444076153.441087.topsubre69.CT tu 1024776645 NGUYEN MINH HANG toi 15873021 LE VAN KHANH tai ACB GD 441087-051025 12:17:42', '9176', '2025-05-10 16:18:05', '2025-05-10 16:18:05'),
(72, NULL, 'bank', 69, NULL, 10000.0000, NULL, 0.00, '+', 'MBVCB.9444073447.437628.topsubre69.CT tu 1024776645 NGUYEN MINH HANG toi 15873021 LE VAN KHANH tai ACB GD 437628-051025 12:17:22', '9175', '2025-05-10 16:18:07', '2025-05-10 16:18:07'),
(73, NULL, NULL, 69, NULL, 1116.0000, NULL, 0.00, '-', 'Place order #77', 'T9177', '2025-05-10 16:20:42', '2025-05-10 16:20:42'),
(74, NULL, NULL, 69, NULL, 5521.6512, NULL, 0.00, '-', 'Place order #78', 'T9178', '2025-05-10 16:21:49', '2025-05-10 16:21:49'),
(75, NULL, NULL, 69, NULL, 930.0000, NULL, 0.00, '-', 'Place order #79', 'T9179', '2025-05-10 16:27:21', '2025-05-10 16:27:21'),
(76, NULL, NULL, 69, NULL, 7988.5000, NULL, 0.00, '-', 'Place order #80', 'T9180', '2025-05-10 16:29:56', '2025-05-10 16:29:56'),
(77, NULL, NULL, 69, NULL, 1011.9000, NULL, 0.00, '-', 'Place order #81', 'T9181', '2025-05-10 16:31:24', '2025-05-10 16:31:24'),
(78, NULL, 'bank', 72, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre72 GD 638213-051025 15:33:21', '9179', '2025-05-10 19:34:06', '2025-05-10 19:34:06'),
(79, NULL, NULL, 69, NULL, 262.0228, NULL, 0.00, '+', 'Refund for partial order 80', 'T9182', '2025-05-10 19:41:21', '2025-05-10 19:41:21'),
(80, NULL, NULL, 72, NULL, 57.2500, NULL, 0.00, '-', 'Place order #82', 'T9183', '2025-05-10 19:53:30', '2025-05-10 19:53:30'),
(81, NULL, NULL, 72, NULL, 113.1700, NULL, 0.00, '-', 'Place order #83', 'T9184', '2025-05-10 19:54:10', '2025-05-10 19:54:10'),
(82, NULL, NULL, 72, NULL, 101.1900, NULL, 0.00, '-', 'Place order #84', 'T9185', '2025-05-10 20:12:49', '2025-05-10 20:12:49'),
(83, NULL, NULL, 18, NULL, 100000.0000, NULL, 0.00, '+', 'gh', 'T9186', '2025-05-11 00:12:50', '2025-05-11 00:12:50'),
(84, NULL, 'bank', 79, NULL, 9500.0000, NULL, 0.00, '+', '87033914307 0975854506 topsubre79 GD 202603-051025 22:43:45', '9196', '2025-05-11 02:44:05', '2025-05-11 02:44:05'),
(85, NULL, 'bank', 62, NULL, 20000.0000, NULL, 0.00, '+', 'IB TOPSUBRE62', '9200', '2025-05-11 12:11:04', '2025-05-11 12:11:04'),
(86, NULL, NULL, 72, NULL, 2800.0000, NULL, 0.00, '-', 'Place order #87', 'T9201', '2025-05-11 14:35:12', '2025-05-11 14:35:12'),
(87, NULL, NULL, 72, NULL, 5725.0000, NULL, 0.00, '-', 'Place order #88', 'T9202', '2025-05-11 14:35:53', '2025-05-11 14:35:53'),
(88, NULL, NULL, 72, NULL, 475.9720, NULL, 0.00, '-', 'Place order #89', 'T9203', '2025-05-11 15:05:00', '2025-05-11 15:05:00'),
(89, NULL, NULL, 63, NULL, 12802.4984, NULL, 0.00, '+', 'Refund for partial order 74', 'T9204', '2025-05-11 21:02:05', '2025-05-11 21:02:05'),
(90, NULL, NULL, 63, NULL, 10624.4800, NULL, 0.00, '-', 'Place order #90', 'T9205', '2025-05-11 22:30:41', '2025-05-11 22:30:41'),
(91, NULL, NULL, 69, NULL, 3693.8824, NULL, 0.00, '-', 'Place order #91', 'T9206', '2025-05-11 23:10:40', '2025-05-11 23:10:40'),
(92, NULL, 'bank', 96, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre96 GD 141057-051125 23:33:43', '9221', '2025-05-12 03:34:03', '2025-05-12 03:34:03'),
(93, NULL, NULL, 96, NULL, 3940.9100, NULL, 0.00, '-', 'Place order #92', 'T9222', '2025-05-12 03:36:42', '2025-05-12 03:36:42'),
(94, NULL, NULL, 96, NULL, 4193.8800, NULL, 0.00, '-', 'Place order #93', 'T9223', '2025-05-12 03:40:47', '2025-05-12 03:40:47'),
(95, NULL, 'bank', 96, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre96 GD 964246-051125 23:43:52', '9222', '2025-05-12 03:44:04', '2025-05-12 03:44:04'),
(96, NULL, NULL, 96, NULL, 3940.9100, NULL, 0.00, '-', 'Place order #94', 'T9224', '2025-05-12 03:54:02', '2025-05-12 03:54:02'),
(97, NULL, NULL, 63, NULL, 186.0000, NULL, 0.00, '-', 'Place order #95', 'T9225', '2025-05-12 07:29:36', '2025-05-12 07:29:36'),
(98, NULL, NULL, 63, NULL, 186.0000, NULL, 0.00, '+', 'Refund for partial order 95', 'T9226', '2025-05-12 08:37:12', '2025-05-12 08:37:12'),
(99, NULL, NULL, 35, NULL, 1397.9700, NULL, 0.00, '-', 'Place order #96', 'T9227', '2025-05-12 10:32:46', '2025-05-12 10:32:46'),
(100, NULL, NULL, 35, NULL, 1770.7200, NULL, 0.00, '-', 'Place order #97', 'T9228', '2025-05-12 10:33:37', '2025-05-12 10:33:37'),
(101, NULL, NULL, 35, NULL, 1211.5600, NULL, 0.00, '-', 'Place order #98', 'T9229', '2025-05-12 10:35:36', '2025-05-12 10:35:36'),
(102, NULL, NULL, 35, NULL, 46.6000, NULL, 0.00, '-', 'Place order #99', 'T9230', '2025-05-12 10:36:33', '2025-05-12 10:36:33'),
(103, NULL, NULL, 96, NULL, 4193.8800, NULL, 0.00, '-', 'Place order #100', 'T9231', '2025-05-12 10:41:10', '2025-05-12 10:41:10'),
(104, NULL, NULL, 96, NULL, 2250.0500, NULL, 0.00, '-', 'Place order #101', 'T9232', '2025-05-12 10:45:09', '2025-05-12 10:45:09'),
(105, NULL, NULL, 63, NULL, 1597.7000, NULL, 0.00, '-', 'Place order #102', 'T9233', '2025-05-12 11:05:21', '2025-05-12 11:05:21'),
(106, NULL, NULL, 63, NULL, 1597.7000, NULL, 0.00, '+', 'Refund for partial order 102', 'T9234', '2025-05-12 12:11:10', '2025-05-12 12:11:10'),
(107, NULL, NULL, 35, NULL, 1211.5600, NULL, 0.00, '-', 'Place order #103', 'T9235', '2025-05-12 22:14:50', '2025-05-12 22:14:50'),
(108, NULL, NULL, 72, NULL, 280.0000, NULL, 0.00, '-', 'Place order #104', 'T9236', '2025-05-13 00:28:23', '2025-05-13 00:28:23'),
(109, NULL, NULL, 72, NULL, 226.0000, NULL, 0.00, '-', 'Place order #105', 'T9237', '2025-05-13 00:44:32', '2025-05-13 00:44:32'),
(110, NULL, 'bank', 108, NULL, 20000.0000, NULL, 0.00, '+', 'MBVCB.9476777205.324993.topsubre108.CT tu 1024776645 NGUYEN MINH HANG toi 15873021 LE VAN KHANH tai ACB GD 324993-051225 23:40:21', '9246', '2025-05-13 03:40:24', '2025-05-13 03:40:24'),
(111, NULL, NULL, 108, NULL, 7988.5000, NULL, 0.00, '-', 'Place order #106', 'T9247', '2025-05-13 03:50:41', '2025-05-13 03:50:41'),
(112, NULL, NULL, 63, NULL, 5312.2400, NULL, 0.00, '-', 'Place order #107', 'T9248', '2025-05-13 05:23:15', '2025-05-13 05:23:15'),
(113, NULL, 'bank', 111, NULL, 50000.0000, NULL, 0.00, '+', 'topsubre111 FT25133850514087 GD 263467-051325 03:47:13', '9247', '2025-05-13 07:47:22', '2025-05-13 07:47:22'),
(114, NULL, NULL, 111, NULL, 1400.0000, NULL, 0.00, '-', 'Place order #108', 'T9249', '2025-05-13 07:48:25', '2025-05-13 07:48:25'),
(115, NULL, NULL, 111, NULL, 19971.0000, NULL, 0.00, '-', 'Place order #109', 'T9250', '2025-05-13 07:54:30', '2025-05-13 07:54:30'),
(116, NULL, NULL, 111, NULL, 2530.0000, NULL, 0.00, '-', 'Place order #110', 'T9251', '2025-05-13 07:56:05', '2025-05-13 07:56:05'),
(117, NULL, NULL, 111, NULL, 11300.0000, NULL, 0.00, '-', 'Place order #111', 'T9252', '2025-05-13 08:02:41', '2025-05-13 08:02:41'),
(118, NULL, 'bank', 56, NULL, 10162.0000, NULL, 0.00, '+', 'MBVCB.9482447266.062585.topsubre56.CT tu 1016550188 TRUONG QUOC ANH toi 15873021 LE VAN KHANH tai ACB GD 062585-051325 14:35:56', '9259', '2025-05-13 18:36:05', '2025-05-13 18:36:05'),
(119, NULL, NULL, 56, NULL, 10140.8099, NULL, 0.00, '-', 'Place order #112', 'T9260', '2025-05-13 18:39:38', '2025-05-13 18:39:38'),
(120, NULL, NULL, 111, NULL, 14382.0000, NULL, 0.00, '-', 'Place order #113', 'T9261', '2025-05-13 21:39:06', '2025-05-13 21:39:06'),
(121, NULL, NULL, 108, NULL, 5945.3216, NULL, 0.00, '-', 'Place order #114', 'T9262', '2025-05-13 23:14:26', '2025-05-13 23:14:26'),
(122, NULL, 'bank', 117, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre117 FT25133538197359 GD 375593-051325 19:27:35', '9266', '2025-05-13 23:28:04', '2025-05-13 23:28:04'),
(123, NULL, NULL, 117, NULL, 2512.3330, NULL, 0.00, '-', 'Place order #115', 'T9267', '2025-05-13 23:29:18', '2025-05-13 23:29:18'),
(124, NULL, NULL, 117, NULL, 3494.8990, NULL, 0.00, '-', 'Place order #116', 'T9268', '2025-05-13 23:33:50', '2025-05-13 23:33:50'),
(125, NULL, NULL, 79, NULL, 2729.3500, NULL, 0.00, '-', 'Place order #117', 'T9269', '2025-05-14 00:17:26', '2025-05-14 00:17:26'),
(126, NULL, NULL, 108, NULL, 2572.0712, NULL, 0.00, '-', 'Place order #118', 'T9270', '2025-05-14 00:17:38', '2025-05-14 00:17:38'),
(127, NULL, NULL, 79, NULL, 5458.7000, NULL, 0.00, '-', 'Place order #119', 'T9271', '2025-05-14 00:57:58', '2025-05-14 00:57:58'),
(128, NULL, 'bank', 79, NULL, 7000.0000, NULL, 0.00, '+', 'topsubre79 GD 850898-051325 21:01:34', '9268', '2025-05-14 01:02:05', '2025-05-14 01:02:05'),
(129, NULL, NULL, 117, NULL, 3494.8990, NULL, 0.00, '+', 'Refund for partial order 116', 'T9272', '2025-05-14 02:56:19', '2025-05-14 02:56:19'),
(130, NULL, NULL, 117, NULL, 2512.3330, NULL, 0.00, '+', 'Refund for partial order 115', 'T9273', '2025-05-14 02:57:20', '2025-05-14 02:57:20'),
(131, NULL, NULL, 18, NULL, 1264.8200, NULL, 0.00, '-', 'Place order #120', 'T9274', '2025-05-14 03:13:32', '2025-05-14 03:13:32'),
(132, NULL, 'bank', 101, NULL, 32375.0000, NULL, 0.00, '+', 'QR - topsubre101 GD 384077-051425 11:18:47', '9280', '2025-05-14 15:21:34', '2025-05-14 15:21:34'),
(133, NULL, 'bank', 101, NULL, 10000.0000, NULL, 0.00, '+', 'QR - topsubre101 GD 379388-051425 11:16:49', '9279', '2025-05-14 15:21:36', '2025-05-14 15:21:36'),
(134, NULL, NULL, 101, NULL, 32752.2000, NULL, 0.00, '-', 'Place order #121', 'T9280', '2025-05-14 15:22:06', '2025-05-14 15:22:06'),
(135, NULL, NULL, 72, NULL, 2800.0000, NULL, 0.00, '+', 'Refund for partial order 87', 'T9281', '2025-05-14 16:54:13', '2025-05-14 16:54:13'),
(136, NULL, 'bank', 111, NULL, 26000.0000, NULL, 0.00, '+', 'topsubre111 FT25135904312918 GD 912217-051525 05:13:09', '9292', '2025-05-15 09:14:02', '2025-05-15 09:14:02'),
(137, NULL, NULL, 111, NULL, 11186.0000, NULL, 0.00, '-', 'Place order #122', 'T9293', '2025-05-15 09:22:49', '2025-05-15 09:22:49'),
(138, NULL, NULL, 111, NULL, 6392.0000, NULL, 0.00, '-', 'Place order #123', 'T9294', '2025-05-15 09:24:43', '2025-05-15 09:24:43'),
(139, NULL, NULL, 111, NULL, 6923.2000, NULL, 0.00, '-', 'Place order #124', 'T9295', '2025-05-15 09:27:31', '2025-05-15 09:27:31'),
(140, NULL, NULL, 111, NULL, 1863.9600, NULL, 0.00, '-', 'Place order #125', 'T9296', '2025-05-15 09:55:42', '2025-05-15 09:55:42'),
(141, NULL, NULL, 111, NULL, 382.5068, NULL, 0.00, '+', 'Refund for partial order 124', 'T9297', '2025-05-15 12:52:04', '2025-05-15 12:52:04'),
(142, NULL, NULL, 72, NULL, 15.9800, NULL, 0.00, '-', 'Place order #126', 'T9298', '2025-05-15 16:50:12', '2025-05-15 16:50:12'),
(143, NULL, NULL, 72, NULL, 16.4594, NULL, 0.00, '-', 'Place order #127', 'T9299', '2025-05-15 16:52:15', '2025-05-15 16:52:15'),
(144, NULL, NULL, 72, NULL, 16.4594, NULL, 0.00, '-', 'Place order #128', 'T9300', '2025-05-15 16:52:48', '2025-05-15 16:52:48'),
(145, NULL, NULL, 72, NULL, 16.4594, NULL, 0.00, '-', 'Place order #129', 'T9301', '2025-05-15 16:53:22', '2025-05-15 16:53:22'),
(146, NULL, NULL, 72, NULL, 218.4466, NULL, 0.00, '-', 'Place order #130', 'T9302', '2025-05-15 16:54:04', '2025-05-15 16:54:04'),
(147, NULL, NULL, 111, NULL, 11300.0000, NULL, 0.00, '+', 'Refund for partial order 111', 'T9303', '2025-05-15 19:55:04', '2025-05-15 19:55:04'),
(148, NULL, 'bank', 131, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre131 GD 390577-051525 18:15:47', '9299', '2025-05-15 22:16:00', '2025-05-15 22:16:00'),
(149, NULL, NULL, 131, NULL, 7788.6500, NULL, 0.00, '-', 'Place order #131', 'T9304', '2025-05-15 22:21:20', '2025-05-15 22:21:20'),
(150, NULL, 'bank', 130, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre130 GD 950094-051525 18:50:42', '9301', '2025-05-15 22:51:02', '2025-05-15 22:51:02'),
(151, NULL, NULL, 130, NULL, 9827.6514, NULL, 0.00, '-', 'Place order #132', 'T9305', '2025-05-15 22:57:37', '2025-05-15 22:57:37'),
(152, NULL, NULL, 35, NULL, 15577.3000, NULL, 0.00, '-', 'Place order #133', 'T9306', '2025-05-16 02:39:51', '2025-05-16 02:39:51'),
(153, NULL, 'bank', 98, NULL, 100000.0000, NULL, 0.00, '+', 'topsubre98 GD 512636-051625 03:59:56', '9309', '2025-05-16 07:59:58', '2025-05-16 07:59:58'),
(154, NULL, NULL, 98, NULL, 16376.1000, NULL, 0.00, '-', 'Place order #135', 'T9310', '2025-05-16 08:04:40', '2025-05-16 08:04:40'),
(155, NULL, NULL, 131, NULL, 3473.7379, NULL, 0.00, '+', 'Refund for partial order 131', 'T9311', '2025-05-16 14:54:12', '2025-05-16 14:54:12'),
(156, NULL, NULL, 72, NULL, 2522.9850, NULL, 0.00, '-', 'Place order #136', 'T9312', '2025-05-16 15:47:55', '2025-05-16 15:47:55'),
(157, NULL, 'bank', 35, NULL, 11000.0000, NULL, 0.00, '+', 'topsubre35 GD 496909-051625 13:01:17', '9320', '2025-05-16 17:02:00', '2025-05-16 17:02:00'),
(158, NULL, NULL, 35, NULL, 15265.7540, NULL, 0.00, '-', 'Place order #137', 'T9321', '2025-05-16 17:06:37', '2025-05-16 17:06:37'),
(159, NULL, 'bank', 140, NULL, 2000.0000, NULL, 0.00, '+', 'topsubre140 GD 442607-051625 19:58:31', '9328', '2025-05-16 23:59:00', '2025-05-16 23:59:00'),
(160, NULL, NULL, 140, NULL, 1557.7300, NULL, 0.00, '-', 'Place order #138', 'T9329', '2025-05-17 01:40:03', '2025-05-17 01:40:03'),
(161, NULL, NULL, 131, NULL, 1264.8200, NULL, 0.00, '-', 'Place order #139', 'T9330', '2025-05-17 02:07:53', '2025-05-17 02:07:53'),
(162, NULL, NULL, 131, NULL, 1747.4495, NULL, 0.00, '-', 'Place order #140', 'T9331', '2025-05-17 02:16:33', '2025-05-17 02:16:33'),
(163, NULL, 'bank', 144, NULL, 12648.0000, NULL, 0.00, '+', 'topsubre144 GD 237752-051625 22:39:12', '9334', '2025-05-17 02:40:01', '2025-05-17 02:40:01'),
(164, NULL, 'bank', 144, NULL, 4000.0000, NULL, 0.00, '+', 'topsubre144 GD 654483-051625 22:46:39', '9335', '2025-05-17 02:46:59', '2025-05-17 02:46:59'),
(165, NULL, NULL, 144, NULL, 15577.3000, NULL, 0.00, '-', 'Place order #141', 'T9336', '2025-05-17 02:54:17', '2025-05-17 02:54:17'),
(166, NULL, 'bank', 144, NULL, 15000.0000, NULL, 0.00, '+', 'topsubre144 GD 716649-051625 23:07:14', '9336', '2025-05-17 03:08:00', '2025-05-17 03:08:00'),
(167, NULL, NULL, 144, NULL, 15577.3000, NULL, 0.00, '-', 'Place order #142', 'T9337', '2025-05-17 03:09:54', '2025-05-17 03:09:54'),
(168, NULL, 'bank', 51, NULL, 18000.0000, NULL, 0.00, '+', 'topsubre51 FT25137217518830 GD 058747-051725 06:50:55', '9337', '2025-05-17 10:50:58', '2025-05-17 10:50:58'),
(169, NULL, NULL, 131, NULL, 1747.4495, NULL, 0.00, '-', 'Place order #143', 'T9338', '2025-05-17 15:42:03', '2025-05-17 15:42:03'),
(170, NULL, 'bank', 35, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre35 GD 474291-051725 12:51:05', '9343', '2025-05-17 16:51:59', '2025-05-17 16:51:59'),
(171, NULL, NULL, 35, NULL, 2529.6000, NULL, 0.00, '-', 'Place order #144', 'T9344', '2025-05-17 16:56:14', '2025-05-17 16:56:14'),
(172, NULL, NULL, 35, NULL, 2529.6000, NULL, 0.00, '-', 'Place order #145', 'T9345', '2025-05-17 16:58:15', '2025-05-17 16:58:15'),
(173, NULL, NULL, 35, NULL, 2529.6000, NULL, 0.00, '-', 'Place order #146', 'T9346', '2025-05-17 16:59:17', '2025-05-17 16:59:17'),
(174, NULL, NULL, 101, NULL, 15590.0472, NULL, 0.00, '+', 'Refund for partial order 121', 'T9347', '2025-05-17 21:42:01', '2025-05-17 21:42:01'),
(175, NULL, 'bank', 50, NULL, 50000.0000, NULL, 0.00, '+', 'IB TOPSUBRE50', '9357', '2025-05-18 01:14:01', '2025-05-18 01:14:01'),
(176, NULL, 'bank', 96, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre96 FT25139810005361 GD 775054-051725 23:09:14', '9359', '2025-05-18 03:10:01', '2025-05-18 03:10:01'),
(177, NULL, 'bank', 56, NULL, 30000.0000, NULL, 0.00, '+', 'MBVCB.9539128790.911786.topsubre56.CT tu 1016550188 TRUONG QUOC ANH toi 15873021 LE VAN KHANH tai ACB GD 911786-051825 10:21:51', '9362', '2025-05-18 14:22:04', '2025-05-18 14:22:04'),
(178, NULL, NULL, 56, NULL, 5603.8120, NULL, 0.00, '-', 'Place order #164', 'T9363', '2025-05-18 14:24:24', '2025-05-18 14:24:24'),
(179, NULL, NULL, 56, NULL, 24030.9515, NULL, 0.00, '-', 'Place order #165', 'T9364', '2025-05-18 14:52:42', '2025-05-18 14:52:42'),
(180, NULL, 'bank', 52, NULL, 27000.0000, NULL, 0.00, '+', 'topsubre52 GD 011518-051825 13:20:57', '9371', '2025-05-18 17:21:02', '2025-05-18 17:21:02'),
(181, NULL, NULL, 52, NULL, 8281.2500, NULL, 0.00, '-', 'Place order #166', 'T9372', '2025-05-18 17:28:51', '2025-05-18 17:28:51'),
(182, NULL, NULL, 52, NULL, 18106.9200, NULL, 0.00, '-', 'Place order #167', 'T9373', '2025-05-18 17:31:55', '2025-05-18 17:31:55'),
(183, NULL, 'bank', 153, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre153 GD 514192-051825 19:51:02', '9374', '2025-05-18 23:52:00', '2025-05-18 23:52:00'),
(184, NULL, 'bank', 153, NULL, 4000.0000, NULL, 0.00, '+', 'topsubre153 GD 989911-051825 19:55:38', '9375', '2025-05-18 23:56:00', '2025-05-18 23:56:00'),
(185, NULL, NULL, 153, NULL, 28358.6000, NULL, 0.00, '-', 'Place order #170', 'T9376', '2025-05-19 00:03:37', '2025-05-19 00:03:37'),
(186, NULL, NULL, 50, NULL, 1105.0000, NULL, 0.00, '-', 'Place order #176', 'T9377', '2025-05-19 02:24:51', '2025-05-19 02:24:51'),
(187, NULL, 'bank', 161, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre161 GD 873715-051925 16:14:24', '9388', '2025-05-19 20:14:46', '2025-05-19 20:14:46'),
(188, NULL, NULL, 161, NULL, 28891.1000, NULL, 0.00, '-', 'Place order #179', 'T9389', '2025-05-19 20:16:33', '2025-05-19 20:16:33'),
(189, NULL, 'bank', 98, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre98 GD 207349-051925 17:13:07', '9390', '2025-05-19 21:14:03', '2025-05-19 21:14:03'),
(190, NULL, 'bank', 165, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre165 GD 624593-052025 10:12:57', '9402', '2025-05-20 14:13:05', '2025-05-20 14:13:05'),
(191, NULL, NULL, 165, NULL, 19978.8420, NULL, 0.00, '-', 'Place order #196', 'T9403', '2025-05-20 14:16:30', '2025-05-20 14:16:30'),
(192, NULL, 'bank', 79, NULL, 44100.0000, NULL, 0.00, '+', 'topsubre79 GD 166655-052025 19:46:13', '9409', '2025-05-21 01:07:04', '2025-05-21 01:07:04'),
(193, NULL, 'bank', 169, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre169 GD 839182-052125 10:40:55', '9418', '2025-05-21 14:49:01', '2025-05-21 14:49:01'),
(194, NULL, NULL, 169, NULL, 5485.3200, NULL, 0.00, '-', 'Place order #209', 'T9419', '2025-05-21 19:42:04', '2025-05-21 19:42:04'),
(195, NULL, NULL, 131, NULL, 90.5220, NULL, 0.00, '-', 'Place order #211', 'T9420', '2025-05-21 23:11:26', '2025-05-21 23:11:26'),
(196, NULL, NULL, 131, NULL, 1180.1645, NULL, 0.00, '-', 'Place order #212', 'T9421', '2025-05-21 23:12:36', '2025-05-21 23:12:36'),
(197, NULL, NULL, 131, NULL, 43.3488, NULL, 0.00, '-', 'Place order #213', 'T9422', '2025-05-21 23:13:43', '2025-05-21 23:13:43'),
(198, NULL, NULL, 131, NULL, 97.2000, NULL, 0.00, '-', 'Place order #214', 'T9423', '2025-05-21 23:17:53', '2025-05-21 23:17:53'),
(199, NULL, NULL, 131, NULL, 1630.7045, NULL, 0.00, '-', 'Place order #215', 'T9424', '2025-05-21 23:19:00', '2025-05-21 23:19:00'),
(200, NULL, NULL, 131, NULL, 317.7270, NULL, 0.00, '-', 'Place order #216', 'T9425', '2025-05-21 23:19:31', '2025-05-21 23:19:31'),
(201, NULL, NULL, 169, NULL, 3839.7240, NULL, 0.00, '-', 'Place order #217', 'T9426', '2025-05-21 23:39:15', '2025-05-21 23:39:15'),
(202, NULL, NULL, 169, NULL, 2742.6600, NULL, 0.00, '-', 'Place order #218', 'T9427', '2025-05-22 00:34:21', '2025-05-22 00:34:21'),
(203, NULL, 'bank', 180, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre180 GD 580489-052225 22:37:44', '9439', '2025-05-23 02:45:08', '2025-05-23 02:45:08'),
(204, NULL, NULL, 169, NULL, 7405.1820, NULL, 0.00, '-', 'Place order #220', 'T9440', '2025-05-24 17:16:30', '2025-05-24 17:16:30'),
(205, NULL, NULL, 96, NULL, 2196.8000, NULL, 0.00, '-', 'Place order #221', 'T9441', '2025-05-25 01:42:10', '2025-05-25 01:42:10'),
(206, NULL, NULL, 96, NULL, 7968.3600, NULL, 0.00, '-', 'Place order #222', 'T9442', '2025-05-25 01:51:42', '2025-05-25 01:51:42'),
(207, NULL, 'bank', 187, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre187 GD 590275-052425 22:12:56', '9489', '2025-05-25 02:46:08', '2025-05-25 02:46:08'),
(208, NULL, 'bank', 96, NULL, 15000.0000, NULL, 0.00, '+', 'topsubre96 GD 568540-052425 22:06:50', '9488', '2025-05-25 02:46:09', '2025-05-25 02:46:09'),
(209, NULL, 'bank', 187, NULL, 11000.0000, NULL, 0.00, '+', 'topsubre187 GD 541211-052425 21:54:52', '9486', '2025-05-25 02:46:11', '2025-05-25 02:46:11'),
(210, NULL, NULL, 131, NULL, 525.9000, NULL, 0.00, '-', 'Place order #224', 'T9487', '2025-05-25 19:36:59', '2025-05-25 19:36:59'),
(211, NULL, 'bank', 62, NULL, 20000.0000, NULL, 0.00, '+', 'IB TOPSUBRE62', '9501', '2025-05-25 21:48:03', '2025-05-25 21:48:03'),
(212, NULL, 'bank', 62, NULL, 30000.0000, NULL, 0.00, '+', 'IB TOPSUBRE62', '9502', '2025-05-25 21:52:02', '2025-05-25 21:52:02'),
(213, NULL, NULL, 96, NULL, 1065.1200, NULL, 0.00, '-', 'Place order #226', 'T9503', '2025-05-26 13:30:15', '2025-05-26 13:30:15'),
(214, NULL, NULL, 96, NULL, 2529.6500, NULL, 0.00, '-', 'Place order #227', 'T9504', '2025-05-26 13:32:00', '2025-05-26 13:32:00'),
(215, NULL, NULL, 96, NULL, 5325.6000, NULL, 0.00, '-', 'Place order #228', 'T9505', '2025-05-26 13:33:27', '2025-05-26 13:33:27'),
(216, NULL, NULL, 96, NULL, 1065.1200, NULL, 0.00, '-', 'Place order #229', 'T9506', '2025-05-26 13:36:06', '2025-05-26 13:36:06'),
(217, NULL, NULL, 111, NULL, 11186.0000, NULL, 0.00, '-', 'Place order #230', 'T9507', '2025-05-27 01:31:55', '2025-05-27 01:31:55'),
(218, NULL, 'bank', 111, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre111 FT25147390307020 GD 920518-052625 21:47:52', '9529', '2025-05-27 01:48:01', '2025-05-27 01:48:01'),
(219, NULL, NULL, 111, NULL, 19651.3000, NULL, 0.00, '-', 'Place order #231', 'T9530', '2025-05-27 01:49:23', '2025-05-27 01:49:23'),
(220, NULL, NULL, 111, NULL, 19023.4170, NULL, 0.00, '+', 'Refund for partial order 231', 'T9531', '2025-05-27 09:06:13', '2025-05-27 09:06:13'),
(221, NULL, NULL, 101, NULL, 14958.1600, NULL, 0.00, '-', 'Place order #232', 'T9532', '2025-05-27 11:51:09', '2025-05-27 11:51:09'),
(222, NULL, 'bank', 200, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre200 GD 791938-052725 11:24:16', '9537', '2025-05-27 15:37:05', '2025-05-27 15:37:05'),
(223, NULL, NULL, 57, NULL, 132.0755, NULL, 0.00, '-', 'Place order #233', 'T9538', '2025-05-27 16:34:55', '2025-05-27 16:34:55'),
(224, NULL, NULL, 57, NULL, 0.8316, NULL, 0.00, '-', 'Place order #234', 'T9539', '2025-05-27 16:36:01', '2025-05-27 16:36:01'),
(225, NULL, 'bank', 57, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre57 GD 642416-052725 12:33:26', '9538', '2025-05-27 18:02:56', '2025-05-27 18:02:56'),
(226, NULL, NULL, 111, NULL, 19523.4000, NULL, 0.00, '-', 'Place order #235', 'T9540', '2025-05-27 20:21:24', '2025-05-27 20:21:24'),
(227, NULL, 'bank', 20, NULL, 85000.0000, NULL, 0.00, '+', 'topsubre20 GD 315292-052725 16:26:43', '9540', '2025-05-27 20:30:03', '2025-05-27 20:30:03'),
(228, NULL, NULL, 20, NULL, 27027.2000, NULL, 0.00, '-', 'Place order #236', 'T9541', '2025-05-27 20:31:48', '2025-05-27 20:31:48'),
(229, NULL, NULL, 20, NULL, 27027.2000, NULL, 0.00, '-', 'Place order #237', 'T9542', '2025-05-27 20:32:48', '2025-05-27 20:32:48'),
(230, NULL, NULL, 20, NULL, 27027.2000, NULL, 0.00, '-', 'Place order #238', 'T9543', '2025-05-27 20:34:50', '2025-05-27 20:34:50'),
(231, NULL, NULL, 111, NULL, 19238.0580, NULL, 0.00, '+', 'Refund for partial order 235', 'T9544', '2025-05-27 22:08:51', '2025-05-27 22:08:51'),
(232, NULL, 'bank', 202, NULL, 20000.0000, NULL, 0.00, '+', 'MBVCB.9647976892.095347.topsubre202.CT tu 1026204778 TRAN THANH CONG toi 15873021 LE VAN KHANH tai ACB GD 095347-052725 23:06:56', '9548', '2025-05-28 03:28:06', '2025-05-28 03:28:06'),
(233, NULL, 'bank', 205, NULL, 40000.0000, NULL, 0.00, '+', 'topsubre205 GD 232722-052825 11:37:56', '9549', '2025-05-28 15:42:07', '2025-05-28 15:42:07'),
(234, NULL, 'bank', 205, NULL, 5000.0000, NULL, 0.00, '+', 'topsubre205 GD 318380-052825 11:53:58', '9550', '2025-05-28 15:55:05', '2025-05-28 15:55:05'),
(235, NULL, NULL, 205, NULL, 40940.2500, NULL, 0.00, '-', 'Place order #239', 'T9551', '2025-05-28 15:59:34', '2025-05-28 15:59:34'),
(236, NULL, NULL, 200, NULL, 379.4490, NULL, 0.00, '-', 'Place order #248', 'T9552', '2025-05-28 22:55:28', '2025-05-28 22:55:28'),
(237, NULL, 'bank', 207, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre207 GD 576241-052825 19:10:36', '9555', '2025-05-28 23:11:01', '2025-05-28 23:11:01'),
(238, NULL, NULL, 207, NULL, 27293.5000, NULL, 0.00, '-', 'Place order #249', 'T9556', '2025-05-28 23:22:26', '2025-05-28 23:22:26'),
(239, NULL, NULL, 202, NULL, 11509.8550, NULL, 0.00, '-', 'Place order #250', 'T9557', '2025-05-29 00:31:55', '2025-05-29 00:31:55'),
(240, NULL, NULL, 200, NULL, 1251.5000, NULL, 0.00, '-', 'Place order #251', 'T9558', '2025-05-29 00:32:34', '2025-05-29 00:32:34'),
(241, NULL, NULL, 57, NULL, 0.8316, NULL, 0.00, '+', 'Refund for partial order 234', 'T9559', '2025-05-29 03:31:01', '2025-05-29 03:31:01'),
(242, NULL, NULL, 57, NULL, 19.2192, NULL, 0.00, '-', 'Place order #252', 'T9560', '2025-05-29 16:36:30', '2025-05-29 16:36:30'),
(243, NULL, NULL, 57, NULL, 31.1544, NULL, 0.00, '-', 'Place order #253', 'T9561', '2025-05-29 16:37:36', '2025-05-29 16:37:36'),
(244, NULL, NULL, 200, NULL, 199.7100, NULL, 0.00, '-', 'Place order #254', 'T9562', '2025-05-29 16:43:28', '2025-05-29 16:43:28'),
(245, NULL, NULL, 200, NULL, 54.5000, NULL, 0.00, '-', 'Place order #255', 'T9563', '2025-05-29 16:47:47', '2025-05-29 16:47:47'),
(246, NULL, NULL, 200, NULL, 500.6000, NULL, 0.00, '-', 'Place order #256', 'T9564', '2025-05-29 18:19:05', '2025-05-29 18:19:05'),
(247, NULL, 'bank', 211, NULL, 30631.0000, NULL, 0.00, '+', 'topsubre211 GD 408763-052925 18:39:29', '9566', '2025-05-29 22:40:01', '2025-05-29 22:40:01'),
(248, NULL, NULL, 211, NULL, 30198.4240, NULL, 0.00, '-', 'Place order #257', 'T9567', '2025-05-29 22:43:47', '2025-05-29 22:43:47'),
(249, NULL, NULL, 96, NULL, 1065.1200, NULL, 0.00, '-', 'Place order #258', 'T9568', '2025-05-30 03:19:52', '2025-05-30 03:19:52'),
(250, NULL, 'bank', 211, NULL, 15000.0000, NULL, 0.00, '+', 'topsubre211 GD 773596-053025 01:07:43', '9574', '2025-05-30 05:54:01', '2025-05-30 05:54:01'),
(251, NULL, NULL, 211, NULL, 14997.2970, NULL, 0.00, '-', 'Place order #259', 'T9575', '2025-05-30 08:57:57', '2025-05-30 08:57:57'),
(252, NULL, 'bank', 211, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre211 GD 699119-053025 14:59:28', '9578', '2025-05-30 20:20:08', '2025-05-30 20:20:08'),
(253, NULL, NULL, 211, NULL, 30355.8000, NULL, 0.00, '-', 'Place order #260', 'T9579', '2025-05-30 20:59:08', '2025-05-30 20:59:08'),
(254, NULL, 'bank', 169, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre169 GD 758758-053025 20:19:38', '9586', '2025-05-31 00:23:03', '2025-05-31 00:23:03'),
(255, NULL, NULL, 169, NULL, 9599.3100, NULL, 0.00, '-', 'Place order #261', 'T9587', '2025-05-31 01:07:02', '2025-05-31 01:07:02'),
(256, NULL, 'bank', 217, NULL, 34390.0000, NULL, 0.00, '+', 'topsubre217 GD 324616-053025 22:06:20', '9587', '2025-05-31 02:08:05', '2025-05-31 02:08:05'),
(257, NULL, NULL, 217, NULL, 34365.1385, NULL, 0.00, '-', 'Place order #262', 'T9588', '2025-05-31 02:45:32', '2025-05-31 02:45:32'),
(258, NULL, NULL, 96, NULL, 532.5600, NULL, 0.00, '-', 'Place order #263', 'T9589', '2025-05-31 03:09:20', '2025-05-31 03:09:20'),
(259, NULL, 'bank', 223, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre223 GD 309845-053125 15:52:13', '9595', '2025-05-31 08:53:05', '2025-05-31 08:53:05'),
(260, NULL, NULL, 223, NULL, 9983.2824, NULL, 0.00, '-', 'Place order #264', 'T9596', '2025-05-31 08:57:59', '2025-05-31 08:57:59'),
(261, NULL, 'bank', 223, NULL, 14000.0000, NULL, 0.00, '+', 'topsubre223 GD 847527-053125 15:58:48', '9596', '2025-05-31 09:01:04', '2025-05-31 09:01:04'),
(262, NULL, NULL, 223, NULL, 13713.3000, NULL, 0.00, '-', 'Place order #265', 'T9597', '2025-05-31 09:37:35', '2025-05-31 09:37:35'),
(263, NULL, 'bank', 226, NULL, 27000.0000, NULL, 0.00, '+', 'topsubre226 GD 591810-053125 21:21:17', '9604', '2025-05-31 14:21:27', '2025-05-31 14:21:27'),
(264, NULL, 'bank', 226, NULL, 3000.0000, NULL, 0.00, '+', 'topsubre226 GD 124096-053125 21:26:53', '9605', '2025-05-31 14:27:01', '2025-05-31 14:27:01'),
(265, NULL, NULL, 226, NULL, 27293.5000, NULL, 0.00, '-', 'Place order #266', 'T9606', '2025-05-31 14:36:03', '2025-05-31 14:36:03'),
(266, NULL, NULL, 180, NULL, 2795.9200, NULL, 0.00, '-', 'Place order #267', 'T9607', '2025-06-01 01:29:14', '2025-06-01 01:29:14'),
(267, NULL, NULL, 96, NULL, 532.5600, NULL, 0.00, '-', 'Place order #271', 'T9608', '2025-06-01 14:11:50', '2025-06-01 14:11:50'),
(268, NULL, NULL, 96, NULL, 532.5600, NULL, 0.00, '-', 'Place order #272', 'T9609', '2025-06-01 14:23:57', '2025-06-01 14:23:57'),
(269, NULL, NULL, 96, NULL, 798.8400, NULL, 0.00, '-', 'Place order #273', 'T9610', '2025-06-01 14:25:17', '2025-06-01 14:25:17'),
(270, NULL, NULL, 200, NULL, 1251.5000, NULL, 0.00, '-', 'Place order #287', 'T9611', '2025-06-03 16:42:25', '2025-06-03 16:42:25'),
(271, NULL, NULL, 200, NULL, 146.0000, NULL, 0.00, '-', 'Place order #288', 'T9612', '2025-06-03 16:43:26', '2025-06-03 16:43:26'),
(272, NULL, NULL, 230, NULL, 15000.0000, NULL, 0.00, '+', '95891385613491	59200044393321	VINAPHONE', 'T9613', '2025-06-04 04:31:38', '2025-06-04 04:31:38'),
(273, NULL, NULL, 230, NULL, 14245.9000, NULL, 0.00, '-', 'Place order #290', 'T9614', '2025-06-04 04:32:52', '2025-06-04 04:32:52'),
(274, NULL, NULL, 230, NULL, 1000.0000, NULL, 0.00, '+', 'ok', 'T9615', '2025-06-04 04:53:40', '2025-06-04 04:53:40'),
(275, NULL, NULL, 230, NULL, 32.7000, NULL, 0.00, '-', 'Place order #291', 'T9616', '2025-06-04 05:04:10', '2025-06-04 05:04:10'),
(276, NULL, 'bank', 234, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre234 GD 275053-060525 13:35:50', '9659', '2025-06-05 06:36:13', '2025-06-05 06:36:13'),
(277, NULL, NULL, 234, NULL, 584.0000, NULL, 0.00, '-', 'Place order #306', 'T9660', '2025-06-05 06:37:47', '2025-06-05 06:37:47'),
(278, NULL, NULL, 234, NULL, 4593.3300, NULL, 0.00, '-', 'Place order #307', 'T9661', '2025-06-05 06:39:43', '2025-06-05 06:39:43'),
(279, NULL, NULL, 234, NULL, 436.0000, NULL, 0.00, '-', 'Place order #308', 'T9662', '2025-06-05 06:47:02', '2025-06-05 06:47:02'),
(280, NULL, NULL, 234, NULL, 146.0000, NULL, 0.00, '-', 'Place order #309', 'T9663', '2025-06-05 09:26:36', '2025-06-05 09:26:36'),
(281, NULL, NULL, 205, NULL, 4055.9960, NULL, 0.00, '-', 'Place order #310', 'T9664', '2025-06-05 10:11:21', '2025-06-05 10:11:21'),
(282, NULL, 'bank', 231, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre231 GD 532093-060525 19:19:19', '9660', '2025-06-05 12:20:05', '2025-06-05 12:20:05'),
(283, NULL, NULL, 231, NULL, 9998.8316, NULL, 0.00, '-', 'Place order #311', 'T9665', '2025-06-05 12:21:54', '2025-06-05 12:21:54'),
(284, NULL, NULL, 234, NULL, 109.0000, NULL, 0.00, '-', 'Place order #312', 'T9666', '2025-06-05 15:14:39', '2025-06-05 15:14:39'),
(285, NULL, NULL, 231, NULL, 74.4244, NULL, 0.00, '+', 'Refund for partial order 311', 'T9667', '2025-06-05 17:32:00', '2025-06-05 17:32:00'),
(286, NULL, 'bank', 236, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre236 GD 574778-060625 10:58:32', '9672', '2025-06-06 03:59:08', '2025-06-06 03:59:08'),
(287, NULL, 'bank', 98, NULL, 100000.0000, NULL, 0.00, '+', 'topsubre98 GD 624761-060625 10:59:25', '9673', '2025-06-06 04:01:00', '2025-06-06 04:01:00'),
(288, NULL, NULL, 200, NULL, 5045.9700, NULL, 0.00, '-', 'Place order #313', 'T9674', '2025-06-06 04:11:17', '2025-06-06 04:11:17'),
(289, NULL, NULL, 200, NULL, 346.1000, NULL, 0.00, '-', 'Place order #314', 'T9675', '2025-06-06 04:13:12', '2025-06-06 04:13:12'),
(290, NULL, NULL, 236, NULL, 9982.2272, NULL, 0.00, '-', 'Place order #315', 'T9676', '2025-06-06 04:13:59', '2025-06-06 04:13:59'),
(291, NULL, 'bank', 200, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre200 GD 669623-060625 11:16:42', '9674', '2025-06-06 04:17:07', '2025-06-06 04:17:07'),
(292, NULL, NULL, 200, NULL, 2662.8000, NULL, 0.00, '-', 'Place order #316', 'T9677', '2025-06-06 04:17:53', '2025-06-06 04:17:53'),
(293, NULL, NULL, 72, NULL, 15.9800, NULL, 0.00, '-', 'Place order #317', 'T9678', '2025-06-06 10:48:07', '2025-06-06 10:48:07'),
(294, NULL, 'bank', 231, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre231 GD 069197-060625 22:34:45', '9679', '2025-06-06 15:35:03', '2025-06-06 15:35:03'),
(295, NULL, NULL, 231, NULL, 29261.2770, NULL, 0.00, '-', 'Place order #318', 'T9680', '2025-06-06 16:31:03', '2025-06-06 16:31:03'),
(296, NULL, NULL, 131, NULL, 228.3335, NULL, 0.00, '-', 'Place order #323', 'T9681', '2025-06-07 13:20:38', '2025-06-07 13:20:38'),
(297, NULL, NULL, 200, NULL, 18.6000, NULL, 0.00, '-', 'Place order #324', 'T9682', '2025-06-07 19:53:48', '2025-06-07 19:53:48'),
(298, NULL, NULL, 200, NULL, 199.7100, NULL, 0.00, '-', 'Place order #325', 'T9683', '2025-06-07 19:56:27', '2025-06-07 19:56:27'),
(299, NULL, NULL, 131, NULL, 411.0003, NULL, 0.00, '-', 'Place order #326', 'T9684', '2025-06-08 04:09:25', '2025-06-08 04:09:25'),
(300, NULL, NULL, 131, NULL, 182.6668, NULL, 0.00, '-', 'Place order #327', 'T9685', '2025-06-08 04:19:58', '2025-06-08 04:19:58'),
(301, NULL, NULL, 131, NULL, 91.3334, NULL, 0.00, '-', 'Place order #328', 'T9686', '2025-06-08 04:24:33', '2025-06-08 04:24:33'),
(302, NULL, NULL, 200, NULL, 6.5291, NULL, 0.00, '-', 'Place order #329', 'T9687', '2025-06-08 18:43:41', '2025-06-08 18:43:41'),
(303, NULL, NULL, 200, NULL, 75.0900, NULL, 0.00, '-', 'Place order #330', 'T9688', '2025-06-08 18:44:24', '2025-06-08 18:44:24'),
(304, NULL, 'bank', 98, NULL, 100000.0000, NULL, 0.00, '+', 'topsubre98 GD 938894-060925 19:44:21', '9702', '2025-06-09 12:46:59', '2025-06-09 12:46:59'),
(305, NULL, NULL, 98, NULL, 9717.5000, NULL, 0.00, '-', 'Place order #334', 'T9703', '2025-06-09 13:14:58', '2025-06-09 13:14:58'),
(306, NULL, NULL, 98, NULL, 11356.8000, NULL, 0.00, '-', 'Place order #335', 'T9704', '2025-06-09 13:15:34', '2025-06-09 13:15:34'),
(307, NULL, NULL, 98, NULL, 11356.8000, NULL, 0.00, '-', 'Place order #336', 'T9705', '2025-06-09 13:15:59', '2025-06-09 13:15:59'),
(308, NULL, NULL, 98, NULL, 9717.5000, NULL, 0.00, '+', 'Refund for canceled order 334', 'T9706', '2025-06-09 13:16:06', '2025-06-09 13:16:06'),
(309, NULL, NULL, 98, NULL, 9717.5000, NULL, 0.00, '+', 'Refund for canceled order 334', 'T9707', '2025-06-09 13:16:13', '2025-06-09 13:16:13'),
(310, NULL, NULL, 98, NULL, 11356.8000, NULL, 0.00, '+', 'Refund for canceled order 335', 'T9708', '2025-06-09 13:17:58', '2025-06-09 13:17:58'),
(311, NULL, NULL, 98, NULL, 11356.8000, NULL, 0.00, '+', 'Refund for canceled order 336', 'T9709', '2025-06-09 13:17:58', '2025-06-09 13:17:58'),
(312, NULL, NULL, 72, NULL, 3.2400, NULL, 0.00, '-', 'Place order #337', 'T9710', '2025-06-10 01:49:16', '2025-06-10 01:49:16'),
(313, NULL, NULL, 72, NULL, 8.1120, NULL, 0.00, '-', 'Place order #338', 'T9711', '2025-06-10 01:49:58', '2025-06-10 01:49:58'),
(314, NULL, NULL, 72, NULL, 123.0000, NULL, 0.00, '-', 'Place order #339', 'T9712', '2025-06-10 02:31:43', '2025-06-10 02:31:43'),
(315, NULL, 'bank', 72, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre72 GD 100352-061025 09:33:02', '9712', '2025-06-10 02:33:59', '2025-06-10 02:33:59'),
(316, NULL, NULL, 72, NULL, 604.1750, NULL, 0.00, '-', 'Place order #340', 'T9713', '2025-06-10 02:34:46', '2025-06-10 02:34:46'),
(317, NULL, NULL, 72, NULL, 205.0000, NULL, 0.00, '-', 'Place order #341', 'T9714', '2025-06-10 02:38:36', '2025-06-10 02:38:36'),
(318, NULL, NULL, 18, NULL, 27.0000, NULL, 0.00, '-', 'Place order #342', 'T9715', '2025-06-10 02:52:28', '2025-06-10 02:52:28'),
(319, NULL, NULL, 18, NULL, 887.2500, NULL, 0.00, '-', 'Place order #343', 'T9716', '2025-06-10 02:53:06', '2025-06-10 02:53:06'),
(320, NULL, NULL, 98, NULL, 9718.0000, NULL, 0.00, '-', '#334', 'T9717', '2025-06-10 03:39:15', '2025-06-10 03:39:15'),
(321, NULL, NULL, 200, NULL, 604.1750, NULL, 0.00, '-', 'Place order #344', 'T9718', '2025-06-10 09:05:07', '2025-06-10 09:05:07'),
(322, NULL, 'bank', 246, NULL, 13000.0000, NULL, 0.00, '+', 'topsubre246 GD 303480-061025 18:14:49', '9723', '2025-06-10 11:14:58', '2025-06-10 11:14:58'),
(323, NULL, NULL, 246, NULL, 6489.6000, NULL, 0.00, '-', 'Place order #345', 'T9724', '2025-06-10 11:16:34', '2025-06-10 11:16:34'),
(324, NULL, NULL, 246, NULL, 6489.6000, NULL, 0.00, '-', 'Place order #346', 'T9725', '2025-06-10 11:26:32', '2025-06-10 11:26:32'),
(325, NULL, NULL, 230, NULL, 676.0000, NULL, 0.00, '-', 'Place order #347', 'T9726', '2025-06-10 15:06:55', '2025-06-10 15:06:55'),
(326, NULL, NULL, 108, NULL, 3485.7500, NULL, 0.00, '-', 'Place order #348', 'T9727', '2025-06-10 17:27:22', '2025-06-10 17:27:22'),
(327, NULL, NULL, 230, NULL, 205.0000, NULL, 0.00, '-', 'Place order #349', 'T9728', '2025-06-11 00:47:20', '2025-06-11 00:47:20'),
(328, NULL, NULL, 230, NULL, 205.0000, NULL, 0.00, '-', 'Place order #350', 'T9729', '2025-06-11 00:53:59', '2025-06-11 00:53:59'),
(329, NULL, 'bank', 250, NULL, 12000.0000, NULL, 0.00, '+', 'topsubre250 GD 604537-061125 09:03:47', '9732', '2025-06-11 02:04:59', '2025-06-11 02:04:59'),
(330, NULL, NULL, 230, NULL, 205.0000, NULL, 0.00, '-', 'Place order #351', 'T9733', '2025-06-11 02:05:56', '2025-06-11 02:05:56'),
(331, NULL, NULL, 230, NULL, 135.2000, NULL, 0.00, '-', 'Place order #352', 'T9734', '2025-06-11 02:06:55', '2025-06-11 02:06:55'),
(332, NULL, NULL, 250, NULL, 32.4000, NULL, 0.00, '-', 'Place order #353', 'T9735', '2025-06-11 02:07:02', '2025-06-11 02:07:02'),
(333, NULL, NULL, 230, NULL, 135.2000, NULL, 0.00, '-', 'Place order #354', 'T9736', '2025-06-11 02:07:27', '2025-06-11 02:07:27'),
(334, NULL, NULL, 230, NULL, 123.0000, NULL, 0.00, '-', 'Place order #355', 'T9737', '2025-06-11 02:08:39', '2025-06-11 02:08:39'),
(335, NULL, NULL, 250, NULL, 3240.0000, NULL, 0.00, '-', 'Place order #356', 'T9738', '2025-06-11 02:11:09', '2025-06-11 02:11:09'),
(336, NULL, 'bank', 250, NULL, 12000.0000, NULL, 0.00, '+', 'topsubre250 GD 611326-061125 09:19:25', '9733', '2025-06-11 02:20:57', '2025-06-11 02:20:57'),
(337, NULL, NULL, 250, NULL, 13943.0000, NULL, 0.00, '-', 'Place order #357', 'T9739', '2025-06-11 02:22:05', '2025-06-11 02:22:05'),
(338, NULL, NULL, 250, NULL, 4100.0000, NULL, 0.00, '-', 'Place order #358', 'T9740', '2025-06-11 04:13:04', '2025-06-11 04:13:04'),
(339, NULL, 'bank', 251, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre251 GD 074276-061125 12:14:40', '9735', '2025-06-11 05:14:55', '2025-06-11 05:14:55'),
(340, NULL, NULL, 251, NULL, 9717.5000, NULL, 0.00, '-', 'Place order #359', 'T9741', '2025-06-11 05:15:58', '2025-06-11 05:15:58'),
(341, NULL, NULL, 250, NULL, 410.0000, NULL, 0.00, '-', 'Place order #360', 'T9742', '2025-06-11 08:22:45', '2025-06-11 08:22:45'),
(342, NULL, NULL, 250, NULL, 287.0000, NULL, 0.00, '-', 'Place order #361', 'T9743', '2025-06-11 13:41:20', '2025-06-11 13:41:20'),
(343, NULL, NULL, 230, NULL, 34.1000, NULL, 0.00, '-', 'Place order #362', 'T9744', '2025-06-12 05:16:29', '2025-06-12 05:16:29'),
(344, NULL, NULL, 230, NULL, 10617.0000, NULL, 0.00, '+', 'Sacombank', 'T9745', '2025-06-12 06:00:23', '2025-06-12 06:00:23'),
(345, NULL, NULL, 230, NULL, 205.0000, NULL, 0.00, '-', 'Place order #363', 'T9746', '2025-06-12 06:09:05', '2025-06-12 06:09:05'),
(346, NULL, NULL, 230, NULL, 1585.2000, NULL, 0.00, '-', 'Place order #364', 'T9747', '2025-06-12 06:09:39', '2025-06-12 06:09:39'),
(347, NULL, NULL, 230, NULL, 1585.2000, NULL, 0.00, '+', 'Refund for partial order 364', 'T9748', '2025-06-12 06:27:08', '2025-06-12 06:27:08'),
(348, NULL, NULL, 230, NULL, 205.0000, NULL, 0.00, '-', 'Place order #365', 'T9749', '2025-06-12 07:41:46', '2025-06-12 07:41:46'),
(349, NULL, NULL, 230, NULL, 1394.3000, NULL, 0.00, '-', 'Place order #366', 'T9750', '2025-06-12 07:48:45', '2025-06-12 07:48:45'),
(350, NULL, NULL, 250, NULL, 410.0000, NULL, 0.00, '-', 'Place order #367', 'T9751', '2025-06-12 11:27:16', '2025-06-12 11:27:16'),
(351, NULL, NULL, 251, NULL, 6480.0000, NULL, 0.00, '-', 'Place order #368', 'T9752', '2025-06-12 12:34:03', '2025-06-12 12:34:03'),
(352, NULL, NULL, 250, NULL, 820.0000, NULL, 0.00, '-', 'Place order #369', 'T9753', '2025-06-12 17:46:48', '2025-06-12 17:46:48'),
(353, NULL, 'bank', 101, NULL, 25000.0000, NULL, 0.00, '+', 'QR - topsubre101 GD 075959-061325 08:06:04', '9764', '2025-06-13 01:09:07', '2025-06-13 01:09:07'),
(354, NULL, NULL, 230, NULL, 10617.0000, NULL, 0.00, '+', 'Bank', 'T9765', '2025-06-13 03:52:53', '2025-06-13 03:52:53'),
(355, NULL, NULL, 230, NULL, 12083.5000, NULL, 0.00, '-', 'Place order #370', 'T9766', '2025-06-13 03:58:27', '2025-06-13 03:58:27'),
(356, NULL, NULL, 200, NULL, 7237.5940, NULL, 0.00, '-', 'Place order #371', 'T9767', '2025-06-13 07:45:18', '2025-06-13 07:45:18'),
(357, NULL, NULL, 230, NULL, 3.2400, NULL, 0.00, '-', 'Place order #372', 'T9768', '2025-06-13 10:16:25', '2025-06-13 10:16:25'),
(358, NULL, NULL, 230, NULL, 6.4800, NULL, 0.00, '-', 'Place order #373', 'T9769', '2025-06-13 13:07:32', '2025-06-13 13:07:32'),
(359, NULL, NULL, 230, NULL, 6.4800, NULL, 0.00, '-', 'Place order #374', 'T9770', '2025-06-13 13:09:48', '2025-06-13 13:09:48'),
(360, NULL, NULL, 230, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #375', 'T9771', '2025-06-13 14:52:52', '2025-06-13 14:52:52'),
(361, NULL, NULL, 250, NULL, 410.0000, NULL, 0.00, '-', 'Place order #376', 'T9772', '2025-06-14 06:46:28', '2025-06-14 06:46:28'),
(362, NULL, NULL, 230, NULL, 16.2000, NULL, 0.00, '-', 'Place order #377', 'T9773', '2025-06-14 10:45:17', '2025-06-14 10:45:17'),
(363, NULL, NULL, 230, NULL, 16.2000, NULL, 0.00, '-', 'Place order #378', 'T9774', '2025-06-14 10:50:47', '2025-06-14 10:50:47'),
(364, NULL, NULL, 250, NULL, 344.4000, NULL, 0.00, '-', 'Place order #379', 'T9775', '2025-06-14 11:51:20', '2025-06-14 11:51:20'),
(365, NULL, 'bank', 250, NULL, 26000.0000, NULL, 0.00, '+', 'topsubre250 GD 349597-061525 12:14:20', '9796', '2025-06-15 05:15:07', '2025-06-15 05:15:07'),
(366, NULL, NULL, 250, NULL, 24167.0000, NULL, 0.00, '-', 'Place order #380', 'T9797', '2025-06-15 05:16:30', '2025-06-15 05:16:30'),
(367, NULL, NULL, 250, NULL, 410.0000, NULL, 0.00, '-', 'Place order #381', 'T9798', '2025-06-15 05:18:00', '2025-06-15 05:18:00'),
(368, NULL, 'bank', 270, NULL, 2000.0000, NULL, 0.00, '+', 'QR - topsubre270 GD 843962-061525 16:37:13', '9801', '2025-06-15 09:38:02', '2025-06-15 09:38:02'),
(369, NULL, NULL, 270, NULL, 1774.5000, NULL, 0.00, '-', 'Place order #382', 'T9802', '2025-06-15 09:39:59', '2025-06-15 09:39:59'),
(370, NULL, NULL, 270, NULL, 32.4000, NULL, 0.00, '-', 'Place order #383', 'T9803', '2025-06-15 09:46:11', '2025-06-15 09:46:11'),
(371, NULL, NULL, 131, NULL, 178.8696, NULL, 0.00, '-', 'Place order #384', 'T9804', '2025-06-15 09:51:29', '2025-06-15 09:51:29'),
(372, NULL, NULL, 131, NULL, 178.8696, NULL, 0.00, '+', 'Refund for canceled order 384', 'T9805', '2025-06-15 10:14:05', '2025-06-15 10:14:05'),
(373, NULL, 'bank', 250, NULL, 5000.0000, NULL, 0.00, '+', '90938623702 0377830495 topsubre250 GD 161425-061525 19:27:04', '9804', '2025-06-15 12:28:03', '2025-06-15 12:28:03'),
(374, NULL, NULL, 250, NULL, 122.0000, NULL, 0.00, '-', 'Place order #385', 'T9806', '2025-06-15 12:28:56', '2025-06-15 12:28:56'),
(375, NULL, NULL, 250, NULL, 2034.8000, NULL, 0.00, '-', 'Place order #386', 'T9807', '2025-06-15 12:29:44', '2025-06-15 12:29:44'),
(376, NULL, NULL, 250, NULL, 122.0000, NULL, 0.00, '-', 'Place order #387', 'T9808', '2025-06-16 03:28:44', '2025-06-16 03:28:44'),
(377, NULL, NULL, 250, NULL, 2034.8000, NULL, 0.00, '-', 'Place order #388', 'T9809', '2025-06-16 03:29:07', '2025-06-16 03:29:07'),
(378, NULL, NULL, 230, NULL, 16.2000, NULL, 0.00, '-', 'Place order #389', 'T9810', '2025-06-16 06:20:29', '2025-06-16 06:20:29'),
(379, NULL, NULL, 230, NULL, 6.4800, NULL, 0.00, '-', 'Place order #390', 'T9811', '2025-06-16 06:22:46', '2025-06-16 06:22:46'),
(380, NULL, NULL, 230, NULL, 12.9600, NULL, 0.00, '-', 'Place order #391', 'T9812', '2025-06-16 06:23:14', '2025-06-16 06:23:14'),
(381, NULL, NULL, 18, NULL, 27209.0000, NULL, 0.00, '-', 'Place order #392', 'T9813', '2025-06-16 11:37:42', '2025-06-16 11:37:42'),
(382, NULL, NULL, 51, NULL, 40089.9772, NULL, 0.00, '-', 'Place order #393', 'T9814', '2025-06-16 13:53:08', '2025-06-16 13:53:08'),
(383, NULL, NULL, 18, NULL, 26936.9100, NULL, 0.00, '+', 'Refund for partial order 392', 'T9815', '2025-06-16 17:56:01', '2025-06-16 17:56:01'),
(384, NULL, NULL, 230, NULL, 16.2000, NULL, 0.00, '-', 'Place order #394', 'T9816', '2025-06-17 09:49:15', '2025-06-17 09:49:15'),
(385, NULL, NULL, 230, NULL, 1.6200, NULL, 0.00, '-', 'Place order #395', 'T9817', '2025-06-17 09:50:06', '2025-06-17 09:50:06'),
(386, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #396', 'T9818', '2025-06-17 09:50:39', '2025-06-17 09:50:39'),
(387, NULL, NULL, 230, NULL, 48.6000, NULL, 0.00, '-', 'Place order #397', 'T9819', '2025-06-17 09:52:50', '2025-06-17 09:52:50'),
(388, NULL, NULL, 230, NULL, 123.0000, NULL, 0.00, '+', 'Refund for canceled order 355', 'T9820', '2025-06-17 13:16:09', '2025-06-17 13:16:09'),
(389, NULL, NULL, 96, NULL, 684.4500, NULL, 0.00, '-', 'Place order #398', 'T9821', '2025-06-17 14:52:12', '2025-06-17 14:52:12'),
(390, NULL, NULL, 96, NULL, 882.1800, NULL, 0.00, '-', 'Place order #399', 'T9822', '2025-06-17 15:00:24', '2025-06-17 15:00:24'),
(391, NULL, NULL, 96, NULL, 684.4500, NULL, 0.00, '-', 'Place order #400', 'T9823', '2025-06-17 15:01:34', '2025-06-17 15:01:34'),
(392, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #401', 'T9824', '2025-06-17 15:05:19', '2025-06-17 15:05:19'),
(393, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #402', 'T9825', '2025-06-17 15:09:06', '2025-06-17 15:09:06'),
(394, NULL, NULL, 111, NULL, 9720.0000, NULL, 0.00, '-', 'Place order #403', 'T9826', '2025-06-17 16:00:46', '2025-06-17 16:00:46'),
(395, NULL, NULL, 111, NULL, 6750.0000, NULL, 0.00, '-', 'Place order #404', 'T9827', '2025-06-18 03:48:03', '2025-06-18 03:48:03'),
(396, NULL, NULL, 111, NULL, 2915.6000, NULL, 0.00, '-', 'Place order #405', 'T9828', '2025-06-18 04:01:21', '2025-06-18 04:01:21'),
(397, NULL, 'bank', 111, NULL, 30000.0000, NULL, 0.00, '+', 'topsubre111 FT25169553149479 GD 552236-061825 11:05:31', '9848', '2025-06-18 04:06:06', '2025-06-18 04:06:06'),
(398, NULL, NULL, 111, NULL, 13500.0000, NULL, 0.00, '-', 'Place order #406', 'T9849', '2025-06-18 04:07:25', '2025-06-18 04:07:25'),
(399, NULL, NULL, 111, NULL, 8100.0000, NULL, 0.00, '-', 'Place order #407', 'T9850', '2025-06-18 05:30:53', '2025-06-18 05:30:53'),
(400, NULL, NULL, 101, NULL, 31400.2000, NULL, 0.00, '-', 'Place order #408', 'T9851', '2025-06-18 08:22:22', '2025-06-18 08:22:22'),
(401, NULL, 'bank', 101, NULL, 28000.0000, NULL, 0.00, '+', 'QR - topsubre101 GD 627663-061825 15:25:07', '9851', '2025-06-18 08:26:04', '2025-06-18 08:26:04'),
(402, NULL, NULL, 101, NULL, 31400.2000, NULL, 0.00, '-', 'Place order #409', 'T9852', '2025-06-18 08:26:52', '2025-06-18 08:26:52'),
(403, NULL, NULL, 250, NULL, 12.2000, NULL, 0.00, '-', 'Place order #410', 'T9853', '2025-06-18 09:25:21', '2025-06-18 09:25:21'),
(404, NULL, NULL, 111, NULL, 7678.2326, NULL, 0.00, '-', 'Place order #411', 'T9854', '2025-06-18 12:20:59', '2025-06-18 12:20:59'),
(405, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #412', 'T9855', '2025-06-18 13:46:28', '2025-06-18 13:46:28'),
(406, NULL, NULL, 230, NULL, 25.9200, NULL, 0.00, '-', 'Place order #413', 'T9856', '2025-06-18 13:47:26', '2025-06-18 13:47:26'),
(407, NULL, NULL, 230, NULL, 25.9200, NULL, 0.00, '-', 'Place order #414', 'T9857', '2025-06-18 13:48:26', '2025-06-18 13:48:26'),
(408, NULL, NULL, 230, NULL, 3.2400, NULL, 0.00, '-', 'Place order #415', 'T9858', '2025-06-18 13:50:18', '2025-06-18 13:50:18'),
(409, NULL, NULL, 234, NULL, 3625.0500, NULL, 0.00, '-', 'Place order #416', 'T9859', '2025-06-18 13:59:17', '2025-06-18 13:59:17'),
(410, NULL, NULL, 234, NULL, 16.2000, NULL, 0.00, '-', 'Place order #417', 'T9860', '2025-06-18 14:04:36', '2025-06-18 14:04:36'),
(411, NULL, NULL, 234, NULL, 45.7256, NULL, 0.00, '-', 'Place order #418', 'T9861', '2025-06-18 14:05:31', '2025-06-18 14:05:31');
INSERT INTO `transactions` (`id`, `transactional_id`, `transactional_type`, `user_id`, `child_panel_id`, `amount`, `balance`, `charge`, `trx_type`, `remarks`, `trx_id`, `created_at`, `updated_at`) VALUES
(412, NULL, 'bank', 282, NULL, 30000.0000, NULL, 0.00, '+', 'MBVCB.9907032462.369722.topsubre282.CT tu 1045708027 VUONG TIEN DAT toi 15873021 LE VAN KHANH tai ACB GD 369722-061925 11:36:36', '9860', '2025-06-19 04:37:06', '2025-06-19 04:37:06'),
(413, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #424', 'T9862', '2025-06-19 04:39:37', '2025-06-19 04:39:37'),
(414, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #425', 'T9863', '2025-06-19 04:40:47', '2025-06-19 04:40:47'),
(415, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #426', 'T9864', '2025-06-19 04:41:03', '2025-06-19 04:41:03'),
(416, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #427', 'T9865', '2025-06-19 04:41:13', '2025-06-19 04:41:13'),
(417, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #428', 'T9866', '2025-06-19 04:41:24', '2025-06-19 04:41:24'),
(418, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #429', 'T9867', '2025-06-19 04:41:33', '2025-06-19 04:41:33'),
(419, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #430', 'T9868', '2025-06-19 04:41:39', '2025-06-19 04:41:39'),
(420, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #431', 'T9869', '2025-06-19 04:41:47', '2025-06-19 04:41:47'),
(421, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #432', 'T9870', '2025-06-19 04:41:54', '2025-06-19 04:41:54'),
(422, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 427', 'T9871', '2025-06-19 04:42:08', '2025-06-19 04:42:08'),
(423, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 428', 'T9872', '2025-06-19 04:42:08', '2025-06-19 04:42:08'),
(424, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 429', 'T9873', '2025-06-19 04:43:07', '2025-06-19 04:43:07'),
(425, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 430', 'T9874', '2025-06-19 04:43:07', '2025-06-19 04:43:07'),
(426, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 431', 'T9875', '2025-06-19 04:43:07', '2025-06-19 04:43:07'),
(427, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 432', 'T9876', '2025-06-19 04:43:07', '2025-06-19 04:43:07'),
(428, NULL, 'bank', 283, NULL, 79000.0000, NULL, 0.00, '+', 'topsubre283 GD 915319-061925 14:04:49', '9864', '2025-06-19 07:06:06', '2025-06-19 07:06:06'),
(429, NULL, NULL, 283, NULL, 9717.5000, NULL, 0.00, '-', 'Place order #433', 'T9877', '2025-06-19 07:09:56', '2025-06-19 07:09:56'),
(430, NULL, NULL, 283, NULL, 9717.5000, NULL, 0.00, '-', 'Place order #434', 'T9878', '2025-06-19 07:13:09', '2025-06-19 07:13:09'),
(431, NULL, NULL, 283, NULL, 19435.0000, NULL, 0.00, '+', 'Hoàn tiền đơn hàng', 'T9879', '2025-06-19 07:47:52', '2025-06-19 07:47:52'),
(432, NULL, NULL, 283, NULL, 9717.5000, NULL, 0.00, '-', 'Place order #435', 'T9880', '2025-06-19 07:56:51', '2025-06-19 07:56:51'),
(433, NULL, 'bank', 102, NULL, 19868.0000, NULL, 0.00, '+', 'topsubre102 FT25170269463743 GD 342835-061925 19:28:35', '9871', '2025-06-19 12:29:03', '2025-06-19 12:29:03'),
(434, NULL, NULL, 102, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #436', 'T9881', '2025-06-19 12:30:35', '2025-06-19 12:30:35'),
(435, NULL, NULL, 102, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #437', 'T9882', '2025-06-19 12:35:06', '2025-06-19 12:35:06'),
(436, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #438', 'T9883', '2025-06-19 12:50:22', '2025-06-19 12:50:22'),
(437, NULL, NULL, 230, NULL, 6.4800, NULL, 0.00, '-', 'Place order #439', 'T9884', '2025-06-19 12:50:38', '2025-06-19 12:50:38'),
(438, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #440', 'T9885', '2025-06-19 12:51:24', '2025-06-19 12:51:24'),
(439, NULL, NULL, 230, NULL, 6.4800, NULL, 0.00, '-', 'Place order #441', 'T9886', '2025-06-19 12:54:40', '2025-06-19 12:54:40'),
(440, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #442', 'T9887', '2025-06-19 12:55:05', '2025-06-19 12:55:05'),
(441, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #443', 'T9888', '2025-06-19 12:55:25', '2025-06-19 12:55:25'),
(442, NULL, NULL, 230, NULL, 25.9200, NULL, 0.00, '-', 'Place order #444', 'T9889', '2025-06-19 12:55:46', '2025-06-19 12:55:46'),
(443, NULL, NULL, 230, NULL, 32.4000, NULL, 0.00, '-', 'Place order #445', 'T9890', '2025-06-19 12:56:04', '2025-06-19 12:56:04'),
(444, NULL, NULL, 230, NULL, 32.4000, NULL, 0.00, '-', 'Place order #446', 'T9891', '2025-06-19 12:56:19', '2025-06-19 12:56:19'),
(445, NULL, NULL, 283, NULL, 48773.4000, NULL, 0.00, '-', 'Place order #447', 'T9892', '2025-06-19 14:04:13', '2025-06-19 14:04:13'),
(446, NULL, NULL, 102, NULL, 676.0000, NULL, 0.00, '-', 'Place order #448', 'T9893', '2025-06-19 14:20:16', '2025-06-19 14:20:16'),
(447, NULL, NULL, 283, NULL, 20406.7500, NULL, 0.00, '-', 'Place order #449', 'T9894', '2025-06-19 20:13:00', '2025-06-19 20:13:00'),
(448, NULL, NULL, 102, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #450', 'T9895', '2025-06-20 05:01:10', '2025-06-20 05:01:10'),
(449, NULL, NULL, 230, NULL, 29.1600, NULL, 0.00, '-', 'Place order #451', 'T9896', '2025-06-20 09:45:10', '2025-06-20 09:45:10'),
(450, NULL, NULL, 230, NULL, 93.9600, NULL, 0.00, '-', 'Place order #452', 'T9897', '2025-06-20 09:45:32', '2025-06-20 09:45:32'),
(451, NULL, NULL, 230, NULL, 22.6800, NULL, 0.00, '-', 'Place order #453', 'T9898', '2025-06-20 09:51:14', '2025-06-20 09:51:14'),
(452, NULL, NULL, 230, NULL, 6.4800, NULL, 0.00, '-', 'Place order #454', 'T9899', '2025-06-20 09:51:50', '2025-06-20 09:51:50'),
(453, NULL, NULL, 230, NULL, 25.9200, NULL, 0.00, '-', 'Place order #455', 'T9900', '2025-06-20 09:52:23', '2025-06-20 09:52:23'),
(454, NULL, NULL, 202, NULL, 7850.0500, NULL, 0.00, '-', 'Place order #456', 'T9901', '2025-06-20 22:58:43', '2025-06-20 22:58:43'),
(455, NULL, NULL, 250, NULL, 1774.5000, NULL, 0.00, '-', 'Place order #457', 'T9902', '2025-06-21 08:57:47', '2025-06-21 08:57:47'),
(456, NULL, NULL, 250, NULL, 122.0000, NULL, 0.00, '-', 'Place order #458', 'T9903', '2025-06-21 08:58:28', '2025-06-21 08:58:28'),
(457, NULL, NULL, 50, NULL, 354.9000, NULL, 0.00, '+', 'Refund for canceled order 461', 'T9904', '2025-06-21 20:18:10', '2025-06-21 20:18:10'),
(458, NULL, NULL, 102, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #462', 'T9905', '2025-06-22 01:22:23', '2025-06-22 01:22:23'),
(459, NULL, NULL, 102, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #463', 'T9906', '2025-06-22 01:23:09', '2025-06-22 01:23:09'),
(460, NULL, 'bank', 101, NULL, 32000.0000, NULL, 0.00, '+', 'QR - topsubre101 GD 500678-062225 14:03:01', '9909', '2025-06-22 07:06:04', '2025-06-22 07:06:04'),
(461, NULL, NULL, 101, NULL, 31400.2000, NULL, 0.00, '-', 'Place order #464', 'T9910', '2025-06-22 07:07:33', '2025-06-22 07:07:33'),
(462, NULL, NULL, 250, NULL, 122.0000, NULL, 0.00, '-', 'Place order #465', 'T9911', '2025-06-22 07:48:25', '2025-06-22 07:48:25'),
(463, NULL, 'bank', 250, NULL, 3000.0000, NULL, 0.00, '+', 'ZP251730431053 250622000653824 topsubre250 GD 431053-062225 14:49:24', '9910', '2025-06-22 07:50:04', '2025-06-22 07:50:04'),
(464, NULL, NULL, 250, NULL, 1774.5000, NULL, 0.00, '-', 'Place order #466', 'T9912', '2025-06-22 07:50:56', '2025-06-22 07:50:56'),
(465, NULL, 'bank', 205, NULL, 7000.0000, NULL, 0.00, '+', 'topsubre205 GD 371900-062225 15:59:15', '9911', '2025-06-22 09:00:07', '2025-06-22 09:00:07'),
(466, NULL, NULL, 205, NULL, 6210.7500, NULL, 0.00, '-', 'Place order #467', 'T9913', '2025-06-22 09:01:33', '2025-06-22 09:01:33'),
(467, NULL, NULL, 205, NULL, 6210.7500, NULL, 0.00, '+', 'Refund for partial order 467', 'T9914', '2025-06-22 09:04:05', '2025-06-22 09:04:05'),
(468, NULL, NULL, 205, NULL, 6210.7500, NULL, 0.00, '-', 'Place order #468', 'T9915', '2025-06-22 09:10:31', '2025-06-22 09:10:31'),
(469, NULL, NULL, 205, NULL, 6210.7500, NULL, 0.00, '+', 'Refund for partial order 468', 'T9916', '2025-06-22 09:14:09', '2025-06-22 09:14:09'),
(470, NULL, NULL, 205, NULL, 6802.2500, NULL, 0.00, '-', 'Place order #469', 'T9917', '2025-06-22 09:16:36', '2025-06-22 09:16:36'),
(471, NULL, 'bank', 291, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre291 GD 349538-062225 22:02:32', '9915', '2025-06-22 15:10:00', '2025-06-22 15:10:00'),
(472, NULL, NULL, 291, NULL, 273.7800, NULL, 0.00, '-', 'Place order #472', 'T9918', '2025-06-22 15:15:11', '2025-06-22 15:15:11'),
(473, NULL, NULL, 291, NULL, 273.7800, NULL, 0.00, '-', 'Place order #473', 'T9919', '2025-06-22 15:15:59', '2025-06-22 15:15:59'),
(474, NULL, NULL, 291, NULL, 4244.5400, NULL, 0.00, '-', 'Place order #474', 'T9920', '2025-06-22 15:17:27', '2025-06-22 15:17:27'),
(475, NULL, NULL, 291, NULL, 565.9472, NULL, 0.00, '-', 'Place order #475', 'T9921', '2025-06-22 15:24:34', '2025-06-22 15:24:34'),
(476, NULL, NULL, 291, NULL, 522.4128, NULL, 0.00, '-', 'Place order #476', 'T9922', '2025-06-22 15:28:18', '2025-06-22 15:28:18'),
(477, NULL, 'bank', 292, NULL, 10647.0000, NULL, 0.00, '+', 'topsubre292 GD 629814-062225 23:35:16', '9916', '2025-06-22 16:37:01', '2025-06-22 16:37:01'),
(478, NULL, NULL, 292, NULL, 10647.0000, NULL, 0.00, '-', 'Place order #477', 'T9923', '2025-06-22 16:37:24', '2025-06-22 16:37:24'),
(479, NULL, 'bank', 293, NULL, 2000.0000, NULL, 0.00, '+', 'topsubre293 GD 744162-062325 00:36:52', '9917', '2025-06-22 17:37:01', '2025-06-22 17:37:01'),
(480, NULL, NULL, 293, NULL, 1983.8910, NULL, 0.00, '-', 'Place order #478', 'T9924', '2025-06-22 17:39:51', '2025-06-22 17:39:51'),
(481, NULL, 'bank', 293, NULL, 2000.0000, NULL, 0.00, '+', 'topsubre293 GD 689783-062325 00:50:19', '9918', '2025-06-22 17:51:01', '2025-06-22 17:51:01'),
(482, NULL, NULL, 293, NULL, 1990.4144, NULL, 0.00, '-', 'Place order #479', 'T9925', '2025-06-22 17:51:47', '2025-06-22 17:51:47'),
(483, NULL, 'bank', 205, NULL, 5000.0000, NULL, 0.00, '+', 'topsubre205 GD 134111-062325 07:21:21', '9919', '2025-06-23 00:22:02', '2025-06-23 00:22:02'),
(484, NULL, NULL, 291, NULL, 1267.5000, NULL, 0.00, '-', 'Place order #480', 'T9926', '2025-06-23 00:23:18', '2025-06-23 00:23:18'),
(485, NULL, NULL, 205, NULL, 5169.7100, NULL, 0.00, '-', 'Place order #481', 'T9927', '2025-06-23 00:24:11', '2025-06-23 00:24:11'),
(486, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #483', 'T9928', '2025-06-23 05:42:16', '2025-06-23 05:42:16'),
(487, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #484', 'T9929', '2025-06-23 05:42:27', '2025-06-23 05:42:27'),
(488, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #485', 'T9930', '2025-06-23 05:42:35', '2025-06-23 05:42:35'),
(489, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #486', 'T9931', '2025-06-23 05:42:45', '2025-06-23 05:42:45'),
(490, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #487', 'T9932', '2025-06-23 05:42:56', '2025-06-23 05:42:56'),
(491, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #488', 'T9933', '2025-06-23 05:43:05', '2025-06-23 05:43:05'),
(492, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 483', 'T9934', '2025-06-23 05:50:01', '2025-06-23 05:50:01'),
(493, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 486', 'T9935', '2025-06-23 05:50:01', '2025-06-23 05:50:01'),
(494, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '+', 'Refund for canceled order 488', 'T9936', '2025-06-23 05:50:02', '2025-06-23 05:50:02'),
(495, NULL, 'bank', 282, NULL, 30000.0000, NULL, 0.00, '+', 'MBVCB.9951626776.119627.topsubre282.CT tu 1045708027 VUONG TIEN DAT toi 15873021 LE VAN KHANH tai ACB GD 119627-062325 12:52:00', '9924', '2025-06-23 05:52:02', '2025-06-23 05:52:02'),
(496, NULL, NULL, 282, NULL, 31400.2000, NULL, 0.00, '-', 'Place order #489', 'T9937', '2025-06-23 05:53:03', '2025-06-23 05:53:03'),
(497, NULL, NULL, 282, NULL, 9734.0620, NULL, 0.00, '-', 'Place order #490', 'T9938', '2025-06-23 05:53:58', '2025-06-23 05:53:58'),
(498, NULL, NULL, 282, NULL, 31400.2000, NULL, 0.00, '+', 'Refund for canceled order 489', 'T9939', '2025-06-23 05:55:01', '2025-06-23 05:55:01'),
(499, NULL, NULL, 282, NULL, 9734.0620, NULL, 0.00, '+', 'Refund for canceled order 490', 'T9940', '2025-06-23 05:56:00', '2025-06-23 05:56:00'),
(500, NULL, NULL, 205, NULL, 6802.0000, NULL, 0.00, '+', 'Hoàn tiền đơn ID:469', 'T9941', '2025-06-23 10:14:14', '2025-06-23 10:14:14'),
(501, NULL, NULL, 205, NULL, 2421.6010, NULL, 0.00, '-', 'Place order #491', 'T9942', '2025-06-23 11:26:53', '2025-06-23 11:26:53'),
(502, NULL, NULL, 102, NULL, 9016.1500, NULL, 0.00, '-', 'Place order #492', 'T9943', '2025-06-23 11:28:00', '2025-06-23 11:28:00'),
(503, NULL, NULL, 35, NULL, 684.4500, NULL, 0.00, '-', 'Place order #495', 'T9944', '2025-06-23 14:08:14', '2025-06-23 14:08:14'),
(504, NULL, NULL, 35, NULL, 684.4500, NULL, 0.00, '-', 'Place order #496', 'T9945', '2025-06-23 14:13:21', '2025-06-23 14:13:21'),
(505, NULL, NULL, 35, NULL, 684.4500, NULL, 0.00, '-', 'Place order #497', 'T9946', '2025-06-23 14:23:11', '2025-06-23 14:23:11'),
(506, NULL, 'bank', 35, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre35 GD 472569-062325 21:25:57', '9931', '2025-06-23 14:26:01', '2025-06-23 14:26:01'),
(507, NULL, NULL, 35, NULL, 684.4500, NULL, 0.00, '-', 'Place order #498', 'T9947', '2025-06-23 14:28:10', '2025-06-23 14:28:10'),
(508, NULL, NULL, 35, NULL, 8213.4000, NULL, 0.00, '-', 'Place order #499', 'T9948', '2025-06-23 14:29:34', '2025-06-23 14:29:34'),
(509, NULL, NULL, 35, NULL, 684.4500, NULL, 0.00, '-', 'Place order #500', 'T9949', '2025-06-23 14:37:44', '2025-06-23 14:37:44'),
(510, NULL, NULL, 35, NULL, 684.4500, NULL, 0.00, '-', 'Place order #501', 'T9950', '2025-06-23 14:42:58', '2025-06-23 14:42:58'),
(511, NULL, NULL, 282, NULL, 6090.7600, NULL, 0.00, '-', 'Place order #502', 'T9951', '2025-06-24 06:06:34', '2025-06-24 06:06:34'),
(512, NULL, NULL, 282, NULL, 6090.7600, NULL, 0.00, '-', 'Place order #503', 'T9952', '2025-06-24 06:06:48', '2025-06-24 06:06:48'),
(513, NULL, NULL, 282, NULL, 6090.7600, NULL, 0.00, '-', 'Place order #504', 'T9953', '2025-06-24 06:07:41', '2025-06-24 06:07:41'),
(514, NULL, NULL, 282, NULL, 6090.7600, NULL, 0.00, '-', 'Place order #505', 'T9954', '2025-06-24 06:07:52', '2025-06-24 06:07:52'),
(515, NULL, NULL, 282, NULL, 6090.7600, NULL, 0.00, '-', 'Place order #506', 'T9955', '2025-06-24 06:08:04', '2025-06-24 06:08:04'),
(516, NULL, NULL, 282, NULL, 6090.7600, NULL, 0.00, '-', 'Place order #507', 'T9956', '2025-06-24 06:08:21', '2025-06-24 06:08:21'),
(517, NULL, NULL, 282, NULL, 4598.5238, NULL, 0.00, '-', 'Place order #508', 'T9957', '2025-06-24 06:09:32', '2025-06-24 06:09:32'),
(518, NULL, NULL, 282, NULL, 6090.7600, NULL, 0.00, '+', 'Refund for canceled order 507', 'T9958', '2025-06-24 06:10:00', '2025-06-24 06:10:00'),
(519, NULL, NULL, 282, NULL, 4598.5238, NULL, 0.00, '+', 'Refund for canceled order 508', 'T9959', '2025-06-24 06:10:00', '2025-06-24 06:10:00'),
(520, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #509', 'T9960', '2025-06-24 06:10:48', '2025-06-24 06:10:48'),
(521, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #510', 'T9961', '2025-06-24 06:10:58', '2025-06-24 06:10:58'),
(522, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #511', 'T9962', '2025-06-24 06:11:08', '2025-06-24 06:11:08'),
(523, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 509', 'T9963', '2025-06-24 06:12:01', '2025-06-24 06:12:01'),
(524, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 510', 'T9964', '2025-06-24 06:12:01', '2025-06-24 06:12:01'),
(525, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 511', 'T9965', '2025-06-24 06:12:01', '2025-06-24 06:12:01'),
(526, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #512', 'T9966', '2025-06-24 06:16:51', '2025-06-24 06:16:51'),
(527, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #513', 'T9967', '2025-06-24 06:17:29', '2025-06-24 06:17:29'),
(528, NULL, NULL, 282, NULL, 3140.0200, NULL, 0.00, '-', 'Place order #514', 'T9968', '2025-06-24 06:18:12', '2025-06-24 06:18:12'),
(529, NULL, NULL, 169, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #515', 'T9969', '2025-06-25 02:07:42', '2025-06-25 02:07:42'),
(530, NULL, NULL, 250, NULL, 410.0000, NULL, 0.00, '-', 'Place order #516', 'T9970', '2025-06-25 04:06:03', '2025-06-25 04:06:03'),
(531, NULL, NULL, 250, NULL, 854.0000, NULL, 0.00, '-', 'Place order #517', 'T9971', '2025-06-25 06:10:14', '2025-06-25 06:10:14'),
(532, NULL, NULL, 169, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #518', 'T9972', '2025-06-25 09:52:16', '2025-06-25 09:52:16'),
(533, NULL, NULL, 250, NULL, 410.0000, NULL, 0.00, '+', 'Refund for canceled order 516', 'T9973', '2025-06-25 10:06:00', '2025-06-25 10:06:00'),
(534, NULL, 'bank', 101, NULL, 35000.0000, NULL, 0.00, '+', 'topsubre101 GD 806002-062725 09:11:09', '9977', '2025-06-27 02:12:03', '2025-06-27 02:12:03'),
(535, NULL, NULL, 101, NULL, 13013.0000, NULL, 0.00, '-', 'Place order #520', 'T9978', '2025-06-27 02:29:50', '2025-06-27 02:29:50'),
(536, NULL, 'bank', 101, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre101 GD 898775-062725 09:33:12', '9979', '2025-06-27 02:34:04', '2025-06-27 02:34:04'),
(537, NULL, NULL, 101, NULL, 31434.0000, NULL, 0.00, '-', 'Place order #521', 'T9980', '2025-06-27 02:35:16', '2025-06-27 02:35:16'),
(538, NULL, NULL, 101, NULL, 13013.0000, NULL, 0.00, '+', 'Refund for canceled order 520', 'T9981', '2025-06-27 04:38:00', '2025-06-27 04:38:00'),
(539, NULL, 'bank', 296, NULL, 35000.0000, NULL, 0.00, '+', 'topsubre296 GD 232316-062725 17:54:18', '9993', '2025-06-27 10:56:07', '2025-06-27 10:56:07'),
(540, NULL, NULL, 296, NULL, 31400.2000, NULL, 0.00, '-', 'Place order #522', 'T9994', '2025-06-27 10:58:06', '2025-06-27 10:58:06'),
(541, NULL, NULL, 20, NULL, 410.0000, NULL, 0.00, '-', 'Place order #529', 'T9995', '2025-06-30 10:09:59', '2025-06-30 10:09:59'),
(542, NULL, NULL, 20, NULL, 1220.0000, NULL, 0.00, '-', 'Place order #530', 'T9996', '2025-06-30 12:01:09', '2025-06-30 12:01:09'),
(543, NULL, 'bank', 20, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre20 GD 775612-063025 20:10:09', '10057', '2025-06-30 13:11:01', '2025-06-30 13:11:01'),
(544, NULL, NULL, 20, NULL, 3619.9800, NULL, 0.00, '-', 'Place order #531', 'T10058', '2025-06-30 13:13:46', '2025-06-30 13:13:46'),
(545, NULL, NULL, 20, NULL, 3619.9800, NULL, 0.00, '+', 'Refund for canceled order 531', 'T10059', '2025-06-30 13:15:00', '2025-06-30 13:15:00'),
(546, NULL, NULL, 205, NULL, 24.3000, NULL, 0.00, '-', 'Place order #532', 'T10060', '2025-06-30 13:26:42', '2025-06-30 13:26:42'),
(547, NULL, NULL, 20, NULL, 3619.9800, NULL, 0.00, '-', 'Place order #533', 'T10061', '2025-07-01 04:28:43', '2025-07-01 04:28:43'),
(548, NULL, NULL, 20, NULL, 3619.9800, NULL, 0.00, '+', 'Refund for canceled order 533', 'T10062', '2025-07-01 04:30:00', '2025-07-01 04:30:00'),
(549, NULL, NULL, 234, NULL, 410.0000, NULL, 0.00, '-', 'Place order #534', 'T10063', '2025-07-01 11:09:50', '2025-07-01 11:09:50'),
(550, NULL, NULL, 205, NULL, 279.4500, NULL, 0.00, '-', 'Place order #535', 'T10064', '2025-07-01 14:08:54', '2025-07-01 14:08:54'),
(551, NULL, NULL, 205, NULL, 760.5000, NULL, 0.00, '-', 'Place order #536', 'T10065', '2025-07-01 14:11:03', '2025-07-01 14:11:03'),
(552, NULL, NULL, 205, NULL, 760.5000, NULL, 0.00, '-', 'Place order #537', 'T10066', '2025-07-01 14:11:05', '2025-07-01 14:11:05'),
(553, NULL, NULL, 20, NULL, 410.0000, NULL, 0.00, '+', 'Refund for canceled order 529', 'T10067', '2025-07-01 23:25:01', '2025-07-01 23:25:01'),
(554, NULL, NULL, 20, NULL, 2430.0000, NULL, 0.00, '-', 'Place order #539', 'T10068', '2025-07-02 01:44:58', '2025-07-02 01:44:58'),
(555, NULL, NULL, 20, NULL, 2430.0000, NULL, 0.00, '-', 'Place order #540', 'T10069', '2025-07-02 11:24:27', '2025-07-02 11:24:27'),
(556, NULL, 'bank', 276, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre276 GD 367657-070225 20:48:47', '10124', '2025-07-02 13:50:00', '2025-07-02 13:50:00'),
(557, NULL, NULL, 276, NULL, 122.0000, NULL, 0.00, '-', 'Place order #541', 'T10125', '2025-07-02 13:51:32', '2025-07-02 13:51:32'),
(558, NULL, NULL, 276, NULL, 1267.5000, NULL, 0.00, '-', 'Place order #542', 'T10126', '2025-07-02 13:57:08', '2025-07-02 13:57:08'),
(559, NULL, NULL, 276, NULL, 410.0000, NULL, 0.00, '-', 'Place order #543', 'T10127', '2025-07-02 13:57:40', '2025-07-02 13:57:40'),
(560, NULL, NULL, 276, NULL, 410.0000, NULL, 0.00, '-', 'Place order #544', 'T10128', '2025-07-02 14:06:13', '2025-07-02 14:06:13'),
(561, NULL, 'bank', 205, NULL, 8000.0000, NULL, 0.00, '+', 'topsubre205 GD 045971-070325 16:18:41', '10142', '2025-07-03 09:19:00', '2025-07-03 09:19:00'),
(562, NULL, NULL, 205, NULL, 8162.7000, NULL, 0.00, '-', 'Place order #545', 'T10143', '2025-07-03 09:20:34', '2025-07-03 09:20:34'),
(563, NULL, 'bank', 303, NULL, 25000.0000, NULL, 0.00, '+', 'MBVCB.10066182809.5184BFTVG22Z8T1T.topsubre303.CT tu 0081001151835 HOANG THI DUYEN toi 15873021 LE VAN KHANH tai ACB GD 851172-070325 19:04:27', '10143', '2025-07-03 12:05:01', '2025-07-03 12:05:01'),
(564, NULL, NULL, 303, NULL, 2430.0000, NULL, 0.00, '-', 'Place order #546', 'T10144', '2025-07-03 12:13:55', '2025-07-03 12:13:55'),
(565, NULL, NULL, 303, NULL, 1267.5000, NULL, 0.00, '-', 'Place order #547', 'T10145', '2025-07-03 12:14:44', '2025-07-03 12:14:44'),
(566, NULL, NULL, 303, NULL, 24.3000, NULL, 0.00, '-', 'Place order #548', 'T10146', '2025-07-03 12:15:36', '2025-07-03 12:15:36'),
(567, NULL, NULL, 303, NULL, 128.2710, NULL, 0.00, '-', 'Place order #549', 'T10147', '2025-07-03 12:16:12', '2025-07-03 12:16:12'),
(568, NULL, NULL, 303, NULL, 537.1872, NULL, 0.00, '-', 'Place order #550', 'T10148', '2025-07-03 12:17:01', '2025-07-03 12:17:01'),
(569, NULL, NULL, 303, NULL, 10784.4400, NULL, 0.00, '-', 'Place order #551', 'T10149', '2025-07-03 12:19:35', '2025-07-03 12:19:35'),
(570, NULL, NULL, 303, NULL, 676.0000, NULL, 0.00, '-', 'Place order #552', 'T10150', '2025-07-03 12:20:43', '2025-07-03 12:20:43'),
(571, NULL, NULL, 303, NULL, 243.0000, NULL, 0.00, '-', 'Place order #553', 'T10151', '2025-07-03 12:27:35', '2025-07-03 12:27:35'),
(572, NULL, NULL, 303, NULL, 8532.8100, NULL, 0.00, '-', 'Place order #554', 'T10152', '2025-07-03 12:29:41', '2025-07-03 12:29:41'),
(573, NULL, NULL, 303, NULL, 373.9125, NULL, 0.00, '-', 'Place order #555', 'T10153', '2025-07-03 12:32:30', '2025-07-03 12:32:30'),
(574, NULL, 'bank', 205, NULL, 6000.0000, NULL, 0.00, '+', 'topsubre205 GD 389646-070325 20:12:10', '10145', '2025-07-03 13:13:01', '2025-07-03 13:13:01'),
(575, NULL, NULL, 205, NULL, 8162.7000, NULL, 0.00, '-', 'Place order #556', 'T10154', '2025-07-03 13:13:57', '2025-07-03 13:13:57'),
(576, NULL, 'bank', 282, NULL, 34000.0000, NULL, 0.00, '+', 'MBVCB.10074181295.5185BFTVG22RVR5D.topsubre282.CT tu 1045708027 VUONG TIEN DAT toi 15873021 LE VAN KHANH tai ACB GD 023056-070425 14:44:24', '10159', '2025-07-04 07:46:01', '2025-07-04 07:46:01'),
(577, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #557', 'T10160', '2025-07-04 07:47:28', '2025-07-04 07:47:28'),
(578, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #558', 'T10161', '2025-07-04 07:47:36', '2025-07-04 07:47:36'),
(579, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #559', 'T10162', '2025-07-04 07:47:49', '2025-07-04 07:47:49'),
(580, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #560', 'T10163', '2025-07-04 07:47:57', '2025-07-04 07:47:57'),
(581, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #561', 'T10164', '2025-07-04 07:48:08', '2025-07-04 07:48:08'),
(582, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #562', 'T10165', '2025-07-04 07:48:16', '2025-07-04 07:48:16'),
(583, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #563', 'T10166', '2025-07-04 07:48:25', '2025-07-04 07:48:25'),
(584, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #564', 'T10167', '2025-07-04 07:48:33', '2025-07-04 07:48:33'),
(585, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #565', 'T10168', '2025-07-04 07:48:42', '2025-07-04 07:48:42'),
(586, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #566', 'T10169', '2025-07-04 07:48:51', '2025-07-04 07:48:51'),
(587, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #567', 'T10170', '2025-07-04 07:49:00', '2025-07-04 07:49:00'),
(588, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 562', 'T10171', '2025-07-04 07:50:00', '2025-07-04 07:50:00'),
(589, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 563', 'T10172', '2025-07-04 07:50:00', '2025-07-04 07:50:00'),
(590, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 564', 'T10173', '2025-07-04 07:50:00', '2025-07-04 07:50:00'),
(591, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 565', 'T10174', '2025-07-04 07:50:00', '2025-07-04 07:50:00'),
(592, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 566', 'T10175', '2025-07-04 07:50:00', '2025-07-04 07:50:00'),
(593, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 567', 'T10176', '2025-07-04 07:50:00', '2025-07-04 07:50:00'),
(594, NULL, NULL, 50, NULL, 431.0000, NULL, 0.00, '+', 'Refund for canceled order 568', 'T10177', '2025-07-04 08:10:01', '2025-07-04 08:10:01'),
(595, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #569', 'T10178', '2025-07-04 10:31:24', '2025-07-04 10:31:24'),
(596, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #570', 'T10179', '2025-07-04 10:31:34', '2025-07-04 10:31:34'),
(597, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #571', 'T10180', '2025-07-04 10:31:43', '2025-07-04 10:31:43'),
(598, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #572', 'T10181', '2025-07-04 10:31:55', '2025-07-04 10:31:55'),
(599, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 569', 'T10182', '2025-07-04 10:32:00', '2025-07-04 10:32:00'),
(600, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 570', 'T10183', '2025-07-04 10:32:00', '2025-07-04 10:32:00'),
(601, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #573', 'T10184', '2025-07-04 10:32:04', '2025-07-04 10:32:04'),
(602, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #574', 'T10185', '2025-07-04 10:32:18', '2025-07-04 10:32:18'),
(603, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #575', 'T10186', '2025-07-04 10:32:27', '2025-07-04 10:32:27'),
(604, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #576', 'T10187', '2025-07-04 10:32:37', '2025-07-04 10:32:37'),
(605, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 571', 'T10188', '2025-07-04 10:33:07', '2025-07-04 10:33:07'),
(606, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 572', 'T10189', '2025-07-04 10:34:00', '2025-07-04 10:34:00'),
(607, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 573', 'T10190', '2025-07-04 10:34:00', '2025-07-04 10:34:00'),
(608, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 574', 'T10191', '2025-07-04 10:34:00', '2025-07-04 10:34:00'),
(609, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 575', 'T10192', '2025-07-04 10:34:00', '2025-07-04 10:34:00'),
(610, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 576', 'T10193', '2025-07-04 10:34:00', '2025-07-04 10:34:00'),
(611, NULL, NULL, 282, NULL, 18272.2800, NULL, 0.00, '-', 'Place order #577', 'T10194', '2025-07-04 11:31:55', '2025-07-04 11:31:55'),
(612, NULL, NULL, 282, NULL, 18272.2800, NULL, 0.00, '+', 'Refund for canceled order 577', 'T10195', '2025-07-04 11:34:00', '2025-07-04 11:34:00'),
(613, NULL, NULL, 276, NULL, 410.0000, NULL, 0.00, '-', 'Place order #578', 'T10196', '2025-07-04 12:11:54', '2025-07-04 12:11:54'),
(614, NULL, NULL, 276, NULL, 1267.5000, NULL, 0.00, '-', 'Place order #579', 'T10197', '2025-07-04 12:13:15', '2025-07-04 12:13:15'),
(615, NULL, NULL, 276, NULL, 2430.0000, NULL, 0.00, '-', 'Place order #580', 'T10198', '2025-07-04 12:38:06', '2025-07-04 12:38:06'),
(616, NULL, NULL, 276, NULL, 5070.0000, NULL, 0.00, '-', 'Place order #581', 'T10199', '2025-07-04 12:42:09', '2025-07-04 12:42:09'),
(617, NULL, NULL, 276, NULL, 410.0000, NULL, 0.00, '+', 'Refund for canceled order 578', 'T10200', '2025-07-04 13:24:00', '2025-07-04 13:24:00'),
(618, NULL, 'bank', 304, NULL, 19000.0000, NULL, 0.00, '+', 'topsubre304 GD 849376-070425 20:55:57', '10170', '2025-07-04 13:56:01', '2025-07-04 13:56:01'),
(619, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #585', 'T10201', '2025-07-04 15:52:37', '2025-07-04 15:52:37'),
(620, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #586', 'T10202', '2025-07-04 15:52:46', '2025-07-04 15:52:46'),
(621, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #587', 'T10203', '2025-07-04 15:52:55', '2025-07-04 15:52:55'),
(622, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #588', 'T10204', '2025-07-04 15:53:03', '2025-07-04 15:53:03'),
(623, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #589', 'T10205', '2025-07-04 15:53:12', '2025-07-04 15:53:12'),
(624, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #590', 'T10206', '2025-07-04 15:53:20', '2025-07-04 15:53:20'),
(625, NULL, NULL, 282, NULL, 3045.3800, NULL, 0.00, '+', 'Refund for canceled order 590', 'T10207', '2025-07-04 15:54:00', '2025-07-04 15:54:00'),
(626, NULL, NULL, 276, NULL, 2430.0000, NULL, 0.00, '-', 'Place order #591', 'T10208', '2025-07-04 17:44:04', '2025-07-04 17:44:04'),
(627, NULL, NULL, 276, NULL, 1267.5000, NULL, 0.00, '-', 'Place order #592', 'T10209', '2025-07-04 17:56:20', '2025-07-04 17:56:20'),
(628, NULL, NULL, 51, NULL, 19420.0000, NULL, 0.00, '+', 'Hoàn tiền ID: 393 \r\nSố lượng : 451', 'T10210', '2025-07-05 00:15:57', '2025-07-05 00:15:57'),
(629, NULL, 'bank', 307, NULL, 50000.0000, NULL, 0.00, '+', 'topsubre307 GD 378348-070525 10:31:59', '10180', '2025-07-05 03:32:01', '2025-07-05 03:32:01'),
(630, NULL, NULL, 307, NULL, 49850.7750, NULL, 0.00, '-', 'Place order #593', 'T10211', '2025-07-05 03:44:30', '2025-07-05 03:44:30'),
(631, NULL, 'bank', 250, NULL, 6000.0000, NULL, 0.00, '+', '93065063424-0377830495-topsubre250 GD 201660-070525 13:33:34', '10183', '2025-07-05 06:34:00', '2025-07-05 06:34:00'),
(632, NULL, NULL, 101, NULL, 13704.2100, NULL, 0.00, '-', 'Place order #594', 'T10212', '2025-07-05 07:38:08', '2025-07-05 07:38:08'),
(633, NULL, NULL, 20, NULL, 5070.0000, NULL, 0.00, '-', 'Place order #595', 'T10213', '2025-07-05 08:24:48', '2025-07-05 08:24:48'),
(634, NULL, 'bank', 309, NULL, 25000.0000, NULL, 0.00, '+', 'topsubre309 FT25188859591070 GD 576452-070625 12:13:41', '10198', '2025-07-06 05:14:01', '2025-07-06 05:14:01'),
(635, NULL, NULL, 309, NULL, 12979.2000, NULL, 0.00, '-', 'Place order #614', 'T10214', '2025-07-06 05:16:51', '2025-07-06 05:16:51'),
(636, NULL, NULL, 309, NULL, 2430.0000, NULL, 0.00, '-', 'Place order #615', 'T10215', '2025-07-06 05:27:06', '2025-07-06 05:27:06'),
(637, NULL, NULL, 309, NULL, 9474.8160, NULL, 0.00, '-', 'Place order #616', 'T10216', '2025-07-06 05:33:19', '2025-07-06 05:33:19'),
(638, NULL, NULL, 51, NULL, 11830.0000, NULL, 0.00, '-', 'Place order #617', 'T10217', '2025-07-06 12:25:10', '2025-07-06 12:25:10'),
(639, NULL, NULL, 250, NULL, 6100.0000, NULL, 0.00, '-', 'Place order #618', 'T10218', '2025-07-06 13:40:01', '2025-07-06 13:40:01'),
(640, NULL, 'bank', 234, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre234 GD 142073-070725 17:42:54', '10222', '2025-07-07 10:43:01', '2025-07-07 10:43:01'),
(641, NULL, NULL, 234, NULL, 366.0000, NULL, 0.00, '-', 'Place order #619', 'T10223', '2025-07-07 10:59:21', '2025-07-07 10:59:21'),
(642, NULL, NULL, 234, NULL, 305.0000, NULL, 0.00, '-', 'Place order #620', 'T10224', '2025-07-07 11:06:25', '2025-07-07 11:06:25'),
(643, NULL, NULL, 234, NULL, 12.2000, NULL, 0.00, '-', 'Place order #621', 'T10225', '2025-07-07 13:05:47', '2025-07-07 13:05:47'),
(644, NULL, NULL, 234, NULL, 183.0000, NULL, 0.00, '-', 'Place order #622', 'T10226', '2025-07-07 13:32:22', '2025-07-07 13:32:22'),
(645, NULL, NULL, 234, NULL, 244.0000, NULL, 0.00, '-', 'Place order #623', 'T10227', '2025-07-07 15:10:47', '2025-07-07 15:10:47'),
(646, NULL, NULL, 234, NULL, 845.0000, NULL, 0.00, '-', 'Place order #624', 'T10228', '2025-07-07 15:12:53', '2025-07-07 15:12:53'),
(647, NULL, NULL, 234, NULL, 183.0000, NULL, 0.00, '-', 'Place order #625', 'T10229', '2025-07-07 15:14:51', '2025-07-07 15:14:51'),
(648, NULL, NULL, 234, NULL, 183.0000, NULL, 0.00, '-', 'Place order #626', 'T10230', '2025-07-07 15:18:18', '2025-07-07 15:18:18'),
(649, NULL, NULL, 234, NULL, 122.0000, NULL, 0.00, '-', 'Place order #627', 'T10231', '2025-07-07 15:35:23', '2025-07-07 15:35:23'),
(650, NULL, NULL, 234, NULL, 729.0000, NULL, 0.00, '-', 'Place order #628', 'T10232', '2025-07-07 16:44:31', '2025-07-07 16:44:31'),
(651, NULL, NULL, 250, NULL, 205.0000, NULL, 0.00, '-', 'Place order #629', 'T10233', '2025-07-08 05:01:55', '2025-07-08 05:01:55'),
(652, NULL, NULL, 276, NULL, 5070.0000, NULL, 0.00, '-', 'Place order #630', 'T10234', '2025-07-08 06:56:32', '2025-07-08 06:56:32'),
(653, NULL, 'bank', 35, NULL, 4000.0000, NULL, 0.00, '+', 'topsubre35 GD 809487-070825 18:57:33', '10241', '2025-07-08 11:58:00', '2025-07-08 11:58:00'),
(654, NULL, NULL, 35, NULL, 1368.9000, NULL, 0.00, '-', 'Place order #631', 'T10242', '2025-07-08 11:59:10', '2025-07-08 11:59:10'),
(655, NULL, NULL, 35, NULL, 1368.9000, NULL, 0.00, '-', 'Place order #632', 'T10243', '2025-07-08 12:00:25', '2025-07-08 12:00:25'),
(656, NULL, NULL, 250, NULL, 205.0000, NULL, 0.00, '+', 'Refund for canceled order 629', 'T10244', '2025-07-08 20:15:00', '2025-07-08 20:15:00'),
(657, NULL, NULL, 234, NULL, 134.8407, NULL, 0.00, '-', 'Place order #633', 'T10245', '2025-07-09 10:52:08', '2025-07-09 10:52:08'),
(658, NULL, NULL, 234, NULL, 155.5476, NULL, 0.00, '-', 'Place order #634', 'T10246', '2025-07-09 11:00:47', '2025-07-09 11:00:47'),
(659, NULL, NULL, 234, NULL, 146.9286, NULL, 0.00, '-', 'Place order #635', 'T10247', '2025-07-09 11:01:13', '2025-07-09 11:01:13'),
(660, NULL, NULL, 234, NULL, 146.9286, NULL, 0.00, '+', 'Refund for canceled order 635', 'T10248', '2025-07-09 16:18:01', '2025-07-09 16:18:01'),
(661, NULL, NULL, 234, NULL, 410.0000, NULL, 0.00, '+', 'Refund for canceled order 534', 'T10249', '2025-07-09 17:05:12', '2025-07-09 17:05:12'),
(662, NULL, 'bank', 309, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre309 FT25191207926184 GD 867989-071025 06:27:40', '10259', '2025-07-09 23:28:00', '2025-07-09 23:28:00'),
(663, NULL, NULL, 309, NULL, 10048.0640, NULL, 0.00, '-', 'Place order #636', 'T10260', '2025-07-09 23:33:31', '2025-07-09 23:33:31'),
(664, NULL, NULL, 234, NULL, 486.0000, NULL, 0.00, '-', 'Place order #639', 'T10261', '2025-07-10 09:12:43', '2025-07-10 09:12:43'),
(665, NULL, NULL, 234, NULL, 607.5000, NULL, 0.00, '-', 'Place order #640', 'T10262', '2025-07-10 09:13:48', '2025-07-10 09:13:48'),
(666, NULL, 'bank', 303, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre303 GD 578906-071025 17:10:25', '10266', '2025-07-10 10:11:00', '2025-07-10 10:11:00'),
(667, NULL, NULL, 303, NULL, 24.3000, NULL, 0.00, '-', 'Place order #641', 'T10267', '2025-07-10 10:13:23', '2025-07-10 10:13:23'),
(668, NULL, NULL, 303, NULL, 1007.2260, NULL, 0.00, '-', 'Place order #642', 'T10268', '2025-07-10 10:13:53', '2025-07-10 10:13:53'),
(669, NULL, NULL, 303, NULL, 243.0000, NULL, 0.00, '-', 'Place order #643', 'T10269', '2025-07-10 10:15:36', '2025-07-10 10:15:36'),
(670, NULL, NULL, 303, NULL, 5400.3592, NULL, 0.00, '-', 'Place order #644', 'T10270', '2025-07-10 10:16:11', '2025-07-10 10:16:11'),
(671, NULL, NULL, 303, NULL, 138.1941, NULL, 0.00, '-', 'Place order #645', 'T10271', '2025-07-10 10:18:15', '2025-07-10 10:18:15'),
(672, NULL, NULL, 303, NULL, 2506.8736, NULL, 0.00, '-', 'Place order #646', 'T10272', '2025-07-10 10:18:51', '2025-07-10 10:18:51'),
(673, NULL, NULL, 303, NULL, 44.9878, NULL, 0.00, '-', 'Place order #647', 'T10273', '2025-07-10 10:19:18', '2025-07-10 10:19:18'),
(674, NULL, NULL, 303, NULL, 30.4200, NULL, 0.00, '-', 'Place order #648', 'T10274', '2025-07-10 10:19:50', '2025-07-10 10:19:50'),
(675, NULL, NULL, 303, NULL, 697.9364, NULL, 0.00, '-', 'Place order #649', 'T10275', '2025-07-10 10:22:46', '2025-07-10 10:22:46'),
(676, NULL, NULL, 303, NULL, 826.4100, NULL, 0.00, '-', 'Place order #650', 'T10276', '2025-07-10 10:24:30', '2025-07-10 10:24:30'),
(677, NULL, NULL, 234, NULL, 244.0000, NULL, 0.00, '-', 'Place order #651', 'T10277', '2025-07-10 11:21:53', '2025-07-10 11:21:53'),
(678, NULL, NULL, 234, NULL, 244.0000, NULL, 0.00, '-', 'Place order #652', 'T10278', '2025-07-10 11:22:33', '2025-07-10 11:22:33'),
(679, NULL, NULL, 234, NULL, 305.0000, NULL, 0.00, '-', 'Place order #653', 'T10279', '2025-07-10 11:23:18', '2025-07-10 11:23:18'),
(680, NULL, NULL, 234, NULL, 122.0000, NULL, 0.00, '-', 'Place order #654', 'T10280', '2025-07-10 11:25:05', '2025-07-10 11:25:05'),
(681, NULL, NULL, 303, NULL, 24.3000, NULL, 0.00, '-', 'Place order #655', 'T10281', '2025-07-10 11:55:22', '2025-07-10 11:55:22'),
(682, NULL, NULL, 303, NULL, 2998.1952, NULL, 0.00, '-', 'Place order #656', 'T10282', '2025-07-10 11:55:53', '2025-07-10 11:55:53'),
(683, NULL, NULL, 303, NULL, 13.7904, NULL, 0.00, '-', 'Place order #657', 'T10283', '2025-07-10 11:56:19', '2025-07-10 11:56:19'),
(684, NULL, NULL, 303, NULL, 8.5514, NULL, 0.00, '-', 'Place order #658', 'T10284', '2025-07-10 11:56:52', '2025-07-10 11:56:52'),
(685, NULL, NULL, 234, NULL, 280.6000, NULL, 0.00, '-', 'Place order #659', 'T10285', '2025-07-10 12:06:47', '2025-07-10 12:06:47'),
(686, NULL, NULL, 234, NULL, 262.3610, NULL, 0.00, '-', 'Place order #660', 'T10286', '2025-07-10 14:40:57', '2025-07-10 14:40:57'),
(687, NULL, 'bank', 293, NULL, 2000.0000, NULL, 0.00, '+', 'QR - topsubre293 GD 546961-071125 12:05:54', '10277', '2025-07-11 05:06:01', '2025-07-11 05:06:01'),
(688, NULL, NULL, 293, NULL, 1994.2000, NULL, 0.00, '-', 'Place order #661', 'T10287', '2025-07-11 05:09:01', '2025-07-11 05:09:01'),
(689, NULL, NULL, 303, NULL, 48.2112, NULL, 0.00, '-', 'Place order #662', 'T10288', '2025-07-11 05:59:45', '2025-07-11 05:59:45'),
(690, NULL, NULL, 303, NULL, 136.3316, NULL, 0.00, '-', 'Place order #663', 'T10289', '2025-07-11 06:00:15', '2025-07-11 06:00:15'),
(691, NULL, NULL, 303, NULL, 21.9024, NULL, 0.00, '-', 'Place order #664', 'T10290', '2025-07-11 06:00:46', '2025-07-11 06:00:46'),
(692, NULL, NULL, 303, NULL, 110.1276, NULL, 0.00, '-', 'Place order #665', 'T10291', '2025-07-11 06:46:25', '2025-07-11 06:46:25'),
(693, NULL, NULL, 234, NULL, 207.8026, NULL, 0.00, '-', 'Place order #666', 'T10292', '2025-07-11 07:02:19', '2025-07-11 07:02:19'),
(694, NULL, NULL, 234, NULL, 161.1376, NULL, 0.00, '-', 'Place order #667', 'T10293', '2025-07-11 07:02:48', '2025-07-11 07:02:48'),
(695, NULL, NULL, 303, NULL, 169.0000, NULL, 0.00, '-', 'Place order #668', 'T10294', '2025-07-11 10:44:31', '2025-07-11 10:44:31'),
(696, NULL, NULL, 303, NULL, 24.3000, NULL, 0.00, '-', 'Place order #669', 'T10295', '2025-07-11 10:45:20', '2025-07-11 10:45:20'),
(697, NULL, NULL, 234, NULL, 207.4000, NULL, 0.00, '-', 'Place order #670', 'T10296', '2025-07-11 12:02:48', '2025-07-11 12:02:48'),
(698, NULL, 'bank', 321, NULL, 10000.0000, NULL, 0.00, '+', 'QR - topsubre321 GD 120808-071225 19:40:42', '10290', '2025-07-12 12:41:00', '2025-07-12 12:41:00'),
(699, NULL, NULL, 321, NULL, 5633.2770, NULL, 0.00, '-', 'Place order #675', 'T10297', '2025-07-12 14:32:30', '2025-07-12 14:32:30'),
(700, NULL, NULL, 321, NULL, 3893.7600, NULL, 0.00, '-', 'Place order #676', 'T10298', '2025-07-12 14:33:53', '2025-07-12 14:33:53'),
(701, NULL, NULL, 234, NULL, 97.2000, NULL, 0.00, '-', 'Place order #677', 'T10299', '2025-07-13 10:44:37', '2025-07-13 10:44:37'),
(702, NULL, NULL, 234, NULL, 129.6000, NULL, 0.00, '-', 'Place order #678', 'T10300', '2025-07-13 10:47:00', '2025-07-13 10:47:00'),
(703, NULL, NULL, 234, NULL, 502.2000, NULL, 0.00, '-', 'Place order #679', 'T10301', '2025-07-13 11:09:14', '2025-07-13 11:09:14'),
(704, NULL, NULL, 303, NULL, 283.9000, NULL, 0.00, '-', 'Place order #680', 'T10302', '2025-07-13 13:16:02', '2025-07-13 13:16:02'),
(705, NULL, NULL, 303, NULL, 921.7644, NULL, 0.00, '-', 'Place order #681', 'T10303', '2025-07-13 13:16:36', '2025-07-13 13:16:36'),
(706, NULL, NULL, 303, NULL, 298.1160, NULL, 0.00, '-', 'Place order #682', 'T10304', '2025-07-13 13:18:36', '2025-07-13 13:18:36'),
(707, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '-', 'Place order #683', 'T10305', '2025-07-13 14:17:00', '2025-07-13 14:17:00'),
(708, NULL, NULL, 321, NULL, 32.4000, NULL, 0.00, '-', 'Place order #684', 'T10306', '2025-07-13 14:18:20', '2025-07-13 14:18:20'),
(709, NULL, NULL, 321, NULL, 81.0000, NULL, 0.00, '-', 'Place order #685', 'T10307', '2025-07-13 14:19:03', '2025-07-13 14:19:03'),
(710, NULL, NULL, 234, NULL, 275.4000, NULL, 0.00, '-', 'Place order #686', 'T10308', '2025-07-13 15:20:57', '2025-07-13 15:20:57'),
(711, NULL, NULL, 234, NULL, 122.0000, NULL, 0.00, '+', 'Refund for canceled order 627', 'T10309', '2025-07-14 19:29:02', '2025-07-14 19:29:02'),
(712, NULL, 'bank', 328, NULL, 25000.0000, NULL, 0.00, '+', 'topsubre328 GD 973042-071525 07:34:42', '10307', '2025-07-15 00:35:02', '2025-07-15 00:35:02'),
(713, NULL, NULL, 328, NULL, 20212.4000, NULL, 0.00, '-', 'Place order #687', 'T10310', '2025-07-15 00:36:07', '2025-07-15 00:36:07'),
(714, NULL, NULL, 321, NULL, 341.8200, NULL, 0.00, '-', 'Place order #688', 'T10311', '2025-07-15 01:50:39', '2025-07-15 01:50:39'),
(715, NULL, NULL, 234, NULL, 486.0000, NULL, 0.00, '-', 'Place order #689', 'T10312', '2025-07-15 05:04:01', '2025-07-15 05:04:01'),
(716, NULL, NULL, 234, NULL, 16.2000, NULL, 0.00, '-', 'Place order #690', 'T10313', '2025-07-15 05:05:08', '2025-07-15 05:05:08'),
(717, NULL, NULL, 234, NULL, 16.2000, NULL, 0.00, '-', 'Place order #691', 'T10314', '2025-07-15 05:07:52', '2025-07-15 05:07:52'),
(718, NULL, NULL, 234, NULL, 243.0000, NULL, 0.00, '-', 'Place order #692', 'T10315', '2025-07-15 05:08:54', '2025-07-15 05:08:54'),
(719, NULL, NULL, 234, NULL, 307.8000, NULL, 0.00, '-', 'Place order #693', 'T10316', '2025-07-15 05:10:03', '2025-07-15 05:10:03'),
(720, NULL, NULL, 234, NULL, 367.2000, NULL, 0.00, '-', 'Place order #694', 'T10317', '2025-07-15 05:17:29', '2025-07-15 05:17:29'),
(721, NULL, 'bank', 101, NULL, 15000.0000, NULL, 0.00, '+', 'QR - topsubre101 GD 528626-071525 14:35:36', '10312', '2025-07-15 07:37:01', '2025-07-15 07:37:01'),
(722, NULL, NULL, 234, NULL, 194.4000, NULL, 0.00, '-', 'Place order #695', 'T10318', '2025-07-15 07:38:21', '2025-07-15 07:38:21'),
(723, NULL, NULL, 234, NULL, 411.0756, NULL, 0.00, '-', 'Place order #696', 'T10319', '2025-07-15 07:42:22', '2025-07-15 07:42:22'),
(724, NULL, NULL, 234, NULL, 354.3930, NULL, 0.00, '-', 'Place order #697', 'T10320', '2025-07-15 07:43:08', '2025-07-15 07:43:08'),
(725, NULL, NULL, 234, NULL, 152.5056, NULL, 0.00, '-', 'Place order #698', 'T10321', '2025-07-15 07:46:45', '2025-07-15 07:46:45'),
(726, NULL, NULL, 234, NULL, 135.8760, NULL, 0.00, '-', 'Place order #699', 'T10322', '2025-07-15 07:47:18', '2025-07-15 07:47:18'),
(727, NULL, NULL, 234, NULL, 110.2896, NULL, 0.00, '-', 'Place order #700', 'T10323', '2025-07-15 07:50:58', '2025-07-15 07:50:58'),
(728, NULL, NULL, 234, NULL, 64.8000, NULL, 0.00, '-', 'Place order #701', 'T10324', '2025-07-15 11:16:00', '2025-07-15 11:16:00'),
(729, NULL, NULL, 234, NULL, 97.2000, NULL, 0.00, '-', 'Place order #702', 'T10325', '2025-07-15 11:55:07', '2025-07-15 11:55:07'),
(730, NULL, 'bank', 20, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre20 GD 818401-071525 19:29:56', '10315', '2025-07-15 12:30:02', '2025-07-15 12:30:02'),
(731, NULL, NULL, 20, NULL, 3240.0000, NULL, 0.00, '-', 'Place order #703', 'T10326', '2025-07-15 12:31:10', '2025-07-15 12:31:10'),
(732, NULL, 'bank', 20, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre20 GD 819199-071525 19:33:54', '10316', '2025-07-15 12:34:01', '2025-07-15 12:34:01'),
(733, NULL, 'bank', 331, NULL, 10000.0000, NULL, 0.00, '+', 'topsubre331 GD 214799-071525 20:14:01', '10318', '2025-07-15 13:15:01', '2025-07-15 13:15:01'),
(734, NULL, NULL, 331, NULL, 48.6000, NULL, 0.00, '-', 'Place order #704', 'T10327', '2025-07-15 14:03:26', '2025-07-15 14:03:26'),
(735, NULL, NULL, 331, NULL, 228.3876, NULL, 0.00, '-', 'Place order #705', 'T10328', '2025-07-15 14:11:47', '2025-07-15 14:11:47'),
(736, NULL, NULL, 331, NULL, 618.2358, NULL, 0.00, '-', 'Place order #706', 'T10329', '2025-07-15 14:24:47', '2025-07-15 14:24:47'),
(737, NULL, NULL, 331, NULL, 226.8000, NULL, 0.00, '-', 'Place order #707', 'T10330', '2025-07-15 14:25:31', '2025-07-15 14:25:31'),
(738, NULL, NULL, 331, NULL, 237.8160, NULL, 0.00, '-', 'Place order #708', 'T10331', '2025-07-15 14:35:03', '2025-07-15 14:35:03'),
(739, NULL, 'bank', 35, NULL, 12000.0000, NULL, 0.00, '+', 'topsubre35 GD 820534-071525 21:44:09', '10319', '2025-07-15 14:47:02', '2025-07-15 14:47:02'),
(740, NULL, NULL, 35, NULL, 13415.2200, NULL, 0.00, '-', 'Place order #709', 'T10332', '2025-07-15 14:49:12', '2025-07-15 14:49:12'),
(741, NULL, NULL, 331, NULL, 98.3016, NULL, 0.00, '-', 'Place order #710', 'T10333', '2025-07-15 15:07:42', '2025-07-15 15:07:42'),
(742, NULL, NULL, 101, NULL, 15226.9000, NULL, 0.00, '-', 'Place order #711', 'T10334', '2025-07-16 01:08:34', '2025-07-16 01:08:34'),
(743, NULL, NULL, 331, NULL, 256.1220, NULL, 0.00, '-', 'Place order #712', 'T10335', '2025-07-16 04:54:10', '2025-07-16 04:54:10'),
(744, NULL, NULL, 331, NULL, 256.1220, NULL, 0.00, '+', 'Refund for canceled order 712', 'T10336', '2025-07-16 08:03:00', '2025-07-16 08:03:00'),
(745, NULL, 'bank', 321, NULL, 50000.0000, NULL, 0.00, '+', 'QR - topsubre321 GD 087737-071625 20:34:36', '10328', '2025-07-16 13:35:02', '2025-07-16 13:35:02'),
(746, NULL, NULL, 321, NULL, 1388.8100, NULL, 0.00, '-', 'Place order #713', 'T10337', '2025-07-16 13:52:32', '2025-07-16 13:52:32'),
(747, NULL, NULL, 321, NULL, 4015.0000, NULL, 0.00, '-', 'Place order #714', 'T10338', '2025-07-16 13:53:22', '2025-07-16 13:53:22'),
(748, NULL, NULL, 131, NULL, 0.2535, NULL, 0.00, '-', 'Place order #715', 'T10339', '2025-07-16 13:59:36', '2025-07-16 13:59:36'),
(749, NULL, NULL, 131, NULL, 338.0000, NULL, 0.00, '-', 'Place order #716', 'T10340', '2025-07-16 14:04:04', '2025-07-16 14:04:04'),
(750, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '-', 'Place order #717', 'T10341', '2025-07-16 14:05:04', '2025-07-16 14:05:04'),
(751, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '-', 'Place order #718', 'T10342', '2025-07-16 14:05:51', '2025-07-16 14:05:51'),
(752, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '-', 'Place order #719', 'T10343', '2025-07-16 14:06:18', '2025-07-16 14:06:18'),
(753, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '-', 'Place order #720', 'T10344', '2025-07-16 14:06:52', '2025-07-16 14:06:52'),
(754, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '-', 'Place order #721', 'T10345', '2025-07-16 14:07:17', '2025-07-16 14:07:17'),
(755, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '-', 'Place order #722', 'T10346', '2025-07-16 14:07:55', '2025-07-16 14:07:55'),
(756, NULL, 'bank', 101, NULL, 40000.0000, NULL, 0.00, '+', 'QR - topsubre101 GD 645176-071725 14:33:10', '10333', '2025-07-17 07:39:03', '2025-07-17 07:39:03'),
(757, NULL, NULL, 101, NULL, 9136.1400, NULL, 0.00, '-', 'Place order #724', 'T10347', '2025-07-17 08:40:08', '2025-07-17 08:40:08'),
(758, NULL, NULL, 101, NULL, 9136.1400, NULL, 0.00, '-', 'Place order #725', 'T10348', '2025-07-17 08:40:51', '2025-07-17 08:40:51'),
(759, NULL, NULL, 101, NULL, 9136.1400, NULL, 0.00, '-', 'Place order #726', 'T10349', '2025-07-17 08:41:08', '2025-07-17 08:41:08'),
(760, NULL, NULL, 101, NULL, 3045.3800, NULL, 0.00, '-', 'Place order #727', 'T10350', '2025-07-17 08:41:20', '2025-07-17 08:41:20'),
(761, NULL, NULL, 20, NULL, 10140.0000, NULL, 0.00, '-', 'Place order #728', 'T10351', '2025-07-17 12:49:58', '2025-07-17 12:49:58'),
(762, NULL, NULL, 51, NULL, 11830.0000, NULL, 0.00, '+', 'Refund for canceled order 617', 'T10352', '2025-07-17 23:53:03', '2025-07-17 23:53:03'),
(763, NULL, NULL, 51, NULL, 19411.6104, NULL, 0.00, '-', 'Place order #729', 'T10353', '2025-07-18 02:38:19', '2025-07-18 02:38:19'),
(764, NULL, NULL, 101, NULL, 9136.1400, NULL, 0.00, '-', 'Place order #730', 'T10354', '2025-07-18 06:10:35', '2025-07-18 06:10:35'),
(765, NULL, 'bank', 101, NULL, 21000.0000, NULL, 0.00, '+', 'QR - topsubre101 GD 028850-071825 13:38:38', '10343', '2025-07-18 06:39:03', '2025-07-18 06:39:03'),
(766, NULL, NULL, 101, NULL, 10658.8300, NULL, 0.00, '-', 'Place order #731', 'T10355', '2025-07-18 06:45:54', '2025-07-18 06:45:54'),
(767, NULL, NULL, 101, NULL, 11267.9060, NULL, 0.00, '-', 'Place order #732', 'T10356', '2025-07-18 06:46:41', '2025-07-18 06:46:41'),
(768, NULL, NULL, 20, NULL, 3650.0000, NULL, 0.00, '-', 'Place order #733', 'T10357', '2025-07-19 09:31:53', '2025-07-19 09:31:53'),
(769, NULL, NULL, 331, NULL, 345.2670, NULL, 0.00, '-', 'Place order #734', 'T10358', '2025-07-19 11:01:55', '2025-07-19 11:01:55'),
(770, NULL, NULL, 331, NULL, 456.6042, NULL, 0.00, '-', 'Place order #735', 'T10359', '2025-07-19 11:03:00', '2025-07-19 11:03:00'),
(771, NULL, 'bank', 250, NULL, 3000.0000, NULL, 0.00, '+', '94610596614-0377830495-topsubre250 GD 117860-071925 18:32:08', '10354', '2025-07-19 11:36:00', '2025-07-19 11:36:00'),
(772, NULL, NULL, 250, NULL, 887.3000, NULL, 0.00, '-', 'Place order #736', 'T10360', '2025-07-19 11:37:03', '2025-07-19 11:37:03'),
(773, NULL, NULL, 250, NULL, 887.3000, NULL, 0.00, '-', 'Place order #737', 'T10361', '2025-07-19 11:39:25', '2025-07-19 11:39:25'),
(774, NULL, NULL, 250, NULL, 365.0000, NULL, 0.00, '-', 'Place order #738', 'T10362', '2025-07-19 11:39:50', '2025-07-19 11:39:50');
INSERT INTO `transactions` (`id`, `transactional_id`, `transactional_type`, `user_id`, `child_panel_id`, `amount`, `balance`, `charge`, `trx_type`, `remarks`, `trx_id`, `created_at`, `updated_at`) VALUES
(775, NULL, NULL, 250, NULL, 1014.0000, NULL, 0.00, '-', 'Place order #739', 'T10363', '2025-07-19 11:55:28', '2025-07-19 11:55:28'),
(776, NULL, NULL, 331, NULL, 258.4200, NULL, 0.00, '-', 'Place order #740', 'T10364', '2025-07-19 15:17:24', '2025-07-19 15:17:24'),
(777, NULL, NULL, 331, NULL, 343.1730, NULL, 0.00, '-', 'Place order #741', 'T10365', '2025-07-19 15:24:07', '2025-07-19 15:24:07'),
(778, NULL, NULL, 331, NULL, 331.2375, NULL, 0.00, '-', 'Place order #742', 'T10366', '2025-07-19 15:36:22', '2025-07-19 15:36:22'),
(779, NULL, NULL, 331, NULL, 292.0000, NULL, 0.00, '-', 'Place order #743', 'T10367', '2025-07-19 15:38:07', '2025-07-19 15:38:07'),
(780, NULL, NULL, 331, NULL, 182.5000, NULL, 0.00, '-', 'Place order #744', 'T10368', '2025-07-19 15:47:15', '2025-07-19 15:47:15'),
(781, NULL, 'bank', 250, NULL, 6000.0000, NULL, 0.00, '+', '94632337492 0377830495 topsubre250 GD 426221-071925 22:44:20', '10359', '2025-07-19 15:50:03', '2025-07-19 15:50:03'),
(782, NULL, NULL, 250, NULL, 1330.9500, NULL, 0.00, '-', 'Place order #745', 'T10369', '2025-07-19 16:10:04', '2025-07-19 16:10:04'),
(783, NULL, NULL, 250, NULL, 730.0000, NULL, 0.00, '-', 'Place order #746', 'T10370', '2025-07-19 16:10:53', '2025-07-19 16:10:53'),
(784, NULL, NULL, 331, NULL, 81.0000, NULL, 0.00, '-', 'Place order #747', 'T10371', '2025-07-20 03:15:30', '2025-07-20 03:15:30'),
(785, NULL, NULL, 331, NULL, 81.0000, NULL, 0.00, '-', 'Place order #748', 'T10372', '2025-07-20 03:18:51', '2025-07-20 03:18:51'),
(786, NULL, NULL, 331, NULL, 159.4080, NULL, 0.00, '-', 'Place order #749', 'T10373', '2025-07-20 03:22:01', '2025-07-20 03:22:01'),
(787, NULL, NULL, 331, NULL, 157.7880, NULL, 0.00, '-', 'Place order #750', 'T10374', '2025-07-20 03:27:10', '2025-07-20 03:27:10'),
(788, NULL, NULL, 331, NULL, 126.4248, NULL, 0.00, '-', 'Place order #751', 'T10375', '2025-07-20 07:21:17', '2025-07-20 07:21:17'),
(789, NULL, NULL, 331, NULL, 81.0000, NULL, 0.00, '-', 'Place order #752', 'T10376', '2025-07-20 09:48:55', '2025-07-20 09:48:55'),
(790, NULL, NULL, 331, NULL, 81.0000, NULL, 0.00, '-', 'Place order #753', 'T10377', '2025-07-20 09:49:33', '2025-07-20 09:49:33'),
(791, NULL, NULL, 331, NULL, 97.2000, NULL, 0.00, '-', 'Place order #754', 'T10378', '2025-07-20 10:02:04', '2025-07-20 10:02:04'),
(792, NULL, NULL, 331, NULL, 158.8410, NULL, 0.00, '-', 'Place order #755', 'T10379', '2025-07-20 10:02:51', '2025-07-20 10:02:51'),
(793, NULL, NULL, 331, NULL, 144.2610, NULL, 0.00, '-', 'Place order #756', 'T10380', '2025-07-20 10:03:57', '2025-07-20 10:03:57'),
(794, NULL, NULL, 331, NULL, 81.0000, NULL, 0.00, '-', 'Place order #757', 'T10381', '2025-07-20 10:12:01', '2025-07-20 10:12:01'),
(795, NULL, NULL, 331, NULL, 146.3346, NULL, 0.00, '-', 'Place order #758', 'T10382', '2025-07-20 10:37:09', '2025-07-20 10:37:09'),
(796, NULL, NULL, 331, NULL, 87.5286, NULL, 0.00, '-', 'Place order #759', 'T10383', '2025-07-20 10:41:51', '2025-07-20 10:41:51'),
(797, NULL, NULL, 331, NULL, 144.9090, NULL, 0.00, '-', 'Place order #760', 'T10384', '2025-07-20 10:51:35', '2025-07-20 10:51:35'),
(798, NULL, NULL, 331, NULL, 130.6206, NULL, 0.00, '-', 'Place order #761', 'T10385', '2025-07-20 11:00:07', '2025-07-20 11:00:07'),
(799, NULL, NULL, 331, NULL, 158.4846, NULL, 0.00, '-', 'Place order #762', 'T10386', '2025-07-20 12:15:20', '2025-07-20 12:15:20'),
(800, NULL, 'bank', 250, NULL, 28000.0000, NULL, 0.00, '+', 'topsubre250 GD 000054-072025 19:29:42', '10362', '2025-07-20 12:33:01', '2025-07-20 12:33:01'),
(801, NULL, NULL, 250, NULL, 3143.4000, NULL, 0.00, '-', 'Place order #763', 'T10387', '2025-07-20 12:38:32', '2025-07-20 12:38:32'),
(802, NULL, NULL, 250, NULL, 6286.8000, NULL, 0.00, '-', 'Place order #764', 'T10388', '2025-07-20 12:43:11', '2025-07-20 12:43:11'),
(803, NULL, NULL, 331, NULL, 81.0000, NULL, 0.00, '-', 'Place order #765', 'T10389', '2025-07-20 14:29:44', '2025-07-20 14:29:44'),
(804, NULL, NULL, 331, NULL, 81.0000, NULL, 0.00, '-', 'Place order #766', 'T10390', '2025-07-20 14:52:44', '2025-07-20 14:52:44'),
(805, NULL, NULL, 331, NULL, 130.5558, NULL, 0.00, '-', 'Place order #767', 'T10391', '2025-07-20 14:56:21', '2025-07-20 14:56:21'),
(806, NULL, NULL, 331, NULL, 73.3779, NULL, 0.00, '-', 'Place order #769', 'T10392', '2025-07-21 03:54:27', '2025-07-21 03:54:27'),
(807, NULL, NULL, 331, NULL, 88.6464, NULL, 0.00, '-', 'Place order #770', 'T10393', '2025-07-21 03:55:12', '2025-07-21 03:55:12'),
(808, NULL, NULL, 331, NULL, 75.7107, NULL, 0.00, '-', 'Place order #772', 'T10394', '2025-07-21 04:05:35', '2025-07-21 04:05:35'),
(809, NULL, NULL, 331, NULL, 73.2645, NULL, 0.00, '-', 'Place order #773', 'T10395', '2025-07-21 05:09:31', '2025-07-21 05:09:31'),
(810, NULL, NULL, 331, NULL, 76.9500, NULL, 0.00, '-', 'Place order #774', 'T10396', '2025-07-21 05:24:26', '2025-07-21 05:24:26'),
(811, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #775', 'T10397', '2025-07-21 06:37:16', '2025-07-21 06:37:16'),
(812, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #776', 'T10398', '2025-07-21 06:37:58', '2025-07-21 06:37:58'),
(813, NULL, NULL, 331, NULL, 73.3536, NULL, 0.00, '-', 'Place order #777', 'T10399', '2025-07-21 06:48:10', '2025-07-21 06:48:10'),
(814, NULL, NULL, 331, NULL, 57.3480, NULL, 0.00, '-', 'Place order #778', 'T10400', '2025-07-21 06:56:20', '2025-07-21 06:56:20'),
(815, NULL, NULL, 331, NULL, 76.5936, NULL, 0.00, '-', 'Place order #779', 'T10401', '2025-07-21 11:49:03', '2025-07-21 11:49:03'),
(816, NULL, NULL, 331, NULL, 70.0650, NULL, 0.00, '-', 'Place order #780', 'T10402', '2025-07-21 11:49:38', '2025-07-21 11:49:38'),
(817, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #781', 'T10403', '2025-07-21 12:01:08', '2025-07-21 12:01:08'),
(818, NULL, NULL, 331, NULL, 76.1643, NULL, 0.00, '-', 'Place order #782', 'T10404', '2025-07-21 12:28:48', '2025-07-21 12:28:48'),
(819, NULL, NULL, 331, NULL, 81.4455, NULL, 0.00, '-', 'Place order #783', 'T10405', '2025-07-21 13:59:43', '2025-07-21 13:59:43'),
(820, NULL, NULL, 331, NULL, 57.1698, NULL, 0.00, '-', 'Place order #784', 'T10406', '2025-07-21 14:03:46', '2025-07-21 14:03:46'),
(821, NULL, NULL, 331, NULL, 65.5614, NULL, 0.00, '-', 'Place order #785', 'T10407', '2025-07-21 14:30:08', '2025-07-21 14:30:08'),
(822, NULL, NULL, 331, NULL, 72.9324, NULL, 0.00, '-', 'Place order #786', 'T10408', '2025-07-21 14:31:10', '2025-07-21 14:31:10'),
(823, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #787', 'T10409', '2025-07-21 14:32:53', '2025-07-21 14:32:53'),
(824, NULL, NULL, 131, NULL, 5659.4720, NULL, 0.00, '-', 'Place order #788', 'T10410', '2025-07-21 14:39:29', '2025-07-21 14:39:29'),
(825, NULL, NULL, 331, NULL, 57.4614, NULL, 0.00, '-', 'Place order #790', 'T10411', '2025-07-22 03:45:49', '2025-07-22 03:45:49'),
(826, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #791', 'T10412', '2025-07-22 03:46:16', '2025-07-22 03:46:16'),
(827, NULL, NULL, 57, NULL, 9828.3470, NULL, 0.00, '-', 'Place order #792', 'T10413', '2025-07-22 04:22:51', '2025-07-22 04:22:51'),
(828, NULL, 'bank', 337, NULL, 15000.0000, NULL, 0.00, '+', 'topsubre337 GD 814084-072225 11:51:41', '10378', '2025-07-22 04:53:01', '2025-07-22 04:53:01'),
(829, NULL, NULL, 337, NULL, 1593.7860, NULL, 0.00, '-', 'Place order #793', 'T10414', '2025-07-22 04:54:08', '2025-07-22 04:54:08'),
(830, NULL, NULL, 250, NULL, 532.3800, NULL, 0.00, '-', 'Place order #794', 'T10415', '2025-07-22 10:19:41', '2025-07-22 10:19:41'),
(831, NULL, NULL, 250, NULL, 81.0000, NULL, 0.00, '-', 'Place order #795', 'T10416', '2025-07-22 10:21:29', '2025-07-22 10:21:29'),
(832, NULL, NULL, 250, NULL, 283.9000, NULL, 0.00, '-', 'Place order #796', 'T10417', '2025-07-22 10:58:38', '2025-07-22 10:58:38'),
(833, NULL, NULL, 321, NULL, 20432.1000, NULL, 0.00, '-', 'Place order #797', 'T10418', '2025-07-22 13:24:06', '2025-07-22 13:24:06'),
(834, NULL, NULL, 331, NULL, 408.1995, NULL, 0.00, '-', 'Place order #798', 'T10419', '2025-07-23 06:31:02', '2025-07-23 06:31:02'),
(835, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #799', 'T10420', '2025-07-23 08:51:17', '2025-07-23 08:51:17'),
(836, NULL, NULL, 331, NULL, 97.2000, NULL, 0.00, '-', 'Place order #800', 'T10421', '2025-07-23 08:51:56', '2025-07-23 08:51:56'),
(837, NULL, NULL, 331, NULL, 280.0413, NULL, 0.00, '-', 'Place order #801', 'T10422', '2025-07-23 10:19:12', '2025-07-23 10:19:12'),
(838, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #802', 'T10423', '2025-07-23 11:44:00', '2025-07-23 11:44:00'),
(839, NULL, NULL, 331, NULL, 81.0000, NULL, 0.00, '-', 'Place order #803', 'T10424', '2025-07-23 12:41:20', '2025-07-23 12:41:20'),
(840, NULL, NULL, 331, NULL, 186.3000, NULL, 0.00, '-', 'Place order #804', 'T10425', '2025-07-23 12:46:52', '2025-07-23 12:46:52'),
(841, NULL, NULL, 331, NULL, 141.7014, NULL, 0.00, '-', 'Place order #805', 'T10426', '2025-07-23 12:48:49', '2025-07-23 12:48:49'),
(842, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #806', 'T10427', '2025-07-23 15:23:10', '2025-07-23 15:23:10'),
(843, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #807', 'T10428', '2025-07-24 05:17:40', '2025-07-24 05:17:40'),
(844, NULL, NULL, 250, NULL, 81.0000, NULL, 0.00, '-', 'Place order #808', 'T10429', '2025-07-24 06:04:06', '2025-07-24 06:04:06'),
(845, NULL, NULL, 250, NULL, 283.9000, NULL, 0.00, '-', 'Place order #809', 'T10430', '2025-07-24 06:49:59', '2025-07-24 06:49:59'),
(846, NULL, NULL, 250, NULL, 3244.8000, NULL, 0.00, '-', 'Place order #810', 'T10431', '2025-07-24 07:00:31', '2025-07-24 07:00:31'),
(847, NULL, NULL, 250, NULL, 422.5000, NULL, 0.00, '-', 'Place order #811', 'T10432', '2025-07-24 07:45:24', '2025-07-24 07:45:24'),
(848, NULL, NULL, 250, NULL, 338.0000, NULL, 0.00, '-', 'Place order #812', 'T10433', '2025-07-24 08:20:12', '2025-07-24 08:20:12'),
(849, NULL, NULL, 250, NULL, 81.0000, NULL, 0.00, '-', 'Place order #813', 'T10434', '2025-07-24 09:17:02', '2025-07-24 09:17:02'),
(850, NULL, NULL, 250, NULL, 443.6500, NULL, 0.00, '-', 'Place order #814', 'T10435', '2025-07-24 09:32:56', '2025-07-24 09:32:56'),
(851, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '+', 'Refund for canceled order 807', 'T10436', '2025-07-24 10:34:03', '2025-07-24 10:34:03'),
(852, NULL, NULL, 250, NULL, 81.0000, NULL, 0.00, '+', 'Refund for canceled order 808', 'T10437', '2025-07-24 10:39:06', '2025-07-24 10:39:06'),
(853, NULL, NULL, 250, NULL, 443.6500, NULL, 0.00, '-', 'Place order #815', 'T10438', '2025-07-24 11:06:38', '2025-07-24 11:06:38'),
(854, NULL, NULL, 250, NULL, 1017.4000, NULL, 0.00, '-', 'Place order #816', 'T10439', '2025-07-24 11:24:48', '2025-07-24 11:24:48'),
(855, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #817', 'T10440', '2025-07-24 12:50:36', '2025-07-24 12:50:36'),
(856, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #818', 'T10441', '2025-07-24 13:09:42', '2025-07-24 13:09:42'),
(857, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #819', 'T10442', '2025-07-24 13:17:03', '2025-07-24 13:17:03'),
(858, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #820', 'T10443', '2025-07-24 13:23:21', '2025-07-24 13:23:21'),
(859, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #821', 'T10444', '2025-07-24 15:24:16', '2025-07-24 15:24:16'),
(860, NULL, 'bank', 343, NULL, 31000.0000, NULL, 0.00, '+', 'ACB;15873021;topsubre343 GD 943006-072725 22:40:49', '10440', '2025-07-27 15:41:02', '2025-07-27 15:41:02'),
(861, NULL, NULL, 343, NULL, 30453.8000, NULL, 0.00, '-', 'Place order #822', 'T10445', '2025-07-27 15:53:02', '2025-07-27 15:53:02'),
(862, NULL, 'bank', 343, NULL, 33000.0000, NULL, 0.00, '+', 'ZP7414KN1PEU, topsubre343 GD 181386-072825 12:33:13', '10451', '2025-07-28 05:35:02', '2025-07-28 05:35:02'),
(863, NULL, NULL, 343, NULL, 13013.0000, NULL, 0.00, '-', 'Place order #823', 'T10452', '2025-07-28 05:37:00', '2025-07-28 05:37:00'),
(864, NULL, NULL, 250, NULL, 8030.0000, NULL, 0.00, '-', 'Place order #824', 'T10453', '2025-07-28 15:31:43', '2025-07-28 15:31:43'),
(865, NULL, NULL, 250, NULL, 887.3000, NULL, 0.00, '-', 'Place order #825', 'T10454', '2025-07-28 15:32:21', '2025-07-28 15:32:21'),
(866, NULL, NULL, 250, NULL, 20.0760, NULL, 0.00, '-', 'Place order #826', 'T10455', '2025-07-28 16:04:14', '2025-07-28 16:04:14'),
(867, NULL, NULL, 250, NULL, 1216.5000, NULL, 0.00, '-', 'Place order #827', 'T10456', '2025-07-28 16:05:33', '2025-07-28 16:05:33'),
(868, NULL, NULL, 250, NULL, 1419.6800, NULL, 0.00, '-', 'Place order #828', 'T10457', '2025-07-28 16:06:12', '2025-07-28 16:06:12'),
(869, NULL, NULL, 250, NULL, 36.5000, NULL, 0.00, '-', 'Place order #829', 'T10458', '2025-07-28 16:06:42', '2025-07-28 16:06:42'),
(870, NULL, NULL, 284, NULL, 15000.0000, NULL, 0.00, '+', 'Nạp thẻ cào', 'T10459', '2025-07-28 23:41:16', '2025-07-28 23:41:16'),
(871, NULL, NULL, 284, NULL, 14997.3932, NULL, 0.00, '-', 'Place order #830', 'T10460', '2025-07-28 23:43:42', '2025-07-28 23:43:42'),
(872, NULL, NULL, 343, NULL, 810.0000, NULL, 0.00, '-', 'Place order #831', 'T10461', '2025-07-29 14:19:42', '2025-07-29 14:19:42'),
(873, NULL, NULL, 343, NULL, 14196.0000, NULL, 0.00, '-', 'Place order #832', 'T10462', '2025-07-29 14:21:11', '2025-07-29 14:21:11'),
(874, NULL, NULL, 343, NULL, 1001.1795, NULL, 0.00, '-', 'Place order #833', 'T10463', '2025-07-29 14:49:53', '2025-07-29 14:49:53'),
(875, NULL, NULL, 343, NULL, 3328.9620, NULL, 0.00, '-', 'Place order #834', 'T10464', '2025-07-29 14:50:59', '2025-07-29 14:50:59'),
(876, NULL, NULL, 343, NULL, 785.7486, NULL, 0.00, '-', 'Place order #835', 'T10465', '2025-07-29 14:53:05', '2025-07-29 14:53:05'),
(877, NULL, NULL, 331, NULL, 40.5000, NULL, 0.00, '-', 'Place order #836', 'T10466', '2025-07-30 03:48:57', '2025-07-30 03:48:57'),
(878, NULL, NULL, 90, NULL, 2000.0000, NULL, 0.00, '+', 'ACB', 'T10467', '2025-07-31 09:23:21', '2025-07-31 09:23:21'),
(879, NULL, NULL, 90, NULL, 1690.0000, NULL, 0.00, '-', 'Place order #837', 'T10468', '2025-07-31 09:26:59', '2025-07-31 09:26:59'),
(880, NULL, 'bank', 90, NULL, 2000.0000, NULL, 0.00, '+', 'topsubre90 GD 151803-073125 16:14:22', '10514', '2025-07-31 09:29:01', '2025-07-31 09:29:01'),
(881, NULL, NULL, 90, NULL, 2000.0000, NULL, 0.00, '-', 'ACB', 'T10515', '2025-07-31 09:33:41', '2025-07-31 09:33:41'),
(882, NULL, 'bank', 328, NULL, 10000.0000, NULL, 0.00, '+', 'MBVCB.10380202880.5212BFTVG2YBXS8R.topsubre328.CT tu 1036885979 TRAN HOANG HUY toi 15873021 LE VAN KHANH tai ACB GD 445142-073125 18:01:21', '10515', '2025-07-31 11:07:00', '2025-07-31 11:07:00'),
(883, NULL, NULL, 303, NULL, 48.2112, NULL, 0.00, '+', 'Refund for canceled order 662', 'T10516', '2025-07-31 11:13:01', '2025-07-31 11:13:01'),
(884, NULL, NULL, 303, NULL, 110.1276, NULL, 0.00, '+', 'Refund for canceled order 665', 'T10517', '2025-07-31 11:13:01', '2025-07-31 11:13:01'),
(885, NULL, NULL, 234, NULL, 207.8026, NULL, 0.00, '+', 'Refund for canceled order 666', 'T10518', '2025-07-31 11:13:01', '2025-07-31 11:13:01'),
(886, NULL, NULL, 303, NULL, 24.3000, NULL, 0.00, '+', 'Refund for canceled order 669', 'T10519', '2025-07-31 11:17:00', '2025-07-31 11:17:00'),
(887, NULL, NULL, 234, NULL, 207.4000, NULL, 0.00, '+', 'Refund for canceled order 670', 'T10520', '2025-07-31 11:20:13', '2025-07-31 11:20:13'),
(888, NULL, NULL, 234, NULL, 155.5476, NULL, 0.00, '+', 'Refund for canceled order 634', 'T10521', '2025-07-31 11:28:08', '2025-07-31 11:28:08'),
(889, NULL, NULL, 234, NULL, 161.1376, NULL, 0.00, '+', 'Refund for canceled order 667', 'T10522', '2025-07-31 11:29:01', '2025-07-31 11:29:01'),
(890, NULL, NULL, 303, NULL, 169.0000, NULL, 0.00, '+', 'Refund for canceled order 668', 'T10523', '2025-07-31 11:33:03', '2025-07-31 11:33:03'),
(891, NULL, NULL, 348, NULL, 70000.0000, NULL, 0.00, '+', 'ACB', 'T10524', '2025-07-31 16:13:29', '2025-07-31 16:13:29'),
(892, NULL, NULL, 348, NULL, 61516.0000, NULL, 0.00, '-', 'Place order #838', 'T10525', '2025-07-31 16:18:10', '2025-07-31 16:18:10'),
(893, NULL, NULL, 348, NULL, 8240.0000, NULL, 0.00, '-', 'Place order #839', 'T10526', '2025-07-31 16:22:09', '2025-07-31 16:22:09'),
(894, NULL, NULL, 348, NULL, 229.5000, NULL, 0.00, '-', 'Place order #840', 'T10527', '2025-07-31 16:45:34', '2025-07-31 16:45:34'),
(895, NULL, NULL, 90, NULL, 1690.0000, NULL, 0.00, '+', 'Refund for canceled order 837', 'T10528', '2025-07-31 19:48:00', '2025-07-31 19:48:00'),
(896, NULL, 'bank', 205, NULL, 19000.0000, NULL, 0.00, '+', 'topsubre205 GD 116988-080125 07:29:03', '10526', '2025-08-01 00:30:00', '2025-08-01 00:30:00'),
(897, NULL, NULL, 205, NULL, 19209.4695, NULL, 0.00, '-', 'Place order #841', 'T10529', '2025-08-01 00:31:10', '2025-08-01 00:31:10'),
(898, NULL, 'bank', 205, NULL, 13000.0000, NULL, 0.00, '+', 'topsubre205 GD 799615-080125 07:40:00', '10527', '2025-08-01 00:40:02', '2025-08-01 00:40:02'),
(899, NULL, NULL, 205, NULL, 11928.4256, NULL, 0.00, '-', 'Place order #842', 'T10530', '2025-08-01 10:13:41', '2025-08-01 10:13:41'),
(900, NULL, NULL, 321, NULL, 4015.0000, NULL, 0.00, '-', 'Place order #844', 'T10531', '2025-08-02 14:46:57', '2025-08-02 14:46:57'),
(901, NULL, NULL, 321, NULL, 1388.8100, NULL, 0.00, '-', 'Place order #845', 'T10532', '2025-08-02 14:47:51', '2025-08-02 14:47:51'),
(902, NULL, NULL, 250, NULL, 1622.0000, NULL, 0.00, '-', 'Place order #846', 'T10533', '2025-08-02 15:52:28', '2025-08-02 15:52:28'),
(903, NULL, NULL, 250, NULL, 1330.9500, NULL, 0.00, '-', 'Place order #847', 'T10534', '2025-08-02 15:54:15', '2025-08-02 15:54:15'),
(904, NULL, NULL, 250, NULL, 33.4600, NULL, 0.00, '-', 'Place order #848', 'T10535', '2025-08-02 15:54:32', '2025-08-02 15:54:32'),
(905, NULL, 'bank', 205, NULL, 13000.0000, NULL, 0.00, '+', 'topsubre205 GD 953754-080325 11:30:19', '10568', '2025-08-03 04:31:01', '2025-08-03 04:31:01'),
(906, NULL, 'bank', 102, NULL, 13339.0000, NULL, 0.00, '+', 'topsubre102 FT25216690823749 GD 979059-080325 12:55:19', '10569', '2025-08-03 05:57:00', '2025-08-03 05:57:00'),
(907, NULL, NULL, 102, NULL, 13283.4000, NULL, 0.00, '-', 'Place order #849', 'T10570', '2025-08-03 06:03:18', '2025-08-03 06:03:18'),
(908, NULL, NULL, 205, NULL, 13689.0000, NULL, 0.00, '-', 'Place order #850', 'T10571', '2025-08-03 09:24:15', '2025-08-03 09:24:15'),
(909, NULL, NULL, 343, NULL, 141.9600, NULL, 0.00, '-', 'Place order #851', 'T10572', '2025-08-04 03:47:57', '2025-08-04 03:47:57'),
(910, NULL, NULL, 343, NULL, 252.1032, NULL, 0.00, '-', 'Place order #852', 'T10573', '2025-08-04 03:48:30', '2025-08-04 03:48:30'),
(911, NULL, NULL, 62, NULL, 26566.8000, NULL, 0.00, '-', 'Place order #853', 'T10574', '2025-08-04 07:49:47', '2025-08-04 07:49:47'),
(912, NULL, NULL, 62, NULL, 13283.4000, NULL, 0.00, '-', 'Place order #854', 'T10575', '2025-08-04 08:37:24', '2025-08-04 08:37:24'),
(913, NULL, 'bank', 62, NULL, 30000.0000, NULL, 0.00, '+', 'IB TOPSUBRE62', '10595', '2025-08-04 08:39:01', '2025-08-04 08:39:01'),
(914, NULL, NULL, 343, NULL, 785.7486, NULL, 0.00, '+', 'Refund for canceled order 835', 'T10596', '2025-08-04 11:57:00', '2025-08-04 11:57:00'),
(915, NULL, NULL, 321, NULL, 669.2000, NULL, 0.00, '-', 'Place order #855', 'T10597', '2025-08-05 07:08:32', '2025-08-05 07:08:32'),
(916, NULL, NULL, 321, NULL, 1419.5000, NULL, 0.00, '-', 'Place order #856', 'T10598', '2025-08-05 07:08:58', '2025-08-05 07:08:58'),
(917, NULL, NULL, 205, NULL, 85.1700, NULL, 0.00, '-', 'Place order #857', 'T10599', '2025-08-05 07:09:23', '2025-08-05 07:09:23'),
(918, NULL, NULL, 205, NULL, 85.1700, NULL, 0.00, '-', 'Place order #858', 'T10600', '2025-08-05 14:18:01', '2025-08-05 14:18:01'),
(919, NULL, NULL, 331, NULL, 507.0000, NULL, 0.00, '-', 'Place order #859', 'T10601', '2025-08-06 08:10:48', '2025-08-06 08:10:48'),
(920, NULL, NULL, 331, NULL, 405.5000, NULL, 0.00, '-', 'Place order #860', 'T10602', '2025-08-06 08:11:58', '2025-08-06 08:11:58'),
(921, NULL, NULL, 331, NULL, 365.0000, NULL, 0.00, '-', 'Place order #861', 'T10603', '2025-08-06 08:15:42', '2025-08-06 08:15:42'),
(922, NULL, 'bank', 293, NULL, 2000.0000, NULL, 0.00, '+', 'topsubre293 GD 953084-080625 23:26:17', '10645', '2025-08-06 16:29:02', '2025-08-06 16:29:02'),
(923, NULL, NULL, 293, NULL, 1994.2000, NULL, 0.00, '-', 'Place order #862', 'T10646', '2025-08-06 16:30:02', '2025-08-06 16:30:02'),
(924, NULL, NULL, 321, NULL, 76.9000, NULL, 0.00, '-', 'Place order #863', 'T10647', '2025-08-07 14:05:58', '2025-08-07 14:05:58'),
(925, NULL, 'bank', 35, NULL, 9000.0000, NULL, 0.00, '+', 'topsubre35 GD 800997-080825 11:07:52', '10663', '2025-08-08 04:08:03', '2025-08-08 04:08:03'),
(926, NULL, NULL, 35, NULL, 1368.9000, NULL, 0.00, '-', 'Place order #864', 'T10664', '2025-08-08 04:09:37', '2025-08-08 04:09:37'),
(927, NULL, NULL, 35, NULL, 2737.8000, NULL, 0.00, '-', 'Place order #865', 'T10665', '2025-08-08 04:11:02', '2025-08-08 04:11:02'),
(928, NULL, NULL, 35, NULL, 1368.9000, NULL, 0.00, '-', 'Place order #866', 'T10666', '2025-08-08 04:11:41', '2025-08-08 04:11:41'),
(929, NULL, NULL, 35, NULL, 3157.6000, NULL, 0.00, '-', 'Place order #867', 'T10667', '2025-08-08 04:12:16', '2025-08-08 04:12:16'),
(930, NULL, 'bank', 205, NULL, 7000.0000, NULL, 0.00, '+', 'topsubre205 GD 020253-080825 17:57:36', '10666', '2025-08-08 10:59:00', '2025-08-08 10:59:00'),
(931, NULL, NULL, 205, NULL, 7263.2820, NULL, 0.00, '-', 'Place order #868', 'T10668', '2025-08-08 11:00:57', '2025-08-08 11:00:57'),
(932, NULL, 'bank', 352, NULL, 20000.0000, NULL, 0.00, '+', 'topsubre352 GD 414896-080925 10:52:55', '10670', '2025-08-09 03:53:02', '2025-08-09 03:53:02'),
(933, NULL, NULL, 352, NULL, 15700.1000, NULL, 0.00, '-', 'Place order #870', 'T10671', '2025-08-09 03:58:12', '2025-08-09 03:58:12'),
(934, NULL, NULL, 352, NULL, 1419.5000, NULL, 0.00, '-', 'Place order #871', 'T10672', '2025-08-09 04:07:33', '2025-08-09 04:07:33'),
(935, NULL, NULL, 343, NULL, 283.9000, NULL, 0.00, '-', 'Place order #872', 'T10673', '2025-08-10 08:57:07', '2025-08-10 08:57:07'),
(936, NULL, NULL, 343, NULL, 425.8800, NULL, 0.00, '-', 'Place order #873', 'T10674', '2025-08-10 08:57:37', '2025-08-10 08:57:37'),
(937, NULL, NULL, 169, NULL, 3380.0000, NULL, 0.00, '-', 'Place order #874', 'T10675', '2025-08-10 11:57:10', '2025-08-10 11:57:10'),
(938, NULL, 'bank', 250, NULL, 2000.0000, NULL, 0.00, '+', 'topsubre250 GD 129575-081025 19:22:02', '10703', '2025-08-10 12:23:02', '2025-08-10 12:23:02'),
(939, NULL, NULL, 250, NULL, 1622.0000, NULL, 0.00, '-', 'Place order #875', 'T10704', '2025-08-10 12:23:39', '2025-08-10 12:23:39'),
(940, NULL, NULL, 250, NULL, 1313.2040, NULL, 0.00, '-', 'Place order #876', 'T10705', '2025-08-10 12:24:40', '2025-08-10 12:24:40'),
(941, NULL, NULL, 62, NULL, 6151.6000, NULL, 0.00, '-', 'Place order #877', 'T10706', '2025-08-10 12:30:36', '2025-08-10 12:30:36'),
(942, NULL, NULL, 62, NULL, 615.1600, NULL, 0.00, '-', 'Place order #878', 'T10707', '2025-08-10 12:36:20', '2025-08-10 12:36:20'),
(943, NULL, 'bank', 352, NULL, 7000.0000, NULL, 0.00, '+', 'topsubre352 GD 759373-081125 18:51:02', '10715', '2025-08-11 11:51:59', '2025-08-11 11:51:59'),
(944, NULL, NULL, 352, NULL, 141.9600, NULL, 0.00, '-', 'Place order #879', 'T10716', '2025-08-11 11:53:13', '2025-08-11 11:53:13'),
(945, NULL, NULL, 352, NULL, 7098.0000, NULL, 0.00, '-', 'Place order #880', 'T10717', '2025-08-11 12:06:25', '2025-08-11 12:06:25'),
(946, NULL, NULL, 352, NULL, 2271.2000, NULL, 0.00, '-', 'Place order #881', 'T10718', '2025-08-11 12:06:57', '2025-08-11 12:06:57'),
(947, NULL, NULL, 352, NULL, 202.1240, NULL, 0.00, '-', 'Place order #882', 'T10719', '2025-08-11 13:28:28', '2025-08-11 13:28:28'),
(948, NULL, 'bank', 352, NULL, 20000.0000, NULL, 0.00, '+', 'MBVCB.10515424058.5223BFTVG2YP3AL4.topsubre352.CT tu 9849397995 NGUYEN HOANG SANG toi 15873021 LE VAN KHANH tai ACB GD 5223BFTVG2YP3AL4 110825-20:59:06', '10718', '2025-08-11 14:03:00', '2025-08-11 14:03:00'),
(949, NULL, NULL, 352, NULL, 20010.2760, NULL, 0.00, '-', 'Place order #883', 'T10720', '2025-08-11 14:04:10', '2025-08-11 14:04:10'),
(950, NULL, NULL, 234, NULL, 730.0000, NULL, 0.00, '-', 'Place order #884', 'T10721', '2025-08-12 09:43:44', '2025-08-12 09:43:44'),
(951, NULL, 'bank', 250, NULL, 17000.0000, NULL, 0.00, '+', '97324328178 0377830495 topsubre250 GD 223928-081325 20:28:36', '10752', '2025-08-13 13:29:02', '2025-08-13 13:29:02'),
(952, NULL, NULL, 250, NULL, 12170.0000, NULL, 0.00, '-', 'Place order #885', 'T10753', '2025-08-13 13:55:51', '2025-08-13 13:55:51'),
(953, NULL, NULL, 250, NULL, 4015.0000, NULL, 0.00, '-', 'Place order #886', 'T10754', '2025-08-13 13:56:21', '2025-08-13 13:56:21'),
(954, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '+', 'Refund for canceled order 721', 'T10755', '2025-08-13 15:08:06', '2025-08-13 15:08:06'),
(955, NULL, NULL, 131, NULL, 0.2535, NULL, 0.00, '+', 'Refund for canceled order 715', 'T10756', '2025-08-13 15:13:03', '2025-08-13 15:13:03'),
(956, NULL, NULL, 234, NULL, 16.2000, NULL, 0.00, '+', 'Refund for canceled order 691', 'T10757', '2025-08-13 15:16:59', '2025-08-13 15:16:59'),
(957, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '+', 'Refund for canceled order 719', 'T10758', '2025-08-13 15:16:59', '2025-08-13 15:16:59'),
(958, NULL, NULL, 234, NULL, 16.2000, NULL, 0.00, '+', 'Refund for canceled order 690', 'T10759', '2025-08-13 15:24:59', '2025-08-13 15:24:59'),
(959, NULL, NULL, 234, NULL, 243.0000, NULL, 0.00, '+', 'Refund for canceled order 692', 'T10760', '2025-08-13 15:24:59', '2025-08-13 15:24:59'),
(960, NULL, NULL, 234, NULL, 367.2000, NULL, 0.00, '+', 'Refund for canceled order 694', 'T10761', '2025-08-13 15:24:59', '2025-08-13 15:24:59'),
(961, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '+', 'Refund for canceled order 717', 'T10762', '2025-08-13 15:24:59', '2025-08-13 15:24:59'),
(962, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '+', 'Refund for canceled order 718', 'T10763', '2025-08-13 15:24:59', '2025-08-13 15:24:59'),
(963, NULL, NULL, 131, NULL, 338.0000, NULL, 0.00, '+', 'Refund for canceled order 716', 'T10764', '2025-08-13 15:33:00', '2025-08-13 15:33:00'),
(964, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '+', 'Refund for canceled order 720', 'T10765', '2025-08-13 15:33:00', '2025-08-13 15:33:00'),
(965, NULL, NULL, 234, NULL, 307.8000, NULL, 0.00, '+', 'Refund for canceled order 693', 'T10766', '2025-08-13 15:36:07', '2025-08-13 15:36:07'),
(966, NULL, NULL, 321, NULL, 341.8200, NULL, 0.00, '+', 'Refund for canceled order 688', 'T10767', '2025-08-13 15:36:58', '2025-08-13 15:36:58'),
(967, NULL, NULL, 250, NULL, 803.3200, NULL, 0.00, '-', 'Place order #887', 'T10768', '2025-08-14 01:20:03', '2025-08-14 01:20:03'),
(968, NULL, NULL, 321, NULL, 16.2000, NULL, 0.00, '+', 'Refund for canceled order 722', 'T10769', '2025-08-14 06:25:02', '2025-08-14 06:25:02'),
(969, NULL, NULL, 234, NULL, 486.0000, NULL, 0.00, '+', 'Refund for canceled order 689', 'T10770', '2025-08-14 06:29:01', '2025-08-14 06:29:01'),
(970, NULL, 'bank', 250, NULL, 5000.0000, NULL, 0.00, '+', 'topsubre250 GD 670235-081525 09:52:17', '10777', '2025-08-15 02:54:59', '2025-08-15 02:54:59'),
(971, NULL, NULL, 250, NULL, 3806.0000, NULL, 0.00, '-', 'Place order #888', 'T10778', '2025-08-15 02:56:46', '2025-08-15 02:56:46'),
(972, NULL, NULL, 250, NULL, 549.6000, NULL, 0.00, '-', 'Place order #889', 'T10779', '2025-08-15 02:57:06', '2025-08-15 02:57:06'),
(973, NULL, 'bank', 357, NULL, 20000.0000, NULL, 0.00, '+', 'MBVCB.10566737077.5228BFTVG2Q8FHJF.topsubre357.CT tu 1026204778 TRAN THANH CONG toi 15873021 LE VAN KHANH tai ACB GD 5228BFTVG2Q8FHJF 160825-06:15:33', '10803', '2025-08-15 23:16:01', '2025-08-15 23:16:01'),
(974, NULL, NULL, 357, NULL, 13704.2100, NULL, 0.00, '-', 'Place order #890', 'T10804', '2025-08-15 23:17:40', '2025-08-15 23:17:40'),
(975, NULL, NULL, 357, NULL, 5053.1000, NULL, 0.00, '-', 'Place order #891', 'T10805', '2025-08-15 23:28:46', '2025-08-15 23:28:46'),
(976, NULL, NULL, 234, NULL, 405.5000, NULL, 0.00, '-', 'Place order #892', 'T10806', '2025-08-16 10:50:49', '2025-08-16 10:50:49'),
(977, NULL, NULL, 234, NULL, 81.1000, NULL, 0.00, '-', 'Place order #893', 'T10807', '2025-08-16 10:58:30', '2025-08-16 10:58:30'),
(978, NULL, NULL, 234, NULL, 81.1000, NULL, 0.00, '-', 'Place order #894', 'T10808', '2025-08-16 11:01:39', '2025-08-16 11:01:39'),
(979, NULL, NULL, 234, NULL, 101.4000, NULL, 0.00, '-', 'Place order #895', 'T10809', '2025-08-16 11:03:07', '2025-08-16 11:03:07'),
(980, NULL, 'bank', 358, NULL, 5000.0000, NULL, 0.00, '+', 'MBVCB.10576953652.5228BFTVG2QJXQ2Y.topsubre358.CT tu 1044876300 LUONG TRAN HUNG toi 15873021 LE VAN KHANH tai ACB GD 5228BFTVG2QJXQ2Y 160825-20:46:54', '10812', '2025-08-16 13:48:03', '2025-08-16 13:48:03'),
(981, NULL, NULL, 358, NULL, 1521.0000, NULL, 0.00, '-', 'Place order #896', 'T10813', '2025-08-16 13:50:50', '2025-08-16 13:50:50'),
(982, NULL, 'bank', 358, NULL, 10000.0000, NULL, 0.00, '+', 'MBVCB.10577038601.5228BFTVG2QJX98E.topsubre358.CT tu 1044876300 LUONG TRAN HUNG toi 15873021 LE VAN KHANH tai ACB GD 5228BFTVG2QJX98E 160825-20:54:12', '10813', '2025-08-16 13:55:03', '2025-08-16 13:55:03'),
(983, NULL, NULL, 358, NULL, 6337.5000, NULL, 0.00, '-', 'Place order #897', 'T10814', '2025-08-16 13:55:06', '2025-08-16 13:55:06'),
(984, NULL, NULL, 358, NULL, 3042.2700, NULL, 0.00, '-', 'Place order #898', 'T10815', '2025-08-16 13:58:12', '2025-08-16 13:58:12'),
(985, NULL, NULL, 358, NULL, 608.4000, NULL, 0.00, '-', 'Place order #899', 'T10816', '2025-08-16 13:59:28', '2025-08-16 13:59:28'),
(986, NULL, NULL, 358, NULL, 3042.0000, NULL, 0.00, '-', 'Place order #900', 'T10817', '2025-08-16 14:00:00', '2025-08-16 14:00:00'),
(987, NULL, NULL, 358, NULL, 3042.2700, NULL, 0.00, '+', 'Refund for canceled order 898', 'T10818', '2025-08-16 14:12:02', '2025-08-16 14:12:02'),
(988, NULL, NULL, 358, NULL, 3157.6000, NULL, 0.00, '-', 'Place order #901', 'T10819', '2025-08-16 15:27:28', '2025-08-16 15:27:28'),
(989, NULL, NULL, 304, NULL, 971.7500, NULL, 0.00, '-', 'Place order #904', 'T10820', '2025-08-17 23:38:02', '2025-08-17 23:38:02'),
(990, NULL, 'bank', 358, NULL, 5000.0000, NULL, 0.00, '+', 'MBVCB.10594047952.5230BFTVG2Q4BWUE.topsubre358.CT tu 1044876300 LUONG TRAN HUNG toi 15873021 LE VAN KHANH tai ACB GD 5230BFTVG2Q4BWUE 180825-11:43:08', '10845', '2025-08-18 04:45:01', '2025-08-18 04:45:01'),
(991, NULL, NULL, 358, NULL, 3042.2700, NULL, 0.00, '-', 'Place order #905', 'T10846', '2025-08-18 04:45:39', '2025-08-18 04:45:39'),
(992, NULL, NULL, 358, NULL, 2129.4000, NULL, 0.00, '-', 'Place order #906', 'T10847', '2025-08-18 04:47:30', '2025-08-18 04:47:30'),
(993, NULL, NULL, 358, NULL, 3042.2700, NULL, 0.00, '+', 'Refund for canceled order 905', 'T10848', '2025-08-18 04:48:02', '2025-08-18 04:48:02'),
(994, NULL, NULL, 358, NULL, 2122.3300, NULL, 0.00, '-', 'Place order #907', 'T10849', '2025-08-18 04:53:39', '2025-08-18 04:53:39'),
(995, NULL, 'bank', 102, NULL, 15200.0000, NULL, 0.00, '+', 'topsubre102 GD 181429-081925 02:10:56', '10861', '2025-08-18 19:11:00', '2025-08-18 19:11:00'),
(996, NULL, NULL, 102, NULL, 410.6700, NULL, 0.00, '-', 'Place order #908', 'T10862', '2025-08-18 19:11:16', '2025-08-18 19:11:16'),
(997, NULL, NULL, 102, NULL, 301.1580, NULL, 0.00, '-', 'Place order #909', 'T10863', '2025-08-18 19:12:16', '2025-08-18 19:12:16'),
(998, NULL, NULL, 102, NULL, 523.2240, NULL, 0.00, '-', 'Place order #910', 'T10864', '2025-08-18 19:20:14', '2025-08-18 19:20:14'),
(999, NULL, NULL, 102, NULL, 380.2500, NULL, 0.00, '-', 'Place order #911', 'T10865', '2025-08-18 19:23:29', '2025-08-18 19:23:29'),
(1000, NULL, NULL, 102, NULL, 479.6220, NULL, 0.00, '-', 'Place order #912', 'T10866', '2025-08-18 19:39:27', '2025-08-18 19:39:27'),
(1001, NULL, NULL, 102, NULL, 807.6510, NULL, 0.00, '-', 'Place order #913', 'T10867', '2025-08-18 19:41:28', '2025-08-18 19:41:28'),
(1002, NULL, NULL, 98, NULL, 3650.4000, NULL, 0.00, '-', 'Place order #914', 'T10868', '2025-08-19 22:53:50', '2025-08-19 22:53:50'),
(1003, NULL, NULL, 98, NULL, 6844.5000, NULL, 0.00, '-', 'Place order #915', 'T10869', '2025-08-19 22:55:42', '2025-08-19 22:55:42'),
(1004, NULL, NULL, 321, NULL, 1208.3500, NULL, 0.00, '-', 'Place order #916', 'T10870', '2025-08-20 02:48:59', '2025-08-20 02:48:59'),
(1005, NULL, NULL, 321, NULL, 1903.0000, NULL, 0.00, '-', 'Place order #917', 'T10871', '2025-08-20 02:51:55', '2025-08-20 02:51:55'),
(1006, NULL, 'bank', 361, NULL, 10000.0000, NULL, 0.00, '+', 'QR - topsubre361 GD 106532-082025 21:30:35', '10904', '2025-08-20 14:31:01', '2025-08-20 14:31:01'),
(1007, NULL, NULL, 361, NULL, 338.0000, NULL, 0.00, '-', 'Place order #918', 'T10905', '2025-08-20 14:34:55', '2025-08-20 14:34:55'),
(1008, NULL, NULL, 361, NULL, 3380.0000, NULL, 0.00, '-', 'Place order #919', 'T10906', '2025-08-20 14:44:18', '2025-08-20 14:44:18'),
(1009, NULL, NULL, 361, NULL, 1419.6000, NULL, 0.00, '-', 'Place order #920', 'T10907', '2025-08-20 15:03:17', '2025-08-20 15:03:17'),
(1010, NULL, NULL, 361, NULL, 676.0000, NULL, 0.00, '-', 'Place order #921', 'T10908', '2025-08-20 15:10:22', '2025-08-20 15:10:22'),
(1011, NULL, NULL, 361, NULL, 1419.6000, NULL, 0.00, '-', 'Place order #922', 'T10909', '2025-08-20 15:27:22', '2025-08-20 15:27:22'),
(1012, NULL, NULL, 18, NULL, 241000.0000, NULL, 0.00, '+', 'ok', 'T10910', '2025-08-21 00:37:16', '2025-08-21 00:37:16'),
(1013, NULL, NULL, 18, NULL, 4833.4000, NULL, 0.00, '-', 'Place order #923', 'T10911', '2025-08-21 00:37:28', '2025-08-21 00:37:28'),
(1014, NULL, NULL, 18, NULL, 4833.4000, NULL, 0.00, '-', 'Place order #924', 'T10912', '2025-08-21 00:37:50', '2025-08-21 00:37:50'),
(1015, NULL, NULL, 361, NULL, 50000.0000, NULL, 0.00, '+', 'ACB', 'T10913', '2025-08-21 06:18:21', '2025-08-21 06:18:21'),
(1016, NULL, NULL, 256, NULL, 62000.0000, NULL, 0.00, '+', 'ACB', 'T10914', '2025-08-21 06:19:25', '2025-08-21 06:19:25'),
(1017, NULL, NULL, 361, NULL, 6280.0400, NULL, 0.00, '-', 'Place order #925', 'T10915', '2025-08-21 06:21:35', '2025-08-21 06:21:35'),
(1018, NULL, NULL, 361, NULL, 4921.2800, NULL, 0.00, '-', 'Place order #926', 'T10916', '2025-08-21 07:02:02', '2025-08-21 07:02:02'),
(1019, NULL, NULL, 361, NULL, 21446.1000, NULL, 0.00, '-', 'Place order #928', 'T10917', '2025-08-21 07:44:19', '2025-08-21 07:44:19'),
(1020, NULL, NULL, 361, NULL, 6280.0400, NULL, 0.00, '-', 'Place order #929', 'T10918', '2025-08-21 07:57:37', '2025-08-21 07:57:37'),
(1021, NULL, NULL, 361, NULL, 6280.0400, NULL, 0.00, '+', 'Refund for canceled order 929', 'T10919', '2025-08-21 07:58:06', '2025-08-21 07:58:06'),
(1022, NULL, NULL, 361, NULL, 9227.4000, NULL, 0.00, '-', 'Place order #930', 'T10920', '2025-08-21 08:02:20', '2025-08-21 08:02:20'),
(1023, NULL, NULL, 361, NULL, 9227.4000, NULL, 0.00, '-', 'Place order #931', 'T10921', '2025-08-21 08:30:33', '2025-08-21 08:30:33'),
(1024, NULL, 'bank', 361, NULL, 30000.0000, NULL, 0.00, '+', 'QR - tsr361 GD 871604-082125 16:27:04', '10925', '2025-08-21 10:00:01', '2025-08-21 10:00:01'),
(1025, NULL, NULL, 361, NULL, 21446.1000, NULL, 0.00, '-', 'Place order #932', 'T10926', '2025-08-21 10:09:27', '2025-08-21 10:09:27'),
(1026, NULL, NULL, 361, NULL, 9227.4000, NULL, 0.00, '-', 'Place order #933', 'T10927', '2025-08-21 11:41:11', '2025-08-21 11:41:11'),
(1027, NULL, 'bank', 50, NULL, 30000.0000, NULL, 0.00, '+', 'tsr50 GD 022866-082225 11:35:59', '10940', '2025-08-22 04:35:57', '2025-08-22 04:35:57'),
(1028, NULL, 'bank', 361, NULL, 50000.0000, NULL, 0.00, '+', 'tsr361 GD 689113-082225 12:17:38', '10943', '2025-08-22 05:17:58', '2025-08-22 05:17:58'),
(1029, NULL, NULL, 361, NULL, 11534.2500, NULL, 0.00, '-', 'Place order #937', 'T10944', '2025-08-22 05:30:24', '2025-08-22 05:30:24'),
(1030, NULL, 'bank', 101, NULL, 61000.0000, NULL, 0.00, '+', 'QR - tsr101 GD 642405-082225 16:42:04', '10948', '2025-08-22 09:42:58', '2025-08-22 09:42:58'),
(1031, NULL, NULL, 101, NULL, 15226.9000, NULL, 0.00, '-', 'Place order #945', 'T10949', '2025-08-22 09:44:22', '2025-08-22 09:44:22'),
(1032, NULL, NULL, 101, NULL, 15700.1000, NULL, 0.00, '-', 'Place order #946', 'T10950', '2025-08-22 09:44:43', '2025-08-22 09:44:43'),
(1033, NULL, NULL, 101, NULL, 15226.9000, NULL, 0.00, '-', 'Place order #947', 'T10951', '2025-08-22 09:45:10', '2025-08-22 09:45:10'),
(1034, NULL, NULL, 101, NULL, 14922.3620, NULL, 0.00, '-', 'Place order #948', 'T10952', '2025-08-22 09:46:22', '2025-08-22 09:46:22'),
(1035, NULL, NULL, 361, NULL, 23068.5000, NULL, 0.00, '-', 'Place order #952', 'T10953', '2025-08-22 12:03:14', '2025-08-22 12:03:14'),
(1036, NULL, NULL, 90, NULL, 1690.0000, NULL, 0.00, '-', 'Place order #956', 'T10954', '2025-08-22 13:23:06', '2025-08-22 13:23:06'),
(1037, NULL, NULL, 361, NULL, 1419.6000, NULL, 0.00, '+', 'Refund for canceled order 920', 'T10955', '2025-08-22 15:04:58', '2025-08-22 15:04:58'),
(1038, NULL, NULL, 361, NULL, 1419.6000, NULL, 0.00, '+', 'Refund for canceled order 922', 'T10956', '2025-08-22 15:36:59', '2025-08-22 15:36:59'),
(1039, NULL, 'bank', 363, NULL, 20000.0000, NULL, 0.00, '+', 'tsr363 GD 314989-082225 22:40:52', '10963', '2025-08-22 15:40:59', '2025-08-22 15:40:59'),
(1040, NULL, NULL, 363, NULL, 8450.0000, NULL, 0.00, '-', 'Place order #957', 'T10964', '2025-08-22 15:44:11', '2025-08-22 15:44:11'),
(1041, NULL, NULL, 18, NULL, 4591.7300, NULL, 0.00, '+', 'Refund for partial order 923', 'T10965', '2025-08-22 22:56:58', '2025-08-22 22:56:58'),
(1042, NULL, NULL, 18, NULL, 4350.0600, NULL, 0.00, '+', 'Refund for partial order 924', 'T10966', '2025-08-22 22:56:58', '2025-08-22 22:56:58'),
(1043, NULL, 'bank', 321, NULL, 25007.0000, NULL, 0.00, '+', 'QR - tsr321 GD 749623-082325 11:51:13', '10974', '2025-08-23 04:51:57', '2025-08-23 04:51:57'),
(1044, NULL, NULL, 321, NULL, 1903.0000, NULL, 0.00, '-', 'Place order #958', 'T10975', '2025-08-23 04:53:57', '2025-08-23 04:53:57'),
(1045, NULL, NULL, 321, NULL, 999.7848, NULL, 0.00, '-', 'Place order #959', 'T10976', '2025-08-23 04:55:50', '2025-08-23 04:55:50'),
(1046, NULL, NULL, 321, NULL, 1521.0000, NULL, 0.00, '-', 'Place order #960', 'T10977', '2025-08-23 05:03:25', '2025-08-23 05:03:25'),
(1047, NULL, NULL, 321, NULL, 2999.5086, NULL, 0.00, '-', 'Place order #961', 'T10978', '2025-08-23 05:18:17', '2025-08-23 05:18:17'),
(1048, NULL, NULL, 250, NULL, 285.6100, NULL, 0.00, '-', 'Place order #962', 'T10979', '2025-08-23 07:40:20', '2025-08-23 07:40:20'),
(1049, NULL, 'bank', 20, NULL, 31000.0000, NULL, 0.00, '+', 'tsr20 GD 115779-082325 14:59:53', '10979', '2025-08-23 08:00:58', '2025-08-23 08:00:58'),
(1050, NULL, NULL, 20, NULL, 30453.8000, NULL, 0.00, '-', 'Place order #963', 'T10980', '2025-08-23 08:04:25', '2025-08-23 08:04:25'),
(1051, NULL, NULL, 250, NULL, 285.6100, NULL, 0.00, '-', 'Place order #964', 'T10981', '2025-08-23 09:47:24', '2025-08-23 09:47:24'),
(1052, NULL, NULL, 321, NULL, 1903.0000, NULL, 0.00, '-', 'Place order #965', 'T10982', '2025-08-23 13:19:13', '2025-08-23 13:19:13'),
(1053, NULL, NULL, 321, NULL, 1208.3500, NULL, 0.00, '-', 'Place order #966', 'T10983', '2025-08-23 13:19:45', '2025-08-23 13:19:45'),
(1054, NULL, NULL, 361, NULL, 13841.1000, NULL, 0.00, '-', 'Place order #967', 'T10984', '2025-08-23 14:27:57', '2025-08-23 14:27:57'),
(1055, NULL, 'bank', 90, NULL, 4000.0000, NULL, 0.00, '+', 'tsr90 GD 525977-082325 22:46:44', '10993', '2025-08-23 15:47:56', '2025-08-23 15:47:56'),
(1056, NULL, NULL, 90, NULL, 1690.0000, NULL, 0.00, '-', 'Place order #968', 'T10994', '2025-08-23 15:50:51', '2025-08-23 15:50:51'),
(1057, NULL, NULL, 90, NULL, 1690.0000, NULL, 0.00, '-', 'Place order #969', 'T10995', '2025-08-23 15:56:45', '2025-08-23 15:56:45'),
(1058, NULL, 'bank', 361, NULL, 40000.0000, NULL, 0.00, '+', 'QR - tsr361 GD 160039-082425 10:27:30', '11001', '2025-08-24 03:28:57', '2025-08-24 03:28:57'),
(1059, NULL, NULL, 361, NULL, 26499.2000, NULL, 0.00, '-', 'Place order #970', 'T11002', '2025-08-24 03:35:21', '2025-08-24 03:35:21'),
(1060, NULL, NULL, 361, NULL, 10325.9000, NULL, 0.00, '-', 'Place order #971', 'T11003', '2025-08-24 07:09:26', '2025-08-24 07:09:26'),
(1061, NULL, NULL, 361, NULL, 8260.7200, NULL, 0.00, '-', 'Place order #972', 'T11004', '2025-08-24 09:49:25', '2025-08-24 09:49:25'),
(1062, NULL, NULL, 90, NULL, 929.5000, NULL, 0.00, '-', 'Place order #976', 'T11005', '2025-08-24 10:39:27', '2025-08-24 10:39:27'),
(1063, NULL, 'bank', 256, NULL, 24000.0000, NULL, 0.00, '+', 'tsr256 GD 976421-082425 21:52:45', '11012', '2025-08-24 14:52:56', '2025-08-24 14:52:56'),
(1064, NULL, NULL, 20, NULL, 5840.6400, NULL, 0.00, '-', 'Place order #979', 'T11013', '2025-08-24 15:59:46', '2025-08-24 15:59:46'),
(1065, NULL, 'bank', 90, NULL, 10000.0000, NULL, 0.00, '+', 'tsr90 GD 195000-082525 06:29:06', '11020', '2025-08-24 23:29:54', '2025-08-24 23:29:54'),
(1066, NULL, NULL, 90, NULL, 3380.0000, NULL, 0.00, '-', 'Place order #982', 'T11021', '2025-08-24 23:32:55', '2025-08-24 23:32:55'),
(1067, NULL, NULL, 90, NULL, 3380.0000, NULL, 0.00, '-', 'Place order #983', 'T11022', '2025-08-24 23:33:53', '2025-08-24 23:33:53'),
(1068, NULL, NULL, 51, NULL, 11235.6608, NULL, 0.00, '+', 'Refund for partial order 729', 'T11023', '2025-08-25 08:16:54', '2025-08-25 08:16:54'),
(1069, NULL, 'bank', 250, NULL, 3000.0000, NULL, 0.00, '+', 'tsr250 GD 859750-082525 16:10:05', '11028', '2025-08-25 09:10:55', '2025-08-25 09:10:55'),
(1070, NULL, NULL, 250, NULL, 1014.0000, NULL, 0.00, '-', 'Place order #988', 'T11029', '2025-08-25 09:47:48', '2025-08-25 09:47:48'),
(1071, NULL, NULL, 250, NULL, 1419.6000, NULL, 0.00, '-', 'Place order #989', 'T11030', '2025-08-25 09:48:24', '2025-08-25 09:48:24'),
(1072, NULL, 'bank', 256, NULL, 35000.0000, NULL, 0.00, '+', 'tsr256 GD 983260-082525 21:07:25', '11033', '2025-08-25 14:08:56', '2025-08-25 14:08:56'),
(1073, NULL, 'bank', 361, NULL, 50000.0000, NULL, 0.00, '+', 'QR - tsr361 GD 150736-082525 21:11:01', '11035', '2025-08-25 14:10:56', '2025-08-25 14:10:56'),
(1074, NULL, NULL, 361, NULL, 3380.0000, NULL, 0.00, '-', 'Place order #995', 'T11036', '2025-08-25 14:14:04', '2025-08-25 14:14:04'),
(1075, NULL, NULL, 361, NULL, 13249.6000, NULL, 0.00, '-', 'Place order #996', 'T11037', '2025-08-25 14:25:39', '2025-08-25 14:25:39'),
(1076, NULL, 'bank', 256, NULL, 25000.0000, NULL, 0.00, '+', 'tsr256 GD 190475-082525 21:52:52', '11038', '2025-08-25 14:53:53', '2025-08-25 14:53:53'),
(1077, NULL, 'bank', 90, NULL, 20000.0000, NULL, 0.00, '+', 'tsr90 GD 719548-082625 08:17:37', '11048', '2025-08-26 01:17:56', '2025-08-26 01:17:56'),
(1078, NULL, NULL, 90, NULL, 5070.0000, NULL, 0.00, '-', 'Place order #1010', 'T11049', '2025-08-26 01:18:23', '2025-08-26 01:18:23'),
(1079, NULL, NULL, 90, NULL, 5070.0000, NULL, 0.00, '-', 'Place order #1011', 'T11050', '2025-08-26 01:19:04', '2025-08-26 01:19:04'),
(1080, NULL, NULL, 90, NULL, 3380.0000, NULL, 0.00, '-', 'Place order #1012', 'T11051', '2025-08-26 01:19:28', '2025-08-26 01:19:28'),
(1081, NULL, NULL, 361, NULL, 3974.8800, NULL, 0.00, '-', 'Place order #1013', 'T11052', '2025-08-26 07:26:17', '2025-08-26 07:26:17'),
(1082, NULL, NULL, 361, NULL, 3974.8800, NULL, 0.00, '+', 'Refund for canceled order 1013', 'T11053', '2025-08-26 07:27:51', '2025-08-26 07:27:51'),
(1083, NULL, 'bank', 50, NULL, 30000.0000, NULL, 0.00, '+', 'tsr50 FT25238250241517 GD 647671-082625 20:20:16', '11067', '2025-08-26 13:22:06', '2025-08-26 13:22:06'),
(1084, NULL, NULL, 51, NULL, 11248.6400, NULL, 0.00, '-', 'Place order #1020', 'T11068', '2025-08-26 15:21:14', '2025-08-26 15:21:14'),
(1085, NULL, NULL, 90, NULL, 5070.0000, NULL, 0.00, '-', 'Place order #1021', 'T11069', '2025-08-27 00:06:42', '2025-08-27 00:06:42'),
(1086, NULL, NULL, 90, NULL, 4647.5000, NULL, 0.00, '-', 'Place order #1022', 'T11070', '2025-08-27 04:54:36', '2025-08-27 04:54:36'),
(1087, NULL, NULL, 343, NULL, 91.2600, NULL, 0.00, '-', 'Place order #1023', 'T11071', '2025-08-27 07:18:38', '2025-08-27 07:18:38'),
(1088, NULL, NULL, 361, NULL, 3380.0000, NULL, 0.00, '-', 'Place order #1025', 'T11072', '2025-08-27 09:26:02', '2025-08-27 09:26:02'),
(1089, NULL, NULL, 361, NULL, 13249.6000, NULL, 0.00, '-', 'Place order #1026', 'T11073', '2025-08-27 09:32:13', '2025-08-27 09:32:13'),
(1090, NULL, 'bank', 368, NULL, 10000.0000, NULL, 0.00, '+', 'ZP252390723408 250827001173155 tsr368 GD 723408-082725 19:19:03', '11090', '2025-08-27 12:21:00', '2025-08-27 12:21:00'),
(1091, NULL, NULL, 368, NULL, 568.0000, NULL, 0.00, '-', 'Place order #1030', 'T11091', '2025-08-27 13:09:47', '2025-08-27 13:09:47'),
(1092, NULL, NULL, 368, NULL, 1704.0000, NULL, 0.00, '-', 'Place order #1031', 'T11092', '2025-08-27 13:24:22', '2025-08-27 13:24:22'),
(1093, NULL, NULL, 363, NULL, 6489.6000, NULL, 0.00, '-', 'Place order #1032', 'T11093', '2025-08-27 16:13:55', '2025-08-27 16:13:55'),
(1094, NULL, NULL, 368, NULL, 568.0000, NULL, 0.00, '-', 'Place order #1033', 'T11094', '2025-08-28 10:11:15', '2025-08-28 10:11:15'),
(1095, NULL, NULL, 363, NULL, 628.3420, NULL, 0.00, '-', 'Place order #1034', 'T11095', '2025-08-28 15:42:23', '2025-08-28 15:42:23'),
(1096, NULL, NULL, 363, NULL, 709.8000, NULL, 0.00, '-', 'Place order #1035', 'T11096', '2025-08-28 15:48:46', '2025-08-28 15:48:46'),
(1097, NULL, NULL, 250, NULL, 624.8000, NULL, 0.00, '-', 'Place order #1039', 'T11097', '2025-08-29 04:48:18', '2025-08-29 04:48:18'),
(1098, NULL, NULL, 368, NULL, 568.0000, NULL, 0.00, '-', 'Place order #1040', 'T11098', '2025-08-29 05:21:22', '2025-08-29 05:21:22'),
(1099, NULL, NULL, 102, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #1041', 'T11099', '2025-08-29 21:30:36', '2025-08-29 21:30:36'),
(1100, NULL, NULL, 256, NULL, 912.6000, NULL, 0.00, '+', 'Refund for canceled order 991', 'T11100', '2025-08-30 02:25:08', '2025-08-30 02:25:08'),
(1101, NULL, NULL, 331, NULL, 48.6000, NULL, 0.00, '+', 'Refund for canceled order 704', 'T11101', '2025-08-30 08:13:03', '2025-08-30 08:13:03'),
(1102, NULL, 'bank', 373, NULL, 45000.0000, NULL, 0.00, '+', 'tsr373 GD 168408-083125 08:49:09', '11191', '2025-08-31 01:51:48', '2025-08-31 01:51:48'),
(1103, NULL, NULL, 373, NULL, 30706.3000, NULL, 0.00, '-', 'Place order #1042', 'T11192', '2025-08-31 01:53:41', '2025-08-31 01:53:41'),
(1104, NULL, NULL, 373, NULL, 14124.8980, NULL, 0.00, '-', 'Place order #1043', 'T11193', '2025-08-31 07:11:46', '2025-08-31 07:11:46'),
(1105, NULL, NULL, 361, NULL, 4921.2800, NULL, 0.00, '+', 'Refund for canceled order 926', 'T11194', '2025-09-01 14:45:04', '2025-09-01 14:45:04'),
(1106, NULL, 'bank', 373, NULL, 15000.0000, NULL, 0.00, '+', 'tsr373 GD 392193-090125 21:48:40', '11234', '2025-09-01 14:50:36', '2025-09-01 14:50:36'),
(1107, NULL, 'bank', 250, NULL, 2000.0000, NULL, 0.00, '+', '99462855528-01677830495-tsr250', '11236', '2025-09-01 15:32:56', '2025-09-01 15:32:56'),
(1108, NULL, NULL, 250, NULL, 304.2000, NULL, 0.00, '-', 'Place order #1044', 'T11237', '2025-09-01 15:33:26', '2025-09-01 15:33:26'),
(1109, NULL, NULL, 250, NULL, 283.9200, NULL, 0.00, '-', 'Place order #1045', 'T11238', '2025-09-01 15:33:58', '2025-09-01 15:33:58'),
(1110, NULL, NULL, 250, NULL, 10.0380, NULL, 0.00, '-', 'Place order #1046', 'T11239', '2025-09-01 15:34:21', '2025-09-01 15:34:21'),
(1111, NULL, NULL, 250, NULL, 65.9100, NULL, 0.00, '-', 'Place order #1047', 'T11240', '2025-09-01 15:35:25', '2025-09-01 15:35:25'),
(1112, NULL, NULL, 250, NULL, 126.7500, NULL, 0.00, '-', 'Place order #1048', 'T11241', '2025-09-01 15:46:54', '2025-09-01 15:46:54'),
(1113, NULL, NULL, 50, NULL, 6084.0000, NULL, 0.00, '+', 'Refund for partial order 1049', 'T11242', '2025-09-01 20:48:29', '2025-09-01 20:48:29'),
(1114, NULL, 'bank', 50, NULL, 43000.0000, NULL, 0.00, '+', 'tsr50 GD 129341-090225 03:49:28', '11244', '2025-09-01 20:50:33', '2025-09-01 20:50:33'),
(1115, NULL, 'bank', 50, NULL, 30000.0000, NULL, 0.00, '+', 'tsr50 GD 143344-090225 04:03:56', '11245', '2025-09-01 21:07:36', '2025-09-01 21:07:36'),
(1116, NULL, NULL, 50, NULL, 30876.3000, NULL, 0.00, '-', 'Place order #1052', 'T11246', '2025-09-01 21:08:50', '2025-09-01 21:08:50'),
(1117, NULL, 'bank', 357, NULL, 15000.0000, NULL, 0.00, '+', 'MBVCB.10764065039.5245BFTVG2AEQG67.tsr357.CT tu 1026204778 TRAN THANH CONG toi 15873021 LE VAN KHANH tai ACB GD 218198-090225 07:08:27', '11247', '2025-09-02 00:08:48', '2025-09-02 00:08:48'),
(1118, NULL, NULL, 357, NULL, 9078.6850, NULL, 0.00, '-', 'Place order #1053', 'T11248', '2025-09-02 00:10:42', '2025-09-02 00:10:42'),
(1119, NULL, NULL, 357, NULL, 5948.8000, NULL, 0.00, '-', 'Place order #1054', 'T11249', '2025-09-02 00:12:44', '2025-09-02 00:12:44'),
(1120, NULL, NULL, 373, NULL, 6489.6000, NULL, 0.00, '-', 'Place order #1055', 'T11250', '2025-09-02 01:49:12', '2025-09-02 01:49:12'),
(1121, NULL, NULL, 357, NULL, 202.8000, NULL, 0.00, '-', 'Place order #1056', 'T11251', '2025-09-02 02:13:04', '2025-09-02 02:13:04'),
(1122, NULL, 'bank', 357, NULL, 13000.0000, NULL, 0.00, '+', 'MBVCB.10765131549.5245BFTVG2AEF4XK.tsr357.CT tu 1026204778 TRAN THANH CONG toi 15873021 LE VAN KHANH tai ACB GD 937197-090225 09:16:21', '11250', '2025-09-02 02:19:56', '2025-09-02 02:19:56'),
(1123, NULL, NULL, 357, NULL, 638.8200, NULL, 0.00, '-', 'Place order #1057', 'T11252', '2025-09-02 02:20:03', '2025-09-02 02:20:03'),
(1124, NULL, NULL, 357, NULL, 3832.9200, NULL, 0.00, '-', 'Place order #1058', 'T11253', '2025-09-02 02:20:29', '2025-09-02 02:20:29'),
(1125, NULL, NULL, 357, NULL, 6500.9450, NULL, 0.00, '-', 'Place order #1059', 'T11254', '2025-09-02 02:24:03', '2025-09-02 02:24:03'),
(1126, NULL, NULL, 357, NULL, 827.3930, NULL, 0.00, '-', 'Place order #1060', 'T11255', '2025-09-02 02:26:26', '2025-09-02 02:26:26'),
(1127, NULL, NULL, 373, NULL, 6489.6000, NULL, 0.00, '-', 'Place order #1061', 'T11256', '2025-09-02 02:58:57', '2025-09-02 02:58:57'),
(1128, NULL, NULL, 357, NULL, 3832.9200, NULL, 0.00, '+', 'Refund for canceled order 1058', 'T11257', '2025-09-02 15:58:56', '2025-09-02 15:58:56'),
(1129, NULL, NULL, 250, NULL, 568.0000, NULL, 0.00, '-', 'Place order #1062', 'T11258', '2025-09-04 02:34:43', '2025-09-04 02:34:43'),
(1130, NULL, NULL, 250, NULL, 401.5000, NULL, 0.00, '-', 'Place order #1063', 'T11259', '2025-09-04 02:35:28', '2025-09-04 02:35:28'),
(1131, NULL, NULL, 250, NULL, 270.7380, NULL, 0.00, '-', 'Place order #1064', 'T11260', '2025-09-04 03:11:12', '2025-09-04 03:11:12'),
(1132, NULL, NULL, 357, NULL, 638.8200, NULL, 0.00, '+', 'Refund for canceled order 1057', 'T11261', '2025-09-05 02:09:41', '2025-09-05 02:09:41');
INSERT INTO `transactions` (`id`, `transactional_id`, `transactional_type`, `user_id`, `child_panel_id`, `amount`, `balance`, `charge`, `trx_type`, `remarks`, `trx_id`, `created_at`, `updated_at`) VALUES
(1133, NULL, NULL, 50, NULL, 30876.3000, NULL, 0.00, '+', 'Refund for canceled order 1052', 'T11262', '2025-09-05 09:17:58', '2025-09-05 09:17:58'),
(1134, NULL, 'bank', 20, NULL, 19821.0000, NULL, 0.00, '+', 'tsr20 GD 031963-090525 21:08:47', '11349', '2025-09-05 14:12:38', '2025-09-05 14:12:38'),
(1135, NULL, NULL, 20, NULL, 15404.3500, NULL, 0.00, '-', 'Place order #1065', 'T11350', '2025-09-05 14:13:25', '2025-09-05 14:13:25'),
(1136, NULL, NULL, 20, NULL, 15404.3500, NULL, 0.00, '+', 'Refund for canceled order 1065', 'T11351', '2025-09-05 14:14:57', '2025-09-05 14:14:57'),
(1137, NULL, NULL, 361, NULL, 13942.5000, NULL, 0.00, '-', 'Place order #1066', 'T11352', '2025-09-06 05:09:43', '2025-09-06 05:09:43'),
(1138, NULL, NULL, 361, NULL, 1324.9600, NULL, 0.00, '-', 'Place order #1067', 'T11353', '2025-09-06 14:28:50', '2025-09-06 14:28:50'),
(1139, NULL, NULL, 361, NULL, 887.2500, NULL, 0.00, '-', 'Place order #1068', 'T11354', '2025-09-06 14:33:11', '2025-09-06 14:33:11'),
(1140, NULL, NULL, 361, NULL, 887.2500, NULL, 0.00, '+', 'Refund for canceled order 1068', 'T11355', '2025-09-06 14:35:43', '2025-09-06 14:35:43'),
(1141, NULL, NULL, 361, NULL, 4647.5000, NULL, 0.00, '-', 'Place order #1069', 'T11356', '2025-09-06 15:26:36', '2025-09-06 15:26:36'),
(1142, NULL, 'bank', 361, NULL, 100000.0000, NULL, 0.00, '+', 'tsr361 FT25251210506601 GD 457456-090625 22:30:02', '11374', '2025-09-06 15:30:41', '2025-09-06 15:30:41'),
(1143, NULL, NULL, 361, NULL, 1277.6400, NULL, 0.00, '-', 'Place order #1070', 'T11375', '2025-09-06 15:34:03', '2025-09-06 15:34:03'),
(1144, NULL, NULL, 50, NULL, 2028.0000, NULL, 0.00, '-', 'Place order #1071', 'T11376', '2025-09-06 21:37:45', '2025-09-06 21:37:45'),
(1145, NULL, NULL, 20, NULL, 15404.3500, NULL, 0.00, '-', 'Place order #1074', 'T11377', '2025-09-07 02:02:29', '2025-09-07 02:02:29'),
(1146, NULL, NULL, 361, NULL, 23237.5000, NULL, 0.00, '-', 'Place order #1075', 'T11378', '2025-09-07 04:19:14', '2025-09-07 04:19:14'),
(1147, NULL, NULL, 361, NULL, 1297.9200, NULL, 0.00, '-', 'Place order #1076', 'T11379', '2025-09-07 06:04:23', '2025-09-07 06:04:23'),
(1148, NULL, NULL, 361, NULL, 338.0000, NULL, 0.00, '-', 'Place order #1077', 'T11380', '2025-09-07 06:17:27', '2025-09-07 06:17:27'),
(1149, NULL, NULL, 361, NULL, 13249.6000, NULL, 0.00, '-', 'Place order #1078', 'T11381', '2025-09-07 06:20:11', '2025-09-07 06:20:11'),
(1150, NULL, NULL, 361, NULL, 3380.0000, NULL, 0.00, '-', 'Place order #1079', 'T11382', '2025-09-07 06:57:50', '2025-09-07 06:57:50'),
(1151, NULL, NULL, 361, NULL, 4647.5000, NULL, 0.00, '+', 'Refund for canceled order 1069', 'T11383', '2025-09-07 08:20:49', '2025-09-07 08:20:49'),
(1152, NULL, NULL, 361, NULL, 1277.6400, NULL, 0.00, '+', 'Refund for canceled order 1070', 'T11384', '2025-09-07 08:20:49', '2025-09-07 08:20:49'),
(1153, NULL, 'bank', 379, NULL, 88000.0000, NULL, 0.00, '+', 'tsr379 GD 679271-090825 13:08:27', '11419', '2025-09-08 06:09:02', '2025-09-08 06:09:02'),
(1154, NULL, NULL, 379, NULL, 29270.8000, NULL, 0.00, '-', 'Place order #1080', 'T11420', '2025-09-08 06:12:05', '2025-09-08 06:12:05'),
(1155, NULL, NULL, 379, NULL, 29270.8000, NULL, 0.00, '-', 'Place order #1081', 'T11421', '2025-09-08 06:40:17', '2025-09-08 06:40:17'),
(1156, NULL, NULL, 361, NULL, 13249.6000, NULL, 0.00, '-', 'Place order #1082', 'T11422', '2025-09-08 13:16:42', '2025-09-08 13:16:42'),
(1157, NULL, NULL, 361, NULL, 1324.9600, NULL, 0.00, '-', 'Place order #1083', 'T11423', '2025-09-08 13:19:16', '2025-09-08 13:19:16'),
(1158, NULL, NULL, 230, NULL, 1268.0000, NULL, 0.00, '-', 'Place order #1084', 'T11424', '2025-09-09 03:34:32', '2025-09-09 03:34:32'),
(1159, NULL, NULL, 361, NULL, 648.9600, NULL, 0.00, '-', 'Place order #1085', 'T11425', '2025-09-09 04:10:49', '2025-09-09 04:10:49'),
(1160, NULL, NULL, 361, NULL, 648.9600, NULL, 0.00, '-', 'Place order #1086', 'T11426', '2025-09-09 04:26:19', '2025-09-09 04:26:19'),
(1161, NULL, NULL, 379, NULL, 29270.8000, NULL, 0.00, '-', 'Place order #1087', 'T11427', '2025-09-09 05:03:10', '2025-09-09 05:03:10'),
(1162, NULL, NULL, 361, NULL, 648.9600, NULL, 0.00, '+', 'Refund for canceled order 1085', 'T11428', '2025-09-09 05:30:03', '2025-09-09 05:30:03'),
(1163, NULL, NULL, 361, NULL, 648.9600, NULL, 0.00, '+', 'Refund for canceled order 1086', 'T11429', '2025-09-09 05:30:03', '2025-09-09 05:30:03'),
(1164, NULL, NULL, 250, NULL, 36.5000, NULL, 0.00, '+', 'Refund for canceled order 829', 'T11430', '2025-09-09 07:45:02', '2025-09-09 07:45:02'),
(1165, NULL, NULL, 361, NULL, 27885.0000, NULL, 0.00, '-', 'Place order #1088', 'T11431', '2025-09-09 09:13:48', '2025-09-09 09:13:48'),
(1166, NULL, NULL, 62, NULL, 19435.0000, NULL, 0.00, '-', 'Place order #1089', 'T11432', '2025-09-10 08:03:57', '2025-09-10 08:03:57'),
(1167, NULL, 'bank', 20, NULL, 35000.0000, NULL, 0.00, '+', 'tsr20 GD 190168-091025 21:11:49', '11470', '2025-09-10 14:12:02', '2025-09-10 14:12:02'),
(1168, NULL, NULL, 20, NULL, 36720.0000, NULL, 0.00, '-', 'Place order #1090', 'T11471', '2025-09-10 14:12:39', '2025-09-10 14:12:39'),
(1169, NULL, NULL, 20, NULL, 36531.8100, NULL, 0.00, '+', 'Refund for partial order 1090', 'T11472', '2025-09-11 04:26:14', '2025-09-11 04:26:14'),
(1170, NULL, 'bank', 101, NULL, 100000.0000, NULL, 0.00, '+', 'QR - tsr101 GD 443651-091225 07:43:59', '11496', '2025-09-12 00:44:18', '2025-09-12 00:44:18'),
(1171, NULL, NULL, 101, NULL, 29744.0000, NULL, 0.00, '-', 'Place order #1091', 'T11497', '2025-09-12 00:45:49', '2025-09-12 00:45:49'),
(1172, NULL, NULL, 101, NULL, 8923.2000, NULL, 0.00, '-', 'Place order #1092', 'T11498', '2025-09-12 01:40:12', '2025-09-12 01:40:12'),
(1173, NULL, NULL, 101, NULL, 8923.2000, NULL, 0.00, '-', 'Place order #1093', 'T11499', '2025-09-12 01:40:39', '2025-09-12 01:40:39'),
(1174, NULL, NULL, 101, NULL, 11897.6000, NULL, 0.00, '-', 'Place order #1094', 'T11500', '2025-09-12 01:41:06', '2025-09-12 01:41:06'),
(1175, NULL, NULL, 101, NULL, 9242.6100, NULL, 0.00, '-', 'Place order #1095', 'T11501', '2025-09-12 01:46:30', '2025-09-12 01:46:30'),
(1176, NULL, NULL, 101, NULL, 8923.2000, NULL, 0.00, '-', 'Place order #1096', 'T11502', '2025-09-12 01:46:51', '2025-09-12 01:46:51'),
(1177, NULL, NULL, 101, NULL, 8923.2000, NULL, 0.00, '-', 'Place order #1097', 'T11503', '2025-09-12 01:47:40', '2025-09-12 01:47:40'),
(1178, NULL, NULL, 101, NULL, 13401.7845, NULL, 0.00, '-', 'Place order #1098', 'T11504', '2025-09-12 01:48:46', '2025-09-12 01:48:46'),
(1179, NULL, NULL, 361, NULL, 11618.7500, NULL, 0.00, '-', 'Place order #1099', 'T11505', '2025-09-12 06:48:07', '2025-09-12 06:48:07'),
(1180, NULL, 'bank', 373, NULL, 25000.0000, NULL, 0.00, '+', 'tsr373 GD 352376-091325 09:28:05', '11517', '2025-09-13 02:29:01', '2025-09-13 02:29:01'),
(1181, NULL, NULL, 373, NULL, 25939.1000, NULL, 0.00, '-', 'Place order #1100', 'T11518', '2025-09-13 03:40:43', '2025-09-13 03:40:43'),
(1182, NULL, 'bank', 379, NULL, 58542.0000, NULL, 0.00, '+', 'tsr379 GD 965357-091425 11:28:48', '11535', '2025-09-14 04:29:03', '2025-09-14 04:29:03'),
(1183, NULL, NULL, 379, NULL, 58541.6000, NULL, 0.00, '-', 'Place order #1101', 'T11536', '2025-09-14 04:45:36', '2025-09-14 04:45:36'),
(1184, NULL, 'bank', 385, NULL, 60000.0000, NULL, 0.00, '+', 'tsr385 GD 751754-091425 20:53:27', '11547', '2025-09-14 13:54:04', '2025-09-14 13:54:04'),
(1185, NULL, NULL, 385, NULL, 59488.0000, NULL, 0.00, '-', 'Place order #1102', 'T11548', '2025-09-14 13:55:06', '2025-09-14 13:55:06'),
(1186, NULL, 'bank', 373, NULL, 26000.0000, NULL, 0.00, '+', 'tsr373 GD 183944-091525 12:54:46', '11555', '2025-09-15 05:55:03', '2025-09-15 05:55:03'),
(1187, NULL, NULL, 98, NULL, 100000.0000, NULL, 0.00, '+', 'ACB', 'T11556', '2025-09-15 07:56:48', '2025-09-15 07:56:48'),
(1188, NULL, NULL, 98, NULL, 12168.0000, NULL, 0.00, '-', 'Place order #1103', 'T11557', '2025-09-15 07:57:03', '2025-09-15 07:57:03'),
(1189, NULL, NULL, 98, NULL, 6844.5000, NULL, 0.00, '-', 'Place order #1104', 'T11558', '2025-09-15 07:59:16', '2025-09-15 07:59:16'),
(1190, NULL, 'bank', 385, NULL, 60000.0000, NULL, 0.00, '+', 'tsr385 GD 467750-091525 21:24:56', '11567', '2025-09-15 14:25:04', '2025-09-15 14:25:04'),
(1191, NULL, NULL, 385, NULL, 59488.0000, NULL, 0.00, '-', 'Place order #1105', 'T11568', '2025-09-15 14:25:54', '2025-09-15 14:25:54'),
(1192, NULL, NULL, 373, NULL, 27236.0550, NULL, 0.00, '-', 'Place order #1106', 'T11569', '2025-09-15 15:07:59', '2025-09-15 15:07:59'),
(1193, NULL, NULL, 361, NULL, 9295.0000, NULL, 0.00, '-', 'Place order #1107', 'T11570', '2025-09-16 11:17:45', '2025-09-16 11:17:45'),
(1194, NULL, 'bank', 379, NULL, 29271.0000, NULL, 0.00, '+', 'tsr379 GD 041167-091625 21:03:25', '11587', '2025-09-16 14:04:05', '2025-09-16 14:04:05'),
(1195, NULL, NULL, 379, NULL, 9366.6560, NULL, 0.00, '-', 'Place order #1108', 'T11588', '2025-09-16 14:04:48', '2025-09-16 14:04:48'),
(1196, NULL, NULL, 379, NULL, 9366.6560, NULL, 0.00, '-', 'Place order #1109', 'T11589', '2025-09-16 14:05:32', '2025-09-16 14:05:32'),
(1197, NULL, NULL, 379, NULL, 9659.3640, NULL, 0.00, '-', 'Place order #1110', 'T11590', '2025-09-16 14:06:29', '2025-09-16 14:06:29'),
(1198, NULL, 'bank', 231, NULL, 20000.0000, NULL, 0.00, '+', 'MBVCB.10987810432.5262BFTVG2B5DIQJ.tsr231.CT tu 9354578704 NGUYEN ANH NGOC toi 15873021 LE VAN KHANH tai ACB GD 675849-091925 19:35:50', '11652', '2025-09-19 12:36:12', '2025-09-19 12:36:12'),
(1199, NULL, NULL, 231, NULL, 20388.1326, NULL, 0.00, '-', 'Place order #1111', 'T11653', '2025-09-19 12:39:00', '2025-09-19 12:39:00'),
(1200, NULL, NULL, 379, NULL, 9366.6560, NULL, 0.00, '+', 'Refund for canceled order 1108', 'T11654', '2025-09-19 16:56:26', '2025-09-19 16:56:26'),
(1201, NULL, NULL, 379, NULL, 9366.6560, NULL, 0.00, '+', 'Refund for canceled order 1109', 'T11655', '2025-09-19 16:56:26', '2025-09-19 16:56:26'),
(1202, NULL, NULL, 379, NULL, 9659.3640, NULL, 0.00, '+', 'Refund for canceled order 1110', 'T11656', '2025-09-19 16:56:26', '2025-09-19 16:56:26'),
(1203, NULL, 'bank', 321, NULL, 24000.0000, NULL, 0.00, '+', 'QR - tsr321 GD 436734-092025 16:46:07', '11668', '2025-09-20 09:47:03', '2025-09-20 09:47:03'),
(1204, NULL, NULL, 321, NULL, 33975.8970, NULL, 0.00, '-', 'Place order #1137', 'T11669', '2025-09-20 09:50:14', '2025-09-20 09:50:14'),
(1205, NULL, NULL, 321, NULL, 1355.5300, NULL, 0.00, '-', 'Place order #1138', 'T11670', '2025-09-20 13:10:54', '2025-09-20 13:10:54'),
(1206, NULL, NULL, 321, NULL, 16266.3600, NULL, 0.00, '-', 'Place order #1139', 'T11671', '2025-09-20 13:23:36', '2025-09-20 13:23:36'),
(1207, NULL, 'bank', 321, NULL, 50000.0000, NULL, 0.00, '+', 'QR - tsr321 GD 098321-092125 07:47:27', '11680', '2025-09-21 00:48:11', '2025-09-21 00:48:11'),
(1208, NULL, NULL, 321, NULL, 13555.3000, NULL, 0.00, '-', 'Place order #1140', 'T11681', '2025-09-21 00:49:01', '2025-09-21 00:49:01'),
(1209, NULL, NULL, 321, NULL, 3448.0000, NULL, 0.00, '-', 'Place order #1141', 'T11682', '2025-09-21 01:40:49', '2025-09-21 01:40:49'),
(1210, NULL, NULL, 321, NULL, 3448.0000, NULL, 0.00, '-', 'Place order #1142', 'T11683', '2025-09-21 01:43:28', '2025-09-21 01:43:28'),
(1211, NULL, NULL, 321, NULL, 3524.3780, NULL, 0.00, '-', 'Place order #1143', 'T11684', '2025-09-23 10:24:57', '2025-09-23 10:24:57'),
(1212, NULL, 'bank', 250, NULL, 4000.0000, NULL, 0.00, '+', '101743925341-01677830495-tsr250', '11736', '2025-09-23 19:01:04', '2025-09-23 19:01:04'),
(1213, NULL, NULL, 250, NULL, 2230.8000, NULL, 0.00, '-', 'Place order #1144', 'T11737', '2025-09-23 19:04:08', '2025-09-23 19:04:08'),
(1214, NULL, NULL, 250, NULL, 709.8000, NULL, 0.00, '-', 'Place order #1145', 'T11738', '2025-09-23 19:04:32', '2025-09-23 19:04:32'),
(1215, NULL, NULL, 250, NULL, 1014.0000, NULL, 0.00, '-', 'Place order #1146', 'T11739', '2025-09-23 19:36:06', '2025-09-23 19:36:06'),
(1216, NULL, 'bank', 250, NULL, 2000.0000, NULL, 0.00, '+', '101761923892-01677830495-tsr250', '11743', '2025-09-23 22:27:04', '2025-09-23 22:27:04'),
(1217, NULL, NULL, 250, NULL, 1987.4400, NULL, 0.00, '-', 'Place order #1147', 'T11744', '2025-09-23 22:27:36', '2025-09-23 22:27:36'),
(1218, NULL, 'bank', 373, NULL, 20000.0000, NULL, 0.00, '+', 'tsr373 GD 793948-092425 02:30:09', '11746', '2025-09-24 02:31:03', '2025-09-24 02:31:03'),
(1219, NULL, NULL, 373, NULL, 3070.6300, NULL, 0.00, '-', 'Place order #1148', 'T11747', '2025-09-24 02:32:22', '2025-09-24 02:32:22'),
(1220, NULL, NULL, 373, NULL, 7436.0000, NULL, 0.00, '-', 'Place order #1149', 'T11748', '2025-09-24 02:37:37', '2025-09-24 02:37:37'),
(1221, NULL, 'bank', 390, NULL, 6000.0000, NULL, 0.00, '+', 'QR - tsr390 GD 835733-092425 06:21:21', '11747', '2025-09-24 06:22:04', '2025-09-24 06:22:04'),
(1222, NULL, NULL, 390, NULL, 4066.5900, NULL, 0.00, '-', 'Place order #1150', 'T11749', '2025-09-24 06:24:06', '2025-09-24 06:24:06'),
(1223, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1151', 'T11750', '2025-09-24 06:43:00', '2025-09-24 06:43:00'),
(1224, NULL, NULL, 373, NULL, 3422.2500, NULL, 0.00, '-', 'Place order #1152', 'T11751', '2025-09-24 18:26:19', '2025-09-24 18:26:19'),
(1225, NULL, NULL, 373, NULL, 2053.3500, NULL, 0.00, '-', 'Place order #1153', 'T11752', '2025-09-24 18:26:58', '2025-09-24 18:26:58'),
(1226, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1154', 'T11753', '2025-09-25 00:28:03', '2025-09-25 00:28:03'),
(1227, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1155', 'T11754', '2025-09-25 00:28:50', '2025-09-25 00:28:50'),
(1228, NULL, NULL, 230, NULL, 421.8000, NULL, 0.00, '-', 'Place order #1156', 'T11755', '2025-09-25 18:41:30', '2025-09-25 18:41:30'),
(1229, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1157', 'T11756', '2025-09-26 00:23:48', '2025-09-26 00:23:48'),
(1230, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1158', 'T11757', '2025-09-26 00:40:21', '2025-09-26 00:40:21'),
(1231, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1159', 'T11758', '2025-09-27 00:26:11', '2025-09-27 00:26:11'),
(1232, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1160', 'T11759', '2025-09-27 00:26:50', '2025-09-27 00:26:50'),
(1233, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1161', 'T11760', '2025-09-28 09:41:04', '2025-09-28 09:41:04'),
(1234, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1162', 'T11761', '2025-09-28 09:45:04', '2025-09-28 09:45:04'),
(1235, NULL, 'bank', 361, NULL, 50000.0000, NULL, 0.00, '+', 'tsr361 FT25272857232206 GD 072373-092825 12:15:30', '11820', '2025-09-28 12:16:03', '2025-09-28 12:16:03'),
(1236, NULL, NULL, 361, NULL, 18454.8000, NULL, 0.00, '-', 'Place order #1163', 'T11821', '2025-09-28 12:21:13', '2025-09-28 12:21:13'),
(1237, NULL, NULL, 230, NULL, 651.0000, NULL, 0.00, '-', 'Place order #1164', 'T11822', '2025-09-28 18:35:50', '2025-09-28 18:35:50'),
(1238, NULL, NULL, 361, NULL, 18454.8000, NULL, 0.00, '-', 'Place order #1165', 'T11823', '2025-09-28 22:53:34', '2025-09-28 22:53:34'),
(1239, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1166', 'T11824', '2025-09-29 00:43:56', '2025-09-29 00:43:56'),
(1240, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1167', 'T11825', '2025-09-29 00:44:30', '2025-09-29 00:44:30'),
(1241, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1168', 'T11826', '2025-09-29 06:23:15', '2025-09-29 06:23:15'),
(1242, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1169', 'T11827', '2025-09-30 00:40:51', '2025-09-30 00:40:51'),
(1243, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1170', 'T11828', '2025-09-30 00:41:51', '2025-09-30 00:41:51'),
(1244, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '+', 'Refund for canceled order 1169', 'T11829', '2025-09-30 00:47:05', '2025-09-30 00:47:05'),
(1245, NULL, NULL, 390, NULL, 52.0520, NULL, 0.00, '-', 'Place order #1171', 'T11830', '2025-09-30 05:42:36', '2025-09-30 05:42:36'),
(1246, NULL, NULL, 390, NULL, 52.0520, NULL, 0.00, '-', 'Place order #1172', 'T11831', '2025-09-30 05:43:04', '2025-09-30 05:43:04'),
(1247, NULL, NULL, 361, NULL, 9624.9000, NULL, 0.00, '-', 'Place order #1173', 'T11832', '2025-09-30 08:24:40', '2025-09-30 08:24:40'),
(1248, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1174', 'T11833', '2025-09-30 18:11:51', '2025-09-30 18:11:51'),
(1249, NULL, NULL, 390, NULL, 14.1960, NULL, 0.00, '-', 'Place order #1175', 'T11834', '2025-09-30 18:12:33', '2025-09-30 18:12:33'),
(1250, NULL, NULL, 20, NULL, 4173.6240, NULL, 0.00, '-', 'Place order #1176', 'T11835', '2025-10-01 08:30:37', '2025-10-01 08:30:37'),
(1251, NULL, NULL, 20, NULL, 4173.6240, NULL, 0.00, '+', 'Refund for canceled order 1176', 'T11836', '2025-10-01 08:31:04', '2025-10-01 08:31:04'),
(1252, NULL, NULL, 20, NULL, 3861.3120, NULL, 0.00, '-', 'Place order #1177', 'T11837', '2025-10-01 08:32:12', '2025-10-01 08:32:12'),
(1253, NULL, NULL, 20, NULL, 3552.8759, NULL, 0.00, '-', 'Place order #1178', 'T11838', '2025-10-01 08:33:22', '2025-10-01 08:33:22'),
(1254, NULL, NULL, 20, NULL, 3861.3120, NULL, 0.00, '+', 'Refund for canceled order 1177', 'T11839', '2025-10-01 08:33:34', '2025-10-01 08:33:34'),
(1255, NULL, 'bank', 240, NULL, 5000.0000, NULL, 0.00, '+', 'tsr240 GD 130952-100225 19:50:19', '11891', '2025-10-02 19:51:03', '2025-10-02 19:51:03'),
(1256, NULL, NULL, 102, NULL, 684.4500, NULL, 0.00, '-', 'Place order #1179', 'T11892', '2025-10-02 19:56:05', '2025-10-02 19:56:05'),
(1257, NULL, NULL, 240, NULL, 4932.0960, NULL, 0.00, '-', 'Place order #1180', 'T11893', '2025-10-02 19:57:37', '2025-10-02 19:57:37'),
(1258, NULL, 'bank', 250, NULL, 2000.0000, NULL, 0.00, '+', 'tsr250 GD 187685-100325 21:57:39', '11924', '2025-10-03 21:58:03', '2025-10-03 21:58:03'),
(1259, NULL, NULL, 250, NULL, 709.8000, NULL, 0.00, '-', 'Place order #1181', 'T11925', '2025-10-03 21:58:33', '2025-10-03 21:58:33'),
(1260, NULL, NULL, 250, NULL, 1373.4900, NULL, 0.00, '-', 'Place order #1182', 'T11926', '2025-10-03 21:59:32', '2025-10-03 21:59:32'),
(1261, NULL, 'bank', 250, NULL, 2000.0000, NULL, 0.00, '+', 'tsr250 GD 461031-100525 19:00:19', '11959', '2025-10-05 19:03:03', '2025-10-05 19:03:03'),
(1262, NULL, NULL, 250, NULL, 709.8000, NULL, 0.00, '-', 'Place order #1183', 'T11960', '2025-10-05 19:03:34', '2025-10-05 19:03:34'),
(1263, NULL, NULL, 234, NULL, 70.4700, NULL, 0.00, '-', 'Place order #1184', 'T11961', '2025-10-06 08:12:47', '2025-10-06 08:12:47'),
(1264, NULL, NULL, 234, NULL, 24.6064, NULL, 0.00, '-', 'Place order #1185', 'T11962', '2025-10-06 08:14:34', '2025-10-06 08:14:34'),
(1265, NULL, NULL, 234, NULL, 260.9520, NULL, 0.00, '-', 'Place order #1186', 'T11963', '2025-10-06 08:17:12', '2025-10-06 08:17:12'),
(1266, NULL, NULL, 234, NULL, 171.2508, NULL, 0.00, '-', 'Place order #1187', 'T11964', '2025-10-06 08:22:31', '2025-10-06 08:22:31'),
(1267, NULL, NULL, 234, NULL, 57.9960, NULL, 0.00, '-', 'Place order #1188', 'T11965', '2025-10-06 08:26:38', '2025-10-06 08:26:38'),
(1268, NULL, NULL, 234, NULL, 2.3660, NULL, 0.00, '-', 'Place order #1189', 'T11966', '2025-10-06 08:33:14', '2025-10-06 08:33:14'),
(1269, NULL, NULL, 234, NULL, 147.1392, NULL, 0.00, '-', 'Place order #1190', 'T11967', '2025-10-06 08:56:53', '2025-10-06 08:56:53'),
(1270, NULL, NULL, 250, NULL, 10.0380, NULL, 0.00, '+', 'Refund for canceled order 1046', 'T11968', '2025-10-06 21:49:10', '2025-10-06 21:49:10'),
(1271, NULL, NULL, 368, NULL, 5172.0000, NULL, 0.00, '-', 'Place order #1191', 'T11969', '2025-10-08 15:13:53', '2025-10-08 15:13:53'),
(1272, NULL, NULL, 234, NULL, 2.3660, NULL, 0.00, '+', 'Refund for canceled order 1189', 'T11970', '2025-10-10 14:48:39', '2025-10-10 14:48:39'),
(1273, NULL, NULL, 234, NULL, 24.6064, NULL, 0.00, '+', 'Refund for canceled order 1185', 'T11971', '2025-10-10 16:08:10', '2025-10-10 16:08:10'),
(1274, NULL, 'bank', 231, NULL, 10000.0000, NULL, 0.00, '+', 'MBVCB.11282593961.5285BFTVG2M52N4N.tsr231.CT tu 9354578704 NGUYEN ANH NGOC toi 15873021 LE VAN KHANH tai ACB GD 176740-101225 23:43:13', '12101', '2025-10-12 23:44:05', '2025-10-12 23:44:05'),
(1275, NULL, NULL, 231, NULL, 5859.0000, NULL, 0.00, '-', 'Place order #1192', 'T12102', '2025-10-12 23:47:25', '2025-10-12 23:47:25'),
(1276, NULL, NULL, 231, NULL, 413.7600, NULL, 0.00, '-', 'Place order #1193', 'T12103', '2025-10-12 23:51:34', '2025-10-12 23:51:34'),
(1277, NULL, 'bank', 231, NULL, 10000.0000, NULL, 0.00, '+', 'MBVCB.11282632316.5285BFTVG2M5LZQK.tsr231.CT tu 9354578704 NGUYEN ANH NGOC toi 15873021 LE VAN KHANH tai ACB GD 215332-101225 23:59:41', '12102', '2025-10-13 00:00:23', '2025-10-13 00:00:23'),
(1278, NULL, NULL, 231, NULL, 2758.4000, NULL, 0.00, '-', 'Place order #1194', 'T12104', '2025-10-13 00:11:03', '2025-10-13 00:11:03'),
(1279, NULL, NULL, 231, NULL, 1944.0000, NULL, 0.00, '-', 'Place order #1195', 'T12105', '2025-10-13 00:16:11', '2025-10-13 00:16:11'),
(1280, NULL, NULL, 98, NULL, 54221.2000, NULL, 0.00, '-', 'Place order #1196', 'T12106', '2025-10-15 19:28:20', '2025-10-15 19:28:20'),
(1281, NULL, NULL, 361, NULL, 4613.7000, NULL, 0.00, '-', 'Place order #1197', 'T12107', '2025-10-15 21:26:38', '2025-10-15 21:26:38'),
(1282, NULL, NULL, 20, NULL, 3177.0600, NULL, 0.00, '-', 'Place order #1198', 'T12108', '2025-10-18 19:40:57', '2025-10-18 19:40:57'),
(1283, NULL, NULL, 20, NULL, 208.2080, NULL, 0.00, '-', 'Place order #1199', 'T12109', '2025-10-18 19:43:10', '2025-10-18 19:43:10'),
(1284, NULL, NULL, 373, NULL, 2665.1300, NULL, 0.00, '-', 'Place order #1200', 'T12110', '2025-10-20 09:29:39', '2025-10-20 09:29:39'),
(1285, NULL, 'bank', 101, NULL, 100000.0000, NULL, 0.00, '+', 'QR - tsr101 GD 471775-102125 11:26:28', '12265', '2025-10-21 11:27:02', '2025-10-21 11:27:02'),
(1286, NULL, NULL, 101, NULL, 4858.7500, NULL, 0.00, '-', 'Place order #1201', 'T12266', '2025-10-21 11:32:31', '2025-10-21 11:32:31'),
(1287, NULL, NULL, 101, NULL, 33664.8000, NULL, 0.00, '-', 'Place order #1202', 'T12267', '2025-10-21 11:33:52', '2025-10-21 11:33:52'),
(1288, NULL, NULL, 101, NULL, 16832.4000, NULL, 0.00, '-', 'Place order #1203', 'T12268', '2025-10-21 11:34:22', '2025-10-21 11:34:22'),
(1289, NULL, NULL, 101, NULL, 16832.4000, NULL, 0.00, '-', 'Place order #1204', 'T12269', '2025-10-21 11:35:04', '2025-10-21 11:35:04'),
(1290, NULL, 'bank', 373, NULL, 20000.0000, NULL, 0.00, '+', 'tsr373 GD 528013-111925 21:39:37', '12627', '2025-11-19 21:41:02', '2025-11-19 21:41:02'),
(1291, NULL, NULL, 373, NULL, 2095.6000, NULL, 0.00, '-', 'Place order #1205', 'T12628', '2025-11-19 21:43:43', '2025-11-19 21:43:43'),
(1292, NULL, NULL, 373, NULL, 1960.4000, NULL, 0.00, '-', 'Place order #1206', 'T12629', '2025-11-19 21:46:23', '2025-11-19 21:46:23'),
(1293, NULL, NULL, 373, NULL, 3920.8000, NULL, 0.00, '-', 'Place order #1207', 'T12630', '2025-11-19 21:50:57', '2025-11-19 21:50:57'),
(1294, NULL, 'bank', 250, NULL, 8504.0000, NULL, 0.00, '+', 'tsr250 GD 069321-113025 09:04:40', '12770', '2025-11-30 09:06:31', '2025-11-30 09:06:31'),
(1295, NULL, NULL, 250, NULL, 9815.6000, NULL, 0.00, '-', 'Place order #1208', 'T12771', '2025-11-30 09:09:05', '2025-11-30 09:09:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_percent` int UNSIGNED DEFAULT '5',
  `child_panel_id` int DEFAULT NULL,
  `referred_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `balance_referred` decimal(11,2) DEFAULT '0.00',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(11,2) DEFAULT '0.00',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Zip Or Postal Code',
  `address_one` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address_two` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `role` tinyint(1) NOT NULL DEFAULT '0',
  `two_fa` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `two_fa_verify` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `two_fa_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => unverified, 1 => verified',
  `sms_verification` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 => unverified, 1 => verified',
  `verify_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `time_zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `login_attempts` int DEFAULT '0',
  `lockout_time` datetime DEFAULT NULL,
  `version` int UNSIGNED NOT NULL DEFAULT '0',
  `two_fa_attempts` int DEFAULT '0',
  `two_fa_lockout_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `referral_percent`, `child_panel_id`, `referred_by`, `language_id`, `balance_referred`, `email`, `country_code`, `country`, `phone_code`, `phone`, `balance`, `image`, `image_driver`, `state`, `city`, `zip_code`, `address_one`, `address_two`, `provider`, `provider_id`, `status`, `role`, `two_fa`, `two_fa_verify`, `two_fa_code`, `email_verification`, `sms_verification`, `verify_code`, `google_id`, `github_id`, `facebook_id`, `sent_at`, `last_login`, `last_seen`, `time_zone`, `password`, `email_verified_at`, `remember_token`, `currency_code`, `api_token`, `created_at`, `updated_at`, `deleted_at`, `login_attempts`, `lockout_time`, `version`, `two_fa_attempts`, `two_fa_lockout_time`) VALUES
(1, NULL, NULL, 'admin123', 5, NULL, '', NULL, 0.00, 'admin@dichvudark.vip', NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 'VMPDNO5TYIKE4VHU', 1, 1, NULL, NULL, NULL, NULL, NULL, '2026-01-12 13:15:36', NULL, NULL, '$2y$12$.rCjIEgXbJwbixpKilbU1e.h/2qfnB5Pxo8u.yQloEDkpGz37c2aa', NULL, NULL, 'VND', NULL, '2026-01-12 18:15:28', '2026-01-12 18:15:28', NULL, 0, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_kycs`
--

CREATE TABLE `user_kycs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `kyc_id` int DEFAULT NULL,
  `kyc_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kyc_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=>pending , 1=> verified, 2=>rejected',
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'rejected reason',
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `child_panel_id` int DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `get_device` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `child_panel_id`, `longitude`, `latitude`, `country_code`, `location`, `country`, `ip_address`, `browser`, `os`, `get_device`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-24 04:38:44', '2025-04-24 04:38:44'),
(2, 1, NULL, '105.831', '19.8819', 'VN', 'Bút Sơn', 'Vietnam', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-24 04:41:07', '2025-04-24 04:41:07'),
(3, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-24 04:53:38', '2025-04-24 04:53:38'),
(4, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-24 13:15:48', '2025-04-24 13:15:48'),
(5, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-25 03:45:56', '2025-04-25 03:45:56'),
(6, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-25 05:09:58', '2025-04-25 05:09:58'),
(7, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-25 05:31:45', '2025-04-25 05:31:45'),
(8, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-25 12:57:56', '2025-04-25 12:57:56'),
(9, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-25 14:42:36', '2025-04-25 14:42:36'),
(10, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-26 03:35:31', '2025-04-26 03:35:31'),
(11, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-26 05:10:49', '2025-04-26 05:10:49'),
(12, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-26 12:14:51', '2025-04-26 12:14:51'),
(13, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-26 12:18:43', '2025-04-26 12:18:43'),
(14, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-27 03:40:20', '2025-04-27 03:40:20'),
(15, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-27 04:40:21', '2025-04-27 04:40:21'),
(16, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-27 13:05:54', '2025-04-27 13:05:54'),
(17, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-28 03:21:03', '2025-04-28 03:21:03'),
(18, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-28 13:13:50', '2025-04-28 13:13:50'),
(19, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-29 02:57:57', '2025-04-29 02:57:57'),
(20, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-29 03:51:58', '2025-04-29 03:51:58'),
(21, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-29 11:49:38', '2025-04-29 11:49:38'),
(22, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-29 12:25:01', '2025-04-29 12:25:01'),
(23, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-29 13:14:43', '2025-04-29 13:14:43'),
(24, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-29 13:45:42', '2025-04-29 13:45:42'),
(25, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-29 14:43:29', '2025-04-29 14:43:29'),
(26, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-30 02:52:48', '2025-04-30 02:52:48'),
(27, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-04-30 12:10:46', '2025-04-30 12:10:46'),
(28, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-01 02:59:25', '2025-05-01 02:59:25'),
(29, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-01 13:17:27', '2025-05-01 13:17:27'),
(30, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-01 14:43:07', '2025-05-01 14:43:07'),
(31, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-02 02:24:14', '2025-05-02 02:24:14'),
(32, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-02 03:03:37', '2025-05-02 03:03:37'),
(33, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-02 11:45:59', '2025-05-02 11:45:59'),
(34, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-02 13:17:30', '2025-05-02 13:17:30'),
(35, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-03 03:27:38', '2025-05-03 03:27:38'),
(36, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-04 03:50:40', '2025-05-04 03:50:40'),
(37, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-06 03:09:14', '2025-05-06 03:09:14'),
(38, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-07 02:14:04', '2025-05-07 02:14:04'),
(39, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-07 03:11:06', '2025-05-07 03:11:06'),
(40, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-07 03:47:40', '2025-05-07 03:47:40'),
(41, 1, NULL, '', '', '', '', '', '::1', 'Chrome', 'Windows', 'Desktop', '2025-05-07 04:47:57', '2025-05-07 04:47:57'),
(42, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.16', 'Chrome', 'Windows', 'Desktop', '2025-05-08 16:26:15', '2025-05-08 16:26:15'),
(43, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.16', 'Chrome', 'Windows', 'Desktop', '2025-05-08 17:15:03', '2025-05-08 17:15:03'),
(44, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.136', 'Chrome', 'Windows', 'Desktop', '2025-05-08 17:25:26', '2025-05-08 17:25:26'),
(45, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.141', 'Safari', 'Unknown', 'Mobile', '2025-05-08 17:38:41', '2025-05-08 17:38:41'),
(46, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.126', 'Chrome', 'Windows', 'Desktop', '2025-05-08 17:39:50', '2025-05-08 17:39:50'),
(47, 21, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.151', 'Safari', 'Unknown', 'Mobile', '2025-05-08 17:40:07', '2025-05-08 17:40:07'),
(48, 21, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.151', 'Safari', 'Unknown', 'Mobile', '2025-05-08 17:41:33', '2025-05-08 17:41:33'),
(49, 22, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.167', 'Safari', 'Unknown', 'Mobile', '2025-05-08 17:45:18', '2025-05-08 17:45:18'),
(50, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.247', 'Safari', 'Unknown', 'Mobile', '2025-05-08 17:47:34', '2025-05-08 17:47:34'),
(51, 25, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.185', 'Safari', 'Unknown', 'Mobile', '2025-05-08 17:50:44', '2025-05-08 17:50:44'),
(52, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.71', 'Safari', 'Unknown', 'Mobile', '2025-05-08 17:56:42', '2025-05-08 17:56:42'),
(53, 26, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.102', 'Chrome', 'Windows', 'Desktop', '2025-05-08 18:01:14', '2025-05-08 18:01:14'),
(54, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.157', 'Safari', 'Unknown', 'Mobile', '2025-05-08 18:41:31', '2025-05-08 18:41:31'),
(55, 28, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.218', 'Safari', 'Unknown', 'Mobile', '2025-05-08 19:15:06', '2025-05-08 19:15:06'),
(56, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.9', 'Chrome', 'Windows', 'Desktop', '2025-05-08 19:29:11', '2025-05-08 19:29:11'),
(57, 18, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.147', 'Safari', 'Unknown', 'Mobile', '2025-05-08 20:17:15', '2025-05-08 20:17:15'),
(58, 32, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.85', 'Chrome', 'Macintosh', 'Desktop', '2025-05-08 20:27:57', '2025-05-08 20:27:57'),
(59, 33, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.3', 'Chrome', 'Windows', 'Desktop', '2025-05-08 20:49:22', '2025-05-08 20:49:22'),
(60, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.18', 'Chrome', 'Windows', 'Desktop', '2025-05-08 21:57:56', '2025-05-08 21:57:56'),
(61, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.101', 'Chrome', 'Windows', 'Desktop', '2025-05-08 22:01:43', '2025-05-08 22:01:43'),
(62, 36, NULL, '108.2021', '16.0544', 'VN', 'Da Nang', 'Vietnam', '172.69.121.132', 'Chrome', 'Linux', 'Mobile', '2025-05-08 22:09:43', '2025-05-08 22:09:43'),
(63, 36, NULL, '108.2021', '16.0544', 'VN', 'Da Nang', 'Vietnam', '172.69.121.133', 'Chrome', 'Linux', 'Mobile', '2025-05-08 22:11:56', '2025-05-08 22:11:56'),
(64, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.75', 'Chrome', 'Windows', 'Desktop', '2025-05-08 22:21:46', '2025-05-08 22:21:46'),
(65, 38, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.76', 'Safari', 'Unknown', 'Mobile', '2025-05-08 22:25:26', '2025-05-08 22:25:26'),
(66, 39, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.225', 'Safari', 'iOS', 'Mobile', '2025-05-08 22:37:32', '2025-05-08 22:37:32'),
(67, 40, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.53', 'Chrome', 'Windows', 'Desktop', '2025-05-08 23:29:48', '2025-05-08 23:29:48'),
(68, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.182', 'Safari', 'Unknown', 'Mobile', '2025-05-09 00:21:42', '2025-05-09 00:21:42'),
(69, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.41', 'Chrome', 'Windows', 'Desktop', '2025-05-09 01:58:26', '2025-05-09 01:58:26'),
(70, 47, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.142', 'Chrome', 'Windows', 'Desktop', '2025-05-09 03:01:12', '2025-05-09 03:01:12'),
(71, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.136', 'Safari', 'Unknown', 'Mobile', '2025-05-09 03:36:38', '2025-05-09 03:36:38'),
(72, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.92', 'Safari', 'Unknown', 'Mobile', '2025-05-09 04:32:05', '2025-05-09 04:32:05'),
(73, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.89', 'Safari', 'Unknown', 'Mobile', '2025-05-09 10:41:46', '2025-05-09 10:41:46'),
(74, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.65', 'Chrome', 'Windows', 'Desktop', '2025-05-09 13:13:50', '2025-05-09 13:13:50'),
(75, 49, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.91', 'Safari', 'Unknown', 'Mobile', '2025-05-09 13:53:37', '2025-05-09 13:53:37'),
(76, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.240', 'Safari', 'Unknown', 'Mobile', '2025-05-09 14:00:23', '2025-05-09 14:00:23'),
(77, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.42', 'Chrome', 'Windows', 'Desktop', '2025-05-09 14:51:30', '2025-05-09 14:51:30'),
(78, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.235', 'Chrome', 'Linux', 'Mobile', '2025-05-09 15:51:10', '2025-05-09 15:51:10'),
(79, 52, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.9', 'Chrome', 'Windows', 'Desktop', '2025-05-09 15:56:27', '2025-05-09 15:56:27'),
(80, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.20', 'Chrome', 'Linux', 'Mobile', '2025-05-09 16:56:25', '2025-05-09 16:56:25'),
(81, 54, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.71', 'Chrome', 'Windows', 'Desktop', '2025-05-09 17:08:57', '2025-05-09 17:08:57'),
(82, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.138', 'Safari', 'Unknown', 'Mobile', '2025-05-09 17:19:19', '2025-05-09 17:19:19'),
(83, 55, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.185', 'Chrome', 'Windows', 'Desktop', '2025-05-09 17:42:39', '2025-05-09 17:42:39'),
(84, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.102', 'Chrome', 'Windows', 'Desktop', '2025-05-09 20:42:05', '2025-05-09 20:42:05'),
(85, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.79', 'Chrome', 'Windows', 'Desktop', '2025-05-09 20:55:02', '2025-05-09 20:55:02'),
(86, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.60', 'Safari', 'Unknown', 'Mobile', '2025-05-09 22:00:11', '2025-05-09 22:00:11'),
(87, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.168', 'Chrome', 'Windows', 'Desktop', '2025-05-10 00:05:37', '2025-05-10 00:05:37'),
(88, 58, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.145', 'Chrome', 'Linux', 'Mobile', '2025-05-10 00:08:51', '2025-05-10 00:08:51'),
(89, 59, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.68', 'Chrome', 'Windows', 'Desktop', '2025-05-10 00:10:17', '2025-05-10 00:10:17'),
(90, 59, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.68', 'Chrome', 'Windows', 'Desktop', '2025-05-10 00:10:57', '2025-05-10 00:10:57'),
(91, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.136', 'Chrome', 'Linux', 'Mobile', '2025-05-10 00:34:45', '2025-05-10 00:34:45'),
(92, 60, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.211.61', 'Chrome', 'Windows', 'Desktop', '2025-05-10 00:46:24', '2025-05-10 00:46:24'),
(93, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.168', 'Chrome', 'Windows', 'Desktop', '2025-05-10 02:17:52', '2025-05-10 02:17:52'),
(94, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.23', 'Chrome', 'Windows', 'Desktop', '2025-05-10 03:21:27', '2025-05-10 03:21:27'),
(95, 25, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.163', 'Safari', 'Unknown', 'Mobile', '2025-05-10 12:20:09', '2025-05-10 12:20:09'),
(96, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.58', 'Chrome', 'Linux', 'Mobile', '2025-05-10 12:24:53', '2025-05-10 12:24:53'),
(97, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.9', 'Chrome', 'Windows', 'Desktop', '2025-05-10 12:25:40', '2025-05-10 12:25:40'),
(98, 65, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.156', 'Safari', 'Unknown', 'Mobile', '2025-05-10 13:35:44', '2025-05-10 13:35:44'),
(99, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.10', 'Chrome', 'Windows', 'Desktop', '2025-05-10 13:41:05', '2025-05-10 13:41:05'),
(100, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.140', 'Chrome', 'Linux', 'Mobile', '2025-05-10 14:18:44', '2025-05-10 14:18:44'),
(101, 36, NULL, '108.2021', '16.0544', 'VN', 'Da Nang', 'Vietnam', '172.69.121.135', 'Chrome', 'Linux', 'Mobile', '2025-05-10 15:00:42', '2025-05-10 15:00:42'),
(102, 67, NULL, '108.2021', '16.0544', 'VN', 'Da Nang', 'Vietnam', '172.69.121.139', 'Chrome', 'Windows', 'Desktop', '2025-05-10 15:23:08', '2025-05-10 15:23:08'),
(103, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.106', 'Chrome', 'Windows', 'Desktop', '2025-05-10 17:25:38', '2025-05-10 17:25:38'),
(104, 71, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.139', 'Unknown', 'IOS', 'Mobile', '2025-05-10 17:36:36', '2025-05-10 17:36:36'),
(105, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.32', 'Chrome', 'Linux', 'Mobile', '2025-05-10 18:26:56', '2025-05-10 18:26:56'),
(106, 74, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.107', 'Chrome', 'Linux', 'Mobile', '2025-05-10 21:11:17', '2025-05-10 21:11:17'),
(107, 76, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.77', 'Chrome', 'Windows', 'Desktop', '2025-05-10 22:05:22', '2025-05-10 22:05:22'),
(108, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.14', 'Chrome', 'Windows', 'Desktop', '2025-05-10 23:10:13', '2025-05-10 23:10:13'),
(109, 77, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.45', 'Safari', 'Unknown', 'Mobile', '2025-05-10 23:31:31', '2025-05-10 23:31:31'),
(110, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.152', 'Chrome', 'Windows', 'Desktop', '2025-05-10 23:52:53', '2025-05-10 23:52:53'),
(111, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.144', 'Chrome', 'Linux', 'Mobile', '2025-05-11 00:39:59', '2025-05-11 00:39:59'),
(112, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.203', 'Chrome', 'Linux', 'Mobile', '2025-05-11 00:58:24', '2025-05-11 00:58:24'),
(113, 78, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.219', 'Chrome', 'Linux', 'Mobile', '2025-05-11 01:28:03', '2025-05-11 01:28:03'),
(114, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.60', 'Safari', 'iOS', 'Mobile', '2025-05-11 01:48:03', '2025-05-11 01:48:03'),
(115, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.125', 'Safari', 'iOS', 'Mobile', '2025-05-11 02:42:38', '2025-05-11 02:42:38'),
(116, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.200', 'Chrome', 'Linux', 'Mobile', '2025-05-11 03:57:19', '2025-05-11 03:57:19'),
(117, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.126', 'Safari', 'Unknown', 'Mobile', '2025-05-11 04:24:13', '2025-05-11 04:24:13'),
(118, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.95', 'Safari', 'Unknown', 'Mobile', '2025-05-11 04:50:32', '2025-05-11 04:50:32'),
(119, 78, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.100', 'Chrome', 'Linux', 'Mobile', '2025-05-11 04:55:50', '2025-05-11 04:55:50'),
(120, 80, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.146', 'Chrome', 'Windows', 'Desktop', '2025-05-11 05:02:01', '2025-05-11 05:02:01'),
(121, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.152', 'Chrome', 'Linux', 'Mobile', '2025-05-11 12:04:03', '2025-05-11 12:04:03'),
(122, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.171', 'Safari', 'Unknown', 'Mobile', '2025-05-11 13:51:05', '2025-05-11 13:51:05'),
(123, 79, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.75', 'Safari', 'iOS', 'Mobile', '2025-05-11 14:05:48', '2025-05-11 14:05:48'),
(124, 81, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.108', 'Chrome', 'Windows', 'Desktop', '2025-05-11 14:40:27', '2025-05-11 14:40:27'),
(125, 82, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.204', 'Chrome', 'Windows', 'Desktop', '2025-05-11 15:20:37', '2025-05-11 15:20:37'),
(126, 85, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.122', 'Unknown', 'IOS', 'Mobile', '2025-05-11 19:58:46', '2025-05-11 19:58:46'),
(127, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.30', 'Chrome', 'Windows', 'Desktop', '2025-05-11 20:49:23', '2025-05-11 20:49:23'),
(128, 89, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.40', 'Chrome', 'Linux', 'Mobile', '2025-05-11 21:58:15', '2025-05-11 21:58:15'),
(129, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.104', 'Chrome', 'Windows', 'Desktop', '2025-05-11 22:05:37', '2025-05-11 22:05:37'),
(130, 92, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.229', 'Chrome', 'Windows', 'Desktop', '2025-05-11 23:25:58', '2025-05-11 23:25:58'),
(131, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.74', 'Chrome', 'Windows', 'Desktop', '2025-05-11 23:26:00', '2025-05-11 23:26:00'),
(132, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.193', 'Chrome', 'Windows', 'Desktop', '2025-05-11 23:54:05', '2025-05-11 23:54:05'),
(133, 93, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.18', 'Chrome', 'Linux', 'Mobile', '2025-05-12 00:18:18', '2025-05-12 00:18:18'),
(134, 94, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.165.52', 'Chrome', 'Linux', 'Mobile', '2025-05-12 00:27:20', '2025-05-12 00:27:20'),
(135, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.86', 'Chrome', 'Linux', 'Mobile', '2025-05-12 01:34:41', '2025-05-12 01:34:41'),
(136, 95, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.180', 'Chrome', 'Macintosh', 'Desktop', '2025-05-12 01:58:52', '2025-05-12 01:58:52'),
(137, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.120', 'Safari', 'Unknown', 'Mobile', '2025-05-12 04:41:24', '2025-05-12 04:41:24'),
(138, 97, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.53', 'Safari', 'Unknown', 'Mobile', '2025-05-12 05:48:18', '2025-05-12 05:48:18'),
(139, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.229', 'Chrome', 'Windows', 'Desktop', '2025-05-12 05:56:40', '2025-05-12 05:56:40'),
(140, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.170', 'Chrome', 'Windows', 'Desktop', '2025-05-12 06:03:16', '2025-05-12 06:03:16'),
(141, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.108', 'Safari', 'Unknown', 'Mobile', '2025-05-12 10:10:30', '2025-05-12 10:10:30'),
(142, 100, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.126', 'Chrome', 'Windows', 'Desktop', '2025-05-12 12:32:09', '2025-05-12 12:32:09'),
(143, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.41', 'Chrome', 'Windows', 'Desktop', '2025-05-12 15:34:25', '2025-05-12 15:34:25'),
(144, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.52', 'Chrome', 'Windows', 'Desktop', '2025-05-12 17:35:32', '2025-05-12 17:35:32'),
(145, 103, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.126', 'Chrome', 'Linux', 'Mobile', '2025-05-12 19:56:24', '2025-05-12 19:56:24'),
(146, 104, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.80', 'Chrome', 'Linux', 'Mobile', '2025-05-13 01:40:24', '2025-05-13 01:40:24'),
(147, 106, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.65', 'Chrome', 'Windows', 'Desktop', '2025-05-13 02:49:37', '2025-05-13 02:49:37'),
(148, 107, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.135', 'Chrome', 'Windows', 'Desktop', '2025-05-13 03:28:16', '2025-05-13 03:28:16'),
(149, 109, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.181', 'Chrome', 'Linux', 'Mobile', '2025-05-13 04:38:18', '2025-05-13 04:38:18'),
(150, 78, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.118', 'Chrome', 'Linux', 'Mobile', '2025-05-13 05:04:38', '2025-05-13 05:04:38'),
(151, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.226', 'Chrome', 'Windows', 'Desktop', '2025-05-13 05:44:44', '2025-05-13 05:44:44'),
(152, 110, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.72', 'Safari', 'Unknown', 'Mobile', '2025-05-13 06:12:47', '2025-05-13 06:12:47'),
(153, 111, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.235', 'Safari', 'Unknown', 'Mobile', '2025-05-13 07:44:48', '2025-05-13 07:44:48'),
(154, 111, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.60', 'Safari', 'Unknown', 'Mobile', '2025-05-13 08:01:28', '2025-05-13 08:01:28'),
(155, 111, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.80', 'Safari', 'Unknown', 'Mobile', '2025-05-13 08:09:28', '2025-05-13 08:09:28'),
(156, 104, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.180', 'Chrome', 'Linux', 'Mobile', '2025-05-13 10:56:08', '2025-05-13 10:56:08'),
(157, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.39', 'Safari', 'Unknown', 'Mobile', '2025-05-13 11:23:09', '2025-05-13 11:23:09'),
(158, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.7', 'Chrome', 'Windows', 'Desktop', '2025-05-13 12:58:00', '2025-05-13 12:58:00'),
(159, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.241', 'Chrome', 'Windows', 'Desktop', '2025-05-13 13:09:21', '2025-05-13 13:09:21'),
(160, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.65', 'Chrome', 'Windows', 'Desktop', '2025-05-13 14:22:59', '2025-05-13 14:22:59'),
(161, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.175', 'Chrome', 'Windows', 'Desktop', '2025-05-13 15:54:44', '2025-05-13 15:54:44'),
(162, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.41', 'Chrome', 'Windows', 'Desktop', '2025-05-13 18:33:55', '2025-05-13 18:33:55'),
(163, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.77', 'Safari', 'Unknown', 'Mobile', '2025-05-13 18:34:02', '2025-05-13 18:34:02'),
(164, 78, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.153', 'Chrome', 'Linux', 'Mobile', '2025-05-13 18:43:26', '2025-05-13 18:43:26'),
(165, 114, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.19', 'Safari', 'Unknown', 'Mobile', '2025-05-13 19:07:10', '2025-05-13 19:07:10'),
(166, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.190', 'Safari', 'Unknown', 'Mobile', '2025-05-13 20:29:52', '2025-05-13 20:29:52'),
(167, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.192', 'Safari', 'Unknown', 'Mobile', '2025-05-13 21:36:25', '2025-05-13 21:36:25'),
(168, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.180', 'Safari', 'Unknown', 'Mobile', '2025-05-13 22:06:47', '2025-05-13 22:06:47'),
(169, 116, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.230', 'Safari', 'iOS', 'Mobile', '2025-05-13 22:45:22', '2025-05-13 22:45:22'),
(170, 117, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.28', 'Chrome', 'Windows', 'Desktop', '2025-05-13 23:02:19', '2025-05-13 23:02:19'),
(171, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Safari', 'iOS', 'Mobile', '2025-05-13 23:24:18', '2025-05-13 23:24:18'),
(172, 18, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.130', 'Safari', 'Unknown', 'Mobile', '2025-05-13 23:34:48', '2025-05-13 23:34:48'),
(173, 79, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.98', 'Safari', 'iOS', 'Mobile', '2025-05-13 23:44:13', '2025-05-13 23:44:13'),
(174, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.138', 'Safari', 'Unknown', 'Mobile', '2025-05-14 00:01:52', '2025-05-14 00:01:52'),
(175, 118, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.75', 'Unknown', 'IOS', 'Mobile', '2025-05-14 00:04:23', '2025-05-14 00:04:23'),
(176, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.184', 'Safari', 'iOS', 'Mobile', '2025-05-14 00:16:03', '2025-05-14 00:16:03'),
(177, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.176', 'Chrome', 'Windows', 'Desktop', '2025-05-14 00:26:58', '2025-05-14 00:26:58'),
(178, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.93.23', 'Safari', 'Unknown', 'Mobile', '2025-05-14 00:36:43', '2025-05-14 00:36:43'),
(179, 117, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.81', 'Chrome', 'Windows', 'Desktop', '2025-05-14 00:37:59', '2025-05-14 00:37:59'),
(180, 79, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.28', 'Safari', 'iOS', 'Mobile', '2025-05-14 00:56:26', '2025-05-14 00:56:26'),
(181, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.83', 'Safari', 'iOS', 'Mobile', '2025-05-14 01:00:31', '2025-05-14 01:00:31'),
(182, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.125', 'Chrome', 'Windows', 'Desktop', '2025-05-14 03:12:51', '2025-05-14 03:12:51'),
(183, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.18', 'Safari', 'Unknown', 'Mobile', '2025-05-14 04:51:24', '2025-05-14 04:51:24'),
(184, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.74', 'Safari', 'Unknown', 'Mobile', '2025-05-14 05:43:14', '2025-05-14 05:43:14'),
(185, 119, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.31', 'Chrome', 'Linux', 'Mobile', '2025-05-14 05:49:46', '2025-05-14 05:49:46'),
(186, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.65', 'Safari', 'Unknown', 'Mobile', '2025-05-14 11:20:03', '2025-05-14 11:20:03'),
(187, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.226', 'Chrome', 'Windows', 'Desktop', '2025-05-14 14:52:37', '2025-05-14 14:52:37'),
(188, 120, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.100', 'Chrome', 'Linux', 'Mobile', '2025-05-14 14:58:43', '2025-05-14 14:58:43'),
(189, 62, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.34', 'Chrome', 'Linux', 'Mobile', '2025-05-14 18:27:28', '2025-05-14 18:27:28'),
(190, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.177', 'Chrome', 'Windows', 'Desktop', '2025-05-14 20:18:06', '2025-05-14 20:18:06'),
(191, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.41', 'Chrome', 'Windows', 'Desktop', '2025-05-15 00:04:58', '2025-05-15 00:04:58'),
(192, 28, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.164', 'Safari', 'Unknown', 'Mobile', '2025-05-15 00:34:25', '2025-05-15 00:34:25'),
(193, 124, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.248', 'Chrome', 'Linux', 'Mobile', '2025-05-15 01:50:47', '2025-05-15 01:50:47'),
(194, 125, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.186', 'Chrome', 'Linux', 'Mobile', '2025-05-15 04:21:36', '2025-05-15 04:21:36'),
(195, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.84', 'Safari', 'Unknown', 'Mobile', '2025-05-15 04:25:49', '2025-05-15 04:25:49'),
(196, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.60', 'Safari', 'Unknown', 'Mobile', '2025-05-15 09:11:28', '2025-05-15 09:11:28'),
(197, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.60', 'Safari', 'Unknown', 'Mobile', '2025-05-15 09:34:06', '2025-05-15 09:34:06'),
(198, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.21', 'Safari', 'Unknown', 'Mobile', '2025-05-15 09:54:44', '2025-05-15 09:54:44'),
(199, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.68', 'Chrome', 'Windows', 'Desktop', '2025-05-15 15:23:41', '2025-05-15 15:23:41'),
(200, 127, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.209', 'Chrome', 'Windows', 'Desktop', '2025-05-15 16:03:22', '2025-05-15 16:03:22'),
(201, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.121', 'Chrome', 'Windows', 'Desktop', '2025-05-15 16:17:56', '2025-05-15 16:17:56'),
(202, 130, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.51', 'Safari', 'Unknown', 'Mobile', '2025-05-15 20:12:23', '2025-05-15 20:12:23'),
(203, 130, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.110', 'Safari', 'Unknown', 'Mobile', '2025-05-15 22:49:59', '2025-05-15 22:49:59'),
(204, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.83', 'Chrome', 'Windows', 'Desktop', '2025-05-16 01:00:07', '2025-05-16 01:00:07'),
(205, 132, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.136', 'Unknown', 'IOS', 'Mobile', '2025-05-16 01:10:45', '2025-05-16 01:10:45'),
(206, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.64', 'Chrome', 'Windows', 'Desktop', '2025-05-16 01:30:09', '2025-05-16 01:30:09'),
(207, 134, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.164', 'Chrome', 'Windows', 'Desktop', '2025-05-16 03:55:16', '2025-05-16 03:55:16'),
(208, 135, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.72', 'Chrome', 'Windows', 'Desktop', '2025-05-16 04:06:24', '2025-05-16 04:06:24'),
(209, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.66', 'Safari', 'Unknown', 'Mobile', '2025-05-16 07:24:32', '2025-05-16 07:24:32'),
(210, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.3', 'Safari', 'Unknown', 'Mobile', '2025-05-16 07:43:43', '2025-05-16 07:43:43'),
(211, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.41', 'Safari', 'Unknown', 'Mobile', '2025-05-16 07:52:11', '2025-05-16 07:52:11'),
(212, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.82', 'Chrome', 'Windows', 'Desktop', '2025-05-16 07:59:32', '2025-05-16 07:59:32'),
(213, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.213', 'Safari', 'Unknown', 'Mobile', '2025-05-16 10:17:23', '2025-05-16 10:17:23'),
(214, 18, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.132', 'Safari', 'Unknown', 'Mobile', '2025-05-16 10:33:30', '2025-05-16 10:33:30'),
(215, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.19', 'Safari', 'Unknown', 'Mobile', '2025-05-16 19:38:19', '2025-05-16 19:38:19'),
(216, 137, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.19', 'Chrome', 'Windows', 'Desktop', '2025-05-16 20:39:31', '2025-05-16 20:39:31'),
(217, 109, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.234', 'Chrome', 'Windows', 'Desktop', '2025-05-16 21:37:32', '2025-05-16 21:37:32'),
(218, 138, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.141', 'Safari', 'IOS', 'Mobile', '2025-05-16 21:38:31', '2025-05-16 21:38:31'),
(219, 139, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.71', 'Chrome', 'Linux', 'Mobile', '2025-05-16 22:35:17', '2025-05-16 22:35:17'),
(220, 140, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.184', 'Chrome', 'Linux', 'Mobile', '2025-05-16 23:54:58', '2025-05-16 23:54:58'),
(221, 143, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.24', 'Chrome', 'Windows', 'Desktop', '2025-05-17 00:11:05', '2025-05-17 00:11:05'),
(222, 140, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.140', 'Chrome', 'Linux', 'Mobile', '2025-05-17 01:35:40', '2025-05-17 01:35:40'),
(223, 52, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.208', 'Chrome', 'Windows', 'Desktop', '2025-05-17 02:49:07', '2025-05-17 02:49:07'),
(224, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.42', 'Chrome', 'Windows', 'Desktop', '2025-05-17 04:33:32', '2025-05-17 04:33:32'),
(225, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.49', 'Chrome', 'Linux', 'Mobile', '2025-05-17 10:40:44', '2025-05-17 10:40:44'),
(226, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.154', 'Chrome', 'Linux', 'Mobile', '2025-05-17 19:14:09', '2025-05-17 19:14:09'),
(227, 147, NULL, '14.4378', '50.0755', 'CZ', 'Prague', 'Czechia', '172.71.15.162', 'Unknown', 'IOS', 'Mobile', '2025-05-17 19:19:28', '2025-05-17 19:19:28'),
(228, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.121', 'Chrome', 'Linux', 'Mobile', '2025-05-17 23:42:03', '2025-05-17 23:42:03'),
(229, 148, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.235', 'Chrome', 'Linux', 'Mobile', '2025-05-17 23:48:26', '2025-05-17 23:48:26'),
(230, 149, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.219', 'Unknown', 'IOS', 'Mobile', '2025-05-17 23:53:56', '2025-05-17 23:53:56'),
(231, 150, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.174', 'Chrome', 'Linux', 'Mobile', '2025-05-18 02:44:14', '2025-05-18 02:44:14'),
(232, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.37', 'Chrome', 'Linux', 'Mobile', '2025-05-18 10:30:42', '2025-05-18 10:30:42'),
(233, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.148', 'Safari', 'Unknown', 'Mobile', '2025-05-18 10:40:52', '2025-05-18 10:40:52'),
(234, 152, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.170', 'Chrome', 'Windows', 'Desktop', '2025-05-18 11:06:40', '2025-05-18 11:06:40'),
(235, 150, NULL, '108.2021', '16.0544', 'VN', 'Da Nang', 'Vietnam', '172.69.121.135', 'Chrome', 'Linux', 'Mobile', '2025-05-18 14:12:36', '2025-05-18 14:12:36'),
(236, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.164', 'Safari', 'Unknown', 'Mobile', '2025-05-18 14:19:40', '2025-05-18 14:19:40'),
(237, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.204', 'Safari', 'Unknown', 'Mobile', '2025-05-18 14:29:59', '2025-05-18 14:29:59'),
(238, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.133', 'Chrome', 'Linux', 'Mobile', '2025-05-18 15:05:18', '2025-05-18 15:05:18'),
(239, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.136', 'Safari', 'Unknown', 'Mobile', '2025-05-18 15:33:40', '2025-05-18 15:33:40'),
(240, 154, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.74', 'Safari', 'Unknown', 'Mobile', '2025-05-18 16:47:10', '2025-05-18 16:47:10'),
(241, 52, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.207', 'Chrome', 'Windows', 'Desktop', '2025-05-18 17:18:08', '2025-05-18 17:18:08'),
(242, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.149', 'Safari', 'Unknown', 'Mobile', '2025-05-18 18:25:52', '2025-05-18 18:25:52'),
(243, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.45', 'Safari', 'Unknown', 'Mobile', '2025-05-18 19:20:35', '2025-05-18 19:20:35'),
(244, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.86', 'Safari', 'Unknown', 'Mobile', '2025-05-18 21:10:44', '2025-05-18 21:10:44'),
(245, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.202', 'Safari', 'Unknown', 'Mobile', '2025-05-18 21:39:35', '2025-05-18 21:39:35'),
(246, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.36', 'Safari', 'Unknown', 'Mobile', '2025-05-18 22:15:24', '2025-05-18 22:15:24'),
(247, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.22', 'Safari', 'Unknown', 'Mobile', '2025-05-18 23:12:43', '2025-05-18 23:12:43'),
(248, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.19', 'Safari', 'Unknown', 'Mobile', '2025-05-19 00:17:17', '2025-05-19 00:17:17'),
(249, 155, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.80', 'Safari', 'Unknown', 'Mobile', '2025-05-19 01:02:40', '2025-05-19 01:02:40'),
(250, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.53', 'Safari', 'Unknown', 'Mobile', '2025-05-19 01:32:42', '2025-05-19 01:32:42'),
(251, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.116', 'Chrome', 'Windows', 'Desktop', '2025-05-19 02:18:01', '2025-05-19 02:18:01'),
(252, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.18', 'Safari', 'Unknown', 'Mobile', '2025-05-19 02:20:47', '2025-05-19 02:20:47'),
(253, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.21', 'Safari', 'Unknown', 'Mobile', '2025-05-19 03:00:12', '2025-05-19 03:00:12'),
(254, 156, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.247', 'Chrome', 'Linux', 'Mobile', '2025-05-19 05:22:05', '2025-05-19 05:22:05'),
(255, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.135', 'Safari', 'Unknown', 'Mobile', '2025-05-19 10:49:05', '2025-05-19 10:49:05'),
(256, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.247', 'Safari', 'Unknown', 'Mobile', '2025-05-19 11:44:52', '2025-05-19 11:44:52'),
(257, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.59', 'Safari', 'Unknown', 'Mobile', '2025-05-19 12:39:29', '2025-05-19 12:39:29'),
(258, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.17', 'Chrome', 'Windows', 'Desktop', '2025-05-19 13:31:08', '2025-05-19 13:31:08'),
(259, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.108', 'Safari', 'Unknown', 'Mobile', '2025-05-19 18:51:07', '2025-05-19 18:51:07'),
(260, 160, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.200', 'Chrome', 'Macintosh', 'Desktop', '2025-05-19 18:53:45', '2025-05-19 18:53:45'),
(261, 161, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.73', 'Safari', 'Unknown', 'Mobile', '2025-05-19 19:24:20', '2025-05-19 19:24:20'),
(262, 161, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.103', 'Safari', 'Unknown', 'Mobile', '2025-05-19 20:12:48', '2025-05-19 20:12:48'),
(263, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.28', 'Safari', 'Unknown', 'Mobile', '2025-05-19 21:09:20', '2025-05-19 21:09:20'),
(264, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.9', 'Chrome', 'Linux', 'Mobile', '2025-05-19 22:41:18', '2025-05-19 22:41:18'),
(265, 163, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.100', 'Chrome', 'Windows', 'Desktop', '2025-05-19 23:19:11', '2025-05-19 23:19:11'),
(266, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Safari', 'Unknown', 'Mobile', '2025-05-20 01:58:15', '2025-05-20 01:58:15'),
(267, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.164', 'Chrome', 'Windows', 'Desktop', '2025-05-20 12:08:04', '2025-05-20 12:08:04'),
(268, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.87', 'Chrome', 'Windows', 'Desktop', '2025-05-20 12:57:10', '2025-05-20 12:57:10'),
(269, 164, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.126', 'Safari', 'iOS', 'Mobile', '2025-05-20 13:37:48', '2025-05-20 13:37:48'),
(270, 166, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.14', 'Chrome', 'Linux', 'Mobile', '2025-05-20 14:10:32', '2025-05-20 14:10:32'),
(271, 166, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.9', 'Chrome', 'Linux', 'Mobile', '2025-05-20 14:22:48', '2025-05-20 14:22:48'),
(272, 166, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.135', 'Chrome', 'Linux', 'Mobile', '2025-05-20 14:24:14', '2025-05-20 14:24:14'),
(273, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.224', 'Chrome', 'Windows', 'Desktop', '2025-05-20 19:48:57', '2025-05-20 19:48:57'),
(274, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.170', 'Chrome', 'Linux', 'Mobile', '2025-05-20 20:47:37', '2025-05-20 20:47:37'),
(275, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.165', 'Safari', 'iOS', 'Mobile', '2025-05-20 23:45:00', '2025-05-20 23:45:00'),
(276, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.23', 'Chrome', 'Windows', 'Desktop', '2025-05-21 00:21:38', '2025-05-21 00:21:38'),
(277, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.158', 'Safari', 'iOS', 'Mobile', '2025-05-21 00:41:35', '2025-05-21 00:41:35'),
(278, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.105', 'Safari', 'iOS', 'Mobile', '2025-05-21 00:52:48', '2025-05-21 00:52:48'),
(279, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.39', 'Safari', 'iOS', 'Mobile', '2025-05-21 01:03:30', '2025-05-21 01:03:30'),
(280, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.49', 'Safari', 'iOS', 'Mobile', '2025-05-21 01:36:44', '2025-05-21 01:36:44'),
(281, 168, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.227', 'Chrome', 'Windows', 'Desktop', '2025-05-21 03:42:29', '2025-05-21 03:42:29'),
(282, 28, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.41', 'Safari', 'Unknown', 'Mobile', '2025-05-21 13:54:35', '2025-05-21 13:54:35'),
(283, 169, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.93', 'Safari', 'Unknown', 'Mobile', '2025-05-21 14:35:24', '2025-05-21 14:35:24'),
(284, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.39', 'Safari', 'Unknown', 'Mobile', '2025-05-21 14:48:25', '2025-05-21 14:48:25'),
(285, 169, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.191', 'Safari', 'Unknown', 'Mobile', '2025-05-21 15:09:16', '2025-05-21 15:09:16'),
(286, 169, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.18', 'Safari', 'Unknown', 'Mobile', '2025-05-21 19:40:49', '2025-05-21 19:40:49'),
(287, 169, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.138', 'Safari', 'Unknown', 'Mobile', '2025-05-21 23:38:16', '2025-05-21 23:38:16'),
(288, 169, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.147', 'Safari', 'Unknown', 'Mobile', '2025-05-22 00:33:38', '2025-05-22 00:33:38'),
(289, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.227', 'Safari', 'iOS', 'Mobile', '2025-05-22 00:45:39', '2025-05-22 00:45:39'),
(290, 171, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.15', 'Safari', 'Unknown', 'Mobile', '2025-05-22 01:35:21', '2025-05-22 01:35:21'),
(291, 172, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.128', 'Chrome', 'Windows', 'Desktop', '2025-05-22 01:44:00', '2025-05-22 01:44:00'),
(292, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.145', 'Chrome', 'Windows', 'Desktop', '2025-05-22 06:19:57', '2025-05-22 06:19:57'),
(293, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.190', 'Safari', 'Unknown', 'Mobile', '2025-05-22 09:34:43', '2025-05-22 09:34:43'),
(294, 173, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.41', 'Chrome', 'Windows', 'Desktop', '2025-05-22 11:25:12', '2025-05-22 11:25:12'),
(295, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.156', 'Chrome', 'Windows', 'Desktop', '2025-05-22 13:47:07', '2025-05-22 13:47:07'),
(296, 174, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.151', 'Chrome', 'Windows', 'Desktop', '2025-05-22 14:01:13', '2025-05-22 14:01:13'),
(297, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.97', 'Safari', 'Unknown', 'Mobile', '2025-05-22 14:22:26', '2025-05-22 14:22:26'),
(298, 177, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.105', 'Chrome', 'Windows', 'Desktop', '2025-05-22 18:33:05', '2025-05-22 18:33:05'),
(299, 178, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.75', 'Chrome', 'Windows', 'Desktop', '2025-05-22 19:38:22', '2025-05-22 19:38:22'),
(300, 179, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.55', 'Safari', 'IOS', 'Mobile', '2025-05-22 20:43:16', '2025-05-22 20:43:16'),
(301, 179, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.55', 'Safari', 'IOS', 'Mobile', '2025-05-22 20:43:41', '2025-05-22 20:43:41'),
(302, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.150', 'Safari', 'iOS', 'Mobile', '2025-05-23 01:02:03', '2025-05-23 01:02:03'),
(303, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.78', 'Chrome', 'Windows', 'Desktop', '2025-05-23 01:09:13', '2025-05-23 01:09:13'),
(304, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.186', 'Safari', 'iOS', 'Mobile', '2025-05-23 01:27:05', '2025-05-23 01:27:05'),
(305, 36, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.190', 'Chrome', 'Linux', 'Mobile', '2025-05-23 02:12:09', '2025-05-23 02:12:09'),
(306, 180, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.113', 'Unknown', 'IOS', 'Mobile', '2025-05-23 02:29:51', '2025-05-23 02:29:51'),
(307, 180, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.102', 'Safari', 'Unknown', 'Mobile', '2025-05-23 02:36:03', '2025-05-23 02:36:03'),
(308, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.65', 'Safari', 'Unknown', 'Mobile', '2025-05-23 02:44:27', '2025-05-23 02:44:27'),
(309, 180, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.105', 'Safari', 'Unknown', 'Mobile', '2025-05-23 03:19:05', '2025-05-23 03:19:05'),
(310, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.22', 'Chrome', 'Windows', 'Desktop', '2025-05-23 12:02:53', '2025-05-23 12:02:53'),
(311, 181, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.186', 'Chrome', 'Windows', 'Desktop', '2025-05-23 12:29:35', '2025-05-23 12:29:35'),
(312, 182, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.30', 'Safari', 'Unknown', 'Mobile', '2025-05-23 12:30:22', '2025-05-23 12:30:22'),
(313, 183, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.136', 'Safari', 'Unknown', 'Mobile', '2025-05-23 18:32:40', '2025-05-23 18:32:40'),
(314, 173, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.21', 'Chrome', 'Windows', 'Desktop', '2025-05-23 19:11:16', '2025-05-23 19:11:16'),
(315, 184, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.144', 'Safari', 'Unknown', 'Mobile', '2025-05-23 22:45:06', '2025-05-23 22:45:06'),
(316, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.81', 'Chrome', 'Linux', 'Mobile', '2025-05-24 00:39:55', '2025-05-24 00:39:55');
INSERT INTO `user_logins` (`id`, `user_id`, `child_panel_id`, `longitude`, `latitude`, `country_code`, `location`, `country`, `ip_address`, `browser`, `os`, `get_device`, `created_at`, `updated_at`) VALUES
(317, 185, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.8', 'Chrome', 'Windows', 'Desktop', '2025-05-24 02:10:41', '2025-05-24 02:10:41'),
(318, 186, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.7', 'Chrome', 'Windows', 'Desktop', '2025-05-24 03:52:50', '2025-05-24 03:52:50'),
(319, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.151', 'Chrome', 'Windows', 'Desktop', '2025-05-24 11:53:34', '2025-05-24 11:53:34'),
(320, 169, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.162', 'Safari', 'Unknown', 'Mobile', '2025-05-24 17:15:32', '2025-05-24 17:15:32'),
(321, 187, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.227', 'Chrome', 'Windows', 'Desktop', '2025-05-24 19:57:20', '2025-05-24 19:57:20'),
(322, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.109', 'Safari', 'Unknown', 'Mobile', '2025-05-24 20:01:29', '2025-05-24 20:01:29'),
(323, 80, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.146', 'Chrome', 'Windows', 'Desktop', '2025-05-24 21:12:20', '2025-05-24 21:12:20'),
(324, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.59', 'Safari', 'Unknown', 'Mobile', '2025-05-24 21:47:54', '2025-05-24 21:47:54'),
(325, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.60', 'Safari', 'Unknown', 'Mobile', '2025-05-24 21:58:48', '2025-05-24 21:58:48'),
(326, 187, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.69', 'Chrome', 'Windows', 'Desktop', '2025-05-24 22:30:05', '2025-05-24 22:30:05'),
(327, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.82', 'Chrome', 'Windows', 'Desktop', '2025-05-25 00:00:21', '2025-05-25 00:00:21'),
(328, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.55', 'Chrome', 'Windows', 'Desktop', '2025-05-25 01:27:45', '2025-05-25 01:27:45'),
(329, 187, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.165', 'Chrome', 'Windows', 'Desktop', '2025-05-25 01:52:43', '2025-05-25 01:52:43'),
(330, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.168', 'Safari', 'Unknown', 'Mobile', '2025-05-25 02:42:44', '2025-05-25 02:42:44'),
(331, 188, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.40', 'Chrome', 'Windows', 'Desktop', '2025-05-25 13:14:01', '2025-05-25 13:14:01'),
(332, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.134', 'Chrome', 'Windows', 'Desktop', '2025-05-25 13:46:59', '2025-05-25 13:46:59'),
(333, 189, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.100', 'Chrome', 'Windows', 'Desktop', '2025-05-25 13:55:38', '2025-05-25 13:55:38'),
(334, 187, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.8', 'Safari', 'iOS', 'Mobile', '2025-05-25 14:45:11', '2025-05-25 14:45:11'),
(335, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.229', 'Chrome', 'Windows', 'Desktop', '2025-05-25 14:59:22', '2025-05-25 14:59:22'),
(336, 190, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.159', 'Safari', 'Unknown', 'Mobile', '2025-05-25 16:35:48', '2025-05-25 16:35:48'),
(337, 187, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.219', 'Chrome', 'Windows', 'Desktop', '2025-05-25 18:02:17', '2025-05-25 18:02:17'),
(338, 191, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.190', 'Safari', 'Unknown', 'Mobile', '2025-05-25 18:11:35', '2025-05-25 18:11:35'),
(339, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.13', 'Safari', 'Unknown', 'Mobile', '2025-05-25 18:51:26', '2025-05-25 18:51:26'),
(340, 192, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.211.28', 'Chrome', 'Linux', 'Mobile', '2025-05-25 19:46:04', '2025-05-25 19:46:04'),
(341, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.94', 'Safari', 'Unknown', 'Mobile', '2025-05-25 20:16:29', '2025-05-25 20:16:29'),
(342, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.99', 'Safari', 'Unknown', 'Mobile', '2025-05-25 20:51:02', '2025-05-25 20:51:02'),
(343, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.45', 'Chrome', 'Linux', 'Mobile', '2025-05-25 21:45:31', '2025-05-25 21:45:31'),
(344, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.183', 'Chrome', 'Linux', 'Mobile', '2025-05-25 23:06:06', '2025-05-25 23:06:06'),
(345, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.10', 'Safari', 'Unknown', 'Mobile', '2025-05-26 02:54:08', '2025-05-26 02:54:08'),
(346, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.212', 'Safari', 'Unknown', 'Mobile', '2025-05-26 02:57:14', '2025-05-26 02:57:14'),
(347, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.212', 'Safari', 'Unknown', 'Mobile', '2025-05-26 03:03:17', '2025-05-26 03:03:17'),
(348, 193, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.123', 'Chrome', 'Linux', 'Mobile', '2025-05-26 03:57:28', '2025-05-26 03:57:28'),
(349, 195, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.228', 'Safari', 'Unknown', 'Mobile', '2025-05-26 12:59:05', '2025-05-26 12:59:05'),
(350, 196, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.156', 'Chrome', 'Linux', 'Mobile', '2025-05-26 15:11:49', '2025-05-26 15:11:49'),
(351, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.191', 'Safari', 'Unknown', 'Mobile', '2025-05-26 18:54:24', '2025-05-26 18:54:24'),
(352, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.13', 'Chrome', 'Windows', 'Desktop', '2025-05-26 19:19:19', '2025-05-26 19:19:19'),
(353, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.128', 'Chrome', 'Windows', 'Desktop', '2025-05-26 21:33:36', '2025-05-26 21:33:36'),
(354, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.188', 'Safari', 'iOS', 'Mobile', '2025-05-26 22:28:25', '2025-05-26 22:28:25'),
(355, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.178', 'Safari', 'Unknown', 'Mobile', '2025-05-27 01:30:34', '2025-05-27 01:30:34'),
(356, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.183', 'Safari', 'Unknown', 'Mobile', '2025-05-27 01:38:20', '2025-05-27 01:38:20'),
(357, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.93', 'Safari', 'Unknown', 'Mobile', '2025-05-27 01:47:06', '2025-05-27 01:47:06'),
(358, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.144', 'Safari', 'Unknown', 'Mobile', '2025-05-27 15:20:46', '2025-05-27 15:20:46'),
(359, 40, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.40', 'Chrome', 'Windows', 'Desktop', '2025-05-27 16:54:00', '2025-05-27 16:54:00'),
(360, 200, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.105', 'Safari', 'Unknown', 'Mobile', '2025-05-27 17:20:14', '2025-05-27 17:20:14'),
(361, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.94', 'Safari', 'Unknown', 'Mobile', '2025-05-27 20:19:54', '2025-05-27 20:19:54'),
(362, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.105', 'Chrome', 'Linux', 'Mobile', '2025-05-27 20:20:21', '2025-05-27 20:20:21'),
(363, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.70.222.168', 'Chrome', 'Windows', 'Desktop', '2025-05-27 20:29:23', '2025-05-27 20:29:23'),
(364, 56, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.13', 'Safari', 'Unknown', 'Mobile', '2025-05-28 00:45:12', '2025-05-28 00:45:12'),
(365, 201, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.98', 'Chrome', 'Linux', 'Mobile', '2025-05-28 01:55:14', '2025-05-28 01:55:14'),
(366, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.72', 'Safari', 'Unknown', 'Mobile', '2025-05-28 03:05:43', '2025-05-28 03:05:43'),
(367, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.134', 'Safari', 'Unknown', 'Mobile', '2025-05-28 03:20:25', '2025-05-28 03:20:25'),
(368, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.218', 'Chrome', 'Windows', 'Desktop', '2025-05-28 04:42:18', '2025-05-28 04:42:18'),
(369, 204, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.228', 'Chrome', 'Windows', 'Desktop', '2025-05-28 05:25:08', '2025-05-28 05:25:08'),
(370, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.102', 'Safari', 'Unknown', 'Mobile', '2025-05-28 10:55:08', '2025-05-28 10:55:08'),
(371, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.24.23', 'Safari', 'Unknown', 'Mobile', '2025-05-28 11:23:20', '2025-05-28 11:23:20'),
(372, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.83', 'Safari', 'Unknown', 'Mobile', '2025-05-28 14:32:19', '2025-05-28 14:32:19'),
(373, 130, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.103', 'Safari', 'Unknown', 'Mobile', '2025-05-28 14:54:37', '2025-05-28 14:54:37'),
(374, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.70.222.126', 'Safari', 'Unknown', 'Mobile', '2025-05-28 15:53:34', '2025-05-28 15:53:34'),
(375, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.41', 'Chrome', 'Windows', 'Desktop', '2025-05-28 17:29:43', '2025-05-28 17:29:43'),
(376, 200, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.230', 'Safari', 'Unknown', 'Mobile', '2025-05-28 22:54:37', '2025-05-28 22:54:37'),
(377, 206, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.74', 'Safari', 'Unknown', 'Mobile', '2025-05-28 23:03:09', '2025-05-28 23:03:09'),
(378, 207, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.93.46', 'Chrome', 'Linux', 'Mobile', '2025-05-28 23:06:50', '2025-05-28 23:06:50'),
(379, 207, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.68', 'Chrome', 'Linux', 'Mobile', '2025-05-28 23:11:30', '2025-05-28 23:11:30'),
(380, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.55', 'Safari', 'Unknown', 'Mobile', '2025-05-29 00:28:20', '2025-05-29 00:28:20'),
(381, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.247', 'Safari', 'Unknown', 'Mobile', '2025-05-29 00:29:34', '2025-05-29 00:29:34'),
(382, 208, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.102', 'Safari', 'Unknown', 'Mobile', '2025-05-29 00:35:05', '2025-05-29 00:35:05'),
(383, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.26', 'Safari', 'Unknown', 'Mobile', '2025-05-29 02:22:02', '2025-05-29 02:22:02'),
(384, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.156', 'Chrome', 'Windows', 'Desktop', '2025-05-29 06:39:12', '2025-05-29 06:39:12'),
(385, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.15', 'Safari', 'Unknown', 'Mobile', '2025-05-29 10:05:26', '2025-05-29 10:05:26'),
(386, 189, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.60', 'Safari', 'Unknown', 'Mobile', '2025-05-29 12:02:51', '2025-05-29 12:02:51'),
(387, 209, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.223', 'Chrome', 'Windows', 'Desktop', '2025-05-29 14:49:23', '2025-05-29 14:49:23'),
(388, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.39', 'Safari', 'Unknown', 'Mobile', '2025-05-29 16:42:36', '2025-05-29 16:42:36'),
(389, 200, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.52', 'Safari', 'Unknown', 'Mobile', '2025-05-29 16:44:02', '2025-05-29 16:44:02'),
(390, 207, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.229', 'Chrome', 'Linux', 'Mobile', '2025-05-29 17:37:50', '2025-05-29 17:37:50'),
(391, 200, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.230', 'Safari', 'Unknown', 'Mobile', '2025-05-29 18:18:23', '2025-05-29 18:18:23'),
(392, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.49', 'Safari', 'Unknown', 'Mobile', '2025-05-29 20:34:50', '2025-05-29 20:34:50'),
(393, 210, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.163', 'Safari', 'Unknown', 'Mobile', '2025-05-29 21:42:59', '2025-05-29 21:42:59'),
(394, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.64', 'Chrome', 'Windows', 'Desktop', '2025-05-30 00:12:53', '2025-05-30 00:12:53'),
(395, 212, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.64', 'Unknown', 'IOS', 'Mobile', '2025-05-30 01:13:55', '2025-05-30 01:13:55'),
(396, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.137', 'Chrome', 'Windows', 'Desktop', '2025-05-30 06:38:22', '2025-05-30 06:38:22'),
(397, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.68.119.9', 'Safari', 'Unknown', 'Mobile', '2025-05-30 09:39:54', '2025-05-30 09:39:54'),
(398, 213, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.175', 'Chrome', 'Windows', 'Desktop', '2025-05-30 18:34:58', '2025-05-30 18:34:58'),
(399, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.65', 'Safari', 'Unknown', 'Mobile', '2025-05-30 19:04:11', '2025-05-30 19:04:11'),
(400, 214, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.72', 'Chrome', 'Windows', 'Desktop', '2025-05-30 19:57:37', '2025-05-30 19:57:37'),
(401, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '162.158.118.16', 'Chrome', 'Windows', 'Desktop', '2025-05-30 19:59:21', '2025-05-30 19:59:21'),
(402, 214, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.51', 'Safari', 'iOS', 'Mobile', '2025-05-30 20:00:38', '2025-05-30 20:00:38'),
(403, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.24.98', 'Safari', 'Unknown', 'Mobile', '2025-05-30 20:16:18', '2025-05-30 20:16:18'),
(404, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.8.18', 'Chrome', 'Windows', 'Desktop', '2025-05-30 20:55:36', '2025-05-30 20:55:36'),
(405, 169, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.28', 'Safari', 'Unknown', 'Mobile', '2025-05-31 00:18:59', '2025-05-31 00:18:59'),
(406, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.68.119.122', 'Chrome', 'Windows', 'Desktop', '2025-05-31 00:27:46', '2025-05-31 00:27:46'),
(407, 169, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.21', 'Safari', 'Unknown', 'Mobile', '2025-05-31 01:04:25', '2025-05-31 01:04:25'),
(408, 169, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.159', 'Safari', 'Unknown', 'Mobile', '2025-05-31 01:47:36', '2025-05-31 01:47:36'),
(409, 169, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.237', 'Safari', 'Unknown', 'Mobile', '2025-05-31 02:08:38', '2025-05-31 02:08:38'),
(410, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.58', 'Chrome', 'Windows', 'Desktop', '2025-05-30 16:46:19', '2025-05-30 16:46:19'),
(411, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.70.223.112', 'Chrome', 'Windows', 'Desktop', '2025-05-31 01:33:58', '2025-05-31 01:33:58'),
(412, 219, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.164', 'Chrome', 'Windows', 'Desktop', '2025-05-31 03:39:38', '2025-05-31 03:39:38'),
(413, 220, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.124', 'Safari', 'iOS', 'Mobile', '2025-05-31 04:40:52', '2025-05-31 04:40:52'),
(414, 220, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.138', 'Chrome', 'Windows', 'Desktop', '2025-05-31 04:50:12', '2025-05-31 04:50:12'),
(415, 207, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.60', 'Chrome', 'Linux', 'Mobile', '2025-05-31 05:19:28', '2025-05-31 05:19:28'),
(416, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.41', 'Chrome', 'Windows', 'Desktop', '2025-05-31 05:47:44', '2025-05-31 05:47:44'),
(417, 223, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.169', 'Safari', 'Unknown', 'Mobile', '2025-05-31 08:44:36', '2025-05-31 08:44:36'),
(418, 223, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.64', 'Safari', 'Unknown', 'Mobile', '2025-05-31 08:59:12', '2025-05-31 08:59:12'),
(419, 225, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.69', 'Chrome', 'Windows', 'Desktop', '2025-05-31 09:30:26', '2025-05-31 09:30:26'),
(420, 223, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.112', 'Safari', 'Unknown', 'Mobile', '2025-05-31 09:38:58', '2025-05-31 09:38:58'),
(421, 226, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.184', 'Safari', 'Unknown', 'Mobile', '2025-05-31 14:18:08', '2025-05-31 14:18:08'),
(422, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.24.188', 'Chrome', 'Windows', 'Desktop', '2025-05-31 14:37:46', '2025-05-31 14:37:46'),
(423, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.100', 'Chrome', 'Windows', 'Desktop', '2025-05-31 18:58:13', '2025-05-31 18:58:13'),
(424, 180, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.147', 'Safari', 'Unknown', 'Mobile', '2025-06-01 01:27:07', '2025-06-01 01:27:07'),
(425, 228, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.145', 'Chrome', 'Windows', 'Desktop', '2025-06-01 02:29:15', '2025-06-01 02:29:15'),
(426, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.137', 'Chrome', 'Windows', 'Desktop', '2025-06-01 12:48:04', '2025-06-01 12:48:04'),
(427, 98, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.187', 'Chrome', 'Windows', 'Desktop', '2025-06-02 07:39:26', '2025-06-02 07:39:26'),
(428, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.204', 'Chrome', 'Windows', 'Desktop', '2025-06-02 08:19:41', '2025-06-02 08:19:41'),
(429, 40, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Chrome', 'Windows', 'Desktop', '2025-06-02 08:30:19', '2025-06-02 08:30:19'),
(430, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.28', 'Chrome', 'Windows', 'Desktop', '2025-06-03 00:46:57', '2025-06-03 00:46:57'),
(431, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.167', 'Chrome', 'Linux', 'Mobile', '2025-06-03 04:30:35', '2025-06-03 04:30:35'),
(432, 189, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.189', 'Chrome', 'Windows', 'Desktop', '2025-06-03 05:11:57', '2025-06-03 05:11:57'),
(433, 229, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.85', 'Safari', 'Unknown', 'Mobile', '2025-06-03 05:27:20', '2025-06-03 05:27:20'),
(434, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.138', 'Safari', 'Unknown', 'Mobile', '2025-06-03 16:41:57', '2025-06-03 16:41:57'),
(435, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.131', 'Chrome', 'Linux', 'Mobile', '2025-06-04 03:46:21', '2025-06-04 03:46:21'),
(436, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.131', 'Chrome', 'Linux', 'Mobile', '2025-06-04 03:46:59', '2025-06-04 03:46:59'),
(437, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.131', 'Chrome', 'Linux', 'Mobile', '2025-06-04 03:49:24', '2025-06-04 03:49:24'),
(438, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.70.49.197', 'Chrome', 'Windows', 'Desktop', '2025-06-04 04:18:54', '2025-06-04 04:18:54'),
(439, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.136', 'Chrome', 'Linux', 'Mobile', '2025-06-04 04:28:31', '2025-06-04 04:28:31'),
(440, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.238', 'Chrome', 'Windows', 'Desktop', '2025-06-04 15:19:57', '2025-06-04 15:19:57'),
(441, 231, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.232', 'Safari', 'Unknown', 'Mobile', '2025-06-04 18:44:30', '2025-06-04 18:44:30'),
(442, 232, NULL, '105.8341', '21.0277', 'VN', 'Hanoi', 'Vietnam', '172.69.120.130', 'Safari', 'Unknown', 'Mobile', '2025-06-05 00:08:16', '2025-06-05 00:08:16'),
(443, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.70.49.191', 'Chrome', 'Windows', 'Desktop', '2025-06-05 01:35:51', '2025-06-05 01:35:51'),
(444, 202, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.183', 'Safari', 'Unknown', 'Mobile', '2025-06-05 03:31:15', '2025-06-05 03:31:15'),
(445, 231, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.2', 'Safari', 'Unknown', 'Mobile', '2025-06-05 12:17:04', '2025-06-05 12:17:04'),
(446, 231, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.165', 'Safari', 'Unknown', 'Mobile', '2025-06-05 13:40:02', '2025-06-05 13:40:02'),
(447, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.86', 'Safari', 'Unknown', 'Mobile', '2025-06-05 14:25:26', '2025-06-05 14:25:26'),
(448, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.163', 'Chrome', 'Windows', 'Desktop', '2025-06-05 14:58:33', '2025-06-05 14:58:33'),
(449, 236, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.39', 'Safari', 'Unknown', 'Mobile', '2025-06-06 03:19:10', '2025-06-06 03:19:10'),
(450, 236, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.167', 'Safari', 'Unknown', 'Mobile', '2025-06-06 03:56:03', '2025-06-06 03:56:03'),
(451, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.105', 'Chrome', 'Windows', 'Desktop', '2025-06-06 03:56:57', '2025-06-06 03:56:57'),
(452, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.104', 'Safari', 'Unknown', 'Mobile', '2025-06-06 04:05:44', '2025-06-06 04:05:44'),
(453, 200, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.200', 'Safari', 'Unknown', 'Mobile', '2025-06-06 04:12:40', '2025-06-06 04:12:40'),
(454, 236, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.27', 'Safari', 'Unknown', 'Mobile', '2025-06-06 04:28:15', '2025-06-06 04:28:15'),
(455, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Safari', 'Unknown', 'Mobile', '2025-06-06 04:48:40', '2025-06-06 04:48:40'),
(456, 237, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.45', 'Chrome', 'Windows', 'Desktop', '2025-06-06 05:35:44', '2025-06-06 05:35:44'),
(457, 236, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.100', 'Safari', 'Unknown', 'Mobile', '2025-06-06 05:56:42', '2025-06-06 05:56:42'),
(458, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.107', 'Safari', 'Unknown', 'Mobile', '2025-06-06 06:18:32', '2025-06-06 06:18:32'),
(459, 236, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.164', 'Safari', 'Unknown', 'Mobile', '2025-06-06 06:20:55', '2025-06-06 06:20:55'),
(460, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.60', 'Safari', 'Unknown', 'Mobile', '2025-06-06 09:24:01', '2025-06-06 09:24:01'),
(461, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.156', 'Safari', 'Unknown', 'Mobile', '2025-06-06 10:39:01', '2025-06-06 10:39:01'),
(462, 238, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.211.27', 'Safari', 'Unknown', 'Mobile', '2025-06-06 14:14:32', '2025-06-06 14:14:32'),
(463, 236, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.10', 'Safari', 'Unknown', 'Mobile', '2025-06-06 14:38:40', '2025-06-06 14:38:40'),
(464, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.48', 'Safari', 'Unknown', 'Mobile', '2025-06-06 15:30:10', '2025-06-06 15:30:10'),
(465, 231, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.40', 'Safari', 'Unknown', 'Mobile', '2025-06-06 16:16:04', '2025-06-06 16:16:04'),
(466, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.165', 'Safari', 'Unknown', 'Mobile', '2025-06-06 16:37:17', '2025-06-06 16:37:17'),
(467, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.80', 'Safari', 'Unknown', 'Mobile', '2025-06-06 16:49:08', '2025-06-06 16:49:08'),
(468, 231, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.188', 'Safari', 'Unknown', 'Mobile', '2025-06-06 18:54:51', '2025-06-06 18:54:51'),
(469, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.162', 'Chrome', 'Linux', 'Mobile', '2025-06-07 12:47:05', '2025-06-07 12:47:05'),
(470, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.141', 'Safari', 'Unknown', 'Mobile', '2025-06-07 14:25:17', '2025-06-07 14:25:17'),
(471, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.150', 'Chrome', 'Windows', 'Desktop', '2025-06-07 15:14:58', '2025-06-07 15:14:58'),
(472, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.7', 'Safari', 'Unknown', 'Mobile', '2025-06-07 19:51:46', '2025-06-07 19:51:46'),
(473, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.191', 'Chrome', 'Windows', 'Desktop', '2025-06-08 09:06:56', '2025-06-08 09:06:56'),
(474, 241, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.40', 'Chrome', 'Windows', 'Desktop', '2025-06-08 14:15:12', '2025-06-08 14:15:12'),
(475, 236, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.136', 'Safari', 'Unknown', 'Mobile', '2025-06-08 15:41:35', '2025-06-08 15:41:35'),
(476, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.246', 'Safari', 'Unknown', 'Mobile', '2025-06-08 18:43:06', '2025-06-08 18:43:06'),
(477, 58, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.5', 'Chrome', 'Linux', 'Mobile', '2025-06-08 23:09:38', '2025-06-08 23:09:38'),
(478, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.247', 'Chrome', 'Windows', 'Desktop', '2025-06-09 00:54:50', '2025-06-09 00:54:50'),
(479, 236, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.40', 'Safari', 'Unknown', 'Mobile', '2025-06-09 08:56:31', '2025-06-09 08:56:31'),
(480, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.52', 'Safari', 'iOS', 'Mobile', '2025-06-09 12:02:15', '2025-06-09 12:02:15'),
(481, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.164', 'Chrome', 'Windows', 'Desktop', '2025-06-09 12:37:23', '2025-06-09 12:37:23'),
(482, 98, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.105', 'Safari', 'Unknown', 'Mobile', '2025-06-09 13:09:10', '2025-06-09 13:09:10'),
(483, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.70.223.155', 'Chrome', 'Windows', 'Desktop', '2025-06-09 13:16:48', '2025-06-09 13:16:48'),
(484, 242, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.232', 'Chrome', 'Linux', 'Mobile', '2025-06-09 14:14:38', '2025-06-09 14:14:38'),
(485, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.24.45', 'Chrome', 'Windows', 'Desktop', '2025-06-09 15:03:22', '2025-06-09 15:03:22'),
(486, 243, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.16', 'Safari', 'Unknown', 'Mobile', '2025-06-09 15:55:11', '2025-06-09 15:55:11'),
(487, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '162.158.119.32', 'Safari', 'Unknown', 'Mobile', '2025-06-09 18:12:04', '2025-06-09 18:12:04'),
(488, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.13', 'Safari', 'Unknown', 'Mobile', '2025-06-09 23:14:28', '2025-06-09 23:14:28'),
(489, 79, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.49', 'Safari', 'iOS', 'Mobile', '2025-06-09 23:50:41', '2025-06-09 23:50:41'),
(490, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.124', 'Safari', 'Unknown', 'Mobile', '2025-06-10 02:31:40', '2025-06-10 02:31:40'),
(491, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '162.158.119.35', 'Chrome', 'Windows', 'Desktop', '2025-06-10 02:37:55', '2025-06-10 02:37:55'),
(492, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.98', 'Chrome', 'Windows', 'Desktop', '2025-06-10 04:41:51', '2025-06-10 04:41:51'),
(493, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.146', 'Chrome', 'Linux', 'Mobile', '2025-06-10 06:57:48', '2025-06-10 06:57:48'),
(494, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.137', 'Safari', 'Unknown', 'Mobile', '2025-06-10 09:03:50', '2025-06-10 09:03:50'),
(495, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.119', 'Safari', 'Unknown', 'Mobile', '2025-06-10 10:37:26', '2025-06-10 10:37:26'),
(496, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.246', 'Safari', 'Unknown', 'Mobile', '2025-06-10 13:14:42', '2025-06-10 13:14:42'),
(497, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.165', 'Safari', 'Unknown', 'Mobile', '2025-06-10 13:29:38', '2025-06-10 13:29:38'),
(498, 249, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.148', 'Chrome', 'Linux', 'Mobile', '2025-06-10 13:44:18', '2025-06-10 13:44:18'),
(499, 230, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.91', 'Chrome', 'Linux', 'Mobile', '2025-06-10 14:58:52', '2025-06-10 14:58:52'),
(500, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.133', 'Chrome', 'Linux', 'Mobile', '2025-06-11 00:45:53', '2025-06-11 00:45:53'),
(501, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.229', 'Safari', 'Unknown', 'Mobile', '2025-06-11 01:37:40', '2025-06-11 01:37:40'),
(502, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.188', 'Safari', 'Unknown', 'Mobile', '2025-06-11 01:46:08', '2025-06-11 01:46:08'),
(503, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.130', 'Chrome', 'Linux', 'Mobile', '2025-06-11 02:03:27', '2025-06-11 02:03:27'),
(504, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.24', 'Safari', 'Unknown', 'Mobile', '2025-06-11 03:12:47', '2025-06-11 03:12:47'),
(505, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.24', 'Safari', 'Unknown', 'Mobile', '2025-06-11 03:12:54', '2025-06-11 03:12:54'),
(506, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.110', 'Safari', 'Unknown', 'Mobile', '2025-06-11 04:12:07', '2025-06-11 04:12:07'),
(507, 251, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.61', 'Chrome', 'Linux', 'Mobile', '2025-06-11 05:04:45', '2025-06-11 05:04:45'),
(508, 251, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.119', 'Chrome', 'Linux', 'Mobile', '2025-06-11 06:32:09', '2025-06-11 06:32:09'),
(509, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.109', 'Safari', 'Unknown', 'Mobile', '2025-06-11 07:31:13', '2025-06-11 07:31:13'),
(510, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.91', 'Safari', 'Unknown', 'Mobile', '2025-06-11 08:20:30', '2025-06-11 08:20:30'),
(511, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.91', 'Safari', 'Unknown', 'Mobile', '2025-06-11 08:20:38', '2025-06-11 08:20:38'),
(512, 253, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.232', 'Safari', 'Unknown', 'Mobile', '2025-06-11 11:52:13', '2025-06-11 11:52:13'),
(513, 251, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.153', 'Chrome', 'Linux', 'Mobile', '2025-06-11 12:28:23', '2025-06-11 12:28:23'),
(514, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.22', 'Safari', 'Unknown', 'Mobile', '2025-06-11 13:39:59', '2025-06-11 13:39:59'),
(515, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.81', 'Safari', 'Unknown', 'Mobile', '2025-06-11 13:40:32', '2025-06-11 13:40:32'),
(516, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.136', 'Chrome', 'Linux', 'Mobile', '2025-06-12 05:07:20', '2025-06-12 05:07:20'),
(517, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.136', 'Chrome', 'Linux', 'Mobile', '2025-06-12 05:28:55', '2025-06-12 05:28:55'),
(518, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.146', 'Chrome', 'Linux', 'Mobile', '2025-06-12 05:58:49', '2025-06-12 05:58:49'),
(519, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.70.49.197', 'Chrome', 'Windows', 'Desktop', '2025-06-12 05:59:29', '2025-06-12 05:59:29'),
(520, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.24.70', 'Chrome', 'Windows', 'Desktop', '2025-06-12 06:58:54', '2025-06-12 06:58:54'),
(521, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.147', 'Chrome', 'Linux', 'Mobile', '2025-06-12 07:40:58', '2025-06-12 07:40:58'),
(522, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.68.118.195', 'Chrome', 'Windows', 'Desktop', '2025-06-12 09:40:34', '2025-06-12 09:40:34'),
(523, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.58', 'Safari', 'Unknown', 'Mobile', '2025-06-12 10:54:49', '2025-06-12 10:54:49'),
(524, 251, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.245', 'Chrome', 'Linux', 'Mobile', '2025-06-12 12:32:34', '2025-06-12 12:32:34'),
(525, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.185', 'Safari', 'Unknown', 'Mobile', '2025-06-12 17:45:51', '2025-06-12 17:45:51'),
(526, 255, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.19', 'Chrome', 'Macintosh', 'Desktop', '2025-06-12 23:01:41', '2025-06-12 23:01:41'),
(527, 256, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.97', 'Chrome', 'Linux', 'Mobile', '2025-06-13 00:07:07', '2025-06-13 00:07:07'),
(528, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.132', 'Chrome', 'Linux', 'Mobile', '2025-06-13 03:40:49', '2025-06-13 03:40:49'),
(529, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.190', 'Safari', 'Unknown', 'Mobile', '2025-06-13 03:51:10', '2025-06-13 03:51:10'),
(530, 230, NULL, '', '', '', '', '', '172.70.196.132', 'Chrome', 'Linux', 'Mobile', '2025-06-13 03:55:41', '2025-06-13 03:55:41'),
(531, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.132', 'Chrome', 'Linux', 'Mobile', '2025-06-13 03:56:01', '2025-06-13 03:56:01'),
(532, 200, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.190', 'Safari', 'Unknown', 'Mobile', '2025-06-13 07:42:24', '2025-06-13 07:42:24'),
(533, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.146', 'Chrome', 'Linux', 'Mobile', '2025-06-13 10:06:20', '2025-06-13 10:06:20'),
(534, 260, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.157', 'Chrome', 'Windows', 'Desktop', '2025-06-13 10:06:46', '2025-06-13 10:06:46'),
(535, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.24.33', 'Chrome', 'Windows', 'Desktop', '2025-06-13 10:13:30', '2025-06-13 10:13:30'),
(536, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.136', 'Chrome', 'Linux', 'Mobile', '2025-06-13 10:15:46', '2025-06-13 10:15:46'),
(537, 230, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.98', 'Chrome', 'Linux', 'Mobile', '2025-06-13 13:07:02', '2025-06-13 13:07:02'),
(538, 261, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.100', 'Chrome', 'Windows', 'Desktop', '2025-06-13 14:13:39', '2025-06-13 14:13:39'),
(539, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.136', 'Chrome', 'Linux', 'Mobile', '2025-06-13 14:30:49', '2025-06-13 14:30:49'),
(540, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.68.118.141', 'Chrome', 'Windows', 'Desktop', '2025-06-13 14:34:28', '2025-06-13 14:34:28'),
(541, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.133', 'Chrome', 'Linux', 'Mobile', '2025-06-13 14:48:23', '2025-06-13 14:48:23'),
(542, 262, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.54', 'Chrome', 'Linux', 'Mobile', '2025-06-13 15:07:35', '2025-06-13 15:07:35'),
(543, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.202', 'Safari', 'Unknown', 'Mobile', '2025-06-13 15:07:56', '2025-06-13 15:07:56'),
(544, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.8.18', 'Safari', 'Unknown', 'Mobile', '2025-06-13 15:49:26', '2025-06-13 15:49:26'),
(545, 263, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.132', 'Safari', 'Unknown', 'Mobile', '2025-06-13 17:24:29', '2025-06-13 17:24:29'),
(546, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.137', 'Chrome', 'Linux', 'Mobile', '2025-06-13 23:56:10', '2025-06-13 23:56:10'),
(547, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.132', 'Chrome', 'Linux', 'Mobile', '2025-06-14 02:31:58', '2025-06-14 02:31:58'),
(548, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.18', 'Safari', 'Unknown', 'Mobile', '2025-06-14 06:45:55', '2025-06-14 06:45:55'),
(549, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.103', 'Safari', 'Unknown', 'Mobile', '2025-06-14 07:29:46', '2025-06-14 07:29:46'),
(550, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.137', 'Chrome', 'Linux', 'Mobile', '2025-06-14 10:44:46', '2025-06-14 10:44:46'),
(551, 230, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.61', 'Chrome', 'Linux', 'Mobile', '2025-06-14 11:37:41', '2025-06-14 11:37:41'),
(552, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.165.54', 'Safari', 'Unknown', 'Mobile', '2025-06-14 11:46:20', '2025-06-14 11:46:20'),
(553, 230, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.147', 'Chrome', 'Linux', 'Mobile', '2025-06-14 11:46:49', '2025-06-14 11:46:49'),
(554, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.197', 'Safari', 'Unknown', 'Mobile', '2025-06-14 15:25:31', '2025-06-14 15:25:31'),
(555, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.61', 'Chrome', 'Linux', 'Mobile', '2025-06-14 23:18:57', '2025-06-14 23:18:57'),
(556, 268, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.149', 'Chrome', 'Linux', 'Mobile', '2025-06-15 04:54:08', '2025-06-15 04:54:08'),
(557, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.211.21', 'Safari', 'Unknown', 'Mobile', '2025-06-15 05:09:17', '2025-06-15 05:09:17'),
(558, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.14', 'Safari', 'Unknown', 'Mobile', '2025-06-15 05:59:20', '2025-06-15 05:59:20'),
(559, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.136', 'Chrome', 'Linux', 'Mobile', '2025-06-15 06:08:55', '2025-06-15 06:08:55'),
(560, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.101', 'Safari', 'Unknown', 'Mobile', '2025-06-15 08:56:21', '2025-06-15 08:56:21'),
(561, 270, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.9', 'Safari', 'Unknown', 'Mobile', '2025-06-15 09:28:24', '2025-06-15 09:28:24'),
(562, 270, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.125', 'Safari', 'Unknown', 'Mobile', '2025-06-15 09:50:30', '2025-06-15 09:50:30'),
(563, 271, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.129', 'Safari', 'Unknown', 'Mobile', '2025-06-15 10:38:21', '2025-06-15 10:38:21'),
(564, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.211.38', 'Safari', 'Unknown', 'Mobile', '2025-06-15 12:23:47', '2025-06-15 12:23:47'),
(565, 273, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.219', 'Safari', 'iOS', 'Mobile', '2025-06-15 17:34:14', '2025-06-15 17:34:14'),
(566, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.250', 'Safari', 'Unknown', 'Mobile', '2025-06-16 03:28:13', '2025-06-16 03:28:13'),
(567, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.103', 'Safari', 'Unknown', 'Mobile', '2025-06-16 05:22:45', '2025-06-16 05:22:45'),
(568, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.132', 'Chrome', 'Linux', 'Mobile', '2025-06-16 06:19:37', '2025-06-16 06:19:37'),
(569, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.232', 'Chrome', 'Windows', 'Desktop', '2025-06-16 11:35:14', '2025-06-16 11:35:14'),
(570, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.32', 'Safari', 'Unknown', 'Mobile', '2025-06-16 12:02:26', '2025-06-16 12:02:26'),
(571, 276, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.197', 'Chrome', 'Linux', 'Mobile', '2025-06-16 12:07:25', '2025-06-16 12:07:25'),
(572, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.4', 'Chrome', 'Linux', 'Mobile', '2025-06-16 13:51:08', '2025-06-16 13:51:08'),
(573, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.75', 'Chrome', 'Linux', 'Mobile', '2025-06-16 23:41:36', '2025-06-16 23:41:36'),
(574, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.59', 'Safari', 'Unknown', 'Mobile', '2025-06-16 23:43:40', '2025-06-16 23:43:40'),
(575, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.176', 'Chrome', 'Windows', 'Desktop', '2025-06-16 23:54:49', '2025-06-16 23:54:49'),
(576, 58, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.72', 'Chrome', 'Linux', 'Mobile', '2025-06-17 03:40:32', '2025-06-17 03:40:32'),
(577, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.130', 'Chrome', 'Linux', 'Mobile', '2025-06-17 09:48:48', '2025-06-17 09:48:48'),
(578, 277, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.167', 'Chrome', 'Windows', 'Desktop', '2025-06-17 11:14:44', '2025-06-17 11:14:44'),
(579, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.118', 'Safari', 'Unknown', 'Mobile', '2025-06-17 11:25:05', '2025-06-17 11:25:05'),
(580, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.137', 'Chrome', 'Linux', 'Mobile', '2025-06-17 12:38:27', '2025-06-17 12:38:27'),
(581, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.146', 'Chrome', 'Linux', 'Mobile', '2025-06-17 15:04:55', '2025-06-17 15:04:55'),
(582, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.176', 'Safari', 'Unknown', 'Mobile', '2025-06-17 15:59:40', '2025-06-17 15:59:40'),
(583, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.142', 'Safari', 'Unknown', 'Mobile', '2025-06-17 16:05:44', '2025-06-17 16:05:44'),
(584, 278, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.43', 'Chrome', 'Linux', 'Mobile', '2025-06-17 17:05:15', '2025-06-17 17:05:15'),
(585, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.100', 'Chrome', 'Linux', 'Mobile', '2025-06-17 23:11:51', '2025-06-17 23:11:51'),
(586, 270, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.184', 'Safari', 'Unknown', 'Mobile', '2025-06-18 02:50:10', '2025-06-18 02:50:10'),
(587, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.107', 'Safari', 'Unknown', 'Mobile', '2025-06-18 03:42:05', '2025-06-18 03:42:05'),
(588, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.136', 'Safari', 'Unknown', 'Mobile', '2025-06-18 03:47:08', '2025-06-18 03:47:08'),
(589, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.97', 'Safari', 'Unknown', 'Mobile', '2025-06-18 03:59:07', '2025-06-18 03:59:07'),
(590, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.15', 'Safari', 'Unknown', 'Mobile', '2025-06-18 04:06:04', '2025-06-18 04:06:04'),
(591, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.36', 'Safari', 'Unknown', 'Mobile', '2025-06-18 05:30:14', '2025-06-18 05:30:14'),
(592, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.228', 'Safari', 'Unknown', 'Mobile', '2025-06-18 05:31:23', '2025-06-18 05:31:23'),
(593, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.51', 'Safari', 'Unknown', 'Mobile', '2025-06-18 09:24:03', '2025-06-18 09:24:03'),
(594, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.62', 'Safari', 'Unknown', 'Mobile', '2025-06-18 12:20:15', '2025-06-18 12:20:15'),
(595, 230, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.227', 'Chrome', 'Linux', 'Mobile', '2025-06-18 13:45:44', '2025-06-18 13:45:44'),
(596, 270, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Safari', 'Unknown', 'Mobile', '2025-06-18 16:59:32', '2025-06-18 16:59:32'),
(597, 273, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.241', 'Safari', 'iOS', 'Mobile', '2025-06-18 17:00:10', '2025-06-18 17:00:10'),
(598, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.176.11', 'Chrome', 'Windows', 'Desktop', '2025-06-19 04:32:59', '2025-06-19 04:32:59'),
(599, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.68.119.62', 'Chrome', 'Windows', 'Desktop', '2025-06-19 06:39:59', '2025-06-19 06:39:59'),
(600, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.232', 'Safari', 'Unknown', 'Mobile', '2025-06-19 07:34:33', '2025-06-19 07:34:33'),
(601, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.8', 'Safari', 'Unknown', 'Mobile', '2025-06-19 08:10:50', '2025-06-19 08:10:50'),
(602, 285, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.249', 'Chrome', 'Windows', 'Desktop', '2025-06-19 12:17:46', '2025-06-19 12:17:46'),
(603, 230, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.182', 'Chrome', 'Linux', 'Mobile', '2025-06-19 12:49:46', '2025-06-19 12:49:46'),
(604, 286, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.98', 'Safari', 'Unknown', 'Mobile', '2025-06-19 14:59:23', '2025-06-19 14:59:23'),
(605, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.204', 'Chrome', 'Windows', 'Desktop', '2025-06-19 16:51:44', '2025-06-19 16:51:44'),
(606, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.146', 'Chrome', 'Linux', 'Mobile', '2025-06-20 09:44:40', '2025-06-20 09:44:40'),
(607, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.137', 'Chrome', 'Windows', 'Desktop', '2025-06-20 14:07:28', '2025-06-20 14:07:28'),
(608, 287, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.159', 'Chrome', 'Linux', 'Mobile', '2025-06-20 15:19:52', '2025-06-20 15:19:52'),
(609, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.63', 'Safari', 'Unknown', 'Mobile', '2025-06-20 22:57:20', '2025-06-20 22:57:20'),
(610, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.137', 'Chrome', 'Linux', 'Mobile', '2025-06-21 07:57:37', '2025-06-21 07:57:37'),
(611, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.174', 'Safari', 'Unknown', 'Mobile', '2025-06-21 08:56:10', '2025-06-21 08:56:10'),
(612, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.174', 'Safari', 'Unknown', 'Mobile', '2025-06-21 08:56:29', '2025-06-21 08:56:29'),
(613, 202, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.22', 'Safari', 'Unknown', 'Mobile', '2025-06-21 22:59:04', '2025-06-21 22:59:04'),
(614, 289, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.7', 'Chrome', 'Windows', 'Desktop', '2025-06-21 23:25:45', '2025-06-21 23:25:45'),
(615, 290, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.78', 'Chrome', 'Windows', 'Desktop', '2025-06-22 00:06:55', '2025-06-22 00:06:55'),
(616, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.146', 'Safari', 'Unknown', 'Mobile', '2025-06-22 07:46:18', '2025-06-22 07:46:18'),
(617, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.146', 'Safari', 'Unknown', 'Mobile', '2025-06-22 07:47:17', '2025-06-22 07:47:17'),
(618, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.228', 'Safari', 'Unknown', 'Mobile', '2025-06-22 09:52:26', '2025-06-22 09:52:26'),
(619, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.87', 'Safari', 'Unknown', 'Mobile', '2025-06-22 15:08:26', '2025-06-22 15:08:26'),
(620, 293, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.237', 'Chrome', 'Linux', 'Mobile', '2025-06-22 17:21:23', '2025-06-22 17:21:23');
INSERT INTO `user_logins` (`id`, `user_id`, `child_panel_id`, `longitude`, `latitude`, `country_code`, `location`, `country`, `ip_address`, `browser`, `os`, `get_device`, `created_at`, `updated_at`) VALUES
(621, 293, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.95', 'Chrome', 'Linux', 'Mobile', '2025-06-22 19:45:30', '2025-06-22 19:45:30'),
(622, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.9', 'Safari', 'Unknown', 'Mobile', '2025-06-23 02:41:31', '2025-06-23 02:41:31'),
(623, 293, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.191', 'Chrome', 'Linux', 'Mobile', '2025-06-23 04:05:29', '2025-06-23 04:05:29'),
(624, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.59', 'Chrome', 'Windows', 'Desktop', '2025-06-23 05:43:46', '2025-06-23 05:43:46'),
(625, 18, NULL, '139.6503', '35.6761', 'JP', 'Tokyo', 'Japan', '172.71.8.41', 'Safari', 'Unknown', 'Mobile', '2025-06-23 10:09:11', '2025-06-23 10:09:11'),
(626, 140, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.29', 'Chrome', 'Linux', 'Mobile', '2025-06-23 14:35:42', '2025-06-23 14:35:42'),
(627, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.229', 'Safari', 'Unknown', 'Mobile', '2025-06-24 07:28:09', '2025-06-24 07:28:09'),
(628, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.164', 'Chrome', 'Windows', 'Desktop', '2025-06-24 09:23:51', '2025-06-24 09:23:51'),
(629, 270, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.12', 'Safari', 'Unknown', 'Mobile', '2025-06-24 09:29:31', '2025-06-24 09:29:31'),
(630, 79, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.120', 'Safari', 'iOS', 'Mobile', '2025-06-24 12:35:27', '2025-06-24 12:35:27'),
(631, 111, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.112', 'Safari', 'Unknown', 'Mobile', '2025-06-24 15:35:19', '2025-06-24 15:35:19'),
(632, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.22', 'Chrome', 'Windows', 'Desktop', '2025-06-24 17:38:27', '2025-06-24 17:38:27'),
(633, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.11', 'Safari', 'Unknown', 'Mobile', '2025-06-24 17:41:24', '2025-06-24 17:41:24'),
(634, 169, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.60', 'Safari', 'Unknown', 'Mobile', '2025-06-25 02:06:17', '2025-06-25 02:06:17'),
(635, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.129', 'Safari', 'Unknown', 'Mobile', '2025-06-25 04:05:10', '2025-06-25 04:05:10'),
(636, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.74', 'Safari', 'Unknown', 'Mobile', '2025-06-25 04:49:45', '2025-06-25 04:49:45'),
(637, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.108', 'Safari', 'Unknown', 'Mobile', '2025-06-25 06:05:59', '2025-06-25 06:05:59'),
(638, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.9', 'Safari', 'Unknown', 'Mobile', '2025-06-25 06:44:04', '2025-06-25 06:44:04'),
(639, 56, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.113', 'Safari', 'Unknown', 'Mobile', '2025-06-25 08:42:33', '2025-06-25 08:42:33'),
(640, 169, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.162', 'Safari', 'Unknown', 'Mobile', '2025-06-25 09:51:23', '2025-06-25 09:51:23'),
(641, 169, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.12', 'Safari', 'Unknown', 'Mobile', '2025-06-25 10:23:00', '2025-06-25 10:23:00'),
(642, 214, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.75', 'Chrome', 'Windows', 'Desktop', '2025-06-26 02:02:10', '2025-06-26 02:02:10'),
(643, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.23', 'Safari', 'Unknown', 'Mobile', '2025-06-27 03:09:24', '2025-06-27 03:09:24'),
(644, 296, NULL, '115.8604', '-31.9505', 'AU', 'Perth', 'Australia', '172.68.0.174', 'Safari', 'Unknown', 'Mobile', '2025-06-27 10:46:35', '2025-06-27 10:46:35'),
(645, 296, NULL, '115.8604', '-31.9505', 'AU', 'Perth', 'Australia', '172.68.86.163', 'Safari', 'Unknown', 'Mobile', '2025-06-27 14:33:26', '2025-06-27 14:33:26'),
(646, 109, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.228', 'Chrome', 'Windows', 'Desktop', '2025-06-27 15:23:15', '2025-06-27 15:23:15'),
(647, 296, NULL, '115.8604', '-31.9505', 'AU', 'Perth', 'Australia', '172.68.0.175', 'Safari', 'Unknown', 'Mobile', '2025-06-28 00:31:05', '2025-06-28 00:31:05'),
(648, 297, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.73', 'Chrome', 'Windows', 'Desktop', '2025-06-28 00:56:42', '2025-06-28 00:56:42'),
(649, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.64', 'Safari', 'Unknown', 'Mobile', '2025-06-28 04:38:07', '2025-06-28 04:38:07'),
(650, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.23', 'Chrome', 'Windows', 'Desktop', '2025-06-28 11:19:51', '2025-06-28 11:19:51'),
(651, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.83', 'Chrome', 'Windows', 'Desktop', '2025-06-28 13:35:09', '2025-06-28 13:35:09'),
(652, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.82', 'Chrome', 'Windows', 'Desktop', '2025-06-29 01:58:59', '2025-06-29 01:58:59'),
(653, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.175', 'Chrome', 'Linux', 'Mobile', '2025-06-29 01:59:17', '2025-06-29 01:59:17'),
(654, 299, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.18', 'Safari', 'Unknown', 'Mobile', '2025-06-29 16:04:11', '2025-06-29 16:04:11'),
(655, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.190', 'Chrome', 'Windows', 'Desktop', '2025-06-30 03:56:08', '2025-06-30 03:56:08'),
(656, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Safari', 'Unknown', 'Mobile', '2025-06-30 04:27:09', '2025-06-30 04:27:09'),
(657, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.17', 'Chrome', 'Windows', 'Desktop', '2025-06-30 04:58:14', '2025-06-30 04:58:14'),
(658, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.54', 'Chrome', 'Windows', 'Desktop', '2025-06-30 05:14:01', '2025-06-30 05:14:01'),
(659, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.69', 'Chrome', 'Windows', 'Desktop', '2025-06-30 06:12:08', '2025-06-30 06:12:08'),
(660, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.95', 'Safari', 'Unknown', 'Mobile', '2025-06-30 07:23:47', '2025-06-30 07:23:47'),
(661, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.184', 'Chrome', 'Windows', 'Desktop', '2025-06-30 10:09:20', '2025-06-30 10:09:20'),
(662, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.163', 'Chrome', 'Windows', 'Desktop', '2025-06-30 11:59:08', '2025-06-30 11:59:08'),
(663, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.200', 'Safari', 'Unknown', 'Mobile', '2025-06-30 12:00:45', '2025-06-30 12:00:45'),
(664, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.137', 'Chrome', 'Windows', 'Desktop', '2025-06-30 13:09:04', '2025-06-30 13:09:04'),
(665, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.95', 'Chrome', 'Windows', 'Desktop', '2025-06-30 14:23:24', '2025-06-30 14:23:24'),
(666, 200, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.134', 'Safari', 'Unknown', 'Mobile', '2025-06-30 15:45:07', '2025-06-30 15:45:07'),
(667, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.27', 'Chrome', 'Linux', 'Mobile', '2025-07-01 02:46:58', '2025-07-01 02:46:58'),
(668, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.76', 'Chrome', 'Windows', 'Desktop', '2025-07-01 04:27:05', '2025-07-01 04:27:05'),
(669, 200, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.65', 'Safari', 'Unknown', 'Mobile', '2025-07-01 05:06:05', '2025-07-01 05:06:05'),
(670, 296, NULL, '115.8604', '-31.9505', 'AU', 'Perth', 'Australia', '172.68.86.164', 'Safari', 'Unknown', 'Mobile', '2025-07-01 14:51:11', '2025-07-01 14:51:11'),
(671, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.53', 'Chrome', 'Windows', 'Desktop', '2025-07-01 16:48:58', '2025-07-01 16:48:58'),
(672, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.14', 'Safari', 'Unknown', 'Mobile', '2025-07-02 00:46:25', '2025-07-02 00:46:25'),
(673, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.104', 'Chrome', 'Windows', 'Desktop', '2025-07-02 01:44:31', '2025-07-02 01:44:31'),
(674, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.17', 'Chrome', 'Windows', 'Desktop', '2025-07-02 11:23:57', '2025-07-02 11:23:57'),
(675, 276, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.235', 'Chrome', 'Linux', 'Mobile', '2025-07-02 13:45:36', '2025-07-02 13:45:36'),
(676, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.19', 'Chrome', 'Windows', 'Desktop', '2025-07-02 14:42:42', '2025-07-02 14:42:42'),
(677, 276, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.124', 'Chrome', 'Linux', 'Mobile', '2025-07-02 17:07:46', '2025-07-02 17:07:46'),
(678, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.185', 'Unknown', 'IOS', 'Mobile', '2025-07-03 12:01:52', '2025-07-03 12:01:52'),
(679, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.185', 'Unknown', 'IOS', 'Mobile', '2025-07-03 12:08:45', '2025-07-03 12:08:45'),
(680, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.190', 'Unknown', 'IOS', 'Mobile', '2025-07-03 12:12:11', '2025-07-03 12:12:11'),
(681, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.57', 'Unknown', 'IOS', 'Mobile', '2025-07-03 13:09:37', '2025-07-03 13:09:37'),
(682, 304, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.185', 'Safari', 'Unknown', 'Mobile', '2025-07-03 15:55:40', '2025-07-03 15:55:40'),
(683, 304, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.153', 'Safari', 'Unknown', 'Mobile', '2025-07-03 16:00:20', '2025-07-03 16:00:20'),
(684, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.12', 'Chrome', 'Linux', 'Mobile', '2025-07-04 00:06:59', '2025-07-04 00:06:59'),
(685, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.57', 'Chrome', 'Windows', 'Desktop', '2025-07-04 03:35:02', '2025-07-04 03:35:02'),
(686, 25, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.165', 'Safari', 'Unknown', 'Mobile', '2025-07-04 04:41:30', '2025-07-04 04:41:30'),
(687, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.87', 'Chrome', 'Windows', 'Desktop', '2025-07-04 04:46:11', '2025-07-04 04:46:11'),
(688, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.145', 'Chrome', 'Windows', 'Desktop', '2025-07-04 06:03:04', '2025-07-04 06:03:04'),
(689, 305, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.153', 'Chrome', 'Linux', 'Mobile', '2025-07-04 09:53:17', '2025-07-04 09:53:17'),
(690, 276, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.83', 'Chrome', 'Linux', 'Mobile', '2025-07-04 12:10:59', '2025-07-04 12:10:59'),
(691, 304, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.20', 'Safari', 'Unknown', 'Mobile', '2025-07-04 13:09:24', '2025-07-04 13:09:24'),
(692, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.139', 'Chrome', 'Windows', 'Desktop', '2025-07-04 13:34:42', '2025-07-04 13:34:42'),
(693, 304, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.105', 'Safari', 'Unknown', 'Mobile', '2025-07-04 13:41:46', '2025-07-04 13:41:46'),
(694, 304, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.38', 'Safari', 'Unknown', 'Mobile', '2025-07-04 14:28:50', '2025-07-04 14:28:50'),
(695, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.249', 'Chrome', 'Windows', 'Desktop', '2025-07-04 14:29:34', '2025-07-04 14:29:34'),
(696, 306, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.123', 'Safari', 'Unknown', 'Mobile', '2025-07-04 16:56:45', '2025-07-04 16:56:45'),
(697, 276, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.139', 'Chrome', 'Linux', 'Mobile', '2025-07-04 17:43:27', '2025-07-04 17:43:27'),
(698, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Chrome', 'Linux', 'Mobile', '2025-07-04 23:50:26', '2025-07-04 23:50:26'),
(699, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.104', 'Safari', 'Unknown', 'Mobile', '2025-07-05 00:06:59', '2025-07-05 00:06:59'),
(700, 303, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.12', 'Unknown', 'IOS', 'Mobile', '2025-07-05 01:26:10', '2025-07-05 01:26:10'),
(701, 307, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.201', 'Safari', 'Unknown', 'Mobile', '2025-07-05 03:29:39', '2025-07-05 03:29:39'),
(702, 307, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.17', 'Safari', 'Unknown', 'Mobile', '2025-07-05 03:38:13', '2025-07-05 03:38:13'),
(703, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.65', 'Safari', 'Unknown', 'Mobile', '2025-07-05 06:29:59', '2025-07-05 06:29:59'),
(704, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.246', 'Chrome', 'Windows', 'Desktop', '2025-07-05 08:16:00', '2025-07-05 08:16:00'),
(705, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.29', 'Chrome', 'Linux', 'Mobile', '2025-07-05 11:10:25', '2025-07-05 11:10:25'),
(706, 308, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.156', 'Chrome', 'Windows', 'Desktop', '2025-07-05 13:19:42', '2025-07-05 13:19:42'),
(707, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.17', 'Chrome', 'Windows', 'Desktop', '2025-07-05 13:29:56', '2025-07-05 13:29:56'),
(708, 304, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.218', 'Safari', 'Unknown', 'Mobile', '2025-07-05 16:10:37', '2025-07-05 16:10:37'),
(709, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.129', 'Safari', 'Unknown', 'Mobile', '2025-07-05 16:29:54', '2025-07-05 16:29:54'),
(710, 309, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.49', 'Safari', 'Unknown', 'Mobile', '2025-07-06 01:04:15', '2025-07-06 01:04:15'),
(711, 309, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.115', 'Safari', 'Unknown', 'Mobile', '2025-07-06 02:14:45', '2025-07-06 02:14:45'),
(712, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.69', 'Chrome', 'Windows', 'Desktop', '2025-07-06 03:03:23', '2025-07-06 03:03:23'),
(713, 309, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.110', 'Safari', 'Unknown', 'Mobile', '2025-07-06 05:12:17', '2025-07-06 05:12:17'),
(714, 200, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.110', 'Safari', 'Unknown', 'Mobile', '2025-07-06 05:13:09', '2025-07-06 05:13:09'),
(715, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.163', 'Chrome', 'Windows', 'Desktop', '2025-07-06 09:57:24', '2025-07-06 09:57:24'),
(716, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.253', 'Chrome', 'Linux', 'Mobile', '2025-07-06 12:18:59', '2025-07-06 12:18:59'),
(717, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.82', 'Safari', 'Unknown', 'Mobile', '2025-07-06 13:39:33', '2025-07-06 13:39:33'),
(718, 311, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.161', 'Chrome', 'Linux', 'Mobile', '2025-07-07 06:37:11', '2025-07-07 06:37:11'),
(719, 243, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.77', 'Safari', 'Unknown', 'Mobile', '2025-07-07 14:04:50', '2025-07-07 14:04:50'),
(720, 243, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.96', 'Chrome', 'Windows', 'Desktop', '2025-07-07 14:06:35', '2025-07-07 14:06:35'),
(721, 65, NULL, '105.8341', '21.0277', 'VN', 'Hanoi', 'Vietnam', '172.69.120.130', 'Safari', 'Unknown', 'Mobile', '2025-07-08 01:49:15', '2025-07-08 01:49:15'),
(722, 312, NULL, '105.8341', '21.0277', 'VN', 'Hanoi', 'Vietnam', '172.69.120.135', 'Chrome', 'Macintosh', 'Desktop', '2025-07-08 01:51:49', '2025-07-08 01:51:49'),
(723, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.127', 'Chrome', 'Windows', 'Desktop', '2025-07-08 04:10:07', '2025-07-08 04:10:07'),
(724, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.64', 'Safari', 'Unknown', 'Mobile', '2025-07-08 05:01:07', '2025-07-08 05:01:07'),
(725, 276, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.199', 'Chrome', 'Linux', 'Mobile', '2025-07-08 06:55:40', '2025-07-08 06:55:40'),
(726, 229, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.165', 'Safari', 'Unknown', 'Mobile', '2025-07-08 10:46:40', '2025-07-08 10:46:40'),
(727, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.93.37', 'Chrome', 'Windows', 'Desktop', '2025-07-08 15:38:23', '2025-07-08 15:38:23'),
(728, 315, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.104', 'Chrome', 'Windows', 'Desktop', '2025-07-08 15:48:27', '2025-07-08 15:48:27'),
(729, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.64', 'Safari', 'Unknown', 'Mobile', '2025-07-08 17:06:27', '2025-07-08 17:06:27'),
(730, 316, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.148', 'Chrome', 'Windows', 'Desktop', '2025-07-09 04:21:28', '2025-07-09 04:21:28'),
(731, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.165.51', 'Chrome', 'Windows', 'Desktop', '2025-07-09 04:41:51', '2025-07-09 04:41:51'),
(732, 316, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.179', 'Chrome', 'Windows', 'Desktop', '2025-07-09 04:43:16', '2025-07-09 04:43:16'),
(733, 316, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.38', 'Chrome', 'Windows', 'Desktop', '2025-07-09 04:50:51', '2025-07-09 04:50:51'),
(734, 318, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.90', 'Safari', 'Unknown', 'Mobile', '2025-07-09 11:45:01', '2025-07-09 11:45:01'),
(735, 309, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.24', 'Safari', 'Unknown', 'Mobile', '2025-07-09 15:36:37', '2025-07-09 15:36:37'),
(736, 309, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.62', 'Safari', 'Unknown', 'Mobile', '2025-07-09 23:25:16', '2025-07-09 23:25:16'),
(737, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.108', 'Chrome', 'Linux', 'Mobile', '2025-07-10 00:03:28', '2025-07-10 00:03:28'),
(738, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.97', 'Chrome', 'Windows', 'Desktop', '2025-07-10 02:53:49', '2025-07-10 02:53:49'),
(739, 303, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.137', 'Unknown', 'IOS', 'Mobile', '2025-07-10 10:08:56', '2025-07-10 10:08:56'),
(740, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.157', 'Unknown', 'IOS', 'Mobile', '2025-07-10 11:54:41', '2025-07-10 11:54:41'),
(741, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.117', 'Chrome', 'Windows', 'Desktop', '2025-07-10 16:40:13', '2025-07-10 16:40:13'),
(742, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.98', 'Chrome', 'Windows', 'Desktop', '2025-07-11 03:02:45', '2025-07-11 03:02:45'),
(743, 293, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.160', 'Chrome', 'Linux', 'Mobile', '2025-07-11 05:00:50', '2025-07-11 05:00:50'),
(744, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.214', 'Unknown', 'IOS', 'Mobile', '2025-07-11 05:59:07', '2025-07-11 05:59:07'),
(745, 303, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.99', 'Unknown', 'IOS', 'Mobile', '2025-07-11 06:44:24', '2025-07-11 06:44:24'),
(746, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.137', 'Unknown', 'IOS', 'Mobile', '2025-07-11 06:59:28', '2025-07-11 06:59:28'),
(747, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.120', 'Unknown', 'IOS', 'Mobile', '2025-07-11 10:42:55', '2025-07-11 10:42:55'),
(748, 104, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.163', 'Chrome', 'Linux', 'Mobile', '2025-07-11 20:55:13', '2025-07-11 20:55:13'),
(749, 304, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.199', 'Safari', 'Unknown', 'Mobile', '2025-07-12 00:12:36', '2025-07-12 00:12:36'),
(750, 320, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.121', 'Chrome', 'Linux', 'Mobile', '2025-07-12 05:17:12', '2025-07-12 05:17:12'),
(751, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.62', 'Safari', 'iOS', 'Mobile', '2025-07-12 12:37:44', '2025-07-12 12:37:44'),
(752, 322, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.216', 'Safari', 'Unknown', 'Mobile', '2025-07-12 12:39:24', '2025-07-12 12:39:24'),
(753, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.60', 'Safari', 'iOS', 'Mobile', '2025-07-12 14:31:15', '2025-07-12 14:31:15'),
(754, 323, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.139', 'Chrome', 'Linux', 'Mobile', '2025-07-12 14:31:56', '2025-07-12 14:31:56'),
(755, 323, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.97', 'Chrome', 'Linux', 'Mobile', '2025-07-12 14:37:16', '2025-07-12 14:37:16'),
(756, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.4', 'Chrome', 'Windows', 'Desktop', '2025-07-12 15:40:49', '2025-07-12 15:40:49'),
(757, 303, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.183', 'Unknown', 'IOS', 'Mobile', '2025-07-13 13:15:42', '2025-07-13 13:15:42'),
(758, 321, NULL, '121.5654', '25.0329', 'TW', 'Taipei', 'Taiwan', '172.69.221.4', 'Safari', 'iOS', 'Mobile', '2025-07-13 14:15:39', '2025-07-13 14:15:39'),
(759, 322, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.40', 'Safari', 'Unknown', 'Mobile', '2025-07-13 16:45:27', '2025-07-13 16:45:27'),
(760, 325, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.24', 'Safari', 'Unknown', 'Mobile', '2025-07-13 21:54:49', '2025-07-13 21:54:49'),
(761, 325, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.7', 'Safari', 'Unknown', 'Mobile', '2025-07-13 21:59:27', '2025-07-13 21:59:27'),
(762, 326, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.25', 'Chrome', 'Windows', 'Desktop', '2025-07-14 14:24:59', '2025-07-14 14:24:59'),
(763, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.184', 'Safari', 'iOS', 'Mobile', '2025-07-15 01:48:41', '2025-07-15 01:48:41'),
(764, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.16', 'Safari', 'iOS', 'Mobile', '2025-07-15 09:53:30', '2025-07-15 09:53:30'),
(765, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.171', 'Chrome', 'Windows', 'Desktop', '2025-07-15 10:44:22', '2025-07-15 10:44:22'),
(766, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.17', 'Chrome', 'Windows', 'Desktop', '2025-07-15 12:28:24', '2025-07-15 12:28:24'),
(767, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.93.6', 'Safari', 'Unknown', 'Mobile', '2025-07-15 13:48:23', '2025-07-15 13:48:23'),
(768, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.23', 'Chrome', 'Windows', 'Desktop', '2025-07-15 15:28:16', '2025-07-15 15:28:16'),
(769, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.105', 'Chrome', 'Linux', 'Mobile', '2025-07-16 00:19:31', '2025-07-16 00:19:31'),
(770, 332, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.14', 'Chrome', 'Macintosh', 'Desktop', '2025-07-16 03:28:29', '2025-07-16 03:28:29'),
(771, 333, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.61', 'Chrome', 'Windows', 'Desktop', '2025-07-16 04:21:07', '2025-07-16 04:21:07'),
(772, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.14', 'Chrome', 'Windows', 'Desktop', '2025-07-16 08:27:14', '2025-07-16 08:27:14'),
(773, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.150', 'Safari', 'iOS', 'Mobile', '2025-07-16 12:38:57', '2025-07-16 12:38:57'),
(774, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.189', 'Safari', 'iOS', 'Mobile', '2025-07-16 13:29:05', '2025-07-16 13:29:05'),
(775, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.208', 'Safari', 'iOS', 'Mobile', '2025-07-16 13:50:26', '2025-07-16 13:50:26'),
(776, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.189', 'Safari', 'iOS', 'Mobile', '2025-07-16 14:04:14', '2025-07-16 14:04:14'),
(777, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.121', 'Safari', 'iOS', 'Mobile', '2025-07-16 14:57:17', '2025-07-16 14:57:17'),
(778, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.39', 'Safari', 'iOS', 'Mobile', '2025-07-16 16:36:46', '2025-07-16 16:36:46'),
(779, 262, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.28', 'Chrome', 'Linux', 'Mobile', '2025-07-16 17:20:35', '2025-07-16 17:20:35'),
(780, 334, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.246', 'Chrome', 'Windows', 'Desktop', '2025-07-17 02:51:51', '2025-07-17 02:51:51'),
(781, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.61', 'Chrome', 'Linux', 'Mobile', '2025-07-17 11:39:45', '2025-07-17 11:39:45'),
(782, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.141', 'Chrome', 'Windows', 'Desktop', '2025-07-17 11:46:06', '2025-07-17 11:46:06'),
(783, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.94', 'Chrome', 'Linux', 'Mobile', '2025-07-17 12:19:24', '2025-07-17 12:19:24'),
(784, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.39', 'Chrome', 'Linux', 'Mobile', '2025-07-17 12:48:43', '2025-07-17 12:48:43'),
(785, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.124', 'Chrome', 'Windows', 'Desktop', '2025-07-17 14:26:36', '2025-07-17 14:26:36'),
(786, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.204', 'Chrome', 'Linux', 'Mobile', '2025-07-17 15:05:03', '2025-07-17 15:05:03'),
(787, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.87', 'Chrome', 'Linux', 'Mobile', '2025-07-17 23:43:04', '2025-07-17 23:43:04'),
(788, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Chrome', 'Linux', 'Mobile', '2025-07-18 02:33:27', '2025-07-18 02:33:27'),
(789, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.147.164', 'Chrome', 'Windows', 'Desktop', '2025-07-18 11:56:07', '2025-07-18 11:56:07'),
(790, 335, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.155', 'Chrome', 'Windows', 'Desktop', '2025-07-18 13:17:35', '2025-07-18 13:17:35'),
(791, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.123', 'Chrome', 'Windows', 'Desktop', '2025-07-19 08:49:35', '2025-07-19 08:49:35'),
(792, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.204', 'Chrome', 'Linux', 'Mobile', '2025-07-19 09:31:18', '2025-07-19 09:31:18'),
(793, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.171', 'Safari', 'Unknown', 'Mobile', '2025-07-19 11:27:41', '2025-07-19 11:27:41'),
(794, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.11', 'Safari', 'Unknown', 'Mobile', '2025-07-19 12:00:10', '2025-07-19 12:00:10'),
(795, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.242', 'Safari', 'Unknown', 'Mobile', '2025-07-19 12:19:20', '2025-07-19 12:19:20'),
(796, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.235', 'Safari', 'Unknown', 'Mobile', '2025-07-19 15:02:58', '2025-07-19 15:02:58'),
(797, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.6', 'Safari', 'Unknown', 'Mobile', '2025-07-19 15:43:50', '2025-07-19 15:43:50'),
(798, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.120', 'Safari', 'Unknown', 'Mobile', '2025-07-19 16:07:45', '2025-07-19 16:07:45'),
(799, 270, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.184', 'Safari', 'Unknown', 'Mobile', '2025-07-19 16:51:37', '2025-07-19 16:51:37'),
(800, 65, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.58', 'Safari', 'Unknown', 'Mobile', '2025-07-20 01:55:23', '2025-07-20 01:55:23'),
(801, 304, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.111', 'Safari', 'Unknown', 'Mobile', '2025-07-20 10:10:50', '2025-07-20 10:10:50'),
(802, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.150', 'Safari', 'Unknown', 'Mobile', '2025-07-20 12:26:02', '2025-07-20 12:26:02'),
(803, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.16', 'Safari', 'Unknown', 'Mobile', '2025-07-20 12:40:44', '2025-07-20 12:40:44'),
(804, 336, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.193', 'Chrome', 'Windows', 'Desktop', '2025-07-20 21:51:29', '2025-07-20 21:51:29'),
(805, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.64', 'Safari', 'Unknown', 'Mobile', '2025-07-21 05:55:12', '2025-07-21 05:55:12'),
(806, 309, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.185', 'Safari', 'Unknown', 'Mobile', '2025-07-21 08:42:29', '2025-07-21 08:42:29'),
(807, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.23', 'Chrome', 'Windows', 'Desktop', '2025-07-21 14:02:53', '2025-07-21 14:02:53'),
(808, 321, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.58', 'Safari', 'iOS', 'Mobile', '2025-07-21 21:08:11', '2025-07-21 21:08:11'),
(809, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.171.20', 'Chrome', 'Linux', 'Mobile', '2025-07-22 00:40:01', '2025-07-22 00:40:01'),
(810, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.136', 'Chrome', 'Windows', 'Desktop', '2025-07-22 06:28:15', '2025-07-22 06:28:15'),
(811, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.104', 'Chrome', 'Windows', 'Desktop', '2025-07-22 07:00:22', '2025-07-22 07:00:22'),
(812, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.49', 'Safari', 'Unknown', 'Mobile', '2025-07-22 09:54:29', '2025-07-22 09:54:29'),
(813, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.74', 'Safari', 'Unknown', 'Mobile', '2025-07-22 10:18:34', '2025-07-22 10:18:34'),
(814, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.201', 'Safari', 'Unknown', 'Mobile', '2025-07-22 10:26:02', '2025-07-22 10:26:02'),
(815, 338, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.202', 'Chrome', 'Windows', 'Desktop', '2025-07-22 10:44:42', '2025-07-22 10:44:42'),
(816, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.166', 'Safari', 'Unknown', 'Mobile', '2025-07-22 10:57:08', '2025-07-22 10:57:08'),
(817, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.7', 'Safari', 'iOS', 'Mobile', '2025-07-22 13:23:28', '2025-07-22 13:23:28'),
(818, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.246', 'Safari', 'iOS', 'Mobile', '2025-07-22 13:50:28', '2025-07-22 13:50:28'),
(819, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.24', 'Safari', 'iOS', 'Mobile', '2025-07-22 20:36:27', '2025-07-22 20:36:27'),
(820, 308, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.17', 'Chrome', 'Windows', 'Desktop', '2025-07-23 03:50:30', '2025-07-23 03:50:30'),
(821, 339, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.159', 'Unknown', 'IOS', 'Mobile', '2025-07-23 06:54:57', '2025-07-23 06:54:57'),
(822, 308, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.191', 'Chrome', 'Windows', 'Desktop', '2025-07-23 08:56:48', '2025-07-23 08:56:48'),
(823, 308, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.149', 'Chrome', 'Windows', 'Desktop', '2025-07-23 13:12:29', '2025-07-23 13:12:29'),
(824, 340, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.135', 'Safari', 'Unknown', 'Mobile', '2025-07-23 14:36:04', '2025-07-23 14:36:04'),
(825, 340, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.165', 'Safari', 'Unknown', 'Mobile', '2025-07-23 15:37:18', '2025-07-23 15:37:18'),
(826, 341, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.121', 'Chrome', 'Windows', 'Desktop', '2025-07-23 21:05:39', '2025-07-23 21:05:39'),
(827, 341, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.70', 'Chrome', 'Windows', 'Desktop', '2025-07-24 03:08:14', '2025-07-24 03:08:14'),
(828, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.176', 'Safari', 'Unknown', 'Mobile', '2025-07-24 05:57:57', '2025-07-24 05:57:57'),
(829, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.174', 'Safari', 'Unknown', 'Mobile', '2025-07-24 06:03:01', '2025-07-24 06:03:01'),
(830, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.2', 'Safari', 'Unknown', 'Mobile', '2025-07-24 06:43:37', '2025-07-24 06:43:37'),
(831, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.242', 'Safari', 'Unknown', 'Mobile', '2025-07-24 08:52:13', '2025-07-24 08:52:13'),
(832, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.145', 'Safari', 'Unknown', 'Mobile', '2025-07-24 09:02:16', '2025-07-24 09:02:16'),
(833, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.148', 'Safari', 'Unknown', 'Mobile', '2025-07-24 09:14:24', '2025-07-24 09:14:24'),
(834, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.130', 'Safari', 'Unknown', 'Mobile', '2025-07-24 09:27:44', '2025-07-24 09:27:44'),
(835, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.185', 'Safari', 'Unknown', 'Mobile', '2025-07-24 09:39:58', '2025-07-24 09:39:58'),
(836, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.170', 'Safari', 'Unknown', 'Mobile', '2025-07-24 09:53:39', '2025-07-24 09:53:39'),
(837, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.16', 'Safari', 'Unknown', 'Mobile', '2025-07-24 11:05:57', '2025-07-24 11:05:57'),
(838, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.169', 'Safari', 'Unknown', 'Mobile', '2025-07-24 11:23:54', '2025-07-24 11:23:54'),
(839, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.146', 'Chrome', 'Windows', 'Desktop', '2025-07-24 13:57:17', '2025-07-24 13:57:17'),
(840, 342, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.71', 'Chrome', 'Windows', 'Desktop', '2025-07-24 14:45:30', '2025-07-24 14:45:30'),
(841, 341, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.63', 'Chrome', 'Windows', 'Desktop', '2025-07-24 15:09:43', '2025-07-24 15:09:43'),
(842, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.8', 'Chrome', 'Windows', 'Desktop', '2025-07-24 22:53:03', '2025-07-24 22:53:03'),
(843, 335, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.17', 'Chrome', 'Windows', 'Desktop', '2025-07-25 23:46:44', '2025-07-25 23:46:44'),
(844, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.55', 'Chrome', 'Windows', 'Desktop', '2025-07-26 01:41:00', '2025-07-26 01:41:00'),
(845, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.164', 'Chrome', 'Windows', 'Desktop', '2025-07-26 11:16:28', '2025-07-26 11:16:28'),
(846, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.232', 'Chrome', 'Linux', 'Mobile', '2025-07-27 03:09:21', '2025-07-27 03:09:21'),
(847, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.63', 'Chrome', 'Windows', 'Desktop', '2025-07-28 01:44:56', '2025-07-28 01:44:56'),
(848, 344, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.108', 'Chrome', 'Windows', 'Desktop', '2025-07-28 02:50:34', '2025-07-28 02:50:34'),
(849, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.61', 'Safari', 'Unknown', 'Mobile', '2025-07-28 04:14:28', '2025-07-28 04:14:28'),
(850, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.120', 'Chrome', 'Windows', 'Desktop', '2025-07-28 14:29:37', '2025-07-28 14:29:37'),
(851, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.154', 'Safari', 'Unknown', 'Mobile', '2025-07-28 14:55:47', '2025-07-28 14:55:47'),
(852, 345, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.60', 'Safari', 'Unknown', 'Mobile', '2025-07-28 14:58:13', '2025-07-28 14:58:13'),
(853, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.130', 'Safari', 'Unknown', 'Mobile', '2025-07-28 15:29:12', '2025-07-28 15:29:12'),
(854, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.177', 'Safari', 'Unknown', 'Mobile', '2025-07-28 16:02:26', '2025-07-28 16:02:26'),
(855, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.200', 'Safari', 'Unknown', 'Mobile', '2025-07-28 16:03:01', '2025-07-28 16:03:01'),
(856, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.70', 'Safari', 'Unknown', 'Mobile', '2025-07-28 16:22:27', '2025-07-28 16:22:27'),
(857, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.128', 'Safari', 'Unknown', 'Mobile', '2025-07-28 23:36:13', '2025-07-28 23:36:13'),
(858, 346, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.14', 'Chrome', 'Windows', 'Desktop', '2025-07-29 11:09:18', '2025-07-29 11:09:18'),
(859, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.21', 'Safari', 'Unknown', 'Mobile', '2025-07-29 13:41:08', '2025-07-29 13:41:08'),
(860, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.65', 'Chrome', 'Windows', 'Desktop', '2025-07-30 09:48:27', '2025-07-30 09:48:27'),
(861, 173, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.101', 'Chrome', 'Windows', 'Desktop', '2025-07-30 09:54:08', '2025-07-30 09:54:08'),
(862, 308, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.77', 'Chrome', 'Windows', 'Desktop', '2025-07-31 06:50:12', '2025-07-31 06:50:12'),
(863, 90, NULL, '-122.332', '47.6062', 'US', 'Seattle', 'United States', '172.71.151.197', 'Chrome', 'Linux', 'Mobile', '2025-07-31 09:06:49', '2025-07-31 09:06:49'),
(864, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.132', 'Chrome', 'Windows', 'Desktop', '2025-07-31 09:12:24', '2025-07-31 09:12:24'),
(865, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.39', 'Chrome', 'Windows', 'Desktop', '2025-07-31 09:22:19', '2025-07-31 09:22:19'),
(866, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.64', 'Chrome', 'Linux', 'Mobile', '2025-07-31 10:46:43', '2025-07-31 10:46:43'),
(867, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.191', 'Safari', 'Unknown', 'Mobile', '2025-07-31 16:10:19', '2025-07-31 16:10:19'),
(868, 270, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.165.18', 'Safari', 'Unknown', 'Mobile', '2025-08-01 01:29:36', '2025-08-01 01:29:36'),
(869, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.60', 'Safari', 'Unknown', 'Mobile', '2025-08-01 04:21:14', '2025-08-01 04:21:14'),
(870, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Chrome', 'Windows', 'Desktop', '2025-08-01 06:00:43', '2025-08-01 06:00:43'),
(871, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.164', 'Chrome', 'Windows', 'Desktop', '2025-08-01 13:33:12', '2025-08-01 13:33:12'),
(872, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.116', 'Safari', 'Unknown', 'Mobile', '2025-08-01 13:43:34', '2025-08-01 13:43:34'),
(873, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.170', 'Safari', 'Unknown', 'Mobile', '2025-08-01 16:56:07', '2025-08-01 16:56:07'),
(874, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.13', 'Chrome', 'Windows', 'Desktop', '2025-08-02 01:08:58', '2025-08-02 01:08:58'),
(875, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.13', 'Chrome', 'Windows', 'Desktop', '2025-08-02 01:09:11', '2025-08-02 01:09:11'),
(876, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.164', 'Safari', 'Unknown', 'Mobile', '2025-08-02 01:10:37', '2025-08-02 01:10:37'),
(877, 90, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.195', 'Chrome', 'Linux', 'Mobile', '2025-08-02 02:56:38', '2025-08-02 02:56:38'),
(878, 18, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.184', 'Safari', 'Unknown', 'Mobile', '2025-08-02 07:42:25', '2025-08-02 07:42:25'),
(879, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.75', 'Safari', 'iOS', 'Mobile', '2025-08-02 08:52:01', '2025-08-02 08:52:01'),
(880, 321, NULL, '8.6821', '50.1109', 'DE', 'Frankfurt', 'Germany', '172.68.194.152', 'Safari', 'iOS', 'Mobile', '2025-08-02 14:44:03', '2025-08-02 14:44:03'),
(881, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.37', 'Safari', 'Unknown', 'Mobile', '2025-08-02 15:46:59', '2025-08-02 15:46:59'),
(882, 250, NULL, '2.3522', '48.8566', 'FR', 'Paris', 'France', '172.71.123.125', 'Safari', 'Unknown', 'Mobile', '2025-08-02 15:48:27', '2025-08-02 15:48:27'),
(883, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.234', 'Safari', 'Unknown', 'Mobile', '2025-08-02 16:01:13', '2025-08-02 16:01:13'),
(884, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.223', 'Chrome', 'Windows', 'Desktop', '2025-08-03 12:03:23', '2025-08-03 12:03:23'),
(885, 51, NULL, '4.9041', '52.3675', 'NL', 'Amsterdam', 'Netherlands', '104.23.168.34', 'Chrome', 'Linux', 'Mobile', '2025-08-04 03:35:54', '2025-08-04 03:35:54'),
(886, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.62', 'Chrome', 'Linux', 'Mobile', '2025-08-04 05:55:29', '2025-08-04 05:55:29'),
(887, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.147', 'Chrome', 'Linux', 'Mobile', '2025-08-04 07:34:34', '2025-08-04 07:34:34'),
(888, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.122', 'Chrome', 'Windows', 'Desktop', '2025-08-04 07:38:26', '2025-08-04 07:38:26'),
(889, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.48', 'Chrome', 'Windows', 'Desktop', '2025-08-04 08:40:24', '2025-08-04 08:40:24'),
(890, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.184', 'Chrome', 'Linux', 'Mobile', '2025-08-04 10:16:52', '2025-08-04 10:16:52'),
(891, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.44', 'Chrome', 'Windows', 'Desktop', '2025-08-04 13:43:33', '2025-08-04 13:43:33'),
(892, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.230', 'Safari', 'Unknown', 'Mobile', '2025-08-05 05:06:19', '2025-08-05 05:06:19'),
(893, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.149', 'Safari', 'iOS', 'Mobile', '2025-08-05 07:07:49', '2025-08-05 07:07:49'),
(894, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.218', 'Chrome', 'Linux', 'Mobile', '2025-08-05 15:21:20', '2025-08-05 15:21:20'),
(895, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.181', 'Chrome', 'Windows', 'Desktop', '2025-08-05 15:26:54', '2025-08-05 15:26:54'),
(896, 293, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.55', 'Chrome', 'Linux', 'Mobile', '2025-08-06 16:20:25', '2025-08-06 16:20:25'),
(897, 351, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.40', 'Chrome', 'Linux', 'Mobile', '2025-08-07 12:18:02', '2025-08-07 12:18:02'),
(898, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.214', 'Safari', 'iOS', 'Mobile', '2025-08-07 14:05:14', '2025-08-07 14:05:14'),
(899, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.10', 'Safari', 'iOS', 'Mobile', '2025-08-07 14:10:04', '2025-08-07 14:10:04'),
(900, 293, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.28', 'Chrome', 'Linux', 'Mobile', '2025-08-07 16:28:02', '2025-08-07 16:28:02'),
(901, 351, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.179', 'Chrome', 'Linux', 'Mobile', '2025-08-08 03:53:46', '2025-08-08 03:53:46'),
(902, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.147', 'Chrome', 'Windows', 'Desktop', '2025-08-08 09:12:29', '2025-08-08 09:12:29'),
(903, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.101', 'Safari', 'Unknown', 'Mobile', '2025-08-09 03:45:22', '2025-08-09 03:45:22'),
(904, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.93', 'Safari', 'Unknown', 'Mobile', '2025-08-09 04:03:15', '2025-08-09 04:03:15'),
(905, 93, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.155', 'Chrome', 'Windows', 'Desktop', '2025-08-09 15:54:52', '2025-08-09 15:54:52'),
(906, 354, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.191', 'Chrome', 'Windows', 'Desktop', '2025-08-09 17:29:05', '2025-08-09 17:29:05'),
(907, 39, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.54', 'Safari', 'iOS', 'Mobile', '2025-08-10 02:35:11', '2025-08-10 02:35:11'),
(908, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.125', 'Safari', 'Unknown', 'Mobile', '2025-08-10 10:24:27', '2025-08-10 10:24:27'),
(909, 169, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.232', 'Safari', 'Unknown', 'Mobile', '2025-08-10 11:56:23', '2025-08-10 11:56:23'),
(910, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.213', 'Chrome', 'Linux', 'Mobile', '2025-08-10 12:02:28', '2025-08-10 12:02:28'),
(911, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.139', 'Safari', 'Unknown', 'Mobile', '2025-08-10 12:20:46', '2025-08-10 12:20:46'),
(912, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.131', 'Chrome', 'Linux', 'Mobile', '2025-08-11 00:23:27', '2025-08-11 00:23:27'),
(913, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.60', 'Safari', 'Unknown', 'Mobile', '2025-08-11 00:32:02', '2025-08-11 00:32:02'),
(914, 270, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.247', 'Safari', 'Unknown', 'Mobile', '2025-08-11 11:26:18', '2025-08-11 11:26:18'),
(915, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.44', 'Safari', 'Unknown', 'Mobile', '2025-08-11 11:37:17', '2025-08-11 11:37:17'),
(916, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.157', 'Safari', 'Unknown', 'Mobile', '2025-08-11 11:44:32', '2025-08-11 11:44:32'),
(917, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.110', 'Safari', 'Unknown', 'Mobile', '2025-08-11 11:49:11', '2025-08-11 11:49:11'),
(918, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.17', 'Safari', 'Unknown', 'Mobile', '2025-08-11 12:05:10', '2025-08-11 12:05:10'),
(919, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.127', 'Safari', 'Unknown', 'Mobile', '2025-08-11 13:25:34', '2025-08-11 13:25:34'),
(920, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.233', 'Safari', 'Unknown', 'Mobile', '2025-08-11 13:26:59', '2025-08-11 13:26:59'),
(921, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.111', 'Chrome', 'Windows', 'Desktop', '2025-08-11 13:40:04', '2025-08-11 13:40:04'),
(922, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.201', 'Safari', 'Unknown', 'Mobile', '2025-08-11 13:57:22', '2025-08-11 13:57:22'),
(923, 352, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.80', 'Safari', 'Unknown', 'Mobile', '2025-08-11 14:02:09', '2025-08-11 14:02:09'),
(924, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.90', 'Chrome', 'Windows', 'Desktop', '2025-08-11 14:41:45', '2025-08-11 14:41:45');
INSERT INTO `user_logins` (`id`, `user_id`, `child_panel_id`, `longitude`, `latitude`, `country_code`, `location`, `country`, `ip_address`, `browser`, `os`, `get_device`, `created_at`, `updated_at`) VALUES
(925, 256, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.148', 'Chrome', 'Linux', 'Mobile', '2025-08-11 15:40:50', '2025-08-11 15:40:50'),
(926, 355, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.213', 'Chrome', 'Linux', 'Mobile', '2025-08-13 12:32:30', '2025-08-13 12:32:30'),
(927, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.107', 'Safari', 'Unknown', 'Mobile', '2025-08-13 13:26:05', '2025-08-13 13:26:05'),
(928, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.119', 'Safari', 'Unknown', 'Mobile', '2025-08-13 13:55:16', '2025-08-13 13:55:16'),
(929, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.217', 'Safari', 'Unknown', 'Mobile', '2025-08-14 01:18:52', '2025-08-14 01:18:52'),
(930, 356, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.183', 'Chrome', 'Windows', 'Desktop', '2025-08-14 15:32:40', '2025-08-14 15:32:40'),
(931, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Safari', 'Unknown', 'Mobile', '2025-08-15 02:42:36', '2025-08-15 02:42:36'),
(932, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.245', 'Safari', 'Unknown', 'Mobile', '2025-08-15 02:47:39', '2025-08-15 02:47:39'),
(933, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.99', 'Safari', 'Unknown', 'Mobile', '2025-08-15 02:49:01', '2025-08-15 02:49:01'),
(934, 357, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.99', 'Safari', 'Unknown', 'Mobile', '2025-08-15 23:13:16', '2025-08-15 23:13:16'),
(935, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.125', 'Safari', 'Unknown', 'Mobile', '2025-08-16 07:13:27', '2025-08-16 07:13:27'),
(936, 358, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.162', 'Safari', 'Unknown', 'Mobile', '2025-08-16 13:33:03', '2025-08-16 13:33:03'),
(937, 358, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.119', 'Safari', 'Unknown', 'Mobile', '2025-08-16 15:22:05', '2025-08-16 15:22:05'),
(938, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.55', 'Chrome', 'Windows', 'Desktop', '2025-08-16 17:47:40', '2025-08-16 17:47:40'),
(939, 359, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.185', 'Safari', 'Unknown', 'Mobile', '2025-08-17 04:14:53', '2025-08-17 04:14:53'),
(940, 358, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.180', 'Safari', 'Unknown', 'Mobile', '2025-08-17 04:47:21', '2025-08-17 04:47:21'),
(941, 357, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.14', 'Safari', 'Unknown', 'Mobile', '2025-08-17 05:38:48', '2025-08-17 05:38:48'),
(942, 358, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.66', 'Safari', 'Unknown', 'Mobile', '2025-08-17 05:46:21', '2025-08-17 05:46:21'),
(943, 358, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Safari', 'Unknown', 'Mobile', '2025-08-17 11:40:27', '2025-08-17 11:40:27'),
(944, 304, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.15', 'Safari', 'Unknown', 'Mobile', '2025-08-17 23:35:15', '2025-08-17 23:35:15'),
(945, 358, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.37', 'Safari', 'Unknown', 'Mobile', '2025-08-18 04:39:48', '2025-08-18 04:39:48'),
(946, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.4', 'Chrome', 'Linux', 'Mobile', '2025-08-18 10:07:11', '2025-08-18 10:07:11'),
(947, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.10', 'Chrome', 'Linux', 'Mobile', '2025-08-18 14:26:07', '2025-08-18 14:26:07'),
(948, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.93.50', 'Chrome', 'Linux', 'Mobile', '2025-08-19 03:43:14', '2025-08-19 03:43:14'),
(949, 256, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.154', 'Chrome', 'Linux', 'Mobile', '2025-08-19 03:43:30', '2025-08-19 03:43:30'),
(950, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.227', 'Chrome', 'Windows', 'Desktop', '2025-08-19 06:07:23', '2025-08-19 06:07:23'),
(951, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.121', 'Chrome', 'Windows', 'Desktop', '2025-08-19 15:38:36', '2025-08-19 15:38:36'),
(952, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.245', 'Safari', 'Unknown', 'Mobile', '2025-08-19 22:52:55', '2025-08-19 22:52:55'),
(953, 238, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.165', 'Chrome', 'Linux', 'Mobile', '2025-08-19 22:56:54', '2025-08-19 22:56:54'),
(954, 238, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.163', 'Chrome', 'Linux', 'Mobile', '2025-08-20 02:02:27', '2025-08-20 02:02:27'),
(955, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.93', 'Safari', 'iOS', 'Mobile', '2025-08-20 02:48:21', '2025-08-20 02:48:21'),
(956, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.164', 'Safari', 'Unknown', 'Mobile', '2025-08-20 05:17:42', '2025-08-20 05:17:42'),
(957, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.170', 'Chrome', 'Linux', 'Mobile', '2025-08-20 05:28:06', '2025-08-20 05:28:06'),
(958, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.95', 'Safari', 'iOS', 'Mobile', '2025-08-20 14:16:07', '2025-08-20 14:16:07'),
(959, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.61', 'Chrome', 'Windows', 'Desktop', '2025-08-20 14:25:06', '2025-08-20 14:25:06'),
(960, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.165.11', 'Safari', 'iOS', 'Mobile', '2025-08-20 14:25:24', '2025-08-20 14:25:24'),
(961, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.109', 'Chrome', 'Windows', 'Desktop', '2025-08-20 17:30:00', '2025-08-20 17:30:00'),
(962, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.130', 'Chrome', 'Windows', 'Desktop', '2025-08-21 00:30:42', '2025-08-21 00:30:42'),
(963, 256, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.222', 'Chrome', 'Linux', 'Mobile', '2025-08-21 04:20:42', '2025-08-21 04:20:42'),
(964, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.132', 'Chrome', 'Windows', 'Desktop', '2025-08-21 04:37:22', '2025-08-21 04:37:22'),
(965, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.190.96', 'Chrome', 'Windows', 'Desktop', '2025-08-21 05:12:43', '2025-08-21 05:12:43'),
(966, 256, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.145', 'Chrome', 'Windows', 'Desktop', '2025-08-21 05:54:08', '2025-08-21 05:54:08'),
(967, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.243', 'Safari', 'Unknown', 'Mobile', '2025-08-21 05:57:43', '2025-08-21 05:57:43'),
(968, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.38', 'Chrome', 'Windows', 'Desktop', '2025-08-21 06:01:43', '2025-08-21 06:01:43'),
(969, 256, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.184', 'Chrome', 'Windows', 'Desktop', '2025-08-21 07:16:17', '2025-08-21 07:16:17'),
(970, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.147', 'Chrome', 'Windows', 'Desktop', '2025-08-21 07:22:50', '2025-08-21 07:22:50'),
(971, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.61', 'Chrome', 'Windows', 'Desktop', '2025-08-21 09:18:44', '2025-08-21 09:18:44'),
(972, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.155', 'Chrome', 'Windows', 'Desktop', '2025-08-21 09:59:10', '2025-08-21 09:59:10'),
(973, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.27', 'Chrome', 'Windows', 'Desktop', '2025-08-21 11:14:01', '2025-08-21 11:14:01'),
(974, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.96', 'Chrome', 'Windows', 'Desktop', '2025-08-21 12:49:17', '2025-08-21 12:49:17'),
(975, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.214', 'Chrome', 'Windows', 'Desktop', '2025-08-21 13:26:59', '2025-08-21 13:26:59'),
(976, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.145', 'Chrome', 'Windows', 'Desktop', '2025-08-21 14:25:15', '2025-08-21 14:25:15'),
(977, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.98', 'Chrome', 'Windows', 'Desktop', '2025-08-22 02:14:31', '2025-08-22 02:14:31'),
(978, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.26', 'Chrome', 'Linux', 'Mobile', '2025-08-22 04:55:07', '2025-08-22 04:55:07'),
(979, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.204', 'Chrome', 'Windows', 'Desktop', '2025-08-22 05:15:50', '2025-08-22 05:15:50'),
(980, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.252', 'Safari', 'Unknown', 'Mobile', '2025-08-22 07:29:50', '2025-08-22 07:29:50'),
(981, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.190', 'Chrome', 'Windows', 'Desktop', '2025-08-22 09:31:39', '2025-08-22 09:31:39'),
(982, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.139', 'Safari', 'Unknown', 'Mobile', '2025-08-22 10:50:42', '2025-08-22 10:50:42'),
(983, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.55', 'Chrome', 'Windows', 'Desktop', '2025-08-22 12:02:21', '2025-08-22 12:02:21'),
(984, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.170', 'Chrome', 'Linux', 'Mobile', '2025-08-22 12:50:51', '2025-08-22 12:50:51'),
(985, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.154', 'Chrome', 'Windows', 'Desktop', '2025-08-22 14:10:21', '2025-08-22 14:10:21'),
(986, 256, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.46', 'Chrome', 'Windows', 'Desktop', '2025-08-22 14:49:01', '2025-08-22 14:49:01'),
(987, 363, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.133', 'Chrome', 'Windows', 'Desktop', '2025-08-22 15:35:54', '2025-08-22 15:35:54'),
(988, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.71', 'Safari', 'iOS', 'Mobile', '2025-08-23 04:49:48', '2025-08-23 04:49:48'),
(989, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.200', 'Safari', 'iOS', 'Mobile', '2025-08-23 05:13:48', '2025-08-23 05:13:48'),
(990, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.192', 'Chrome', 'Linux', 'Mobile', '2025-08-23 05:14:56', '2025-08-23 05:14:56'),
(991, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.92', 'Safari', 'Unknown', 'Mobile', '2025-08-23 07:14:55', '2025-08-23 07:14:55'),
(992, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.130', 'Safari', 'Unknown', 'Mobile', '2025-08-23 07:39:39', '2025-08-23 07:39:39'),
(993, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.183', 'Chrome', 'Linux', 'Mobile', '2025-08-23 07:58:33', '2025-08-23 07:58:33'),
(994, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.189.47', 'Safari', 'Unknown', 'Mobile', '2025-08-23 09:46:32', '2025-08-23 09:46:32'),
(995, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.184', 'Chrome', 'Windows', 'Desktop', '2025-08-23 12:59:45', '2025-08-23 12:59:45'),
(996, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.167', 'Safari', 'iOS', 'Mobile', '2025-08-23 13:17:17', '2025-08-23 13:17:17'),
(997, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.242.84', 'Chrome', 'Linux', 'Mobile', '2025-08-23 13:44:13', '2025-08-23 13:44:13'),
(998, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.133', 'Chrome', 'Windows', 'Desktop', '2025-08-23 14:26:05', '2025-08-23 14:26:05'),
(999, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.157', 'Chrome', 'Linux', 'Mobile', '2025-08-23 15:43:29', '2025-08-23 15:43:29'),
(1000, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.165', 'Chrome', 'Linux', 'Mobile', '2025-08-23 17:11:44', '2025-08-23 17:11:44'),
(1001, 304, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.99', 'Safari', 'Unknown', 'Mobile', '2025-08-23 21:32:12', '2025-08-23 21:32:12'),
(1002, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.162', 'Chrome', 'Linux', 'Mobile', '2025-08-23 23:03:06', '2025-08-23 23:03:06'),
(1003, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.242', 'Chrome', 'Linux', 'Mobile', '2025-08-24 02:46:03', '2025-08-24 02:46:03'),
(1004, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.214', 'Chrome', 'Linux', 'Mobile', '2025-08-24 03:21:41', '2025-08-24 03:21:41'),
(1005, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.138', 'Chrome', 'Windows', 'Desktop', '2025-08-24 03:25:46', '2025-08-24 03:25:46'),
(1006, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.190', 'Chrome', 'Linux', 'Mobile', '2025-08-24 04:39:05', '2025-08-24 04:39:05'),
(1007, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.133', 'Chrome', 'Linux', 'Mobile', '2025-08-24 04:58:07', '2025-08-24 04:58:07'),
(1008, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.45', 'Chrome', 'Linux', 'Mobile', '2025-08-24 05:26:45', '2025-08-24 05:26:45'),
(1009, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.110', 'Chrome', 'Windows', 'Desktop', '2025-08-24 07:04:15', '2025-08-24 07:04:15'),
(1010, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.247', 'Chrome', 'Linux', 'Mobile', '2025-08-24 09:43:22', '2025-08-24 09:43:22'),
(1011, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.104', 'Chrome', 'Windows', 'Desktop', '2025-08-24 09:46:47', '2025-08-24 09:46:47'),
(1012, 90, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.108', 'Chrome', 'Linux', 'Mobile', '2025-08-24 10:29:51', '2025-08-24 10:29:51'),
(1013, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.111', 'Chrome', 'Windows', 'Desktop', '2025-08-24 11:27:02', '2025-08-24 11:27:02'),
(1014, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.93.40', 'Chrome', 'Windows', 'Desktop', '2025-08-24 13:53:58', '2025-08-24 13:53:58'),
(1015, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.111', 'Chrome', 'Linux', 'Mobile', '2025-08-24 14:30:42', '2025-08-24 14:30:42'),
(1016, 256, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.127', 'Chrome', 'Windows', 'Desktop', '2025-08-24 14:51:49', '2025-08-24 14:51:49'),
(1017, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.153', 'Chrome', 'Windows', 'Desktop', '2025-08-24 15:29:39', '2025-08-24 15:29:39'),
(1018, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.110', 'Chrome', 'Windows', 'Desktop', '2025-08-24 15:59:00', '2025-08-24 15:59:00'),
(1019, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.205', 'Chrome', 'Linux', 'Mobile', '2025-08-24 15:59:17', '2025-08-24 15:59:17'),
(1020, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.125', 'Chrome', 'Linux', 'Mobile', '2025-08-24 22:56:16', '2025-08-24 22:56:16'),
(1021, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.64', 'Chrome', 'Linux', 'Mobile', '2025-08-24 23:28:19', '2025-08-24 23:28:19'),
(1022, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.219', 'Chrome', 'Linux', 'Mobile', '2025-08-25 02:26:23', '2025-08-25 02:26:23'),
(1023, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.78', 'Chrome', 'Windows', 'Desktop', '2025-08-25 03:19:33', '2025-08-25 03:19:33'),
(1024, 256, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.95', 'Chrome', 'Windows', 'Desktop', '2025-08-25 04:33:19', '2025-08-25 04:33:19'),
(1025, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.153', 'Chrome', 'Linux', 'Mobile', '2025-08-25 06:27:54', '2025-08-25 06:27:54'),
(1026, 256, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.37', 'Chrome', 'Windows', 'Desktop', '2025-08-25 09:07:00', '2025-08-25 09:07:00'),
(1027, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.62', 'Safari', 'Unknown', 'Mobile', '2025-08-25 09:09:00', '2025-08-25 09:09:00'),
(1028, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.18', 'Safari', 'Unknown', 'Mobile', '2025-08-25 09:47:20', '2025-08-25 09:47:20'),
(1029, 364, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.148', 'Chrome', 'Linux', 'Mobile', '2025-08-25 09:52:48', '2025-08-25 09:52:48'),
(1030, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.157', 'Chrome', 'Linux', 'Mobile', '2025-08-25 10:22:10', '2025-08-25 10:22:10'),
(1031, 90, NULL, '5.3697', '43.2964', 'FR', 'Marseille', 'France', '172.70.108.157', 'Chrome', 'Windows', 'Desktop', '2025-08-25 11:37:03', '2025-08-25 11:37:03'),
(1032, 62, NULL, '8.6821', '50.1109', 'DE', 'Frankfurt', 'Germany', '172.68.194.174', 'Chrome', 'Linux', 'Mobile', '2025-08-25 13:37:23', '2025-08-25 13:37:23'),
(1033, 361, NULL, '2.3522', '48.8566', 'FR', 'Paris', 'France', '172.71.232.6', 'Chrome', 'Windows', 'Desktop', '2025-08-25 13:50:19', '2025-08-25 13:50:19'),
(1034, 256, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.176.11', 'Chrome', 'Windows', 'Desktop', '2025-08-25 14:06:41', '2025-08-25 14:06:41'),
(1035, 18, NULL, '2.3522', '48.8566', 'FR', 'Paris', 'France', '172.71.232.85', 'Chrome', 'Windows', 'Desktop', '2025-08-25 14:15:49', '2025-08-25 14:15:49'),
(1036, 256, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.205', 'Chrome', 'Windows', 'Desktop', '2025-08-25 14:41:54', '2025-08-25 14:41:54'),
(1037, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.166.92', 'Chrome', 'Linux', 'Mobile', '2025-08-25 15:03:31', '2025-08-25 15:03:31'),
(1038, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.10', 'Chrome', 'Windows', 'Desktop', '2025-08-26 01:14:48', '2025-08-26 01:14:48'),
(1039, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.253', 'Chrome', 'Linux', 'Mobile', '2025-08-26 02:51:19', '2025-08-26 02:51:19'),
(1040, 186, NULL, '-118.2436', '34.0522', 'US', 'Los Angeles', 'United States', '162.158.90.46', 'Chrome', 'Windows', 'Desktop', '2025-08-26 06:48:34', '2025-08-26 06:48:34'),
(1041, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.149', 'Chrome', 'Windows', 'Desktop', '2025-08-26 07:19:27', '2025-08-26 07:19:27'),
(1042, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.86', 'Chrome', 'Linux', 'Mobile', '2025-08-26 09:00:35', '2025-08-26 09:00:35'),
(1043, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.156', 'Chrome', 'Windows', 'Desktop', '2025-08-26 09:17:52', '2025-08-26 09:17:52'),
(1044, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.125', 'Safari', 'Unknown', 'Mobile', '2025-08-26 10:13:14', '2025-08-26 10:13:14'),
(1045, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.246', 'Chrome', 'Linux', 'Mobile', '2025-08-26 10:25:24', '2025-08-26 10:25:24'),
(1046, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.45', 'Chrome', 'Windows', 'Desktop', '2025-08-26 12:17:33', '2025-08-26 12:17:33'),
(1047, 18, NULL, '9.1899', '45.4642', 'IT', 'Milan', 'Italy', '172.70.216.191', 'Chrome', 'Windows', 'Desktop', '2025-08-26 12:38:27', '2025-08-26 12:38:27'),
(1048, 90, NULL, '9.1899', '45.4642', 'IT', 'Milan', 'Italy', '188.114.102.8', 'Chrome', 'Linux', 'Mobile', '2025-08-26 13:12:17', '2025-08-26 13:12:17'),
(1049, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.165', 'Chrome', 'Windows', 'Desktop', '2025-08-26 13:22:44', '2025-08-26 13:22:44'),
(1050, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.144', 'Chrome', 'Windows', 'Desktop', '2025-08-26 13:36:21', '2025-08-26 13:36:21'),
(1051, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.86', 'Chrome', 'Windows', 'Desktop', '2025-08-26 13:39:35', '2025-08-26 13:39:35'),
(1052, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.106', 'Chrome', 'Linux', 'Mobile', '2025-08-26 13:42:23', '2025-08-26 13:42:23'),
(1053, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.92', 'Chrome', 'Windows', 'Desktop', '2025-08-26 14:13:21', '2025-08-26 14:13:21'),
(1054, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.18', 'Chrome', 'Windows', 'Desktop', '2025-08-26 15:15:11', '2025-08-26 15:15:11'),
(1055, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.197', 'Chrome', 'Linux', 'Mobile', '2025-08-26 15:16:44', '2025-08-26 15:16:44'),
(1056, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.72', 'Chrome', 'Linux', 'Mobile', '2025-08-26 16:33:27', '2025-08-26 16:33:27'),
(1057, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.84', 'Chrome', 'Linux', 'Mobile', '2025-08-26 23:10:54', '2025-08-26 23:10:54'),
(1058, 51, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.243', 'Chrome', 'Linux', 'Mobile', '2025-08-26 23:13:20', '2025-08-26 23:13:20'),
(1059, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.190', 'Chrome', 'Linux', 'Mobile', '2025-08-27 00:04:36', '2025-08-27 00:04:36'),
(1060, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.134', 'Chrome', 'Linux', 'Mobile', '2025-08-27 01:10:32', '2025-08-27 01:10:32'),
(1061, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.190', 'Chrome', 'Linux', 'Mobile', '2025-08-27 02:05:02', '2025-08-27 02:05:02'),
(1062, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.144', 'Chrome', 'Linux', 'Mobile', '2025-08-27 03:32:13', '2025-08-27 03:32:13'),
(1063, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.8', 'Chrome', 'Windows', 'Desktop', '2025-08-27 03:36:28', '2025-08-27 03:36:28'),
(1064, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.227.80', 'Chrome', 'Linux', 'Mobile', '2025-08-27 04:53:03', '2025-08-27 04:53:03'),
(1065, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.165', 'Chrome', 'Linux', 'Mobile', '2025-08-27 07:29:57', '2025-08-27 07:29:57'),
(1066, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.196', 'Chrome', 'Windows', 'Desktop', '2025-08-27 09:21:45', '2025-08-27 09:21:45'),
(1067, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.16', 'Chrome', 'Linux', 'Mobile', '2025-08-27 09:26:19', '2025-08-27 09:26:19'),
(1068, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.149', 'Chrome', 'Windows', 'Desktop', '2025-08-27 09:44:50', '2025-08-27 09:44:50'),
(1069, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.74', 'Chrome', 'Linux', 'Mobile', '2025-08-27 10:18:49', '2025-08-27 10:18:49'),
(1070, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.254', 'Chrome', 'Linux', 'Mobile', '2025-08-27 11:09:00', '2025-08-27 11:09:00'),
(1071, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.192', 'Chrome', 'Windows', 'Desktop', '2025-08-27 12:13:34', '2025-08-27 12:13:34'),
(1072, 368, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.165', 'Chrome', 'Linux', 'Mobile', '2025-08-27 12:14:46', '2025-08-27 12:14:46'),
(1073, 368, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.109', 'Unknown', 'IOS', 'Mobile', '2025-08-27 12:39:40', '2025-08-27 12:39:40'),
(1074, 90, NULL, '9.1899', '45.4642', 'IT', 'Milan', 'Italy', '172.69.9.131', 'Chrome', 'Linux', 'Mobile', '2025-08-27 12:58:43', '2025-08-27 12:58:43'),
(1075, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.216', 'Chrome', 'Windows', 'Desktop', '2025-08-27 14:01:49', '2025-08-27 14:01:49'),
(1076, 363, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.131', 'Chrome', 'Windows', 'Desktop', '2025-08-27 16:07:37', '2025-08-27 16:07:37'),
(1077, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.215.110', 'Chrome', 'Linux', 'Mobile', '2025-08-27 17:30:56', '2025-08-27 17:30:56'),
(1078, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.160', 'Chrome', 'Windows', 'Desktop', '2025-08-28 01:33:40', '2025-08-28 01:33:40'),
(1079, 370, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.239', 'Chrome', 'Windows', 'Desktop', '2025-08-28 04:37:00', '2025-08-28 04:37:00'),
(1080, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.144', 'Chrome', 'Linux', 'Mobile', '2025-08-28 04:41:27', '2025-08-28 04:41:27'),
(1081, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.144', 'Chrome', 'Linux', 'Mobile', '2025-08-28 04:42:06', '2025-08-28 04:42:06'),
(1082, 368, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.206', 'Unknown', 'IOS', 'Mobile', '2025-08-28 10:10:07', '2025-08-28 10:10:07'),
(1083, 371, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.148', 'Chrome', 'Windows', 'Desktop', '2025-08-28 10:15:05', '2025-08-28 10:15:05'),
(1084, 363, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.222', 'Chrome', 'Windows', 'Desktop', '2025-08-28 15:39:57', '2025-08-28 15:39:57'),
(1085, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.166', 'Chrome', 'Windows', 'Desktop', '2025-08-28 23:46:49', '2025-08-28 23:46:49'),
(1086, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.57', 'Safari', 'Unknown', 'Mobile', '2025-08-29 04:45:39', '2025-08-29 04:45:39'),
(1087, 368, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.150', 'Unknown', 'IOS', 'Mobile', '2025-08-29 05:20:47', '2025-08-29 05:20:47'),
(1088, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.219', 'Safari', 'Unknown', 'Mobile', '2025-08-29 15:32:21', '2025-08-29 15:32:21'),
(1089, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.183', 'Safari', 'Unknown', 'Mobile', '2025-08-30 09:27:08', '2025-08-30 09:27:08'),
(1090, 372, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.154', 'Safari', 'Unknown', 'Mobile', '2025-08-30 16:35:32', '2025-08-30 16:35:32'),
(1091, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.102', 'Safari', 'Unknown', 'Mobile', '2025-08-31 01:39:49', '2025-08-31 01:39:49'),
(1092, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.8', 'Safari', 'Unknown', 'Mobile', '2025-08-31 07:10:44', '2025-08-31 07:10:44'),
(1093, 374, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.149', 'Chrome', 'Windows', 'Desktop', '2025-08-31 08:16:24', '2025-08-31 08:16:24'),
(1094, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.185', 'Safari', 'Unknown', 'Mobile', '2025-08-31 13:06:47', '2025-08-31 13:06:47'),
(1095, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.65', 'Safari', 'Unknown', 'Mobile', '2025-09-01 04:31:45', '2025-09-01 04:31:45'),
(1096, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.127', 'Safari', 'Unknown', 'Mobile', '2025-09-01 14:47:26', '2025-09-01 14:47:26'),
(1097, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.20', 'Safari', 'Unknown', 'Mobile', '2025-09-01 15:28:00', '2025-09-01 15:28:00'),
(1098, 357, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.179.153', 'Safari', 'Unknown', 'Mobile', '2025-09-02 00:07:07', '2025-09-02 00:07:07'),
(1099, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.30', 'Safari', 'Unknown', 'Mobile', '2025-09-02 01:48:22', '2025-09-02 01:48:22'),
(1100, 357, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.70', 'Safari', 'Unknown', 'Mobile', '2025-09-02 02:08:58', '2025-09-02 02:08:58'),
(1101, 357, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.95', 'Safari', 'Unknown', 'Mobile', '2025-09-02 02:17:25', '2025-09-02 02:17:25'),
(1102, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.233', 'Safari', 'Unknown', 'Mobile', '2025-09-02 02:58:40', '2025-09-02 02:58:40'),
(1103, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.75', 'Chrome', 'Windows', 'Desktop', '2025-09-02 12:56:36', '2025-09-02 12:56:36'),
(1104, 238, NULL, '5.3697', '43.2964', 'FR', 'Marseille', 'France', '172.70.108.92', 'Chrome', 'Linux', 'Mobile', '2025-09-02 13:27:55', '2025-09-02 13:27:55'),
(1105, 238, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.165', 'Chrome', 'Linux', 'Mobile', '2025-09-02 14:28:11', '2025-09-02 14:28:11'),
(1106, 374, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.237', 'Chrome', 'Windows', 'Desktop', '2025-09-03 06:44:46', '2025-09-03 06:44:46'),
(1107, 20, NULL, '8.6821', '50.1109', 'DE', 'Frankfurt', 'Germany', '172.71.250.133', 'Chrome', 'Windows', 'Desktop', '2025-09-03 13:05:38', '2025-09-03 13:05:38'),
(1108, 18, NULL, '5.3697', '43.2964', 'FR', 'Marseille', 'France', '172.68.234.79', 'Chrome', 'Windows', 'Desktop', '2025-09-03 14:45:12', '2025-09-03 14:45:12'),
(1109, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.222', 'Chrome', 'Windows', 'Desktop', '2025-09-04 01:24:26', '2025-09-04 01:24:26'),
(1110, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.107', 'Safari', 'Unknown', 'Mobile', '2025-09-04 02:33:53', '2025-09-04 02:33:53'),
(1111, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.63', 'Safari', 'Unknown', 'Mobile', '2025-09-04 03:08:15', '2025-09-04 03:08:15'),
(1112, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.159', 'Chrome', 'Windows', 'Desktop', '2025-09-04 06:34:41', '2025-09-04 06:34:41'),
(1113, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.213', 'Chrome', 'Windows', 'Desktop', '2025-09-04 12:52:22', '2025-09-04 12:52:22'),
(1114, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.107.81', 'Chrome', 'Windows', 'Desktop', '2025-09-05 01:08:37', '2025-09-05 01:08:37'),
(1115, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.144', 'Chrome', 'Windows', 'Desktop', '2025-09-05 07:59:20', '2025-09-05 07:59:20'),
(1116, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.135', 'Chrome', 'Windows', 'Desktop', '2025-09-05 12:17:48', '2025-09-05 12:17:48'),
(1117, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.9', 'Chrome', 'Windows', 'Desktop', '2025-09-05 14:06:57', '2025-09-05 14:06:57'),
(1118, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.216', 'Chrome', 'Windows', 'Desktop', '2025-09-06 04:55:33', '2025-09-06 04:55:33'),
(1119, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.105', 'Chrome', 'Windows', 'Desktop', '2025-09-06 06:01:43', '2025-09-06 06:01:43'),
(1120, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.104', 'Chrome', 'Windows', 'Desktop', '2025-09-06 10:08:20', '2025-09-06 10:08:20'),
(1121, 377, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.215', 'Safari', 'Unknown', 'Mobile', '2025-09-06 13:22:59', '2025-09-06 13:22:59'),
(1122, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.167', 'Chrome', 'Windows', 'Desktop', '2025-09-06 14:10:27', '2025-09-06 14:10:27'),
(1123, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.61', 'Chrome', 'Windows', 'Desktop', '2025-09-06 15:23:43', '2025-09-06 15:23:43'),
(1124, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.106', 'Chrome', 'Windows', 'Desktop', '2025-09-07 01:21:59', '2025-09-07 01:21:59'),
(1125, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.18', 'Chrome', 'Windows', 'Desktop', '2025-09-07 02:01:39', '2025-09-07 02:01:39'),
(1126, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.223', 'Chrome', 'Windows', 'Desktop', '2025-09-07 04:17:34', '2025-09-07 04:17:34'),
(1127, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.166', 'Chrome', 'Windows', 'Desktop', '2025-09-07 05:50:10', '2025-09-07 05:50:10'),
(1128, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.243', 'Chrome', 'Windows', 'Desktop', '2025-09-08 13:15:29', '2025-09-08 13:15:29'),
(1129, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.145', 'Chrome', 'Linux', 'Mobile', '2025-09-09 03:33:17', '2025-09-09 03:33:17'),
(1130, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.170', 'Chrome', 'Windows', 'Desktop', '2025-09-09 04:10:00', '2025-09-09 04:10:00'),
(1131, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.166', 'Chrome', 'Windows', 'Desktop', '2025-09-09 05:59:04', '2025-09-09 05:59:04'),
(1132, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.104', 'Chrome', 'Windows', 'Desktop', '2025-09-09 09:12:25', '2025-09-09 09:12:25'),
(1133, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.142', 'Chrome', 'Windows', 'Desktop', '2025-09-09 11:42:55', '2025-09-09 11:42:55'),
(1134, 361, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.45', 'Chrome', 'Windows', 'Desktop', '2025-09-09 13:45:03', '2025-09-09 13:45:03'),
(1135, 382, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.135', 'Safari', 'Unknown', 'Mobile', '2025-09-10 05:43:57', '2025-09-10 05:43:57'),
(1136, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.170', 'Chrome', 'Linux', 'Mobile', '2025-09-10 07:24:53', '2025-09-10 07:24:53'),
(1137, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.170', 'Chrome', 'Linux', 'Mobile', '2025-09-10 08:00:40', '2025-09-10 08:00:40'),
(1138, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.15', 'Chrome', 'Linux', 'Mobile', '2025-09-10 09:15:42', '2025-09-10 09:15:42'),
(1139, 62, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.170', 'Chrome', 'Linux', 'Mobile', '2025-09-10 10:38:24', '2025-09-10 10:38:24'),
(1140, 382, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.135', 'Safari', 'Unknown', 'Mobile', '2025-09-10 11:49:09', '2025-09-10 11:49:09'),
(1141, 358, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.18', 'Safari', 'Unknown', 'Mobile', '2025-09-10 13:38:24', '2025-09-10 13:38:24'),
(1142, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.10', 'Chrome', 'Windows', 'Desktop', '2025-09-10 14:01:36', '2025-09-10 14:01:36'),
(1143, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.20', 'Chrome', 'Windows', 'Desktop', '2025-09-11 02:36:34', '2025-09-11 02:36:34'),
(1144, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.142', 'Chrome', 'Windows', 'Desktop', '2025-09-11 03:42:55', '2025-09-11 03:42:55'),
(1145, 90, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.234', 'Chrome', 'Windows', 'Desktop', '2025-09-11 04:38:20', '2025-09-11 04:38:20'),
(1146, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.101', 'Chrome', 'Windows', 'Desktop', '2025-09-11 05:02:59', '2025-09-11 05:02:59'),
(1147, 20, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.10', 'Chrome', 'Windows', 'Desktop', '2025-09-11 08:34:03', '2025-09-11 08:34:03'),
(1148, 62, NULL, '135.5022', '34.6937', 'JP', 'Osaka', 'Japan', '172.69.63.42', 'Chrome', 'Linux', 'Mobile', '2025-09-11 09:58:17', '2025-09-11 09:58:17'),
(1149, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.232', 'Safari', 'Unknown', 'Mobile', '2025-09-11 10:16:41', '2025-09-11 10:16:41'),
(1150, 373, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.9', 'Safari', 'Unknown', 'Mobile', '2025-09-11 13:09:16', '2025-09-11 13:09:16'),
(1151, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.25', 'Chrome', 'Windows', 'Desktop', '2025-09-12 06:46:04', '2025-09-12 06:46:04'),
(1152, 297, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.106', 'Chrome', 'Windows', 'Desktop', '2025-09-12 09:05:40', '2025-09-12 09:05:40'),
(1153, 383, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.15', 'Chrome', 'Linux', 'Mobile', '2025-09-12 09:55:32', '2025-09-12 09:55:32'),
(1154, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.142.25', 'Chrome', 'Windows', 'Desktop', '2025-09-12 11:00:33', '2025-09-12 11:00:33'),
(1155, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.189.106', 'Chrome', 'Windows', 'Desktop', '2025-09-12 13:45:11', '2025-09-12 13:45:11'),
(1156, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.45', 'Safari', 'Unknown', 'Mobile', '2025-09-12 15:13:38', '2025-09-12 15:13:38'),
(1157, 384, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.105', 'Chrome', 'Linux', 'Mobile', '2025-09-12 15:35:26', '2025-09-12 15:35:26'),
(1158, 373, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.170', 'Safari', 'Unknown', 'Mobile', '2025-09-13 02:26:41', '2025-09-13 02:26:41'),
(1159, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.143', 'Safari', 'Unknown', 'Mobile', '2025-09-13 03:40:14', '2025-09-13 03:40:14'),
(1160, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.171', 'Chrome', 'Windows', 'Desktop', '2025-09-13 10:16:31', '2025-09-13 10:16:31'),
(1161, 385, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.101', 'Safari', 'Unknown', 'Mobile', '2025-09-14 13:50:47', '2025-09-14 13:50:47'),
(1162, 385, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.243', 'Safari', 'Unknown', 'Mobile', '2025-09-14 15:01:16', '2025-09-14 15:01:16'),
(1163, 385, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.100', 'Safari', 'Unknown', 'Mobile', '2025-09-14 20:23:30', '2025-09-14 20:23:30'),
(1164, 385, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.92', 'Safari', 'Unknown', 'Mobile', '2025-09-15 04:00:52', '2025-09-15 04:00:52'),
(1165, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.149', 'Chrome', 'Windows', 'Desktop', '2025-09-15 05:36:09', '2025-09-15 05:36:09'),
(1166, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.162.78', 'Safari', 'Unknown', 'Mobile', '2025-09-15 05:53:41', '2025-09-15 05:53:41'),
(1167, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.5', 'Safari', 'Unknown', 'Mobile', '2025-09-15 07:52:14', '2025-09-15 07:52:14'),
(1168, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.144', 'Chrome', 'Windows', 'Desktop', '2025-09-15 07:55:48', '2025-09-15 07:55:48'),
(1169, 385, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.171', 'Safari', 'Unknown', 'Mobile', '2025-09-15 13:21:40', '2025-09-15 13:21:40'),
(1170, 385, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.25', 'Safari', 'Unknown', 'Mobile', '2025-09-15 14:24:07', '2025-09-15 14:24:07'),
(1171, 373, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.92', 'Safari', 'Unknown', 'Mobile', '2025-09-15 15:07:19', '2025-09-15 15:07:19'),
(1172, 385, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.17', 'Safari', 'Unknown', 'Mobile', '2025-09-16 00:57:10', '2025-09-16 00:57:10'),
(1173, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.236', 'Chrome', 'Windows', 'Desktop', '2025-09-16 11:12:45', '2025-09-16 11:12:45'),
(1174, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.170', 'Chrome', 'Windows', 'Desktop', '2025-09-16 12:47:52', '2025-09-16 12:47:52'),
(1175, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.126', 'Safari', 'Unknown', 'Mobile', '2025-09-17 11:37:50', '2025-09-17 11:37:50'),
(1176, 276, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.91', 'Safari', 'Unknown', 'Mobile', '2025-09-18 05:27:34', '2025-09-18 05:27:34'),
(1177, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.135', 'Safari', 'Unknown', 'Mobile', '2025-09-18 10:54:11', '2025-09-18 10:54:11'),
(1178, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.227', 'Chrome', 'Windows', 'Desktop', '2025-09-18 12:57:23', '2025-09-18 12:57:23'),
(1179, 386, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.92', 'Safari', 'Unknown', 'Mobile', '2025-09-18 13:09:47', '2025-09-18 13:09:47'),
(1180, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.149', 'Chrome', 'Windows', 'Desktop', '2025-09-18 13:29:14', '2025-09-18 13:29:14'),
(1181, 386, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.171', 'Safari', 'Unknown', 'Mobile', '2025-09-18 13:29:49', '2025-09-18 13:29:49'),
(1182, 386, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.44', 'Safari', 'Unknown', 'Mobile', '2025-09-18 14:18:41', '2025-09-18 14:18:41'),
(1183, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.91', 'Safari', 'Unknown', 'Mobile', '2025-09-18 15:42:16', '2025-09-18 15:42:16'),
(1184, 386, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.44', 'Safari', 'iOS', 'Mobile', '2025-09-18 16:14:05', '2025-09-18 16:14:05'),
(1185, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.15', 'Safari', 'Unknown', 'Mobile', '2025-09-19 12:34:22', '2025-09-19 12:34:22'),
(1186, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.41', 'Safari', 'Unknown', 'Mobile', '2025-09-19 14:19:58', '2025-09-19 14:19:58'),
(1187, 387, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.237', 'Chrome', 'Linux', 'Mobile', '2025-09-20 01:41:59', '2025-09-20 01:41:59'),
(1188, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.20', 'Safari', 'iOS', 'Mobile', '2025-09-20 09:44:07', '2025-09-20 09:44:07'),
(1189, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.61', 'Safari', 'iOS', 'Mobile', '2025-09-20 10:40:41', '2025-09-20 10:40:41'),
(1190, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.5', 'Safari', 'iOS', 'Mobile', '2025-09-20 12:59:36', '2025-09-20 12:59:36'),
(1191, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.104', 'Chrome', 'Windows', 'Desktop', '2025-09-20 13:04:38', '2025-09-20 13:04:38'),
(1192, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.188.16', 'Safari', 'iOS', 'Mobile', '2025-09-20 14:30:29', '2025-09-20 14:30:29'),
(1193, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.236', 'Safari', 'iOS', 'Mobile', '2025-09-20 14:54:39', '2025-09-20 14:54:39'),
(1194, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.21', 'Safari', 'iOS', 'Mobile', '2025-09-20 15:59:15', '2025-09-20 15:59:15'),
(1195, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.20', 'Safari', 'iOS', 'Mobile', '2025-09-21 00:46:37', '2025-09-21 00:46:37'),
(1196, 173, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.214.15', 'Chrome', 'Windows', 'Desktop', '2025-09-21 04:51:13', '2025-09-21 04:51:13'),
(1197, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.170', 'Safari', 'iOS', 'Mobile', '2025-09-23 10:24:34', '2025-09-23 10:24:34'),
(1198, 386, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.219.91', 'Safari', 'Macintosh', 'Desktop', '2025-09-23 11:47:32', '2025-09-23 11:47:32'),
(1199, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.101', 'Safari', 'iOS', 'Mobile', '2025-09-23 13:23:17', '2025-09-23 13:23:17'),
(1200, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.243', 'Safari', 'iOS', 'Mobile', '2025-09-23 14:27:32', '2025-09-23 14:27:32'),
(1201, 321, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.21', 'Safari', 'iOS', 'Mobile', '2025-09-23 15:25:54', '2025-09-23 15:25:54'),
(1202, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.143.243', 'Safari', 'Unknown', 'Mobile', '2025-09-23 18:58:24', '2025-09-23 18:58:24'),
(1203, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.6', 'Safari', 'Unknown', 'Mobile', '2025-09-23 19:18:28', '2025-09-23 19:18:28'),
(1204, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.145', 'Safari', 'Unknown', 'Mobile', '2025-09-23 19:30:59', '2025-09-23 19:30:59'),
(1205, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.148', 'Safari', 'Unknown', 'Mobile', '2025-09-23 22:25:55', '2025-09-23 22:25:55'),
(1206, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.135', 'Safari', 'Unknown', 'Mobile', '2025-09-24 02:29:14', '2025-09-24 02:29:14'),
(1207, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.143', 'Chrome', 'Linux', 'Mobile', '2025-09-24 16:18:14', '2025-09-24 16:18:14'),
(1208, 373, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.44', 'Safari', 'Unknown', 'Mobile', '2025-09-24 18:25:55', '2025-09-24 18:25:55'),
(1209, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.145', 'Chrome', 'Linux', 'Mobile', '2025-09-25 18:40:52', '2025-09-25 18:40:52'),
(1210, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.134', 'Chrome', 'Windows', 'Desktop', '2025-09-25 21:14:22', '2025-09-25 21:14:22'),
(1211, 394, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.40', 'Safari', 'Unknown', 'Mobile', '2025-09-27 18:22:32', '2025-09-27 18:22:32'),
(1212, 395, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.104', 'Chrome', 'Windows', 'Desktop', '2025-09-28 09:20:10', '2025-09-28 09:20:10'),
(1213, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.61', 'Chrome', 'Windows', 'Desktop', '2025-09-28 12:13:55', '2025-09-28 12:13:55'),
(1214, 297, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.170.242', 'Chrome', 'Windows', 'Desktop', '2025-09-28 17:02:31', '2025-09-28 17:02:31'),
(1215, 230, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.145', 'Chrome', 'Linux', 'Mobile', '2025-09-28 18:34:49', '2025-09-28 18:34:49'),
(1216, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.10', 'Chrome', 'Windows', 'Desktop', '2025-09-28 22:52:50', '2025-09-28 22:52:50'),
(1217, 397, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.21', 'Chrome', 'Windows', 'Desktop', '2025-09-30 00:52:38', '2025-09-30 00:52:38'),
(1218, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.155', 'Chrome', 'Windows', 'Desktop', '2025-09-30 08:23:37', '2025-09-30 08:23:37'),
(1219, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.134', 'Safari', 'Unknown', 'Mobile', '2025-09-30 11:22:23', '2025-09-30 11:22:23'),
(1220, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.52', 'Chrome', 'Windows', 'Desktop', '2025-10-01 08:29:36', '2025-10-01 08:29:36'),
(1221, 90, NULL, '4.9041', '52.3675', 'NL', 'Amsterdam', 'Netherlands', '104.23.168.3', 'Chrome', 'Windows', 'Desktop', '2025-10-01 14:27:21', '2025-10-01 14:27:21'),
(1222, 399, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.31', 'Unknown', 'iOS', 'Mobile', '2025-10-02 21:01:54', '2025-10-02 21:01:54'),
(1223, 18, NULL, '-118.2436', '34.0522', 'US', 'Los Angeles', 'United States', '104.23.251.144', 'Chrome', 'Windows', 'Desktop', '2025-10-03 14:56:10', '2025-10-03 14:56:10'),
(1224, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.82.30', 'Safari', 'Unknown', 'Mobile', '2025-10-03 21:56:29', '2025-10-03 21:56:29'),
(1225, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.57', 'Safari', 'Unknown', 'Mobile', '2025-10-03 22:08:23', '2025-10-03 22:08:23'),
(1226, 400, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.145', 'Chrome', 'Linux', 'Mobile', '2025-10-04 04:27:17', '2025-10-04 04:27:17'),
(1227, 401, NULL, '135.5022', '34.6937', 'JP', 'Osaka', 'Japan', '172.69.63.75', 'Chrome', 'Windows', 'Desktop', '2025-10-04 18:10:44', '2025-10-04 18:10:44');
INSERT INTO `user_logins` (`id`, `user_id`, `child_panel_id`, `longitude`, `latitude`, `country_code`, `location`, `country`, `ip_address`, `browser`, `os`, `get_device`, `created_at`, `updated_at`) VALUES
(1228, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.124.182', 'Safari', 'Unknown', 'Mobile', '2025-10-04 22:20:40', '2025-10-04 22:20:40'),
(1229, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.40', 'Safari', 'Unknown', 'Mobile', '2025-10-05 18:59:34', '2025-10-05 18:59:34'),
(1230, 402, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.21', 'Safari', 'iOS', 'Mobile', '2025-10-06 16:45:23', '2025-10-06 16:45:23'),
(1231, 368, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.166', 'Unknown', 'IOS', 'Mobile', '2025-10-08 15:11:18', '2025-10-08 15:11:18'),
(1232, 403, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.45', 'Chrome', 'Windows', 'Desktop', '2025-10-10 08:49:54', '2025-10-10 08:49:54'),
(1233, 297, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '104.23.175.170', 'Chrome', 'Windows', 'Desktop', '2025-10-10 19:25:52', '2025-10-10 19:25:52'),
(1234, 287, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.60', 'Chrome', 'Linux', 'Mobile', '2025-10-12 22:36:58', '2025-10-12 22:36:58'),
(1235, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.143', 'Safari', 'Unknown', 'Mobile', '2025-10-12 23:41:53', '2025-10-12 23:41:53'),
(1236, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.170', 'Safari', 'Unknown', 'Mobile', '2025-10-13 00:10:14', '2025-10-13 00:10:14'),
(1237, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.44', 'Safari', 'Unknown', 'Mobile', '2025-10-13 00:54:44', '2025-10-13 00:54:44'),
(1238, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.41', 'Safari', 'Unknown', 'Mobile', '2025-10-13 01:25:02', '2025-10-13 01:25:02'),
(1239, 231, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.18', 'Safari', 'Unknown', 'Mobile', '2025-10-13 05:55:50', '2025-10-13 05:55:50'),
(1240, 405, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.67', 'Chrome', 'Linux', 'Mobile', '2025-10-13 18:31:18', '2025-10-13 18:31:18'),
(1241, 405, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.211.44', 'Chrome', 'Linux', 'Mobile', '2025-10-13 20:10:09', '2025-10-13 20:10:09'),
(1242, 406, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.92.236', 'Safari', 'Unknown', 'Mobile', '2025-10-13 20:12:14', '2025-10-13 20:12:14'),
(1243, 18, NULL, '-118.2436', '34.0522', 'US', 'Los Angeles', 'United States', '172.69.34.175', 'Chrome', 'Windows', 'Desktop', '2025-10-14 15:12:59', '2025-10-14 15:12:59'),
(1244, 98, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.106.135', 'Safari', 'Unknown', 'Mobile', '2025-10-15 19:26:48', '2025-10-15 19:26:48'),
(1245, 361, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.21', 'Chrome', 'Windows', 'Desktop', '2025-10-15 21:24:54', '2025-10-15 21:24:54'),
(1246, 407, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.68.225.139', 'Safari', 'Unknown', 'Mobile', '2025-10-15 21:46:03', '2025-10-15 21:46:03'),
(1247, 40, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.167', 'Chrome', 'Windows', 'Desktop', '2025-10-16 20:09:23', '2025-10-16 20:09:23'),
(1248, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.60', 'Chrome', 'Linux', 'Mobile', '2025-10-18 19:31:58', '2025-10-18 19:31:58'),
(1249, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.152.35', 'Chrome', 'Linux', 'Mobile', '2025-10-19 07:46:44', '2025-10-19 07:46:44'),
(1250, 20, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.71.81.176', 'Chrome', 'Windows', 'Desktop', '2025-10-19 07:47:49', '2025-10-19 07:47:49'),
(1251, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.163.236', 'Safari', 'Unknown', 'Mobile', '2025-10-20 09:28:13', '2025-10-20 09:28:13'),
(1252, 18, NULL, '-118.2436', '34.0522', 'US', 'Los Angeles', 'United States', '172.70.206.40', 'Chrome', 'Windows', 'Desktop', '2025-10-21 11:28:48', '2025-10-21 11:28:48'),
(1253, 18, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '108.162.226.12', 'Safari', 'Unknown', 'Mobile', '2025-10-21 11:48:03', '2025-10-21 11:48:03'),
(1254, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.178.171', 'Safari', 'Unknown', 'Mobile', '2025-11-13 13:36:53', '2025-11-13 13:36:53'),
(1255, 373, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.142', 'Safari', 'Unknown', 'Mobile', '2025-11-19 21:35:36', '2025-11-19 21:35:36'),
(1256, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.114.218', 'Safari', 'Unknown', 'Mobile', '2025-11-30 09:02:36', '2025-11-30 09:02:36'),
(1257, 250, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.218.52', 'Safari', 'Unknown', 'Mobile', '2025-11-30 22:53:56', '2025-11-30 22:53:56'),
(1258, 270, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.158.193.62', 'Safari', 'Unknown', 'Mobile', '2025-12-03 23:42:29', '2025-12-03 23:42:29'),
(1259, 409, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '172.71.210.119', 'Chrome', 'Linux', 'Mobile', '2025-12-06 10:27:37', '2025-12-06 10:27:37'),
(1260, 409, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.108.142', 'Chrome', 'Linux', 'Mobile', '2025-12-12 08:57:20', '2025-12-12 08:57:20'),
(1261, 411, NULL, '106.6296', '10.823', 'VN', 'Ho Chi Minh City', 'Vietnam', '172.70.196.145', 'Chrome', 'Windows', 'Desktop', '2025-12-12 11:17:03', '2025-12-12 11:17:03'),
(1262, 250, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.69.176.148', 'Safari', 'Unknown', 'Mobile', '2025-12-14 13:50:02', '2025-12-14 13:50:02'),
(1263, 412, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.68.164.21', 'Chrome', 'Linux', 'Mobile', '2025-12-22 22:36:49', '2025-12-22 22:36:49'),
(1264, 409, NULL, '114.1693', '22.3193', 'HK', 'Hong Kong', 'Hong Kong', '162.159.98.172', 'Chrome', 'Linux', 'Mobile', '2025-12-28 21:07:44', '2025-12-28 21:07:44'),
(1265, 270, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '172.70.208.167', 'Safari', 'Unknown', 'Mobile', '2026-01-04 19:22:56', '2026-01-04 19:22:56'),
(1266, 1, NULL, '103.8198', '1.352', 'SG', 'Singapore', 'Singapore', '162.158.88.69', 'Chrome', 'Windows', 'Desktop', '2026-01-12 18:15:36', '2026-01-12 18:15:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_service_rates`
--

CREATE TABLE `user_service_rates` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `price` decimal(18,9) NOT NULL DEFAULT '0.000000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_holder` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `amount`, `bank_name`, `account_holder`, `account_number`, `status`, `created_at`) VALUES
(1, 1, 500000.00, 'Vietcombank', 'Nguyen Van A', '1234567890', 'cancelled', '2025-04-20 03:00:00'),
(2, 1, 100000.00, 'Vietcombank', '43242', '432', 'completed', '2025-04-21 13:28:01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Chỉ mục cho bảng `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `affiliate_code` (`affiliate_code`);

--
-- Chỉ mục cho bảng `affiliate_clicks`
--
ALTER TABLE `affiliate_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `affiliate_conversions`
--
ALTER TABLE `affiliate_conversions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `api_providers`
--
ALTER TABLE `api_providers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `author_details`
--
ALTER TABLE `author_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `basic_controls`
--
ALTER TABLE `basic_controls`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blacklist_emails`
--
ALTER TABLE `blacklist_emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `blacklist_ips`
--
ALTER TABLE `blacklist_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Chỉ mục cho bảng `blacklist_links`
--
ALTER TABLE `blacklist_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Chỉ mục cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog_category_details`
--
ALTER TABLE `blog_category_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog_details`
--
ALTER TABLE `blog_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `card_transactions`
--
ALTER TABLE `card_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `child_panels`
--
ALTER TABLE `child_panels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain` (`domain`),
  ADD UNIQUE KEY `panel_id` (`panel_id`);

--
-- Chỉ mục cho bảng `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `content_details`
--
ALTER TABLE `content_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_foreign` (`user_id`),
  ADD KEY `deposits_payment_method_id_foreign` (`payment_method_id`);

--
-- Chỉ mục cho bảng `draft_mass_orders`
--
ALTER TABLE `draft_mass_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `file_storages`
--
ALTER TABLE `file_storages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gateways_code_unique` (`code`);

--
-- Chỉ mục cho bảng `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `manage_menus`
--
ALTER TABLE `manage_menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notice_details`
--
ALTER TABLE `notice_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_templates_language_id_foreign` (`language_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `page_details`
--
ALTER TABLE `page_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `page_seos`
--
ALTER TABLE `page_seos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_key` (`key`(191));

--
-- Chỉ mục cho bảng `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `theme_colors`
--
ALTER TABLE `theme_colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_kycs_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_service_rates`
--
ALTER TABLE `user_service_rates`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `affiliate_clicks`
--
ALTER TABLE `affiliate_clicks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `affiliate_conversions`
--
ALTER TABLE `affiliate_conversions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `api_providers`
--
ALTER TABLE `api_providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `author_details`
--
ALTER TABLE `author_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `basic_controls`
--
ALTER TABLE `basic_controls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `blacklist_emails`
--
ALTER TABLE `blacklist_emails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blacklist_ips`
--
ALTER TABLE `blacklist_ips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blacklist_links`
--
ALTER TABLE `blacklist_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `blog_category_details`
--
ALTER TABLE `blog_category_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `blog_details`
--
ALTER TABLE `blog_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `card_transactions`
--
ALTER TABLE `card_transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `child_panels`
--
ALTER TABLE `child_panels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `configs`
--
ALTER TABLE `configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;

--
-- AUTO_INCREMENT cho bảng `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=899;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `draft_mass_orders`
--
ALTER TABLE `draft_mass_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `file_storages`
--
ALTER TABLE `file_storages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT cho bảng `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `manage_menus`
--
ALTER TABLE `manage_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT cho bảng `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notice_details`
--
ALTER TABLE `notice_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT cho bảng `page_details`
--
ALTER TABLE `page_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT cho bảng `page_seos`
--
ALTER TABLE `page_seos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `referral_bonuses`
--
ALTER TABLE `referral_bonuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT cho bảng `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `theme_colors`
--
ALTER TABLE `theme_colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1296;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user_kycs`
--
ALTER TABLE `user_kycs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1267;

--
-- AUTO_INCREMENT cho bảng `user_service_rates`
--
ALTER TABLE `user_service_rates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD CONSTRAINT `notification_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
