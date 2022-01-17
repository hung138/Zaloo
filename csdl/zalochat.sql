-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 17, 2022 lúc 11:25 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `zalochat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet`
--

CREATE TABLE `baiviet` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `media` text COLLATE utf8_unicode_ci NOT NULL,
  `media2` text COLLATE utf8_unicode_ci NOT NULL,
  `tgTao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `locked` int(11) NOT NULL,
  `comment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`id`, `id_user`, `noidung`, `media`, `media2`, `tgTao`, `locked`, `comment`) VALUES
(1, 1, 'Hom nay vui', '', '', '2021-12-22 17:53:17', 0, 0),
(2, 1, 'dbz', '', '', '2021-12-22 17:53:24', 0, 0),
(5, 1, 'thoi gian hop li', '', '', '2021-11-28 02:23:13', 0, 0),
(6, 3, 'NFL madden', '', '', '2021-12-22 17:53:27', 0, 0),
(7, 1, 'Hom nay troi dep', '', '', '2021-12-22 17:53:30', 0, 0),
(8, 1, 'game fifa 21', '', '', '2021-12-22 20:24:28', 1, 0),
(11, 14, 'Hello2', 'http://localhost/Zaloo/api/post/img/a4e43668879415.Y3JvcCw4MDgsNjMyLDAsMA1.jpg', '', '2021-12-27 08:47:46', 0, 0),
(12, 14, 'Hello', 'http://localhost/Zaloo/api/post/img/3c63d317681683.562bd58d99d02.jpg', '', '2021-12-22 18:56:57', 0, 0),
(13, 14, 'Hello 3', '', '', '2021-12-22 18:57:57', 0, 0),
(14, 14, 'Hello 3', 'http://localhost/Zaloo/api/post/img/background.png', '', '2021-12-22 19:10:01', 0, 0),
(15, 14, 'DBz', 'http://localhost/Zaloo/api/post/img/background1.png', '', '2021-12-22 19:10:27', 0, 0),
(16, 1, 'Viet nam va thai land', '', '', '2022-01-10 06:16:36', 0, 0),
(17, 1, 'Bong da viet nam', '', '', '2022-01-17 09:52:43', 0, 0),
(18, 1, 'Bóng đá Việt Nam', '', '', '2022-01-17 09:53:16', 0, 0),
(19, 13, 'Bóng đá Việt Nam45', 'http://localhost/Zaloo/api/post/img/background3.png', '', '2022-01-17 10:03:05', 0, 0),
(20, 13, 'Bóng đá Việt Nam45', '', 'http://localhost/Zaloo/api/post/video/upv13.mp4', '2022-01-17 10:03:21', 0, 0),
(21, 13, 'Bóng đá Việt Nam45', 'http://localhost/Zaloo/api/post/img/a4e43668879415.Y3JvcCw4MDgsNjMyLDAsMA4.jpg', '', '2022-01-17 10:03:43', 0, 0),
(22, 13, 'Bóng đá Việt Nam45', 'http://localhost/Zaloo/api/post/img/a4e43668879415.Y3JvcCw4MDgsNjMyLDAsMA5.jpg', '', '2022-01-17 10:03:48', 0, 0),
(23, 13, 'Hello2', 'http://localhost/Zaloo/api/post/img/79952157573223.59db866085bdc.jpg', '', '2022-01-17 10:04:30', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banbe`
--

CREATE TABLE `banbe` (
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `stt` int(11) NOT NULL,
  `tt` int(11) NOT NULL,
  `ngay` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banbe`
--

INSERT INTO `banbe` (`user1`, `user2`, `stt`, `tt`, `ngay`) VALUES
(1, 3, 1, 2, '2021-12-28 13:57:34'),
(1, 4, 2, 0, '2021-12-28 14:05:10'),
(3, 4, 3, 2, '2021-12-27 05:35:24'),
(5, 1, 4, 2, '2021-12-28 13:57:37'),
(1, 9, 5, 1, '2021-12-28 13:58:05'),
(2, 3, 7, 2, '2021-12-27 05:35:24'),
(1, 2, 9, 2, '2021-12-28 13:58:14'),
(1, 14, 12, 1, '2021-12-27 06:25:44'),
(9, 2, 17, 2, '2021-12-28 13:57:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `stt` int(11) NOT NULL,
  `id_baiviet` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `media` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ngay` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`stt`, `id_baiviet`, `id_user`, `noidung`, `media`, `ngay`) VALUES
(2, 8, 2, 'cung dc', 'data:image/png;base64,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', '2021-11-19 08:02:55'),
(4, 7, 1, 'ok cam on', '', '2021-11-19 08:06:21'),
(5, 7, 4, 'bai viet rat hay', '', '2021-11-19 08:27:18'),
(6, 8, 4, 'ok dep', '', '2021-11-19 08:32:21'),
(7, 6, 1, 'ok chua', '', '2021-11-19 08:52:18'),
(8, 6, 1, 'hello', '', '2021-11-19 08:52:42'),
(9, 6, 4, 'ok dc', '', '2021-11-19 09:42:08'),
(10, 6, 1, 'tot lam roi', '', '2021-12-06 04:15:24'),
(11, 6, 4, 'xem da', '', '2021-11-19 09:42:55'),
(13, 6, 1, 'ke ke', '', '2021-12-23 14:42:10'),
(14, 6, 1, 'hom qua', '', '2021-11-19 09:43:55'),
(15, 6, 1, 'hom qua', '', '2021-12-06 04:15:36'),
(17, 8, 1, 'tot qua', '', '2021-12-06 04:43:22'),
(18, 8, 1, 'hay hay', '', '2021-12-06 04:43:38'),
(21, 6, 4, 'ok chua gkj vvh', '', '2021-11-19 10:06:26'),
(22, 8, 3, 'chua dc', '', '2021-11-24 16:44:19'),
(23, 7, 1, 'HO ho', '', '2021-12-23 04:25:35'),
(29, 6, 3, 'hi', '', '2021-11-27 06:47:34'),
(36, 6, 1, 'nghe', '', '2021-12-06 03:34:06'),
(37, 6, 1, 'kkka kka', '', '2021-12-06 04:26:23'),
(38, 8, 1, 'hihi', '', '2021-12-06 04:20:13'),
(42, 6, 14, 'Hay hay', 'null', '2021-12-23 12:24:24'),
(43, 5, 14, 'Hay hay', 'null', '2021-12-23 12:24:56'),
(44, 5, 13, '11', 'null', '2022-01-17 10:07:07'),
(45, 5, 13, '', 'null', '2022-01-17 10:08:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `block`
--

CREATE TABLE `block` (
  `id_user_block` int(11) NOT NULL,
  `id_user_bi_block` int(11) NOT NULL,
  `stt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `block`
--

INSERT INTO `block` (`id_user_block`, `id_user_bi_block`, `stt`) VALUES
(2, 1, 4),
(5, 14, 5),
(1, 7, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `block2`
--

CREATE TABLE `block2` (
  `id_user_block` int(11) NOT NULL,
  `id_user_bi_block` int(11) NOT NULL,
  `stt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `block2`
--

INSERT INTO `block2` (`id_user_block`, `id_user_bi_block`, `stt`) VALUES
(4, 14, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat`
--

CREATE TABLE `chat` (
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `media` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ngay` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stt` int(11) NOT NULL,
  `tt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chat`
--

INSERT INTO `chat` (`user1`, `user2`, `noidung`, `media`, `ngay`, `stt`, `tt`) VALUES
(1, 2, 'hello', '', '2021-12-06 02:24:01', 5, 1),
(1, 2, 'rat vui duoc gap', '', '2021-12-06 02:24:01', 6, 1),
(2, 1, 'ok', '', '2021-12-01 15:34:12', 7, 1),
(2, 1, 'duoc', '', '2021-12-01 15:34:12', 8, 1),
(1, 2, 'gap nhau di', '', '2021-12-06 02:24:01', 9, 1),
(1, 2, 'di choi', '', '2021-12-06 02:24:01', 10, 1),
(1, 2, 'bao gio gap', '', '2021-12-06 02:24:01', 11, 1),
(1, 2, 'chua biet nua', '', '2021-12-06 02:24:01', 12, 1),
(2, 1, 'mai ok', '', '2021-12-01 15:34:12', 13, 1),
(1, 2, 'game', '', '2021-12-06 02:24:01', 16, 1),
(1, 2, 'game', '', '2021-12-01 11:53:12', 17, 1),
(2, 1, 'duoc', '', '2021-12-01 10:50:52', 18, 1),
(1, 3, 'ket ban di', '', '2021-12-01 15:40:12', 19, 1),
(3, 1, 'da ket ban', '', '2021-12-01 15:40:31', 21, 1),
(1, 3, 'goku', '', '2021-12-01 15:40:12', 24, 1),
(1, 4, 'dc chua\nmlsmvv', '', '2021-12-01 05:41:55', 27, 0),
(1, 4, 'fcsv', '', '2021-12-01 10:50:57', 28, 0),
(1, 4, 'sssv', '', '2021-12-01 05:42:11', 29, 0),
(1, 3, 'ok gh', '', '2021-12-01 15:40:12', 30, 1),
(3, 1, 'kjdg', '', '2022-01-09 06:53:25', 32, 1),
(4, 3, 'Hello Hung', '', '2021-12-01 15:40:18', 33, 1),
(4, 1, 'hello', '', '2021-12-01 15:40:26', 35, 1),
(4, 1, 'he he', '', '2021-12-01 15:40:26', 36, 1),
(4, 1, 'gid', '', '2022-01-09 06:53:29', 37, 1),
(1, 4, 'ok', '', '2021-12-02 05:00:59', 38, 0),
(2, 3, 'ho ho', '', '2021-12-06 02:29:21', 39, 1),
(3, 2, 'hehe', '', '2021-12-06 02:29:56', 40, 1),
(3, 4, 'okk la', '', '2021-12-06 02:29:47', 41, 0),
(3, 4, 'ko', '', '2021-12-06 02:32:10', 45, 0),
(3, 1, 'on thoi', '', '2021-12-06 03:23:36', 48, 1),
(3, 5, 'oh no', '', '2021-12-06 05:47:39', 50, 1),
(2, 3, 'hi hi', '', '2021-12-06 03:04:38', 51, 1),
(1, 3, 'mlk', '', '2021-12-06 03:30:54', 56, 0),
(1, 3, 'okk', '', '2021-12-06 03:31:11', 58, 0),
(1, 4, 'kn', '', '2021-12-06 04:11:45', 59, 0),
(1, 4, 'ml', '', '2021-12-06 04:11:50', 60, 0),
(1, 4, 'ml', '', '2021-12-06 04:11:55', 61, 0),
(1, 4, 'ml', '', '2021-12-06 04:11:58', 62, 0),
(1, 4, 'hhh', '', '2021-12-06 04:12:04', 63, 0),
(1, 3, 'hom qua', '', '2021-12-06 04:13:36', 65, 0),
(1, 3, 'da sao', '', '2021-12-06 04:13:45', 66, 0),
(1, 3, 'dc roi', '', '2021-12-06 04:13:54', 67, 0),
(5, 1, 'hdhdh', '', '2021-12-06 05:53:27', 72, 1),
(1, 5, 'dhdh', '', '2021-12-06 05:54:25', 73, 1),
(5, 1, 'fjf', '', '2021-12-06 05:54:35', 74, 1),
(5, 1, 'djdj', '', '2021-12-06 05:55:00', 75, 1),
(5, 1, 'scsc', '', '2021-12-06 06:05:56', 77, 1),
(1, 5, 'cscscs', '', '2021-12-06 06:06:48', 79, 1),
(1, 5, 'dndcnc', '', '2021-12-25 11:06:36', 86, 1),
(5, 1, 'fvnv', '', '2021-12-25 11:06:39', 87, 1),
(1, 3, 'hi ha', '', '2022-01-09 07:23:38', 89, 0),
(1, 3, 'hhhhh', '', '2022-01-09 07:25:20', 90, 0),
(3, 1, 'ok la', '', '2022-01-09 07:47:34', 91, 0),
(1, 3, 'lala', '', '2022-01-09 07:48:04', 92, 0),
(3, 1, 'hddg', '', '2022-01-09 07:48:07', 93, 0),
(10, 7, 'hi hi', '', '2022-01-17 07:00:27', 94, 0),
(10, 7, 'oh', '', '2022-01-17 07:00:39', 95, 0),
(7, 10, 'ke ke', '', '2022-01-17 07:00:47', 96, 0),
(7, 10, 'uo', '', '2022-01-17 07:01:06', 97, 0),
(10, 7, 'go', '', '2022-01-17 07:01:15', 98, 0),
(10, 7, 'okk', '', '2022-01-17 07:03:31', 99, 0),
(7, 10, 'hj', '', '2022-01-17 07:03:51', 100, 0),
(10, 7, 'gh', '', '2022-01-17 07:04:47', 101, 0),
(7, 10, 'bhnj', '', '2022-01-17 07:04:54', 102, 0),
(7, 10, 'yoyo', '', '2022-01-17 07:06:41', 103, 0),
(15, 7, 'gogo', '', '2022-01-17 07:07:50', 104, 0),
(15, 7, 'yo', '', '2022-01-17 07:09:03', 105, 0),
(7, 15, 'gh', '', '2022-01-17 07:09:09', 106, 0),
(15, 14, 'ghe', '', '2022-01-17 07:16:56', 107, 0),
(14, 15, 'ghk', '', '2022-01-17 07:17:05', 108, 0),
(12, 13, 'ghh sss', '', '2022-01-17 09:57:45', 109, 0),
(13, 12, 'fjsjs dfx', '', '2022-01-17 09:57:57', 110, 0),
(12, 13, 'gvhhb', '', '2022-01-17 09:58:08', 111, 0),
(12, 13, 'hink', '', '2022-01-17 09:58:14', 112, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report`
--

CREATE TABLE `report` (
  `stt` int(11) NOT NULL,
  `id_baiviet` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report`
--

INSERT INTO `report` (`stt`, `id_baiviet`, `subject`, `details`) VALUES
(1, 5, 3, 'phan cam'),
(3, 5, 3, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `searched`
--

CREATE TABLE `searched` (
  `stt` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `ngay` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `searched`
--

INSERT INTO `searched` (`stt`, `user_id`, `noidung`, `ngay`) VALUES
(7, 1, 'li', '2021-12-28 14:32:51'),
(8, 1, 'he hi', '2021-12-28 14:33:25'),
(9, 1, 'he he', '2021-12-28 14:37:32'),
(10, 1, 'thoi', '2021-12-28 14:38:03'),
(11, 1, '23', '2021-12-28 14:38:16'),
(12, 1, 'he', '2022-01-17 06:23:44'),
(13, 1, 'Viet nam', '2022-01-17 06:23:54'),
(14, 1, 'dc', '2022-01-17 06:24:08'),
(15, 1, 'ho', '2022-01-17 09:00:37'),
(16, 1, 'vie', '2022-01-17 09:00:54'),
(17, 1, 'Nam bóng đá việt', '2022-01-17 09:53:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sms`
--

CREATE TABLE `sms` (
  `stt` int(11) NOT NULL,
  `sdt` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `ngay` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sms`
--

INSERT INTO `sms` (`stt`, `sdt`, `code`, `ngay`) VALUES
(1, 987640393, 8518, '2021-12-27 09:22:55'),
(2, 987640393, 6120, '2021-12-27 09:23:04'),
(3, 987640393, 5353, '2021-12-27 09:30:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thich`
--

CREATE TABLE `thich` (
  `id_baiviet` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `ngay` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thich`
--

INSERT INTO `thich` (`id_baiviet`, `id_user`, `ngay`) VALUES
(5, 1, '2021-11-28 03:30:30'),
(9, 1, '2021-11-28 03:30:45'),
(7, 2, '2021-11-28 03:31:38'),
(5, 2, '2021-11-28 03:31:43'),
(2, 2, '2021-11-28 03:31:45'),
(8, 1, '2021-11-28 03:32:17'),
(8, 2, '2021-11-28 03:32:20'),
(9, 2, '2021-11-28 04:37:52'),
(6, 1, '2021-12-06 04:15:15'),
(7, 1, '2021-12-20 08:53:15'),
(6, 14, '2021-12-23 14:53:41'),
(5, 14, '2021-12-23 14:55:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `tenDN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `matkhau` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `linkAvatar` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `quyen` int(11) NOT NULL,
  `song` int(11) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `tenDN`, `matkhau`, `sdt`, `linkAvatar`, `quyen`, `song`, `last_login`) VALUES
(1, 'Hung Tuan', '5hfhdbd4', '0987654321', 'http://localhost/Zaloo/api/avatar/3c63d317681683.562bd58d99d02.jpg', 3, 0, '2022-01-17 09:52:18'),
(2, 'Nguyen Minh Tu', '123iss9sjs', '0987640393', 'https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png', 0, 0, '2021-12-27 09:22:05'),
(3, 'Hung Le', '345648hssf', '0987640325', 'https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png', 2, 0, '2022-01-09 07:47:04'),
(4, 'Tran Nam', '123djs8jde', '0987453672', 'https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png', 1, 0, '2022-01-17 06:47:56'),
(5, 'Nam hai', '183ujd6j4d', '0983334321', 'https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png', 2, 1, '2021-12-27 09:22:17'),
(7, 'Minh Ha', '123dms864d', '0986285935', 'https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png', 0, 0, '2022-01-17 06:56:21'),
(8, 'Nam Khanh', '456sks84vs', '0837292294', 'https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png', 0, 1, '2021-12-27 09:22:26'),
(9, 'Ho Nam', '123s9djs9s8', '0448894426', 'https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png', 0, 0, '2022-01-09 02:48:42'),
(10, 'Manh Minh', '123ma76dm', '0985432108', 'https://cdn.iconscout.com/icon/free/png-256/face-1659511-1410033.png', 0, 0, '2022-01-17 07:07:06'),
(12, 'Hung Dung', '123ma767', '0388484812', 'http://localhost/Zaloo/api/avatar/0388484812.png', 0, 0, '2022-01-17 09:56:32'),
(13, 'Hoang Duc', '75839hdgo87', '0188486712', 'http://localhost/Zaloo/api/avatar/male.png', 0, 0, '2022-01-17 09:59:23'),
(14, 'Hoang Hai', 'mandh19383', '0758992929', 'http://localhost/Zaloo/api/avatar/0758992929.png', 1, 0, '2022-01-17 07:16:26'),
(15, 'UMM', 'kgndh19383', '0758942929', 'http://localhost/Zaloo/api/avatar/male.png', 0, 0, '2022-01-17 07:20:08'),
(16, 'Uma la', '535h19383', '0985942929', 'http://localhost/Zaloo/api/avatar/male1.png', 0, 0, '2021-12-25 13:11:57'),
(17, 'Oke La', '539573jds', '0235942929', 'http://localhost/Zaloo/api/avatar/male3.png', 0, 0, '2021-12-25 13:11:57'),
(18, 'Oke La', '539573jds', '0235942965', 'http://localhost/Zaloo/api/avatar/a4e43668879415.Y3JvcCw4MDgsNjMyLDAsMA1.jpg', 0, 0, '2022-01-17 09:45:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banbe`
--
ALTER TABLE `banbe`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `block2`
--
ALTER TABLE `block2`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `searched`
--
ALTER TABLE `searched`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `banbe`
--
ALTER TABLE `banbe`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `block`
--
ALTER TABLE `block`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `block2`
--
ALTER TABLE `block2`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chat`
--
ALTER TABLE `chat`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT cho bảng `report`
--
ALTER TABLE `report`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `searched`
--
ALTER TABLE `searched`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `sms`
--
ALTER TABLE `sms`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
