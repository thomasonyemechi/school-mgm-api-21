-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2022 at 08:55 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_school_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_arms`
--

CREATE TABLE `class_arms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `arm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_arms`
--

INSERT INTO `class_arms` (`id`, `school_id`, `arm`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'A', 1, '2021-12-07 11:26:19', '2022-01-12 15:02:43'),
(2, 1, 'B', 1, '2021-12-07 11:26:35', '2021-12-07 11:26:35'),
(3, 1, 'C', 1, '2021-12-21 07:36:39', '2021-12-21 07:36:39'),
(4, 1, 'D', 1, '2022-01-12 15:05:08', '2022-01-12 15:06:05'),
(5, 1, 'E', 1, '2022-01-12 15:06:54', '2022-01-12 15:07:03'),
(6, 1, 'F', 1, '2022-01-13 07:09:37', '2022-01-13 07:09:37'),
(7, 1, 'G', 1, '2022-01-13 07:11:05', '2022-01-13 07:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `class_categories`
--

CREATE TABLE `class_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_categories`
--

INSERT INTO `class_categories` (`id`, `school_id`, `category`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'JSS', 1, '2021-12-07 11:38:40', '2022-01-12 14:02:34'),
(2, 1, 'SSS', 1, '2021-12-07 11:39:14', '2022-01-12 14:03:40'),
(3, 1, 'PRY', 1, '2022-01-12 14:37:01', '2022-01-12 14:37:01'),
(4, 1, 'KG', 1, '2022-01-12 14:38:40', '2022-01-12 14:38:40'),
(5, 1, 'EX', 1, '2022-01-12 14:39:54', '2022-01-12 14:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `class_cores`
--

CREATE TABLE `class_cores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `class` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `index` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_cores`
--

INSERT INTO `class_cores` (`id`, `school_id`, `category_id`, `class`, `index`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'SSS 1', 5, 1, '2021-12-08 08:30:36', '2022-01-13 07:49:53'),
(2, 1, 2, 'SSS 3', 7, 1, '2021-12-08 08:30:53', '2022-01-13 07:49:50'),
(3, 1, 2, 'SSS 2', 6, 1, '2021-12-08 08:31:01', '2022-01-13 07:49:51'),
(4, 1, 1, 'JSS 2', 3, 1, '2021-12-08 08:31:05', '2022-01-13 07:49:56'),
(5, 1, 1, 'JSS 1', 2, 1, '2021-12-08 08:31:12', '2022-01-13 07:50:06'),
(6, 1, 1, 'JSS 3', 4, 1, '2021-12-08 08:31:16', '2022-01-13 07:49:54'),
(7, 1, 2, 'SSS 6', 10, 1, '2022-01-13 07:21:27', '2022-01-13 07:49:45'),
(8, 1, 2, 'SSS 5', 9, 1, '2022-01-13 07:21:54', '2022-01-13 07:49:47'),
(9, 1, 2, 'SSS 4', 8, 1, '2022-01-13 07:23:43', '2022-01-13 07:49:48'),
(10, 1, 2, 'SSS 7', 11, 1, '2022-01-13 07:43:51', '2022-01-13 07:49:43'),
(11, 1, 4, 'KG 3', 1, 1, '2022-01-13 07:49:38', '2022-01-13 07:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_categories`
--

CREATE TABLE `fee_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `fee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_categories`
--

INSERT INTO `fee_categories` (`id`, `school_id`, `term_id`, `fee`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Lesson Fee', 'Money for Lesson to be paid every term', 1, '2021-12-21 08:08:00', '2022-01-19 10:13:52'),
(2, 1, 2, 'Tution oo', 'Tution', 1, '2021-12-21 08:49:08', '2022-01-19 10:13:21'),
(3, 1, 14, 'Transportation Fee', 'Transportation Fee', 1, '2022-01-18 09:08:55', '2022-01-18 09:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `a` int(11) NOT NULL DEFAULT 70,
  `b` int(11) NOT NULL DEFAULT 60,
  `c` int(11) NOT NULL DEFAULT 50,
  `d` int(11) NOT NULL DEFAULT 45,
  `e` int(11) NOT NULL DEFAULT 40,
  `ca1` int(11) NOT NULL DEFAULT 10,
  `ca2` int(11) NOT NULL DEFAULT 20,
  `ca3` int(11) NOT NULL DEFAULT 10,
  `exam` int(11) NOT NULL DEFAULT 60,
  `teacher_comment_a` int(11) DEFAULT NULL,
  `teacher_comment_b` int(11) DEFAULT NULL,
  `teacher_comment_c` int(11) DEFAULT NULL,
  `teacher_comment_d` int(11) DEFAULT NULL,
  `teacher_comment_e` int(11) DEFAULT NULL,
  `teacher_comment_f` int(11) DEFAULT NULL,
  `principal_comment_a` int(11) DEFAULT NULL,
  `principal_comment_b` int(11) DEFAULT NULL,
  `principal_comment_c` int(11) DEFAULT NULL,
  `principal_comment_d` int(11) DEFAULT NULL,
  `principal_comment_e` int(11) DEFAULT NULL,
  `principal_comment_f` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `school_id`, `a`, `b`, `c`, `d`, `e`, `ca1`, `ca2`, `ca3`, `exam`, `teacher_comment_a`, `teacher_comment_b`, `teacher_comment_c`, `teacher_comment_d`, `teacher_comment_e`, `teacher_comment_f`, `principal_comment_a`, `principal_comment_b`, `principal_comment_c`, `principal_comment_d`, `principal_comment_e`, `principal_comment_f`, `created_at`, `updated_at`) VALUES
(1, 1, 70, 60, 50, 45, 40, 10, 20, 10, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-03 12:58:18', '2021-12-03 12:58:18'),
(2, 3, 70, 60, 50, 45, 40, 10, 20, 10, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-21 07:26:54', '2021-12-21 07:26:54'),
(4, 13, 70, 60, 50, 45, 40, 10, 20, 10, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-10 16:50:11', '2022-01-10 16:50:11'),
(5, 14, 70, 60, 50, 45, 40, 10, 20, 10, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-10 16:53:47', '2022-01-10 16:53:47'),
(6, 15, 70, 60, 50, 45, 40, 10, 20, 10, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-10 16:55:31', '2022-01-10 16:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `guardian_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_office_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_office_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lga` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guardians`
--

INSERT INTO `guardians` (`id`, `school_id`, `guardian_name`, `guardian_email`, `guardian_phone`, `guardian_address`, `password`, `mother_name`, `mother_email`, `mother_address`, `mother_phone`, `mother_occupation`, `mother_office_address`, `father_name`, `father_email`, `father_address`, `father_phone`, `father_occupation`, `father_office_address`, `state`, `lga`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'School Petal Guardian', 'guardian@schoolpetal.com', '09038772366', 'School Petal GUradian address live somewhere here', '$2y$10$ZxK/BMDwnj2hoqttVwSQtuPL4Q4Gqur7ny7kkt/BoprzKTfE8KW.6', 'Schoolpetal Mother', 'mother@schoolpetal.com', 'Address of school petal mother some where in don know', '090231131033', 'Petal Mother Occupation', 'Office Address of school petal mother some where in don know', 'School Petal Father', 'father@schoolpetal.com', 'Address of school petal father some where in don know', '1132323233', 'Petal Father Occupation', 'Office Address of school petal father some where in don know', 'Ondo State', 'Akure South', 1, '2021-12-08 08:51:29', '2021-12-08 08:51:29'),
(2, 1, 'G one  School', 'g@school.com', '09999999', 'address', '$2y$10$kj7qRLCVnmZpHzvV46KnC.byf17M0fi7KOiiVdEw5VnqV5WkwuC4i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-21 07:46:31', '2021-12-21 07:48:15'),
(3, 1, 'Nimi Braid', 'thomasonyemechi03@gmail.com', '09038772366', 'Ondo', '$2y$10$6bKlCxQE37rDniRYGQ5LFeFNYtBQX00xqpj4SOgEh/lEYhu2SaPTC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'oyo', 'local goverment', 1, '2022-01-14 07:10:53', '2022-01-14 07:10:53'),
(4, 1, 'Nimi Braid', 'guardian@gmail.com', '+2349038772366', 'Adamawa', '$2y$10$htl4VOIPJGyT4JH9A3Xviu4HkI8wlVxZ/GnP3a7BNVNWBjwVfTtry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ebonyi', 'zanku', 1, '2022-01-14 07:12:57', '2022-01-14 07:12:57'),
(5, 1, 'thomasonyemechi', 'guardian@gmail.com1', '73473742', 'akure', '$2y$10$u5GjEhnOrhZI1PW/eCw80uVMIHoHa4XpnhwTCpEGqXDwkIzqiIjN2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guridaon State', 'local goverment', 1, '2022-01-14 07:14:14', '2022-01-14 07:14:14'),
(6, 1, 'agile staff one', 'guardian@gmail.com2', '08067544387', 'Adamawa', '$2y$10$mRCgPvPex6e2uNS4yXrS9eGuNAn6Dt6rob8dWHW7IPyxNINukoZkC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ebonyi', 'zanku', 1, '2022-01-14 07:15:25', '2022-01-14 07:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2021_12_03_115229_create_schools_table', 2),
(11, '2021_12_03_125451_create_grades_table', 3),
(12, '2021_12_03_130723_create_permissions_table', 4),
(13, '2021_12_03_140750_create_sessions_table', 5),
(14, '2021_12_03_142537_create_terms_table', 6),
(15, '2021_12_06_112024_create_subjects_table', 7),
(16, '2021_12_07_113202_create_class_arms_table', 8),
(17, '2021_12_07_113744_create_class_categories_table', 8),
(18, '2021_12_07_130905_create_class_cores_table', 9),
(19, '2021_12_08_083246_create_guardians_table', 10),
(20, '2021_12_08_101156_create_students_table', 11),
(21, '2021_12_13_152417_create_fee_categories_table', 12),
(22, '2021_12_13_152907_create_payments_table', 13),
(23, '2021_12_21_195155_create_set_subjects_table', 14),
(24, '2021_12_25_131645_create_result_summaries_table', 15),
(25, '2021_12_25_132745_create_results_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('05e8cc32b55a6ac0c4cdfb125d1a9be9286c8c1d08cc625c17b6df4ef157b4035f9b9208eda2e304', 1, 1, 'authToken', '[]', 0, '2022-01-12 14:26:22', '2022-01-12 14:26:22', '2023-01-12 15:26:22'),
('06593b93a526741d2c851236ae6d50c195511c9d17063c78c0cb86a4e2eaf57755c4b8af89650e43', 1, 1, 'authToken', '[]', 0, '2022-01-10 13:32:20', '2022-01-10 13:32:20', '2023-01-10 14:32:20'),
('0fbdcdc612ebaf01ce097da73045cbd406e6b791d3ad0647d29063beb4faecbeb8ee9a315585f661', 4, 1, 'authToken', '[]', 0, '2021-12-21 07:27:26', '2021-12-21 07:27:26', '2022-12-21 08:27:26'),
('1706279af8c448da52ee59e31951201b9cc432b0d03d09f2d140d9b8698453f7593ee232b71c3331', 1, 1, 'authToken', '[]', 0, '2022-01-13 17:15:55', '2022-01-13 17:15:55', '2023-01-13 18:15:55'),
('1889a6bf12ce30b2a891343e28709c9a8ae04845f363937615f1064551b29fb9243f2ef9ab7f1571', 1, 1, 'authToken', '[]', 0, '2022-01-12 07:04:50', '2022-01-12 07:04:50', '2023-01-12 08:04:50'),
('1a602678e2d0235b7771ce0c6e200e525d8f8789291e4a3a80c9792dd841f117db9dc830d01e315c', 1, 1, 'authToken', '[]', 0, '2022-01-31 05:50:49', '2022-01-31 05:50:49', '2023-01-31 06:50:49'),
('1a74e4e3672f27e87f5c5b5b9cb27871e08b05e301c23b501bc32227a9a967d56c29c8c7fed63ef3', 1, 1, 'authToken', '[]', 0, '2022-01-10 13:29:29', '2022-01-10 13:29:29', '2023-01-10 14:29:29'),
('1d932eefef2ed2f87ff9bdc065e143832afa19f8f345532bf6624de8478465f97a1cadc5b1831f99', 1, 1, 'authToken', '[]', 0, '2021-12-03 10:23:29', '2021-12-03 10:23:29', '2022-12-03 11:23:29'),
('1df0f35b68fd3bc760a8c7d6139be9d116c82616140336c2a6e1ba2e27fbd67c8d0b82fc17dc6881', 1, 1, 'authToken', '[]', 0, '2022-01-14 13:44:28', '2022-01-14 13:44:28', '2023-01-14 14:44:28'),
('1ef83ce1e1e3e0708c7f9703e17fa7f05999c49bcd6b9ebbae092998a218b8afe9673f6f2ca5e8cc', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:33:32', '2022-01-11 06:33:32', '2023-01-11 07:33:32'),
('22b9be94f236536426adbeaa598357af86b1484ad9d52fe0963171bf72fb87a2a3ac83fbe37b19e8', 1, 1, 'authToken', '[]', 0, '2022-01-24 06:46:20', '2022-01-24 06:46:20', '2023-01-24 07:46:20'),
('2514a5cbbb500de012aae50c040d1b3e0dd0ee4d838869868b42f2369b0da64ecb3bee521198fd5b', 1, 1, 'authToken', '[]', 0, '2021-12-03 12:40:49', '2021-12-03 12:40:49', '2022-12-03 13:40:49'),
('2c28b346c03f7aa45a5b5e5ee01dbfba1874e4e3fd942acced490c422c737a8472448145713fb1d1', 17, 1, 'authToken', '[]', 0, '2022-01-10 16:55:56', '2022-01-10 16:55:56', '2023-01-10 17:55:56'),
('2cabca27fc1fa4aa19b7da19cff253fc3d4aa90ac667a925b310044560930e4f75dcb193e19113c5', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:51:22', '2022-01-11 06:51:22', '2023-01-11 07:51:22'),
('2d0fc39ad03cdac89453c60b3c221dc7834241819b014c890a3ccb05e8e3b0a4cbf01331052b9058', 1, 1, 'authToken', '[]', 0, '2022-01-12 13:15:36', '2022-01-12 13:15:36', '2023-01-12 14:15:36'),
('321c1922d88cb8f6f0d47fbc20f02791e8acb183fa66fe120aff9be16a8118d750d3f9d2513676db', 1, 1, 'authToken', '[]', 0, '2022-01-18 13:13:16', '2022-01-18 13:13:16', '2023-01-18 14:13:16'),
('341d6ab6092dd09b9e4fbb8186186f5a80e73896783e047469e887ba5285210184264fb01d8c76e8', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:34:11', '2022-01-11 06:34:11', '2023-01-11 07:34:11'),
('3fd850a073a8f510d55cb35b558eeee77a899b0f9507051bdecfc6f9ab30c8985aa6ea9df569e677', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:49:43', '2022-01-11 06:49:43', '2023-01-11 07:49:43'),
('451d9196fca9d09fa904433c436281eae6ef62c099d3404f80472fad00310665254404e50d4d2cc4', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:50:08', '2022-01-11 06:50:08', '2023-01-11 07:50:08'),
('46f1ed8d4ba4c051bbee0d7d1c7729f5616d3a5048a38e8b13d56df434c0e9ee2a0d87db81bbc59b', 1, 1, 'authToken', '[]', 0, '2022-01-17 10:06:05', '2022-01-17 10:06:05', '2023-01-17 11:06:05'),
('4a4fca8eb36070b762125459ff48ca5df11287798426a67523d015a922edd234fd912c7c7729c45b', 1, 1, 'authToken', '[]', 0, '2021-12-03 12:41:01', '2021-12-03 12:41:01', '2022-12-03 13:41:01'),
('4b4709ccb0901274902734b6a16cfc44e064aa6d07be7d9884a38d6b821aa3de9ba50bae77c5d2b6', 1, 1, 'authToken', '[]', 0, '2022-01-12 08:18:27', '2022-01-12 08:18:27', '2023-01-12 09:18:27'),
('4e4cd33c64effb16aa8f2b571b8c8dfa6fe6012cb00a1b67a65c8dad6a3dee10d273ae220625b875', 1, 1, 'authToken', '[]', 0, '2021-12-21 08:02:03', '2021-12-21 08:02:03', '2022-12-21 09:02:03'),
('521a4e3fceeb690c5393e14f3b666dde3fff95f788591106d3bf9ca147188a3ac4280256528b0003', 1, 1, 'authToken', '[]', 0, '2022-01-10 13:28:07', '2022-01-10 13:28:07', '2023-01-10 14:28:07'),
('5444e223eacc20debd91374977abd3e50671b1a267f97738ebd4fae10abbe9811183400cf174492d', 1, 1, 'authToken', '[]', 0, '2022-01-17 10:06:17', '2022-01-17 10:06:17', '2023-01-17 11:06:17'),
('56d024244e64e9706b89711fd0aa59be201cd8695503a990502b61b94615ecb1bca8350044f533b5', 1, 1, 'authToken', '[]', 0, '2022-01-14 05:55:16', '2022-01-14 05:55:16', '2023-01-14 06:55:16'),
('583f7281917bf777a954f545a94e8abf2125b673eb5ae45a1a82bd0554bf33fe8410920154fd023b', 1, 1, 'authToken', '[]', 0, '2023-01-12 13:11:54', '2023-01-12 13:11:54', '2024-01-12 14:11:54'),
('59df908f0b02258d17ae98ee3bc3dfde779eddb6121a38f6da2b29cda0e17f5a1af2ddfe67083395', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:47:26', '2022-01-11 06:47:26', '2023-01-11 07:47:26'),
('5a0b57cf26779703430a7a9ab131373216bc287ef6c9f347a3ac68c40e1302f81be32eaf8d13faba', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:37:46', '2022-01-11 06:37:46', '2023-01-11 07:37:46'),
('5dff7878a0e1320b0ceafc00a85113d96754e924238192ff6cc5e0bd322c95d9b45cbb2c7e41478e', 1, 1, 'authToken', '[]', 0, '2022-01-10 13:31:07', '2022-01-10 13:31:07', '2023-01-10 14:31:07'),
('5f76f9181b289e8fdaaa7550ee28a41a7a245c20a39b94c93b454c367a69d42d150a106a9ff8bbdb', 1, 1, 'authToken', '[]', 0, '2021-12-06 08:36:07', '2021-12-06 08:36:07', '2022-12-06 09:36:07'),
('62b394783cdd762707cfcd40ead8471e9e46b12f8772e228dcf361734371c4afcfec3259d4339505', 1, 1, 'authToken', '[]', 0, '2022-01-20 08:13:40', '2022-01-20 08:13:40', '2023-01-20 09:13:40'),
('635a67d767a587d776234612134b5fce911b24ad4af8df3d1243dee45912919a61d6b504faba9c13', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:33:17', '2022-01-11 06:33:17', '2023-01-11 07:33:17'),
('692cdfd7739f909d27635054df7b067ff7b2aafc91b0ae8dead1b46e6d7a52f6496a807197d75537', 1, 1, 'authToken', '[]', 0, '2022-01-19 10:12:52', '2022-01-19 10:12:52', '2023-01-19 11:12:52'),
('69fcaa033e75e0047d62fee4bf2a76c2af42b1d806c46159b4b245348df371762c1830d25001330d', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:32:37', '2022-01-11 06:32:37', '2023-01-11 07:32:37'),
('6b857330b944c1f16521349ad948c39425155e365d5b28d27ccc362ac82aad9be95dabca42dcb92f', 1, 1, 'authToken', '[]', 0, '2022-01-30 17:07:29', '2022-01-30 17:07:29', '2023-01-30 18:07:29'),
('6d3f564fc37895dc49ec0bda5aefea70832bad1cbe6da612c0b73912a085f2730596079527ab80a4', 1, 1, 'authToken', '[]', 0, '2022-02-01 06:09:32', '2022-02-01 06:09:32', '2023-02-01 07:09:32'),
('6f84af3e9ac932c777655dac0ec2b1bafa6f1a0fbb846db1debd740c1e9b925634751b55c8e80687', 1, 1, 'authToken', '[]', 0, '2022-01-12 06:22:38', '2022-01-12 06:22:38', '2023-01-12 07:22:38'),
('714c534855e8016a868f06a2318fff6f9c1d65e969559f6afeb4e6ebfcdfc9aca8f15274d93ccccf', 1, 1, 'authToken', '[]', 0, '2022-01-20 03:25:43', '2022-01-20 03:25:43', '2023-01-20 04:25:43'),
('715f8adb11ec11adabbf78ea4c7b95b761fc2c4a3d3c804900f9103a364181cb5c14a7bc3704fe35', 1, 1, 'authToken', '[]', 0, '2022-01-10 16:59:55', '2022-01-10 16:59:55', '2023-01-10 17:59:55'),
('73a597a7694c939731fa468d5dcaf71658425a2b112f0d2d513f66b39951645929c1bf9e444c7fe2', 1, 1, 'authToken', '[]', 0, '2022-01-10 15:22:32', '2022-01-10 15:22:32', '2023-01-10 16:22:32'),
('7527f04e23994dc98f48f35e3e83aa8d7e549df6550841d47a8fe199aa7b8b7d575521555228e7ef', 1, 1, 'authToken', '[]', 0, '2022-01-31 06:04:44', '2022-01-31 06:04:44', '2023-01-31 07:04:44'),
('776777289598060c3290acbad5191794120df905e7c1c4700d0cd945b2379a75208af985d1dfaf4c', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:31:48', '2022-01-11 06:31:48', '2023-01-11 07:31:48'),
('7b5af9b48f52353eedb3eb1c3a8990c87a27444490f8a2c17b3b4cbedc825bfab9a4e08a5a3c4c33', 1, 1, 'authToken', '[]', 0, '2022-01-29 07:57:54', '2022-01-29 07:57:54', '2023-01-29 08:57:54'),
('7f0f9225c40c80ed14335180cae11ef3bda7c125f29217a21d148697f12918aa7f230dbe325d320d', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:50:36', '2022-01-11 06:50:36', '2023-01-11 07:50:36'),
('7f286dd746ad289983a200dc8c6a8d6d8dabcd08c914a10a1eb5e256ac52b2e96a92ca11997583fd', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:36:00', '2022-01-11 06:36:00', '2023-01-11 07:36:00'),
('83e6225f6e7c358903e7b748c97f59c3e6197170e92482340e71834e3359d8233ad8d7dcd03eba43', 1, 1, 'authToken', '[]', 0, '2022-01-25 18:58:21', '2022-01-25 18:58:21', '2023-01-25 19:58:21'),
('83ebfb846272e46c5d3e43ef2804718b8ab8f34e8ba06baf3ddbbc848ce8b1b90580715165b90cc2', 1, 1, 'authToken', '[]', 0, '2022-01-24 04:02:56', '2022-01-24 04:02:56', '2023-01-24 05:02:56'),
('8ec7b8efb860d4d03a3eb9fd6bf64a444ba05a9440fbf8909bf3b753efa5d7c5eec88be17ff002ac', 1, 1, 'authToken', '[]', 0, '2022-01-11 07:06:44', '2022-01-11 07:06:44', '2023-01-11 08:06:44'),
('92c87bccba04b6bb486930432f1925b8685ceaae1fc81558dd21811eaf528b878c00b9b595964bad', 1, 1, 'authToken', '[]', 0, '2022-01-13 16:44:51', '2022-01-13 16:44:51', '2023-01-13 17:44:51'),
('94419745c41fdb5500a09a86e8ba0a205213287ad970a360e7579d9302025b28f13b9223ad44dc8e', 1, 1, 'authToken', '[]', 0, '2022-01-12 14:16:53', '2022-01-12 14:16:53', '2023-01-12 15:16:53'),
('9a7a7e13535a2f66345e54a00825097b7eae2f49641304c408dae16a396128addd269b35e476ba23', 1, 1, 'authToken', '[]', 0, '2022-01-10 16:57:18', '2022-01-10 16:57:18', '2023-01-10 17:57:18'),
('9b306498c406a55fa566ce2dfc36d046d4b3bb786e673c3f8cf986c19c13fd04391b9435ab47c61a', 1, 1, 'authToken', '[]', 0, '2022-01-06 12:32:05', '2022-01-06 12:32:05', '2023-01-06 13:32:05'),
('9b3d8bdb9af1dca722d7498ee454722aff9379dea8ac51d3dd00aac7b1a030ea2a2ae2cc5a52a800', 1, 1, 'authToken', '[]', 0, '2022-01-26 14:14:17', '2022-01-26 14:14:17', '2023-01-26 15:14:17'),
('a234af9ecff6b61e752f98d32c860da69b269e42c5077cdae2e411a9d5abf2f799f85887a2d1c156', 1, 1, 'authToken', '[]', 0, '2022-01-10 13:31:56', '2022-01-10 13:31:56', '2023-01-10 14:31:56'),
('a3a90b2818e6cad5499fa69bb274272bd073be2d72fab274713892e00f721fa14ba0815aff3ef239', 1, 1, 'authToken', '[]', 0, '2022-01-11 07:07:29', '2022-01-11 07:07:29', '2023-01-11 08:07:29'),
('a5e70cff31718e05dc33edb8f3cd9e93d7c033656fb66916aa7007d8391d256e079f3c91a3a9dc2f', 1, 1, 'authToken', '[]', 0, '2022-01-10 17:01:53', '2022-01-10 17:01:53', '2023-01-10 18:01:53'),
('a9961302ff9dd2175e53713c1e83dd700370aca2e050563497e7c5f8836eb5a975ed87e31c5f3e16', 1, 1, 'authToken', '[]', 0, '2022-01-12 06:26:13', '2022-01-12 06:26:13', '2023-01-12 07:26:13'),
('b0a7ed949823faabd89ba5be58a7b69cc38bbe0767948187eb209bb8166a09caf9bd243925f6f0ce', 1, 1, 'authToken', '[]', 0, '2022-01-18 07:40:48', '2022-01-18 07:40:48', '2023-01-18 08:40:48'),
('b166c303917372edbe36bc1d68f78bc2dd590dd3aa709b5a7c5a88b1a0653d3463b650e65a81557c', 1, 1, 'authToken', '[]', 0, '2022-01-10 16:57:48', '2022-01-10 16:57:48', '2023-01-10 17:57:48'),
('b493a3a3e45a81deb4f5b70da1ea14c1a9fd071db88fbf4455bf1904bdb895bd69d21a378d0bac8a', 1, 1, 'authToken', '[]', 0, '2022-01-22 10:37:11', '2022-01-22 10:37:11', '2023-01-22 11:37:11'),
('b63d45a95579620351b91429bb30759e3e4952d40682797ed328c6116603922bfd06f58edcc05a33', 1, 1, 'authToken', '[]', 0, '2022-01-30 16:48:25', '2022-01-30 16:48:25', '2023-01-30 17:48:25'),
('b7a1fc85678a9b814b39382823901c5b231f4588568d3803c950565b981cb4c43d8b702c7fb52c35', 1, 1, 'authToken', '[]', 0, '2022-01-25 07:33:08', '2022-01-25 07:33:08', '2023-01-25 08:33:08'),
('b877fd5e5a935470f2ddbe550802b0d94b01a8f7d1ba6077e3682addb25dafe84a5dda7fe2a609c1', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:31:55', '2022-01-11 06:31:55', '2023-01-11 07:31:55'),
('bc97f052d4929da428e020768e43f5ff2f2f04418f75f21014f03a51ed5025e88a42a1050be9d160', 1, 1, 'authToken', '[]', 0, '2022-01-11 05:39:35', '2022-01-11 05:39:35', '2023-01-11 06:39:35'),
('c6106bf1b09845e4a0c2332b64d24250d6053ad55710d4abbea46742555e6987b78d8b7045053305', 1, 1, 'authToken', '[]', 0, '2022-01-10 17:00:57', '2022-01-10 17:00:57', '2023-01-10 18:00:57'),
('c61fc5011ca8eb70f2fd3240bdc4ffa3bfc8940c89a4cc2c9ce49d86eed650db07454a2cceacd938', 1, 1, 'authToken', '[]', 0, '2022-01-17 05:50:13', '2022-01-17 05:50:13', '2023-01-17 06:50:13'),
('caecb818975963bf22fdf0d82c62ee487930ab2264720dd45a18823c58561800aadeeb8577af8339', 1, 1, 'authToken', '[]', 0, '2022-01-10 13:13:18', '2022-01-10 13:13:18', '2023-01-10 14:13:18'),
('ccf51321cb681df6d313fdbb5873ffa903063b1c199391f049710f9d8f607f56576a13001cc2d94c', 1, 1, 'authToken', '[]', 0, '2022-01-20 12:42:52', '2022-01-20 12:42:52', '2023-01-20 13:42:52'),
('d1ced00c78b1172ba9bb25b153b308b2882dfe441b6d8d8759acde42f39ab8b08926eecbeca6b54b', 1, 1, 'authToken', '[]', 0, '2022-01-11 06:35:56', '2022-01-11 06:35:56', '2023-01-11 07:35:56'),
('dbb626791cbfac3330e3b438e1d44ae87fd246c53dcd6bf6b06e52ba139f677a08b48ce883008351', 1, 1, 'authToken', '[]', 0, '2022-01-11 07:08:54', '2022-01-11 07:08:54', '2023-01-11 08:08:54'),
('df1d0747dd33a35170b330261936e4530fbf485ccfbe29ebabf1374c2700e4c59a7192a00fcc5f2e', 1, 1, 'authToken', '[]', 0, '2021-12-03 10:25:40', '2021-12-03 10:25:40', '2022-12-03 11:25:40'),
('e1ba5f140593c587d508b269896c31229895cba865027b46f3e098e004518f271442078d6202ee17', 1, 1, 'authToken', '[]', 0, '2022-01-25 20:27:06', '2022-01-25 20:27:06', '2023-01-25 21:27:06'),
('e5638d24744d82b11322c605220664301cda9698ddc741ef3bbbe7d3c12dfd66868e8e3345192634', 1, 1, 'authToken', '[]', 0, '2022-01-13 16:53:55', '2022-01-13 16:53:55', '2023-01-13 17:53:55'),
('e729ecebc1724382f2c4736c431e83a7539e79f3d9803ccaddb85c27bd5dea13b82f6c230027153a', 1, 1, 'authToken', '[]', 0, '2022-01-10 17:13:43', '2022-01-10 17:13:43', '2023-01-10 18:13:43'),
('ecdaaf80cd8bcb2a6f5b77ab99e9f274991f630a9042a6f0ba0ea0b1e3b19e86b91b839b0a2030a5', 1, 1, 'authToken', '[]', 0, '2022-01-10 13:32:49', '2022-01-10 13:32:49', '2023-01-10 14:32:49'),
('ed157d3c724ef0d2a8377a077b769e058521da9f2add7efd88945512ea2d07c2a86c4c5044304cdf', 1, 1, 'authToken', '[]', 0, '2022-01-13 06:00:03', '2022-01-13 06:00:03', '2023-01-13 07:00:03'),
('ede5d219377020d456ef1b90c360207698f38222e34cd094795705e1ffabc57be7f2589747f5c154', 1, 1, 'authToken', '[]', 0, '2022-01-31 09:29:03', '2022-01-31 09:29:03', '2023-01-31 10:29:03'),
('f0ad7eeba363b50968c93831bee449f33af385c8558514ffcec729d2cd07dde257782cc70247ad99', 1, 1, 'authToken', '[]', 0, '2022-01-06 08:21:51', '2022-01-06 08:21:51', '2023-01-06 09:21:51'),
('f657673271d7f4b7825ae58f695d57567ba2dc132dea6b5f3a265567fff3e0b7ced6d502c8e8cf67', 1, 1, 'authToken', '[]', 0, '2022-01-11 13:23:08', '2022-01-11 13:23:08', '2023-01-11 14:23:08'),
('f8246cfedc66a439376debf3439c042f3099d15fb171db62d8533489b45f36f55907ec132b6a513b', 1, 1, 'authToken', '[]', 0, '2022-02-01 06:10:23', '2022-02-01 06:10:23', '2023-02-01 07:10:23'),
('fbed963da3a86445c0bbcd9864db7ba957e308e61760b322a1cc0035494e08f11b17ded570a811a9', 1, 1, 'authToken', '[]', 0, '2022-01-24 13:44:50', '2022-01-24 13:44:50', '2023-01-24 14:44:50'),
('fc47a592e59529284fcd0864c6b09044c5a6f74a9622203094e1050b1974496379a4d1127df20337', 1, 1, 'authToken', '[]', 0, '2022-01-29 15:26:29', '2022-01-29 15:26:29', '2023-01-29 16:26:29'),
('ff1147ba0f53cb9f34df5d2bbabe7a99e1b4ba505823718c09f478599f7c7c12891834dc8dd6b7ad', 1, 1, 'authToken', '[]', 0, '2021-12-03 13:59:50', '2021-12-03 13:59:50', '2022-12-03 14:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '1COs7NNOwkmK3hQwoxDGH2XM1JPH26ijKxdlCexT', NULL, 'http://localhost', 1, 0, 0, '2021-12-03 10:05:33', '2021-12-03 10:05:33'),
(2, NULL, 'Laravel Password Grant Client', 'cEneuRaAhQEFPpNciGkG15LTNV5WShzUazo494WE', 'users', 'http://localhost', 0, 1, 0, '2021-12-03 10:05:33', '2021-12-03 10:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-03 10:05:33', '2021-12-03 10:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  `fee_index` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `school_id`, `term_id`, `fee_id`, `fee_index`, `class_id`, `student_id`, `amount`, `discount`, `total`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 14, 2, 21411, 5, 11, 1500, 20, 1480, 1, '2022-01-22 10:59:39', '2022-01-22 11:11:02'),
(2, 1, 14, 1, 1148, 4, 8, 5000, 115, 4885, 1, '2022-01-22 11:11:21', '2022-01-22 11:13:37'),
(3, 1, 14, 1, 11410, 4, 10, 5000, 250, 4750, 1, '2022-01-22 11:11:22', '2022-01-22 11:14:09'),
(4, 1, 14, 1, 11415, 4, 15, 5000, 125, 4875, 1, '2022-01-22 11:11:22', '2022-01-22 11:13:37'),
(5, 1, 14, 1, 11417, 4, 17, 5000, 100, 4900, 1, '2022-01-22 11:11:22', '2022-01-22 11:13:37'),
(6, 1, 14, 1, 1141, 1, 1, 1500, 0, -1500, 1, '2022-01-22 12:10:09', '2022-01-22 12:10:09'),
(7, 1, 14, 1, 1143, 1, 3, 1500, 0, -1500, 1, '2022-01-22 12:10:10', '2022-01-22 12:10:10'),
(8, 1, 14, 1, 1144, 1, 4, 1500, 0, -1500, 1, '2022-01-22 12:10:10', '2022-01-22 12:10:10'),
(9, 1, 14, 1, 1145, 1, 5, 1500, 0, -1500, 1, '2022-01-22 12:10:10', '2022-01-22 12:10:10'),
(10, 1, 14, 1, 1147, 1, 7, 1500, 0, -1500, 1, '2022-01-22 12:10:10', '2022-01-22 12:10:10'),
(11, 1, 14, 2, 2141, 1, 1, 5000, 0, -5000, 1, '2022-01-29 09:55:33', '2022-01-29 09:55:33'),
(12, 1, 14, 2, 2143, 1, 3, 5000, 0, -5000, 1, '2022-01-29 09:55:33', '2022-01-29 09:55:33'),
(13, 1, 14, 2, 2144, 1, 4, 5000, 0, -5000, 1, '2022-01-29 09:55:33', '2022-01-29 09:55:33'),
(14, 1, 14, 2, 2145, 1, 5, 5000, 0, -5000, 1, '2022-01-29 09:55:33', '2022-01-29 09:55:33'),
(15, 1, 14, 2, 2147, 1, 7, 5000, 0, -5000, 1, '2022-01-29 09:55:33', '2022-01-29 09:55:33'),
(16, 1, 14, 3, 3141, 1, 1, 2000, 0, -2000, 1, '2022-01-29 09:55:56', '2022-01-29 09:55:56'),
(17, 1, 14, 3, 3143, 1, 3, 2000, 0, -2000, 1, '2022-01-29 09:55:57', '2022-01-29 09:55:57'),
(18, 1, 14, 3, 3144, 1, 4, 2000, 0, -2000, 1, '2022-01-29 09:55:57', '2022-01-29 09:55:57'),
(19, 1, 14, 3, 3145, 1, 5, 2000, 0, -2000, 1, '2022-01-29 09:55:57', '2022-01-29 09:55:57'),
(20, 1, 14, 3, 3147, 1, 7, 2000, 0, -2000, 1, '2022-01-29 09:55:57', '2022-01-29 09:55:57'),
(21, 1, 15, 1, 1151, 1, 1, 7555, 0, -7555, 1, '2022-01-29 10:17:37', '2022-01-29 10:17:37'),
(22, 1, 15, 1, 1153, 1, 3, 7555, 0, -7555, 1, '2022-01-29 10:17:37', '2022-01-29 10:17:37'),
(23, 1, 15, 1, 1154, 1, 4, 7555, 0, -7555, 1, '2022-01-29 10:17:37', '2022-01-29 10:17:37'),
(24, 1, 15, 1, 1155, 1, 5, 7555, 0, -7555, 1, '2022-01-29 10:17:37', '2022-01-29 10:17:37'),
(25, 1, 15, 1, 1157, 1, 7, 7555, 0, -7555, 1, '2022-01-29 10:17:38', '2022-01-29 10:17:38'),
(26, 1, 15, 3, 3151, 1, 1, 12750, 0, -12750, 1, '2022-01-29 10:17:58', '2022-01-29 10:17:58'),
(27, 1, 15, 3, 3153, 1, 3, 12750, 0, -12750, 1, '2022-01-29 10:17:58', '2022-01-29 10:17:58'),
(28, 1, 15, 3, 3154, 1, 4, 12750, 0, -12750, 1, '2022-01-29 10:17:58', '2022-01-29 10:17:58'),
(29, 1, 15, 3, 3155, 1, 5, 12750, 0, -12750, 1, '2022-01-29 10:17:58', '2022-01-29 10:17:58'),
(30, 1, 15, 3, 3157, 1, 7, 12750, 0, -12750, 1, '2022-01-29 10:17:58', '2022-01-29 10:17:58'),
(33, 1, 15, 0, 100336, 1, 3, 0, 0, 1000, 5, '2022-01-29 16:31:52', '2022-01-29 16:31:52'),
(34, 1, 15, 0, 105755, 1, 3, 0, 0, 1750, 5, '2022-01-29 16:33:39', '2022-01-29 16:33:39'),
(35, 1, 15, 0, 104476, 1, 3, 0, 0, 105, 5, '2022-01-30 16:54:00', '2022-01-30 16:54:00'),
(36, 1, 15, 0, 110427, 1, 3, 0, 0, 450, 5, '2022-01-30 16:54:32', '2022-01-30 16:54:32'),
(37, 1, 15, 0, 102353, 1, 3, 0, 0, 500, 5, '2022-01-30 16:56:50', '2022-01-30 16:56:50'),
(38, 1, 15, 3, 110016, 1, 3, 0, 0, 250, 5, '2022-01-31 06:28:59', '2022-01-31 06:28:59'),
(39, 1, 15, 1, 103852, 1, 3, 0, 0, 700, 5, '2022-01-31 08:46:04', '2022-01-31 08:46:04'),
(40, 1, 15, 3, 102164, 1, 3, 0, 0, 255, 5, '2022-02-01 06:21:09', '2022-02-01 06:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `student` int(11) NOT NULL DEFAULT 0,
  `bill` int(11) NOT NULL DEFAULT 0,
  `sms` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `user_id`, `student`, `bill`, `sms`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '2021-12-03 12:58:18', '2021-12-03 12:58:18'),
(2, 2, 1, 1, 1, '2021-12-06 09:17:45', '2021-12-06 09:17:45'),
(3, 4, 1, 1, 1, '2021-12-21 07:26:53', '2021-12-21 07:26:53'),
(4, 5, 1, 1, 1, '2021-12-21 07:32:37', '2021-12-21 07:32:37'),
(6, 15, 1, 1, 1, '2022-01-10 16:50:11', '2022-01-10 16:50:11'),
(7, 16, 1, 1, 1, '2022-01-10 16:53:47', '2022-01-10 16:53:47'),
(8, 17, 1, 1, 1, '2022-01-10 16:55:31', '2022-01-10 16:55:31'),
(9, 18, 1, 1, 1, '2022-01-13 08:27:25', '2022-01-13 08:27:25'),
(10, 19, 1, 1, 1, '2022-01-13 08:27:25', '2022-01-13 08:27:25'),
(11, 20, 1, 1, 1, '2022-01-13 08:30:07', '2022-01-13 08:30:07'),
(12, 21, 1, 1, 1, '2022-01-13 08:30:07', '2022-01-13 08:30:07'),
(13, 22, 1, 1, 1, '2022-01-13 08:30:07', '2022-01-13 08:30:07'),
(14, 23, 1, 1, 1, '2022-01-13 08:30:07', '2022-01-13 08:30:07'),
(15, 24, 1, 1, 1, '2022-01-13 08:30:08', '2022-01-13 08:30:08'),
(16, 25, 1, 1, 1, '2022-01-13 08:30:08', '2022-01-13 08:30:08'),
(17, 26, 1, 1, 1, '2022-01-13 08:30:08', '2022-01-13 08:30:08'),
(18, 27, 1, 1, 1, '2022-01-13 08:30:09', '2022-01-13 08:30:09'),
(19, 28, 1, 1, 1, '2022-01-13 08:30:09', '2022-01-13 08:30:09'),
(20, 29, 1, 1, 1, '2022-01-13 08:30:09', '2022-01-13 08:30:09'),
(21, 30, 1, 1, 1, '2022-01-13 08:30:09', '2022-01-13 08:30:09'),
(22, 31, 1, 1, 1, '2022-01-13 08:30:09', '2022-01-13 08:30:09'),
(23, 32, 1, 1, 1, '2022-01-13 08:30:09', '2022-01-13 08:30:09'),
(24, 33, 1, 1, 1, '2022-01-13 08:30:09', '2022-01-13 08:30:09'),
(25, 34, 1, 1, 1, '2022-01-13 08:30:10', '2022-01-13 08:30:10'),
(26, 35, 1, 1, 1, '2022-01-13 08:30:10', '2022-01-13 08:30:10'),
(27, 36, 1, 1, 1, '2022-01-13 08:30:10', '2022-01-13 08:30:10'),
(28, 37, 1, 1, 1, '2022-01-13 08:30:10', '2022-01-13 08:30:10'),
(29, 38, 1, 1, 1, '2022-01-13 08:30:10', '2022-01-13 08:30:10'),
(30, 39, 1, 1, 1, '2022-01-13 08:30:10', '2022-01-13 08:30:10'),
(31, 40, 1, 1, 1, '2022-01-13 08:30:11', '2022-01-13 08:30:11'),
(32, 41, 1, 1, 1, '2022-01-13 08:30:11', '2022-01-13 08:30:11'),
(33, 42, 1, 1, 1, '2022-01-13 08:30:12', '2022-01-13 08:30:12'),
(34, 43, 1, 1, 1, '2022-01-13 08:30:12', '2022-01-13 08:30:12'),
(35, 44, 1, 1, 1, '2022-01-13 08:30:12', '2022-01-13 08:30:12'),
(36, 45, 1, 1, 1, '2022-01-13 08:30:12', '2022-01-13 08:30:12'),
(37, 46, 1, 1, 1, '2022-01-13 08:30:12', '2022-01-13 08:30:12'),
(38, 47, 1, 1, 1, '2022-01-13 08:30:13', '2022-01-13 08:30:13'),
(39, 48, 1, 1, 1, '2022-01-13 08:30:13', '2022-01-13 08:30:13'),
(40, 49, 1, 1, 1, '2022-01-13 08:30:13', '2022-01-13 08:30:13'),
(41, 50, 1, 1, 1, '2022-01-13 08:30:13', '2022-01-13 08:30:13'),
(42, 51, 1, 1, 1, '2022-01-13 08:30:13', '2022-01-13 08:30:13'),
(43, 52, 1, 1, 1, '2022-01-13 08:30:13', '2022-01-13 08:30:13'),
(44, 53, 1, 1, 1, '2022-01-13 08:30:14', '2022-01-13 08:30:14'),
(45, 54, 1, 1, 1, '2022-01-13 08:30:14', '2022-01-13 08:30:14'),
(46, 55, 1, 1, 1, '2022-01-13 08:30:14', '2022-01-13 08:30:14'),
(47, 56, 1, 1, 1, '2022-01-13 08:30:14', '2022-01-13 08:30:14'),
(48, 57, 1, 1, 1, '2022-01-13 08:30:14', '2022-01-13 08:30:14'),
(49, 58, 1, 1, 1, '2022-01-13 08:30:14', '2022-01-13 08:30:14'),
(50, 59, 1, 1, 1, '2022-01-13 08:30:15', '2022-01-13 08:30:15'),
(51, 60, 1, 1, 1, '2022-01-13 08:30:15', '2022-01-13 08:30:15'),
(52, 61, 1, 1, 1, '2022-01-13 08:30:15', '2022-01-13 08:30:15'),
(53, 62, 1, 1, 1, '2022-01-13 08:30:15', '2022-01-13 08:30:15'),
(54, 63, 1, 1, 1, '2022-01-13 08:30:15', '2022-01-13 08:30:15'),
(55, 64, 1, 1, 1, '2022-01-13 08:30:15', '2022-01-13 08:30:15'),
(56, 65, 1, 1, 1, '2022-01-13 08:30:15', '2022-01-13 08:30:15'),
(57, 66, 1, 1, 1, '2022-01-13 08:30:16', '2022-01-13 08:30:16'),
(58, 67, 1, 1, 1, '2022-01-13 08:30:16', '2022-01-13 08:30:16'),
(59, 68, 1, 1, 1, '2022-01-13 08:30:16', '2022-01-13 08:30:16'),
(60, 69, 1, 1, 1, '2022-01-13 08:30:16', '2022-01-13 08:30:16'),
(61, 70, 1, 1, 1, '2022-01-13 08:30:16', '2022-01-13 08:30:16'),
(62, 71, 1, 1, 1, '2022-01-13 08:31:21', '2022-01-13 08:31:21'),
(63, 72, 1, 1, 1, '2022-01-13 08:31:21', '2022-01-13 08:31:21'),
(64, 73, 1, 1, 1, '2022-01-13 08:31:21', '2022-01-13 08:31:21'),
(65, 74, 1, 1, 1, '2022-01-13 08:31:21', '2022-01-13 08:31:21'),
(66, 75, 1, 1, 1, '2022-01-13 08:31:21', '2022-01-13 08:31:21'),
(67, 76, 1, 1, 1, '2022-01-13 08:31:22', '2022-01-13 08:31:22'),
(68, 77, 1, 1, 1, '2022-01-13 08:31:22', '2022-01-13 08:31:22'),
(69, 78, 1, 1, 1, '2022-01-13 08:31:22', '2022-01-13 08:31:22'),
(70, 79, 1, 1, 1, '2022-01-13 08:31:22', '2022-01-13 08:31:22'),
(71, 80, 1, 1, 1, '2022-01-13 08:31:22', '2022-01-13 08:31:22'),
(72, 81, 1, 1, 1, '2022-01-13 08:31:22', '2022-01-13 08:31:22'),
(73, 82, 1, 1, 1, '2022-01-13 08:31:23', '2022-01-13 08:31:23'),
(74, 83, 1, 1, 1, '2022-01-13 08:31:23', '2022-01-13 08:31:23'),
(75, 84, 1, 1, 1, '2022-01-13 08:31:23', '2022-01-13 08:31:23'),
(76, 85, 1, 1, 1, '2022-01-13 08:31:23', '2022-01-13 08:31:23'),
(77, 86, 1, 1, 1, '2022-01-13 08:31:24', '2022-01-13 08:31:24'),
(78, 87, 1, 1, 1, '2022-01-13 08:31:24', '2022-01-13 08:31:24'),
(79, 88, 1, 1, 1, '2022-01-13 08:31:24', '2022-01-13 08:31:24'),
(80, 89, 1, 1, 1, '2022-01-13 08:31:24', '2022-01-13 08:31:24'),
(81, 90, 1, 1, 1, '2022-01-13 08:31:25', '2022-01-13 08:31:25'),
(82, 91, 1, 1, 1, '2022-01-13 08:31:25', '2022-01-13 08:31:25'),
(83, 92, 1, 1, 1, '2022-01-13 08:31:25', '2022-01-13 08:31:25'),
(84, 93, 1, 1, 1, '2022-01-13 08:31:25', '2022-01-13 08:31:25'),
(85, 94, 1, 1, 1, '2022-01-13 08:31:25', '2022-01-13 08:31:25'),
(86, 95, 1, 1, 1, '2022-01-13 08:31:25', '2022-01-13 08:31:25'),
(87, 96, 1, 1, 1, '2022-01-13 08:31:26', '2022-01-13 08:31:26'),
(88, 97, 1, 1, 1, '2022-01-13 08:31:26', '2022-01-13 08:31:26'),
(89, 98, 1, 1, 1, '2022-01-13 08:31:26', '2022-01-13 08:31:26'),
(90, 99, 1, 1, 1, '2022-01-13 08:31:26', '2022-01-13 08:31:26'),
(91, 100, 1, 1, 1, '2022-01-13 08:31:26', '2022-01-13 08:31:26'),
(92, 101, 1, 1, 1, '2022-01-13 08:31:26', '2022-01-13 08:31:26'),
(93, 102, 1, 1, 1, '2022-01-13 08:31:27', '2022-01-13 08:31:27'),
(94, 103, 1, 1, 1, '2022-01-13 08:31:27', '2022-01-13 08:31:27'),
(95, 104, 1, 1, 1, '2022-01-13 08:31:27', '2022-01-13 08:31:27'),
(96, 105, 1, 1, 1, '2022-01-13 08:31:27', '2022-01-13 08:31:27'),
(97, 106, 1, 1, 1, '2022-01-13 08:31:27', '2022-01-13 08:31:27'),
(98, 107, 1, 1, 1, '2022-01-13 08:31:27', '2022-01-13 08:31:27'),
(99, 108, 1, 1, 1, '2022-01-13 08:31:28', '2022-01-13 08:31:28'),
(100, 109, 1, 1, 1, '2022-01-13 08:31:28', '2022-01-13 08:31:28'),
(101, 110, 1, 1, 1, '2022-01-13 08:31:28', '2022-01-13 08:31:28'),
(102, 111, 1, 1, 1, '2022-01-13 08:31:28', '2022-01-13 08:31:28'),
(103, 112, 1, 1, 1, '2022-01-13 08:31:28', '2022-01-13 08:31:28'),
(104, 113, 1, 1, 1, '2022-01-13 08:31:29', '2022-01-13 08:31:29'),
(105, 114, 1, 1, 1, '2022-01-13 08:31:29', '2022-01-13 08:31:29'),
(106, 115, 1, 1, 1, '2022-01-13 08:31:29', '2022-01-13 08:31:29'),
(107, 116, 1, 1, 1, '2022-01-13 08:31:29', '2022-01-13 08:31:29'),
(108, 117, 1, 1, 1, '2022-01-13 08:31:30', '2022-01-13 08:31:30'),
(109, 118, 1, 1, 1, '2022-01-13 08:31:30', '2022-01-13 08:31:30'),
(110, 119, 1, 1, 1, '2022-01-13 08:31:30', '2022-01-13 08:31:30'),
(111, 120, 1, 1, 1, '2022-01-13 08:31:30', '2022-01-13 08:31:30'),
(112, 121, 1, 1, 1, '2022-01-13 08:31:30', '2022-01-13 08:31:30'),
(113, 122, 1, 1, 1, '2022-01-13 08:31:37', '2022-01-13 08:31:37'),
(114, 123, 1, 1, 1, '2022-01-13 08:31:37', '2022-01-13 08:31:37'),
(115, 124, 1, 1, 1, '2022-01-13 08:31:37', '2022-01-13 08:31:37'),
(116, 125, 1, 1, 1, '2022-01-13 08:31:37', '2022-01-13 08:31:37'),
(117, 126, 1, 1, 1, '2022-01-13 08:31:38', '2022-01-13 08:31:38'),
(118, 127, 1, 1, 1, '2022-01-13 08:31:38', '2022-01-13 08:31:38'),
(119, 128, 1, 1, 1, '2022-01-13 08:31:38', '2022-01-13 08:31:38'),
(120, 129, 1, 1, 1, '2022-01-13 08:31:38', '2022-01-13 08:31:38'),
(121, 130, 1, 1, 1, '2022-01-13 08:31:38', '2022-01-13 08:31:38'),
(122, 131, 1, 1, 1, '2022-01-13 08:31:38', '2022-01-13 08:31:38'),
(123, 132, 1, 1, 1, '2022-01-13 08:31:39', '2022-01-13 08:31:39'),
(124, 133, 1, 1, 1, '2022-01-13 08:31:39', '2022-01-13 08:31:39'),
(125, 134, 1, 1, 1, '2022-01-13 08:31:39', '2022-01-13 08:31:39'),
(126, 135, 1, 1, 1, '2022-01-13 08:31:39', '2022-01-13 08:31:39'),
(127, 136, 1, 1, 1, '2022-01-13 08:31:39', '2022-01-13 08:31:39'),
(128, 137, 1, 1, 1, '2022-01-13 08:31:39', '2022-01-13 08:31:39'),
(129, 138, 1, 1, 1, '2022-01-13 08:31:39', '2022-01-13 08:31:39'),
(130, 139, 1, 1, 1, '2022-01-13 08:31:40', '2022-01-13 08:31:40'),
(131, 140, 1, 1, 1, '2022-01-13 08:31:40', '2022-01-13 08:31:40'),
(132, 141, 1, 1, 1, '2022-01-13 08:31:40', '2022-01-13 08:31:40'),
(133, 142, 1, 1, 1, '2022-01-13 08:31:40', '2022-01-13 08:31:40'),
(134, 143, 1, 1, 1, '2022-01-13 08:31:40', '2022-01-13 08:31:40'),
(135, 144, 1, 1, 1, '2022-01-13 08:31:40', '2022-01-13 08:31:40'),
(136, 145, 1, 1, 1, '2022-01-13 08:31:41', '2022-01-13 08:31:41'),
(137, 146, 1, 1, 1, '2022-01-13 08:31:41', '2022-01-13 08:31:41'),
(138, 147, 1, 1, 1, '2022-01-13 08:31:41', '2022-01-13 08:31:41'),
(139, 148, 1, 1, 1, '2022-01-13 08:31:41', '2022-01-13 08:31:41'),
(140, 149, 1, 1, 1, '2022-01-13 08:31:41', '2022-01-13 08:31:41'),
(141, 150, 1, 1, 1, '2022-01-13 08:31:42', '2022-01-13 08:31:42'),
(142, 151, 1, 1, 1, '2022-01-13 08:31:42', '2022-01-13 08:31:42'),
(143, 152, 1, 1, 1, '2022-01-13 08:31:42', '2022-01-13 08:31:42'),
(144, 153, 1, 1, 1, '2022-01-13 08:31:42', '2022-01-13 08:31:42'),
(145, 154, 1, 1, 1, '2022-01-13 08:31:42', '2022-01-13 08:31:42'),
(146, 155, 1, 1, 1, '2022-01-13 08:31:42', '2022-01-13 08:31:42'),
(147, 156, 1, 1, 1, '2022-01-13 08:31:42', '2022-01-13 08:31:42'),
(148, 157, 1, 1, 1, '2022-01-13 08:31:43', '2022-01-13 08:31:43'),
(149, 158, 1, 1, 1, '2022-01-13 08:31:43', '2022-01-13 08:31:43'),
(150, 159, 1, 1, 1, '2022-01-13 08:31:43', '2022-01-13 08:31:43'),
(151, 160, 1, 1, 1, '2022-01-13 08:31:43', '2022-01-13 08:31:43'),
(152, 161, 1, 1, 1, '2022-01-13 08:31:43', '2022-01-13 08:31:43'),
(153, 162, 1, 1, 1, '2022-01-13 08:31:43', '2022-01-13 08:31:43'),
(154, 163, 1, 1, 1, '2022-01-13 08:31:44', '2022-01-13 08:31:44'),
(155, 164, 1, 1, 1, '2022-01-13 08:31:44', '2022-01-13 08:31:44'),
(156, 165, 1, 1, 1, '2022-01-13 08:31:44', '2022-01-13 08:31:44'),
(157, 166, 1, 1, 1, '2022-01-13 08:31:44', '2022-01-13 08:31:44'),
(158, 167, 1, 1, 1, '2022-01-13 08:31:44', '2022-01-13 08:31:44'),
(159, 168, 1, 1, 1, '2022-01-13 08:31:45', '2022-01-13 08:31:45'),
(160, 169, 1, 1, 1, '2022-01-13 08:31:45', '2022-01-13 08:31:45'),
(161, 170, 1, 1, 1, '2022-01-13 08:31:45', '2022-01-13 08:31:45'),
(162, 171, 1, 1, 1, '2022-01-13 08:31:45', '2022-01-13 08:31:45'),
(163, 172, 1, 1, 1, '2022-01-13 08:31:45', '2022-01-13 08:31:45'),
(164, 173, 1, 1, 1, '2022-01-13 08:38:22', '2022-01-13 08:38:22'),
(165, 174, 1, 1, 1, '2022-01-13 08:38:22', '2022-01-13 08:38:22'),
(166, 175, 1, 1, 1, '2022-01-13 08:38:22', '2022-01-13 08:38:22'),
(167, 176, 1, 1, 1, '2022-01-13 08:38:23', '2022-01-13 08:38:23'),
(168, 177, 1, 1, 1, '2022-01-13 08:38:23', '2022-01-13 08:38:23'),
(169, 178, 1, 1, 1, '2022-01-13 08:38:23', '2022-01-13 08:38:23'),
(170, 179, 1, 1, 1, '2022-01-13 08:38:23', '2022-01-13 08:38:23'),
(171, 180, 1, 1, 1, '2022-01-13 08:38:24', '2022-01-13 08:38:24'),
(172, 181, 1, 1, 1, '2022-01-13 08:38:24', '2022-01-13 08:38:24'),
(173, 182, 1, 1, 1, '2022-01-13 08:38:24', '2022-01-13 08:38:24'),
(174, 183, 1, 1, 1, '2022-01-13 08:38:24', '2022-01-13 08:38:24'),
(175, 184, 1, 1, 1, '2022-01-13 08:38:25', '2022-01-13 08:38:25'),
(176, 185, 1, 1, 1, '2022-01-13 08:38:25', '2022-01-13 08:38:25'),
(177, 186, 1, 1, 1, '2022-01-13 08:38:25', '2022-01-13 08:38:25'),
(178, 187, 1, 1, 1, '2022-01-13 08:38:25', '2022-01-13 08:38:25'),
(179, 188, 1, 1, 1, '2022-01-13 08:38:25', '2022-01-13 08:38:25'),
(180, 189, 1, 1, 1, '2022-01-13 08:38:26', '2022-01-13 08:38:26'),
(181, 190, 1, 1, 1, '2022-01-13 08:38:26', '2022-01-13 08:38:26'),
(182, 191, 1, 1, 1, '2022-01-13 08:38:26', '2022-01-13 08:38:26'),
(183, 192, 1, 1, 1, '2022-01-13 08:38:26', '2022-01-13 08:38:26'),
(184, 193, 1, 1, 1, '2022-01-13 08:38:26', '2022-01-13 08:38:26'),
(185, 194, 1, 1, 1, '2022-01-13 08:38:26', '2022-01-13 08:38:26'),
(186, 195, 1, 1, 1, '2022-01-13 08:38:27', '2022-01-13 08:38:27'),
(187, 196, 1, 1, 1, '2022-01-13 08:38:27', '2022-01-13 08:38:27'),
(188, 197, 1, 1, 1, '2022-01-13 08:38:27', '2022-01-13 08:38:27'),
(189, 198, 1, 1, 1, '2022-01-13 08:38:27', '2022-01-13 08:38:27'),
(190, 199, 1, 1, 1, '2022-01-13 08:38:27', '2022-01-13 08:38:27'),
(191, 200, 1, 1, 1, '2022-01-13 08:38:28', '2022-01-13 08:38:28'),
(192, 201, 1, 1, 1, '2022-01-13 08:38:28', '2022-01-13 08:38:28'),
(193, 202, 1, 1, 1, '2022-01-13 08:38:28', '2022-01-13 08:38:28'),
(194, 203, 1, 1, 1, '2022-01-13 08:38:28', '2022-01-13 08:38:28'),
(195, 204, 1, 1, 1, '2022-01-13 08:38:28', '2022-01-13 08:38:28'),
(196, 205, 1, 1, 1, '2022-01-13 08:38:28', '2022-01-13 08:38:28'),
(197, 206, 1, 1, 1, '2022-01-13 08:38:28', '2022-01-13 08:38:28'),
(198, 207, 1, 1, 1, '2022-01-13 08:38:29', '2022-01-13 08:38:29'),
(199, 208, 1, 1, 1, '2022-01-13 08:38:29', '2022-01-13 08:38:29'),
(200, 209, 1, 1, 1, '2022-01-13 08:38:29', '2022-01-13 08:38:29'),
(201, 210, 1, 1, 1, '2022-01-13 08:38:29', '2022-01-13 08:38:29'),
(202, 211, 1, 1, 1, '2022-01-13 08:38:29', '2022-01-13 08:38:29'),
(203, 212, 1, 1, 1, '2022-01-13 08:38:30', '2022-01-13 08:38:30'),
(204, 213, 1, 1, 1, '2022-01-13 08:38:30', '2022-01-13 08:38:30'),
(205, 214, 1, 1, 1, '2022-01-13 08:38:30', '2022-01-13 08:38:30'),
(206, 215, 1, 1, 1, '2022-01-13 08:38:30', '2022-01-13 08:38:30'),
(207, 216, 1, 1, 1, '2022-01-13 08:38:31', '2022-01-13 08:38:31'),
(208, 217, 1, 1, 1, '2022-01-13 08:38:31', '2022-01-13 08:38:31'),
(209, 218, 1, 1, 1, '2022-01-13 08:38:31', '2022-01-13 08:38:31'),
(210, 219, 1, 1, 1, '2022-01-13 08:38:31', '2022-01-13 08:38:31'),
(211, 220, 1, 1, 1, '2022-01-13 08:38:31', '2022-01-13 08:38:31'),
(212, 221, 1, 1, 1, '2022-01-13 08:38:32', '2022-01-13 08:38:32'),
(213, 222, 1, 1, 1, '2022-01-13 08:38:32', '2022-01-13 08:38:32'),
(214, 223, 1, 1, 1, '2022-01-13 08:38:32', '2022-01-13 08:38:32'),
(215, 224, 1, 1, 1, '2022-01-13 13:14:01', '2022-01-13 13:14:01'),
(216, 225, 1, 1, 1, '2022-01-13 14:15:03', '2022-01-13 14:15:03'),
(217, 226, 1, 1, 1, '2022-01-13 14:16:07', '2022-01-13 14:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `result_index` int(11) NOT NULL,
  `t1` int(11) NOT NULL DEFAULT 0,
  `t2` int(11) NOT NULL DEFAULT 0,
  `t3` int(11) NOT NULL DEFAULT 0,
  `t4` int(11) NOT NULL DEFAULT 0,
  `exam` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_summaries`
--

CREATE TABLE `result_summaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `result_index` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `principal_remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locomotive` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'school.png',
  `bussiness_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `slug`, `name`, `email`, `phone`, `alternate_phone`, `address`, `website`, `motto`, `logo`, `bussiness_id`, `created_at`, `updated_at`) VALUES
(1, 'school-petal-vv20', 'School Petal vv2.0', 'school@schoolpetal.com', '2323232322323', '12323421', 'akure ondo city', 'www.schoolpetal.com', 'unity and fauth peace and prgress', 'assets/img/schools/3272122school-petal-vv20.png', '910994744364160596', '2021-12-03 12:58:18', '2021-12-06 08:58:14'),
(2, 'school-petal-international', 'School Petal International', 'school@schoolpetal.com', '09038772366', NULL, NULL, NULL, NULL, 'school.png', '504872235071792036', '2021-12-21 07:26:19', '2021-12-21 07:26:19'),
(3, 'school-petal-international', 'School Petal International', 'school1@schoolpetal.com', '090387723661', NULL, NULL, NULL, NULL, 'school.png', '470002676488915475', '2021-12-21 07:26:53', '2021-12-21 07:26:53'),
(4, 'school-petal-international', 'School Petal International', 'school1@schoolpetal.com', '090387723661', NULL, NULL, NULL, NULL, 'school.png', '466639325849582203', '2022-01-06 12:31:34', '2022-01-06 12:31:34'),
(9, 'mouse-pads', 'Mouse Pads', 'school@schoolpetal.com1', '73473742', NULL, NULL, NULL, NULL, 'school.png', '413360334940867617', '2022-01-10 15:18:47', '2022-01-10 15:18:47'),
(10, 'thomasonyemechi', 'thomasonyemechi', 'school@schoolpetal.com1', '09038772366', NULL, NULL, NULL, NULL, 'school.png', '922514037642792499', '2022-01-10 15:20:29', '2022-01-10 15:20:29'),
(11, 'thomasonyemechi', 'thomasonyemechi', 'school@schoolpetal.com1', '09038772366', NULL, NULL, NULL, NULL, 'school.png', '252010592341254497', '2022-01-10 15:24:04', '2022-01-10 15:24:04'),
(12, 'thomasonyemechi', 'thomasonyemechi', 'school@schoolpetal.com1', '09038772366', NULL, NULL, NULL, NULL, 'school.png', '68735004475764605', '2022-01-10 15:24:11', '2022-01-10 15:24:11'),
(13, 'thomasonyemechi', 'thomasonyemechi', 'school@schoolpetal.com3', '+2349038772366', NULL, NULL, NULL, NULL, 'school.png', '936867145254953787', '2022-01-10 16:50:10', '2022-01-10 16:50:10'),
(14, 'mouse-pads', 'Mouse Pads', 'school@schoolpetal.com6', '09038772366', NULL, NULL, NULL, NULL, 'school.png', '192697136620458460', '2022-01-10 16:53:47', '2022-01-10 16:53:47'),
(15, 'mouse-pads', 'Mouse Pads', 'school@schoolpetal.com5', '09038772366', NULL, NULL, NULL, NULL, 'school.png', '306659289364278982', '2022-01-10 16:55:31', '2022-01-10 16:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `session` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `school_id`, `session`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '2021/2022', 1, '2021-12-03 14:04:01', '2021-12-03 14:04:01'),
(2, 1, '2022/2023', 1, '2021-12-21 07:29:22', '2021-12-21 07:29:22'),
(5, 1, '2023/2024', 1, '2023-01-12 13:13:19', '2023-01-12 13:13:19');

-- --------------------------------------------------------

--
-- Table structure for table `set_subjects`
--

CREATE TABLE `set_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `guardian_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `arm_id` int(11) NOT NULL DEFAULT 0,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `othername` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/students/user.png',
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` int(11) NOT NULL,
  `others` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `school_id`, `guardian_id`, `class_id`, `arm_id`, `registration_number`, `surname`, `firstname`, `othername`, `photo`, `sex`, `username`, `password`, `pwd`, `others`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0, 'SCHOOL_131322_21', 'Thomas', 'Onyemechi', 'Gadafi', 'assets/img/students/user.png', 'Male', 'thomas2371', '$2y$10$quJs8U2erAfs2TqxUZFpveOcq37lWXIN4W18pRzo08PfFUTbjsuXO', 2371, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2021-12-08 11:38:41', '2021-12-08 11:38:41'),
(2, 1, 2, 1, 0, NULL, 'School', 'Student', NULL, 'assets/img/students/user.png', NULL, 'school1786', '$2y$10$wOuYKnRqj1j3eF51sRB7hunLYZWsDBjbN7F.AvEjuTc5gQ769nZjK', 1786, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 0, 1, '2021-12-21 07:50:10', '2021-12-21 07:50:10'),
(3, 1, 2, 1, 5, 'SCH_00123', 'Akintake', 'Samuel', 'Olufemiwa', 'assets/img/students/user.png', 'Male', 'school219', '$2y$10$qpn4WUs2qxwoUwIT5qWNDOmOn9qi4alPK53By5von.RVbXH8chhri', 6219, '{\"previous_school\":\"grad000\",\"reason_for_leaving\":null,\"blood_group\":\"O+\",\"genotype\":\"AA\",\"ailment\":\"noneuuu\",\"disability\":\"nonennn\"}', 1, 1, '2021-12-21 07:51:04', '2022-01-31 07:01:24'),
(4, 1, 1, 1, 0, 'SCHOOL_131322_21', 'Thomas', 'Onyemechi', 'Gadafi', 'assets/img/students/user.png', 'Male', 'thomas4736', '$2y$10$rUr05OGY/6VqMvwmmfKw5uWaaVhZK2J4.b0p3CuDZoFR6l.TDkzNC', 4736, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-06 08:27:29', '2022-01-06 08:27:29'),
(5, 1, 1, 1, 0, 'SCHOOL_131322_21', 'Thomas', 'Onyemechi', 'Gadafi', 'assets/img/students/user.png', 'Male', 'thomas1284', '$2y$10$mdlGFQ/wmDBXkqdCLQ8JuugHqIJWhhvMBiq0i2Q76mYDZ3kgV0n0K', 1284, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-06 12:30:59', '2022-01-06 12:30:59'),
(6, 1, 1, 1, 0, 'SCHOOL_131322_21', 'Thomas', 'Onyemechi', 'Gadafi', 'assets/img/students/user.png', 'Male', 'thomas5421', '$2y$10$AQ6EHrw2BrmIIEgCtJgXC.hGmB9trmWevKUSqkVtBoiyegQS3fAZq', 5421, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 0, 1, '2022-01-06 12:31:06', '2022-01-06 12:31:06'),
(7, 1, 3, 1, 0, '', 'Thomas', 'Gideon', NULL, 'assets/img/students/user.png', NULL, 'thomas5351', '$2y$10$KZoP/tXUOzhDoaMMEXLOR.aPmzbt93lCErnaDdeKB4UV09uhkwuEq', 5351, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-17 09:42:13', '2022-01-17 09:42:13'),
(8, 1, 1, 4, 0, '', 'Adefemim', 'seyeola', NULL, 'assets/img/students/user.png', NULL, 'adefemim1507', '$2y$10$1JjGlYoMauwS0vwvQgjVMONiK1QujQWVbE65kpLANvMX68LAyQ6LW', 1507, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-17 10:07:34', '2022-01-17 10:07:34'),
(9, 1, 1, 4, 0, '', 'Thomas', 'seyeola', NULL, 'assets/img/students/user.png', NULL, 'thomas4869', '$2y$10$Kvgr09.ahimxMmyw2g5q4eh/.RMt6GgMs0wMy7xJs2KnuSo./F8IG', 4869, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 0, 1, '2022-01-17 10:08:05', '2022-01-17 10:08:05'),
(10, 1, 1, 4, 4, '', 'Adefemim', 'Gideon', 'Sayo', 'assets/img/students/user.png', NULL, 'adefemim8321', '$2y$10$VJjPUhARQR98ocCMNOS2jOPjtCeqmCvPuvNsvfsT/kOnd.TpSNEXi', 8321, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-17 10:08:58', '2022-01-17 10:08:58'),
(11, 1, 1, 5, 3, 'SCH_00123', 'Two', 'seyeola', 'Sayo', 'assets/img/students/user.png', NULL, 'two1070', '$2y$10$qvRPI/SUb2NlRWychylYSuuDRGuk0bqdZQFG8e7MPy8QjftPF4oHe', 1070, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-17 10:11:11', '2022-01-17 10:11:11'),
(12, 1, 1, 6, 4, '', 'Adefemim', 'thomas onyemechi', 'Sayo', 'assets/img/students/user.png', 'Female', 'adefemim9345', '$2y$10$uIc0kKJYffKx7ngLtbN1IOtT4/4H9P6N1J0kIf.zu.cQXzttgo0FO', 9345, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-17 10:14:18', '2022-01-17 10:14:18'),
(13, 1, 3, 1, 5, 'SCH_00123', 'Thomas', 'Gideon', 'Sayo', 'assets/img/students/user.png', 'Male', 'thomas2118', '$2y$10$E0XG5CTqO4gOEiYBFOq57e1gFMBrC.2q6m4JU6whRpsJKcnfJSP9O', 2118, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 0, 1, '2022-01-17 10:21:24', '2022-01-17 10:21:24'),
(14, 1, 6, 6, 4, 'SCH_00123', 'Adefemim', 'Gideon', 'Sayo', 'assets/img/students/user.png', 'Male', 'adefemim1764', '$2y$10$C7ODLsi2Z5MA/gKHdEfomus79pOzb2qaDOMZiM0r3iEXrhoQGs1vu', 1764, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-17 10:22:11', '2022-01-17 10:22:11'),
(15, 1, 2, 4, 2, 'SCH_00123', 'Adefemim', 'Gideon', 'Sayo', 'assets/img/students/user.png', 'Male', 'adefemim6177', '$2y$10$QEnYxlVN/wjgRDifx7Xpfu0kqd5wh9dey341tLAa9G3TZiofQ1Pbm', 6177, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-17 10:23:21', '2022-01-17 10:23:21'),
(16, 1, 2, 4, 2, 'SCH_00123', 'thomas', 'ayomide', 'Sayo', 'assets/img/students/user.png', 'Female', 'thomas4211', '$2y$10$EBJg6Cpa2E0TkCbqnD2eW.p3sBNhMHrsGvcgYWy/YE9BvCzvNeIXO', 4211, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 0, 1, '2022-01-17 10:23:49', '2022-01-17 10:23:49'),
(17, 1, 5, 4, 5, 'SCH_00123', 'Thomas', 'seyeola', 'Sayo', 'assets/img/students/user.png', 'Female', 'thomas9236', '$2y$10$qhEoAGt6Z1j4TPN2jrT1A.7yijBecYsiTSiiq1hsJ4PUjqfSSS2Tu', 9236, '{\"previous_school\":\"null\",\"reason_for_leaving\":\"null\",\"blood_group\":\"null\",\"genotype\":\"null\",\"ailment\":\"null\",\"disability\":\"null\"}', 1, 1, '2022-01-17 10:24:55', '2022-01-17 10:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `school_id`, `subject`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mathematics', 1, '2022-01-12 12:37:11', '2022-01-12 12:37:11'),
(2, 1, 'English Language', 1, '2022-01-12 12:40:03', '2022-01-12 12:40:03'),
(3, 1, 'Chemistry', 1, '2022-01-12 12:40:51', '2022-01-12 12:40:51'),
(4, 1, 'Mathematics 101', 1, '2022-01-12 12:42:32', '2022-01-12 12:42:32'),
(5, 1, 'technical drawing', 1, '2022-01-12 12:42:57', '2022-01-12 12:42:57'),
(6, 1, 'biology', 1, '2022-01-12 12:50:30', '2022-01-12 12:50:30'),
(7, 1, 'Christian religious knowledge', 1, '2022-01-12 12:50:52', '2022-01-12 12:50:52'),
(8, 1, 'Computer science 1101', 1, '2022-01-12 12:52:59', '2022-01-12 13:09:21'),
(9, 1, 'Mathematics 1110', 1, '2022-01-12 12:57:03', '2022-01-12 13:09:14'),
(10, 1, 'Computer science', 1, '2022-01-12 13:09:52', '2022-01-12 13:09:52'),
(11, 1, 'Further Mathematics One', 1, '2022-01-12 13:10:12', '2022-01-12 13:10:20'),
(12, 1, 'English Language 101', 1, '2022-01-13 07:11:46', '2022-01-13 07:11:46'),
(13, 1, 'English Language 103', 1, '2022-01-13 07:11:55', '2022-01-13 07:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `term` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `close` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `school_id`, `session_id`, `term`, `year`, `close`, `resume`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2021, '2022-01-21', '2022-01-18', 0, '2021-12-03 14:04:01', '2022-01-29 10:45:00'),
(2, 1, 1, 2, 2022, '1/2/2021', '21/21/1222', 0, '2021-12-03 14:04:01', '2022-01-29 10:45:00'),
(3, 1, 1, 3, 2021, '2022-01-21', '2022-01-18', 0, '2021-12-03 14:04:01', '2022-01-29 10:45:00'),
(5, 1, 2, 1, 2022, '2022-01-27', '2022-01-03', 0, '2021-12-21 07:29:22', '2022-01-29 10:45:00'),
(6, 1, 2, 2, 2022, '2022-01-11', '2022-01-06', 0, '2021-12-21 07:29:22', '2022-01-29 10:45:00'),
(7, 1, 2, 3, 2022, '2022-01-11', '2022-01-21', 0, '2021-12-21 07:29:22', '2022-01-29 10:45:00'),
(11, 1, 4, 1, 2023, NULL, NULL, 0, '2023-01-12 13:12:21', '2023-01-12 13:12:21'),
(12, 1, 4, 2, 2023, NULL, NULL, 0, '2023-01-12 13:12:21', '2023-01-12 13:12:21'),
(13, 1, 4, 3, 2023, NULL, NULL, 0, '2023-01-12 13:12:22', '2023-01-12 13:12:22'),
(14, 1, 5, 1, 2023, '2022-01-11', '2022-01-22', 0, '2023-01-12 13:13:19', '2022-01-29 10:45:00'),
(15, 1, 5, 2, 2023, '2022-01-13', '2022-01-14', 1, '2023-01-12 13:13:20', '2022-01-29 10:45:00'),
(16, 1, 5, 3, 2023, '2022-01-03', '2022-01-28', 0, '2023-01-12 13:13:20', '2022-01-29 10:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` int(11) NOT NULL DEFAULT 0,
  `role` int(11) NOT NULL DEFAULT 0,
  `photo` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `school_id`, `role`, `photo`, `address`, `phone`, `email_verified_at`, `password`, `status`, `remember_token`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'School Petal', 'school@schoolpetal.com', 1, 10, NULL, NULL, '53996138868918014', NULL, '$2y$10$jLDCnDdoOK2FXtq72eRYnO9y7vjpLjDtx8.AKRhYxg/kY.XvabnXy', 1, NULL, 0, '2021-12-03 12:58:18', '2022-01-13 09:56:38'),
(2, 'Adminstrator School Petal', 'admin@schoolpetal.com', 1, 10, 'assets/img/users/4021465adminstrator-school-petal.jpg', NULL, '6765107274206676', NULL, '$2y$10$FlyYQcRd99te/CGtj3AshOU9YmChZlKgPI8WuibwMynKsEWOZNNoa', 0, NULL, 1, '2021-12-06 09:17:45', '2022-01-13 09:56:38'),
(4, 'School Petal', 'school1@schoolpetal.com', 1, 10, NULL, NULL, '35656455605352182', NULL, '$2y$10$0fEDWD/Bg82AiRi1KUKgM.hcChuj8473Z2cAEhpk0U4RtOUmy41Le', 0, NULL, 0, '2021-12-21 07:26:53', '2022-01-13 09:56:38'),
(5, 'Adminstrator School Petal', 'adminuser@schoolpetal.com', 1, 9, NULL, NULL, '90287937908659880', NULL, '$2y$10$YG7h14SITCy1e6FYZoqqm.o2GkQPzLUICtfrrmr5zVJCZEw.mB5P.', 0, NULL, 1, '2021-12-21 07:32:37', '2022-01-13 09:56:38'),
(15, 'opd', 'school@schoolpetal.com3', 13, 10, NULL, NULL, '51257720369020706', NULL, '$2y$10$Ds5icsovK8e9suR2EeEg.e9JpLUPP9j7yXkyMGJboWOh0b0JGW6fK', 0, NULL, 0, '2022-01-10 16:50:11', '2022-01-13 09:56:38'),
(16, 'opd', 'school@schoolpetal.com6', 14, 10, NULL, NULL, '37859220779892595', NULL, '$2y$10$G9lfdG/MfEfUBfqBdIgH1uvUD5B8hCuYPu8E1Ywp2vDXVDJf8P9TC', 0, NULL, 0, '2022-01-10 16:53:47', '2022-01-13 09:56:38'),
(17, 'opd', 'school@schoolpetal.com5', 15, 10, NULL, NULL, '15992388865224582', NULL, '$2y$10$xOICePA2Xix.i6hr5h.UXOof.Sojt0J9d4LEk6dqbBBB2tg.DVvsy', 0, NULL, 0, '2022-01-10 16:55:31', '2022-01-13 09:56:38'),
(18, 'Blaze Perry', 'perry35154@schoolpetal.com', 1, 7, NULL, NULL, '66827911604311897', NULL, '$2y$10$qYirIhFQAwd6QwKm0ZdNW.MmNqn5wJlnrN7gj92ciWYQ3xyQNRRm6', 0, NULL, 1, '2022-01-13 08:27:25', '2022-01-13 09:56:38'),
(19, 'Ammon Ushie', 'ushie99175@schoolpetal.com', 1, 9, NULL, NULL, '90828168060577489', NULL, '$2y$10$85CljqBMxNob3zAdEBy4ze7WgXVUrk8YCQCGC9HR4FjSj2w5iiLIa', 0, NULL, 1, '2022-01-13 08:27:25', '2022-01-13 09:56:38'),
(20, 'Samuel Ushie', 'ushie80743@schoolpetal.com', 1, 6, NULL, NULL, '41247846913700847', NULL, '$2y$10$hg6emWK4J9beTJ4bPYU.EOgoypoDKRDcobJp8hyG6ZQukvukW1UlK', 0, NULL, 1, '2022-01-13 08:30:07', '2022-01-13 09:56:38'),
(21, 'Gideon Bash', 'bash85439@schoolpetal.com', 1, 7, NULL, NULL, '82343378766797292', NULL, '$2y$10$r7tyf/MzShhe/QiFkVPrpef4Zrzemr85QAuulIzSzIaAuEES6Zyn6', 0, NULL, 1, '2022-01-13 08:30:07', '2022-01-13 09:56:38'),
(22, 'Joe Saliu', 'saliu74110@schoolpetal.com', 1, 6, NULL, NULL, '85228022880274006', NULL, '$2y$10$EVVaGBFTyl2BXD.JlKR0D.1X93mXJPuGVYbwJAf70TRDiiW2L72Rm', 0, NULL, 1, '2022-01-13 08:30:07', '2022-01-13 09:56:38'),
(23, 'Moscow Bowy', 'bowy71162@schoolpetal.com', 1, 8, NULL, NULL, '35778577677270071', NULL, '$2y$10$wTSAiF/KYFtscYLOKW8DS.TU129QLOycKstXqZMANlySTtOAuse5q', 0, NULL, 1, '2022-01-13 08:30:07', '2022-01-13 09:56:38'),
(24, 'Moscow Tem', 'tem71829@schoolpetal.com', 1, 6, NULL, NULL, '61782679302280030', NULL, '$2y$10$PCdeFBnsIZR3ME7HuhO1rehJAQ3tc89pqJeDbiq3mqGaydjNz3IyG', 0, NULL, 1, '2022-01-13 08:30:08', '2022-01-13 09:56:38'),
(25, 'Moscow Ushie', 'ushie59470@schoolpetal.com', 1, 8, NULL, NULL, '5430221530327967', NULL, '$2y$10$GqlOxp210DzsKMvhe55FKurowv0O3Nhgk2V7qwrvQYIcV.BBmlv46', 0, NULL, 1, '2022-01-13 08:30:08', '2022-01-13 09:56:39'),
(26, 'Ravo Bash', 'bash68283@schoolpetal.com', 1, 8, NULL, NULL, '95257785998634557', NULL, '$2y$10$aw1QnOTG7JdA9R8uulY7Su2aDk6pMCgWIuBvtli3rGxLSNCPdWbdW', 0, NULL, 1, '2022-01-13 08:30:08', '2022-01-13 09:56:39'),
(27, 'Blaze Blaze', 'blaze74090@schoolpetal.com', 1, 8, NULL, NULL, '78699687201985199', NULL, '$2y$10$Ha.LHJ9hUAC5HA745FBq8.Aa2lK3Am2sX.OjWGrPm7.FoAgzXYj7O', 0, NULL, 1, '2022-01-13 08:30:09', '2022-01-13 09:56:39'),
(28, 'Joe Jazzy', 'jazzy78967@schoolpetal.com', 1, 7, NULL, NULL, '37066680362560008', NULL, '$2y$10$EjHNTnHTehLYpxoTsN6zTeo9/cCWFu7aP.TMX8Sxin47MVaK7cwgC', 0, NULL, 1, '2022-01-13 08:30:09', '2022-01-13 09:56:39'),
(29, 'Kaka Perry', 'perry21048@schoolpetal.com', 1, 6, NULL, NULL, '84799628084747342', NULL, '$2y$10$FgI1Lo.WacRqaPjNlF0knOS/nJ/HER3Xup.dtcwun.zIhQs1fyvqm', 0, NULL, 1, '2022-01-13 08:30:09', '2022-01-13 09:56:39'),
(30, 'Kaka Dayo', 'dayo7743@schoolpetal.com', 1, 9, NULL, NULL, '54489766818697639', NULL, '$2y$10$w72RXXVBl9yc/2HomCpj/.nahSVBEgfd4vrJXzibVG7YxvAbVhE0.', 0, NULL, 1, '2022-01-13 08:30:09', '2022-01-13 09:56:39'),
(31, 'Saliu Moscow', 'moscow49019@schoolpetal.com', 1, 6, NULL, NULL, '89029568045241545', NULL, '$2y$10$HfNHxeFP/IYqzaBDhBViGeOXAUblQHZuvUx//Hd3J6g3do522kh9i', 0, NULL, 1, '2022-01-13 08:30:09', '2022-01-13 09:56:39'),
(32, 'Jay Tem', 'tem31600@schoolpetal.com', 1, 8, NULL, NULL, '54224504604009951', NULL, '$2y$10$cnAYY1eZNA1afjBfRRjdzeRsQu8NT4WBc2c1KxP/s5CcQaOJo4Lt.', 0, NULL, 1, '2022-01-13 08:30:09', '2022-01-13 09:56:39'),
(33, 'Bash Grace', 'grace54922@schoolpetal.com', 1, 6, NULL, NULL, '49048307113699399', NULL, '$2y$10$p3AvDlSxe8eyoatW7UjsZue8i/pP15QIhSsYsF7g9wVC8XUt7zDl.', 0, NULL, 1, '2022-01-13 08:30:09', '2022-01-13 09:56:39'),
(34, 'Park Blaze', 'blaze11346@schoolpetal.com', 1, 9, NULL, NULL, '83776793512894897', NULL, '$2y$10$e9k7XOdTM6YE/mxm3K4JteahNeuGzr/ke6YoAlDrfvKrTgUl/W0B2', 0, NULL, 1, '2022-01-13 08:30:10', '2022-01-13 09:56:39'),
(35, 'Bash Ushie', 'ushie88152@schoolpetal.com', 1, 8, NULL, NULL, '39241888095223294', NULL, '$2y$10$MC7jZuHPB5EfnJV9k4pGcunSfPD9NzX3rDyjB5MueESVQ2cSc465u', 0, NULL, 1, '2022-01-13 08:30:10', '2022-01-13 09:56:39'),
(36, 'Poe Saliu', 'saliu66215@schoolpetal.com', 1, 9, NULL, NULL, '94497513367847062', NULL, '$2y$10$Y3QkLni3MWiHusDxEFqAKuND0cqjcgZw7rESk3AJbbjJQ2/aLNVR.', 0, NULL, 1, '2022-01-13 08:30:10', '2022-01-13 09:56:39'),
(37, 'Yusuf Poe', 'poe67502@schoolpetal.com', 1, 7, NULL, NULL, '33310789039563751', NULL, '$2y$10$/klv6CMGLxfqTCYCF/CwuOVUiy.01XBrugRTHy/fn3jHSsWSlm1z.', 0, NULL, 1, '2022-01-13 08:30:10', '2022-01-13 09:56:39'),
(38, 'Blaze Yoncy', 'yoncy15677@schoolpetal.com', 1, 6, NULL, NULL, '65389871578959679', NULL, '$2y$10$W7dpKSXQCCWbkdU4nRnvSeix5IfVEJCLd.nZTNxQ.mgcQCSV3q.om', 0, NULL, 1, '2022-01-13 08:30:10', '2022-01-13 09:56:39'),
(39, 'Grace Joe', 'joe62463@schoolpetal.com', 1, 8, NULL, NULL, '41391115177745774', NULL, '$2y$10$XUygwK3S0lg6ijXxPC/5ZeqIL8.qPM/McVio7q5kln6S1ANt1CNr6', 0, NULL, 1, '2022-01-13 08:30:10', '2022-01-13 09:56:39'),
(40, 'Nimi Ravo', 'ravo21830@schoolpetal.com', 1, 7, NULL, NULL, '52021814089131560', NULL, '$2y$10$NcsCVH5VTr/tZ.JJzPdWpe0jIcbEj/0Y/VMe.J/fXhjZl7w97lgRi', 0, NULL, 1, '2022-01-13 08:30:11', '2022-01-13 09:56:39'),
(41, 'Dorcas Perry', 'perry32165@schoolpetal.com', 1, 7, NULL, NULL, '61517756361587412', NULL, '$2y$10$iATtzRlKX0jIcHdXPTZvRe41bWcZD/BciVo4EL2gdog2ZVPlRTewu', 0, NULL, 1, '2022-01-13 08:30:11', '2022-01-13 09:56:39'),
(42, 'Kaka Gideon', 'gideon1179@schoolpetal.com', 1, 7, NULL, NULL, '62024479283273096', NULL, '$2y$10$4JlHuiGuZ6ISm5juB8eO2uvyyfdwQG/fPtz2r9S3NKU9WP.JvOxeO', 0, NULL, 1, '2022-01-13 08:30:12', '2022-01-13 09:56:39'),
(43, 'Blaze Dollar', 'dollar94730@schoolpetal.com', 1, 6, NULL, NULL, '51497470678770046', NULL, '$2y$10$ZY3sXis4JILSUk1cyH0wT.wVE5nMV98Cs0ndn0oHKm2uctW7PIbJK', 0, NULL, 1, '2022-01-13 08:30:12', '2022-01-13 09:56:39'),
(44, 'Jay Tem', 'tem82977@schoolpetal.com', 1, 8, NULL, NULL, '98054369469570493', NULL, '$2y$10$emRpyv7gRuYGXD.2PGKYNur5ZnblrL084NUOAd4oiCV0B9qTTxW5G', 0, NULL, 1, '2022-01-13 08:30:12', '2022-01-13 09:56:39'),
(45, 'Doe Nimi', 'nimi77636@schoolpetal.com', 1, 9, NULL, NULL, '85242973507441185', NULL, '$2y$10$NLJfbrNbLAwXTYtFeZ/qPumZMBzNGm41rFhgUxqj9Rjb1girf.pM.', 0, NULL, 1, '2022-01-13 08:30:12', '2022-01-13 09:56:39'),
(46, 'Dayo Dayo', 'dayo2221@schoolpetal.com', 1, 9, NULL, NULL, '74733107701229583', NULL, '$2y$10$G1nLpVENwqhIqWPblV2RRuCdJEWCq5zZVR.2wScT2N01sqr.9aj6y', 0, NULL, 1, '2022-01-13 08:30:12', '2022-01-13 09:56:39'),
(47, 'Poe Samuel', 'samuel42472@schoolpetal.com', 1, 8, NULL, NULL, '97539579577903322', NULL, '$2y$10$KNEkyn.MpEuEGJEMQd0GdeXrtnGwEFUzcWZLdJEh71XCtHCGmvLxK', 0, NULL, 1, '2022-01-13 08:30:13', '2022-01-13 09:56:39'),
(48, 'Grace Valentine', 'valentine35897@schoolpetal.com', 1, 9, NULL, NULL, '21224392980834890', NULL, '$2y$10$QO6LI6zmVQKYxIOUzcSZ6e2fFf5AWsfr45T9K3cFZxCX6PeIAZ9.G', 0, NULL, 1, '2022-01-13 08:30:13', '2022-01-13 09:56:39'),
(49, 'Blaze Nimi', 'nimi86540@schoolpetal.com', 1, 6, NULL, NULL, '47185052615504202', NULL, '$2y$10$zdCT7s5GlxVElKqoPQtBZe4.65xoi65FxVgwWG2VXUJFf3DZbH7ZW', 0, NULL, 1, '2022-01-13 08:30:13', '2022-01-13 09:56:39'),
(50, 'Doe Valentine', 'valentine49678@schoolpetal.com', 1, 6, NULL, NULL, '77642796195878057', NULL, '$2y$10$zfGx9DSFhKMoAT.NTsbXy.ZYoJrQMseB51I0xDLMyOf6xV2NHMfS6', 0, NULL, 1, '2022-01-13 08:30:13', '2022-01-13 09:56:39'),
(51, 'Moscow Tem', 'tem52852@schoolpetal.com', 1, 6, NULL, NULL, '46266066420574372', NULL, '$2y$10$h1TZYiNF4OdbZGQdD4wPl.WXE8p4FpOuD5VfHwMTVZDZwheerHuQK', 0, NULL, 1, '2022-01-13 08:30:13', '2022-01-13 09:56:39'),
(52, 'Grace Kaka', 'kaka92233@schoolpetal.com', 1, 6, NULL, NULL, '6579915791246967', NULL, '$2y$10$tfG5wDkjxp4VCLHhWDTm5uvIn6qwwhaPE/Iv63UtuKKQQ5ztOQTUe', 0, NULL, 1, '2022-01-13 08:30:13', '2022-01-13 09:56:39'),
(53, 'Park Kaka', 'kaka72228@schoolpetal.com', 1, 8, NULL, NULL, '13379603905737824', NULL, '$2y$10$m07bTfPLloIJWKkAK5hyHe4BBRqwIlRgEaR16T2R66fkFTdijSWvW', 0, NULL, 1, '2022-01-13 08:30:14', '2022-01-13 09:56:39'),
(54, 'Kaka Jazzy', 'jazzy80746@schoolpetal.com', 1, 6, NULL, NULL, '8918579191295097', NULL, '$2y$10$1sV8LsXeWUB7JVugFMNZBO7ABWBVBp1aPrZBXU1bqlPbhD.r1/inC', 0, NULL, 1, '2022-01-13 08:30:14', '2022-01-13 09:56:39'),
(55, 'Grace Joe', 'joe15464@schoolpetal.com', 1, 6, NULL, NULL, '58046934198767388', NULL, '$2y$10$jfoMHRSZejrqx2AcRSuMIeZnCbDt8FuzzxQ.UShYhjtAXWdrugZVO', 0, NULL, 1, '2022-01-13 08:30:14', '2022-01-13 09:56:39'),
(56, 'Ammon Gideon', 'gideon96994@schoolpetal.com', 1, 7, NULL, NULL, '3458666100961211', NULL, '$2y$10$B/CWNUOxo/u.qjXfyOrU0uEKQxfOzOy0USKwH0URoylHvbENCm64e', 0, NULL, 1, '2022-01-13 08:30:14', '2022-01-13 09:56:39'),
(57, 'Jazzy Moscow', 'moscow14131@schoolpetal.com', 1, 8, NULL, NULL, '87446159502134670', NULL, '$2y$10$Vbw./i3eEUusIqXGZKbqT.2qdQcbgWV/jiLB9AOgy475UFyhpnzsG', 0, NULL, 1, '2022-01-13 08:30:14', '2022-01-13 09:56:39'),
(58, 'Grace Ravo', 'ravo41491@schoolpetal.com', 1, 7, NULL, NULL, '17561192284064432', NULL, '$2y$10$U56w.LufZd0HL0QIwN4APu6Sr0yScrGKyT3m1R3/B2JtGgbfHMMz.', 0, NULL, 1, '2022-01-13 08:30:14', '2022-01-13 09:56:40'),
(59, 'Doe Dayo', 'dayo71482@schoolpetal.com', 1, 9, NULL, NULL, '23968022637301718', NULL, '$2y$10$rESW29KbCmrNtpimppMboOKie3ERQOej94KIPK1Xp.gZ/OSVRVRLO', 0, NULL, 1, '2022-01-13 08:30:15', '2022-01-13 09:56:40'),
(60, 'Uche Braid', 'braid61095@schoolpetal.com', 1, 7, NULL, NULL, '36347612373625199', NULL, '$2y$10$LC9T.24GUZuB9GXYPlTTPOQrpHkV5oAXGwsNbkw2piFsPJJaxOPdO', 0, NULL, 1, '2022-01-13 08:30:15', '2022-01-13 09:56:40'),
(61, 'Dollar Doe', 'doe76396@schoolpetal.com', 1, 7, NULL, NULL, '48039222319884744', NULL, '$2y$10$R6dB0RfJ42ERmiZRdAqPfOJAo6xtmhGBwtN3ULynbjuVyXqwlX9nS', 0, NULL, 1, '2022-01-13 08:30:15', '2022-01-13 09:56:40'),
(62, 'Ammon Ammon', 'ammon13854@schoolpetal.com', 1, 9, NULL, NULL, '69516965245513261', NULL, '$2y$10$AliTJUEZMNklr5AoMM3jWujkyMCftCj.TrAnnvDy3SOgvQUpSOSWK', 0, NULL, 1, '2022-01-13 08:30:15', '2022-01-13 09:56:40'),
(63, 'Yoncy Uche', 'uche19680@schoolpetal.com', 1, 7, NULL, NULL, '67187116504173473', NULL, '$2y$10$TKQvr2G3VoJ9jaaU6lR9HeRLqDkDYWFXkwQ.3EqPuBYECPYM94Qbu', 0, NULL, 1, '2022-01-13 08:30:15', '2022-01-13 09:56:40'),
(64, 'Park Perry', 'perry58898@schoolpetal.com', 1, 9, NULL, NULL, '87178489191084145', NULL, '$2y$10$PrcaO2/7FhUVkrSDvMy6W.sAHTYPeJ8LEv0rFe4Exm27JGvBlBFHO', 0, NULL, 1, '2022-01-13 08:30:15', '2022-01-13 09:56:40'),
(65, 'Nimi Dayo', 'dayo41163@schoolpetal.com', 1, 6, NULL, NULL, '30955980062515625', NULL, '$2y$10$k/cpAWvqOIbRu8S/NgnyGu6TACrbxxqXciR/jcobhZTJ8/AUF/ht2', 0, NULL, 1, '2022-01-13 08:30:15', '2022-01-13 09:56:40'),
(66, 'Boss Blaze', 'blaze17867@schoolpetal.com', 1, 6, NULL, NULL, '12615813671632013', NULL, '$2y$10$oO9xmIsyYwfUt9lYwh0DkOZOtk9ACenc7dBJXQP1TO1t.sNndSU9S', 0, NULL, 1, '2022-01-13 08:30:16', '2022-01-13 09:56:40'),
(67, 'Perry Jazzy', 'jazzy27313@schoolpetal.com', 1, 9, NULL, NULL, '68343595264106072', NULL, '$2y$10$qrTF2hGi4i70O11uQ7GsxO7ydbTb9IIQEN3wFLBmrID2hfcNxLyxq', 0, NULL, 1, '2022-01-13 08:30:16', '2022-01-13 09:56:40'),
(68, 'Bowy Perry', 'perry27957@schoolpetal.com', 1, 7, NULL, NULL, '48469683977242560', NULL, '$2y$10$uZrMnsazhJbAfmso.FVFmODuxnZwbK/1W2ONixW4VsbhA4QbBIRqq', 0, NULL, 1, '2022-01-13 08:30:16', '2022-01-13 09:56:40'),
(69, 'Valentine Braid', 'braid40245@schoolpetal.com', 1, 7, NULL, NULL, '35058511088215660', NULL, '$2y$10$RRyFr0ZvyNElqjl615AH7Ox0spL5jIA5p98WlW/FoWldXN0cQFNxm', 0, NULL, 1, '2022-01-13 08:30:16', '2022-01-13 09:56:40'),
(70, 'Kaka Samuel', 'samuel33359@schoolpetal.com', 1, 6, NULL, NULL, '41159160256281781', NULL, '$2y$10$FGyQFdBaVjw2OA8k23LsGOy.egM.IGEV6ARaLF.eWjyCaixOCxaJa', 0, NULL, 1, '2022-01-13 08:30:16', '2022-01-13 09:56:40'),
(71, 'Saliu Ammon', 'ammon86284@schoolpetal.com', 1, 9, NULL, NULL, '70058445233058977', NULL, '$2y$10$8e6NNoTRPEaW3RNZWqSlOe6/m5txhV5.C6EDjPv5T4ctyToGXrX3G', 0, NULL, 1, '2022-01-13 08:31:21', '2022-01-13 09:56:40'),
(72, 'Braid Bash', 'bash83027@schoolpetal.com', 1, 9, NULL, NULL, '45851394569641615', NULL, '$2y$10$fwGsGJahkt0d93RFnb6iauaYNm/4dFMXJBDHE8JOOj3DbN0lrk8N.', 0, NULL, 1, '2022-01-13 08:31:21', '2022-01-13 09:56:40'),
(73, 'Dollar Ravo', 'ravo66250@schoolpetal.com', 1, 6, NULL, NULL, '64151661607858765', NULL, '$2y$10$aHb/XZdfbkckxZHb3Jj2Se2GrZuRfKJB3JGAyQ5ov339o2I0tNKK.', 0, NULL, 1, '2022-01-13 08:31:21', '2022-01-13 09:56:40'),
(74, 'Nimi Ammon', 'ammon35816@schoolpetal.com', 1, 8, NULL, NULL, '7971440925169497', NULL, '$2y$10$cuN9fBdQC8gpBFucWmp6S.uy.cCAQBFl9xgjpdA8V5rSrxY3C/dH.', 0, NULL, 1, '2022-01-13 08:31:21', '2022-01-13 09:56:40'),
(75, 'Blaze Doe', 'doe16635@schoolpetal.com', 1, 7, NULL, NULL, '78088851869751264', NULL, '$2y$10$/xdkEnj4VdhGanbA4uHZiOIUZ63oxKdSeSkomMWwEzAvP/JvjUyye', 0, NULL, 1, '2022-01-13 08:31:21', '2022-01-13 09:56:40'),
(76, 'Ushie Valentine', 'valentine25179@schoolpetal.com', 1, 8, NULL, NULL, '97438419208034810', NULL, '$2y$10$e3yKOMOZl2D1Q3RdbhHz4.PKG9.SOp4p/mKUJBdwx.PJPJopnVtX.', 0, NULL, 1, '2022-01-13 08:31:22', '2022-01-13 09:56:40'),
(77, 'Jay Bowy', 'bowy51472@schoolpetal.com', 1, 7, NULL, NULL, '54367160594574730', NULL, '$2y$10$VdLuXsXu6bpHZM4A/o45QeNaRyz2lFbCvxA6aTcTv7qQfrynySqdW', 0, NULL, 1, '2022-01-13 08:31:22', '2022-01-13 09:56:40'),
(78, 'Grace Dorcas', 'dorcas22424@schoolpetal.com', 1, 7, NULL, NULL, '48492022699256379', NULL, '$2y$10$fOghXlI3TL6zBQEtslp0g.jncuhgnX6Hb8h7uy0kbhpk4rrxJWo0i', 0, NULL, 1, '2022-01-13 08:31:22', '2022-01-13 09:56:40'),
(79, 'Blaze Jay', 'jay79920@schoolpetal.com', 1, 7, NULL, NULL, '25656226944426589', NULL, '$2y$10$D8w1yWw2ULCmn3Q48OZfqe6BMypikzqTvHbbE7dZYq7.3Nxy.2dU2', 0, NULL, 1, '2022-01-13 08:31:22', '2022-01-13 09:56:40'),
(80, 'Braid Ushie', 'ushie88421@schoolpetal.com', 1, 9, NULL, NULL, '12129209486835022', NULL, '$2y$10$jXkyqKh0OQ3wiOYiNNDznONfyaPKsYQGAv9wDd1OgyqKcm/AXb6lW', 0, NULL, 1, '2022-01-13 08:31:22', '2022-01-13 09:56:40'),
(81, 'Joe Grace', 'grace6809@schoolpetal.com', 1, 8, NULL, NULL, '11768080143497170', NULL, '$2y$10$l3IzVRHbEBkU8QoXZh/Za.nC0zSsNn8gd5Tb2ee2d/53M9duNGgeS', 0, NULL, 1, '2022-01-13 08:31:22', '2022-01-13 09:56:40'),
(82, 'Samuel Braid', 'braid77872@schoolpetal.com', 1, 9, NULL, NULL, '8392690593923062', NULL, '$2y$10$WsT5IlAJELF3t/FrktAiEuWeEFafWpusOjMb91LVQpva9dfryLGD6', 0, NULL, 1, '2022-01-13 08:31:23', '2022-01-13 09:56:40'),
(83, 'Joe Nimi', 'nimi35227@schoolpetal.com', 1, 7, NULL, NULL, '80356876681481308', NULL, '$2y$10$.pnRfjxQyj/j./GFn1sb/ejREYrRVccsFThIb43BHxx5d7OKCHpKO', 0, NULL, 1, '2022-01-13 08:31:23', '2022-01-13 09:56:40'),
(84, 'Nimi Kaka', 'kaka32105@schoolpetal.com', 1, 7, NULL, NULL, '72402543999909887', NULL, '$2y$10$gqCcp5bGX1q4AjDopZTc8uAGXGF7bQoOYL/OEfPdmgioN.TyHkTGu', 0, NULL, 1, '2022-01-13 08:31:23', '2022-01-13 09:56:40'),
(85, 'Joe Gideon', 'gideon42337@schoolpetal.com', 1, 6, NULL, NULL, '45155205190823118', NULL, '$2y$10$HeYha89.QqNB.0WsHvm5l.CV9yt.eq9xgxTTxwu0qssQbeYzv7YDO', 0, NULL, 1, '2022-01-13 08:31:23', '2022-01-13 09:56:40'),
(86, 'Bowy Tem', 'tem61214@schoolpetal.com', 1, 9, NULL, NULL, '75085852237089501', NULL, '$2y$10$B1DfZC9qfK/xKMaOVa9l3e.hus6Vy5QveeaHurD.pCo2P1QpH8b9O', 0, NULL, 1, '2022-01-13 08:31:24', '2022-01-13 09:56:40'),
(87, 'Dollar Dollar', 'dollar53725@schoolpetal.com', 1, 9, NULL, NULL, '32085871553976034', NULL, '$2y$10$iM32bkO1sahWx7sqouAfwO6FKj/cjEi30uZN4ErISEt7oLlhtmzCi', 0, NULL, 1, '2022-01-13 08:31:24', '2022-01-13 09:56:40'),
(88, 'Saliu Bowy', 'bowy65593@schoolpetal.com', 1, 6, NULL, NULL, '34552052454995458', NULL, '$2y$10$hklGdD0IpFO7DJVyAargW.iaJsTqud6tjorMwLsJHsoLwk4i3Yovm', 0, NULL, 1, '2022-01-13 08:31:24', '2022-01-13 09:56:40'),
(89, 'Dayo Saliu', 'saliu93182@schoolpetal.com', 1, 6, NULL, NULL, '99735194200754686', NULL, '$2y$10$ZRNJ9yg21U5mBIYdqrxJlOibdY02aGaqlxoE5TZZ1Y8AGgaKg5Ctu', 0, NULL, 1, '2022-01-13 08:31:24', '2022-01-13 09:56:40'),
(90, 'Perry Gideon', 'gideon55794@schoolpetal.com', 1, 7, NULL, NULL, '4980645230632882', NULL, '$2y$10$k2IkOW8hYao08SqWW1Kvs.u/kdkxa4Qm0w9Mu46t7TJJlEvvA6JGi', 0, NULL, 1, '2022-01-13 08:31:24', '2022-01-13 09:56:41'),
(91, 'Dollar Gideon', 'gideon28796@schoolpetal.com', 1, 6, NULL, NULL, '88235798994582514', NULL, '$2y$10$3fPdoBTtSZLr7vZre3x4BudixwGiR6J6xQj5QLHdfra08J0lGpzJC', 0, NULL, 1, '2022-01-13 08:31:25', '2022-01-13 09:56:41'),
(92, 'Doe Perry', 'perry93625@schoolpetal.com', 1, 6, NULL, NULL, '41437158268903873', NULL, '$2y$10$9s3Nan1Pa8Vr/e29JAIUzefIwdQbc2Dw3TjQ9FGtukmyuzQjJ.0yC', 0, NULL, 1, '2022-01-13 08:31:25', '2022-01-13 09:56:41'),
(93, 'Ushie Ushie', 'ushie17653@schoolpetal.com', 1, 9, NULL, NULL, '96616113402404329', NULL, '$2y$10$nEPgyGq5dFy4U/9nlKIgruHIbIZDT9AqR8kxeGufylqRFQo1VLkJW', 0, NULL, 1, '2022-01-13 08:31:25', '2022-01-13 09:56:41'),
(94, 'Samuel Braid', 'braid67899@schoolpetal.com', 1, 6, NULL, NULL, '60035432277766223', NULL, '$2y$10$B.RQqrf2WtpDG2o1YWfZTOdTFvGf9M7tEfl7I1vSgoDIayd5GMLyS', 0, NULL, 1, '2022-01-13 08:31:25', '2022-01-13 09:56:41'),
(95, 'Valentine Samuel', 'samuel5508@schoolpetal.com', 1, 6, NULL, NULL, '70820098381859359', NULL, '$2y$10$CuC3eo/9diEflTLZDnGs9.JjX0oedKw7s/5b5Xh50s5mnG5KCVLQe', 0, NULL, 1, '2022-01-13 08:31:25', '2022-01-13 09:56:41'),
(96, 'Dollar Braid', 'braid27385@schoolpetal.com', 1, 8, NULL, NULL, '85976527423011935', NULL, '$2y$10$TYxF4HnSFpkR.2YrE9i2a.uxkSlUv5LaM6PgBzF7svvqD8EaCzoUC', 0, NULL, 1, '2022-01-13 08:31:26', '2022-01-13 09:56:41'),
(97, 'Poe Doe', 'doe80509@schoolpetal.com', 1, 6, NULL, NULL, '65611695057059353', NULL, '$2y$10$j4gbPk/IVWb2WWBLRTXpwuw1z0KKppHtKtWioyJybqyN053yrA812', 0, NULL, 1, '2022-01-13 08:31:26', '2022-01-13 09:56:41'),
(98, 'Samuel Park', 'park19382@schoolpetal.com', 1, 6, NULL, NULL, '57097092683024667', NULL, '$2y$10$3N1naFH83aFph.svOF512.hU3u4bIeYomI4JtHAR3buZlCByPyNB2', 0, NULL, 1, '2022-01-13 08:31:26', '2022-01-13 09:56:41'),
(99, 'Boss Braid', 'braid53245@schoolpetal.com', 1, 7, NULL, NULL, '37020760992861304', NULL, '$2y$10$EjNGOo1bzqlju2VfO2TeIeW8cKLpOdJfL850SGTBNtbrB9typZEie', 0, NULL, 1, '2022-01-13 08:31:26', '2022-01-13 09:56:41'),
(100, 'Dorcas Boss', 'boss40368@schoolpetal.com', 1, 8, NULL, NULL, '14031032881744817', NULL, '$2y$10$PKLadrM24syDZqeWzgUJs.IfRdIBw/M9/tSXe2yhar53.groCjnFy', 0, NULL, 1, '2022-01-13 08:31:26', '2022-01-13 09:56:41'),
(101, 'Joe Ushie', 'ushie72290@schoolpetal.com', 1, 7, NULL, NULL, '90566052928695594', NULL, '$2y$10$cxPmW4WLmA2KlJ.xfQBuD.fJnBVeBAg4a.re7DdvHOFHCF3hboDiS', 0, NULL, 1, '2022-01-13 08:31:26', '2022-01-13 09:56:41'),
(102, 'Samuel Boss', 'boss44194@schoolpetal.com', 1, 9, NULL, NULL, '10841931921448109', NULL, '$2y$10$1HBePnEt2PGbxugt2tuGm.DaalqpFULjrsFSZL444BiG6gQ4rzAYG', 0, NULL, 1, '2022-01-13 08:31:27', '2022-01-13 09:56:41'),
(103, 'Tem Grace', 'grace51504@schoolpetal.com', 1, 6, NULL, NULL, '47743001327614178', NULL, '$2y$10$V7u6wG.3pn0nfLEZCBrd8.B5G98nT1q3vrCQ6SmXd7AnehngInAQm', 0, NULL, 1, '2022-01-13 08:31:27', '2022-01-13 09:56:41'),
(104, 'Bowy Park', 'park44552@schoolpetal.com', 1, 8, NULL, NULL, '90972959567942974', NULL, '$2y$10$glaunCWEab3dl5Iw36bUHuISnpm9KJQX6J68tUe3N53vr4vos5kKG', 0, NULL, 1, '2022-01-13 08:31:27', '2022-01-13 09:56:41'),
(105, 'Jay Perry', 'perry66137@schoolpetal.com', 1, 8, NULL, NULL, '38506300656722116', NULL, '$2y$10$ZjGd2kVMnMLqAB3PIJWmMehveRByawZikiVX4n9CsP41pIpa7KfwS', 0, NULL, 1, '2022-01-13 08:31:27', '2022-01-13 09:56:41'),
(106, 'Boss Perry', 'perry4284@schoolpetal.com', 1, 6, NULL, NULL, '76242040903062235', NULL, '$2y$10$NRkcmDAGV.E49baz5WzmBOloxCnjLEGuay8gDoLzD3OexVi3SYXRC', 0, NULL, 1, '2022-01-13 08:31:27', '2022-01-13 09:56:41'),
(107, 'Poe Uche', 'uche79312@schoolpetal.com', 1, 7, NULL, NULL, '33766233701567311', NULL, '$2y$10$m95BhQtejr6.MA14.oelIuAF3G2UjYWseZB5.mkU83TzmIXKNouvy', 0, NULL, 1, '2022-01-13 08:31:27', '2022-01-13 09:56:41'),
(108, 'Kaka Perry', 'perry83455@schoolpetal.com', 1, 9, NULL, NULL, '33328178064283610', NULL, '$2y$10$uYH45G//oRY.COZzLNuvyeH0Ue7EJ60zN/UCTNlENkG3gJs3GvbAC', 0, NULL, 1, '2022-01-13 08:31:28', '2022-01-13 09:56:42'),
(109, 'Saliu Jay', 'jay36003@schoolpetal.com', 1, 9, NULL, NULL, '58147479907024537', NULL, '$2y$10$p33JcGPtowgX..VmA2SUQOS.wj/1aBdMVVoocHEQeB0O5i3nqevbK', 0, NULL, 1, '2022-01-13 08:31:28', '2022-01-13 09:56:42'),
(110, 'Ammon Nimi', 'nimi73643@schoolpetal.com', 1, 7, NULL, NULL, '67167671293373409', NULL, '$2y$10$QLrMCYDJSZX1oV9w9lZlHu9CxcbOIj5yMuQKM0q6Tu7GhPuNmKTsi', 0, NULL, 1, '2022-01-13 08:31:28', '2022-01-13 09:56:42'),
(111, 'Saliu Valentine', 'valentine61794@schoolpetal.com', 1, 6, NULL, NULL, '87285638216234234', NULL, '$2y$10$R.HmImwF0Zn53m.sRzC4M.UrRXh7P5cUXDnIwdBy9h0Ef3CyNi5aS', 0, NULL, 1, '2022-01-13 08:31:28', '2022-01-13 09:56:42'),
(112, 'Dorcas Moscow', 'moscow78942@schoolpetal.com', 1, 7, NULL, NULL, '91334482341499902', NULL, '$2y$10$Apjqus43tvXfVFqhC5BltOl6g3SDMSxMZUJOdC9hCcTcTUdWmsuwa', 0, NULL, 1, '2022-01-13 08:31:28', '2022-01-13 09:56:42'),
(113, 'Ammon Nimi', 'nimi55560@schoolpetal.com', 1, 6, NULL, NULL, '57612826682015364', NULL, '$2y$10$kvuKC73CqwWXmP4lZVyAbOCek1YhMi084UlUW7T6Q4NOvw2R4KdIG', 0, NULL, 1, '2022-01-13 08:31:29', '2022-01-13 09:56:42'),
(114, 'Gideon Samuel', 'samuel57932@schoolpetal.com', 1, 9, NULL, NULL, '30207504744538188', NULL, '$2y$10$yPChOtXO3otwBzc4xqsZZuO4BXHAqlr6DsnUH3W9c8hEufh47cYm.', 0, NULL, 1, '2022-01-13 08:31:29', '2022-01-13 09:56:42'),
(115, 'Poe Bowy', 'bowy72364@schoolpetal.com', 1, 8, NULL, NULL, '9152878382400547', NULL, '$2y$10$eeQ9i1SIDpdSrIH5LWnfpOuOcvz.8qhiE0YQiur74lQ8aOtWC62sO', 0, NULL, 1, '2022-01-13 08:31:29', '2022-01-13 09:56:42'),
(116, 'Dollar Bowy', 'bowy91313@schoolpetal.com', 1, 7, NULL, NULL, '68146167446679613', NULL, '$2y$10$D3ZiOPjeXGpm0wNubpavDOtdZEQd2WEBohZsCe6H6YwtzsDnAUSKi', 0, NULL, 1, '2022-01-13 08:31:29', '2022-01-13 09:56:42'),
(117, 'Ushie Ravo', 'ravo77663@schoolpetal.com', 1, 9, NULL, NULL, '60383405959103841', NULL, '$2y$10$x2KfgAc3K6GISMMz7BDQGe6KqRr./Gn7B6CNMojU0D7AmH6j3lIXq', 0, NULL, 1, '2022-01-13 08:31:30', '2022-01-13 09:56:42'),
(118, 'Bowy Saliu', 'saliu77046@schoolpetal.com', 1, 9, NULL, NULL, '29066191528919363', NULL, '$2y$10$MTP0Kwa7O0XQIQ3/lTdGiORSiV9YJKxOdJknC4ZuULksX3tDOwcz.', 0, NULL, 1, '2022-01-13 08:31:30', '2022-01-13 09:56:42'),
(119, 'Saliu Poe', 'poe56022@schoolpetal.com', 1, 6, NULL, NULL, '69250106504682051', NULL, '$2y$10$4gjCj6OiYrzyXMUUnkCu2u0tTVP8r9I8GYcbK3Eyhp.PUyhllBAPW', 0, NULL, 1, '2022-01-13 08:31:30', '2022-01-13 09:56:42'),
(120, 'Braid Joe', 'joe76433@schoolpetal.com', 1, 8, NULL, NULL, '16806853340667098', NULL, '$2y$10$HIN9sTfKpX2esWufsSKAmuaA5YykdJxqqwAOBxEg1W4txJP80EQ.y', 0, NULL, 1, '2022-01-13 08:31:30', '2022-01-13 09:56:42'),
(121, 'Blaze Yusuf', 'yusuf56187@schoolpetal.com', 1, 9, NULL, NULL, '50663554926356557', NULL, '$2y$10$vWcKKY9jG5HoPuQFZaq4delhQLksOn2wfj1NRZB16M1IStquwNx5O', 0, NULL, 1, '2022-01-13 08:31:30', '2022-01-13 09:56:42'),
(122, 'Yusuf Braid', 'braid13282@schoolpetal.com', 1, 7, NULL, NULL, '12731092449818710', NULL, '$2y$10$aNE2w33kqjIWNK/3c9HIRuJNy12jvDxNGL1lxUY13Sg/TNZ4DSNSi', 0, NULL, 1, '2022-01-13 08:31:37', '2022-01-13 09:56:42'),
(123, 'Kaka Boss', 'boss46456@schoolpetal.com', 1, 7, NULL, NULL, '92002659506270373', NULL, '$2y$10$ZbJitfPoPxetwBgWOITd2uBZuz1xO8CQLJ1ho9jJxHBQ6zh4JHgEW', 0, NULL, 1, '2022-01-13 08:31:37', '2022-01-13 09:56:42'),
(124, 'Uche Ammon', 'ammon64514@schoolpetal.com', 1, 6, NULL, NULL, '2143343949982202', NULL, '$2y$10$KK267//c0sOq8X1ycWtI7Ogkei.H1uPYUTYWioV6pXs9A56.mHIUK', 0, NULL, 1, '2022-01-13 08:31:37', '2022-01-13 09:56:42'),
(125, 'Perry Braid', 'braid74949@schoolpetal.com', 1, 7, NULL, NULL, '949374068071339', NULL, '$2y$10$82anYWUtFtnuASJphXZTge79F.fJqgxg7LCi70CiM5jurPQN3Ebwm', 0, NULL, 1, '2022-01-13 08:31:37', '2022-01-13 09:56:42'),
(126, 'Joe Valentine', 'valentine88313@schoolpetal.com', 1, 8, NULL, NULL, '89248929844131192', NULL, '$2y$10$TyyrnIrUv.yX4ZtxASYQ..bVcrOBqN9563Vg1bIf7KI3hvgc5fHxi', 0, NULL, 1, '2022-01-13 08:31:38', '2022-01-13 09:56:42'),
(127, 'Jay Kaka', 'kaka99455@schoolpetal.com', 1, 7, NULL, NULL, '47782495524818757', NULL, '$2y$10$Gt8f8.8KVShh7TFlAvqKReCvNwSnAMygvihoar5cO5wL/IhthFKqu', 0, NULL, 1, '2022-01-13 08:31:38', '2022-01-13 09:56:42'),
(128, 'Boss Tem', 'tem34969@schoolpetal.com', 1, 6, NULL, NULL, '27602319644799069', NULL, '$2y$10$WsSdR5bipiITclscXfFoduFpq9kGudTHPE..SW/638B3DurUTEmIG', 0, NULL, 1, '2022-01-13 08:31:38', '2022-01-13 09:56:42'),
(129, 'Uche Park', 'park91066@schoolpetal.com', 1, 7, NULL, NULL, '94664317260164825', NULL, '$2y$10$Fphpn2pHkf92MZ7hqoQ5zu8r4gmHeSoRf2pgag1MOxu/.TrK07kb2', 0, NULL, 1, '2022-01-13 08:31:38', '2022-01-13 09:56:42'),
(130, 'Kaka Moscow', 'moscow39210@schoolpetal.com', 1, 7, NULL, NULL, '82518913824170567', NULL, '$2y$10$WgegsfzkzlCSHTs8ZlndLegiSZmZZGCozV8zannIvMrtOeri7Q34W', 0, NULL, 1, '2022-01-13 08:31:38', '2022-01-13 09:56:42'),
(131, 'Valentine Bash', 'bash44315@schoolpetal.com', 1, 9, NULL, NULL, '34475649461323134', NULL, '$2y$10$CXZUqP.q.8Whc/2pXt4P8eQZi5M1AxxOhHo9c6GW.HKvd6cgtWnuu', 0, NULL, 1, '2022-01-13 08:31:38', '2022-01-13 09:56:42'),
(132, 'Gideon Boss', 'boss32507@schoolpetal.com', 1, 8, NULL, NULL, '22155481306324819', NULL, '$2y$10$VgwkmF1tIJ.B4NEsRXhC8uWS4osPMyegfnNHDaDnj1vfVw0X/Vkei', 0, NULL, 1, '2022-01-13 08:31:39', '2022-01-13 09:56:42'),
(133, 'Kaka Ammon', 'ammon5393@schoolpetal.com', 1, 9, NULL, NULL, '6326875435332196', NULL, '$2y$10$vIaNGp9bf1hwU52EGV2Q4.G3mNYsezePX9HcPlS4C/KwuE.WFl6KW', 0, NULL, 1, '2022-01-13 08:31:39', '2022-01-13 09:56:43'),
(134, 'Blaze Moscow', 'moscow18358@schoolpetal.com', 1, 7, NULL, NULL, '2748708414728474', NULL, '$2y$10$Nj6r7WGJzsqBv/4VP5E7kedmsU8YBFw.8WIASGIrkFKaoJsJmqtHC', 0, NULL, 1, '2022-01-13 08:31:39', '2022-01-13 09:56:43'),
(135, 'Boss Yusuf', 'yusuf14932@schoolpetal.com', 1, 9, NULL, NULL, '40582240239335157', NULL, '$2y$10$mIF8y7CKtUXvdtYZDPK/8u55l6bjYglSAoXsm37dLvoIC9a4rDXra', 0, NULL, 1, '2022-01-13 08:31:39', '2022-01-13 09:56:43'),
(136, 'Ravo Uche', 'uche24644@schoolpetal.com', 1, 6, NULL, NULL, '24164469217604547', NULL, '$2y$10$M4y5IejUViMsX/ZTavb6meFtyNbXrICL85CLMFFM2twGe/uCf7.yG', 0, NULL, 1, '2022-01-13 08:31:39', '2022-01-13 09:56:43'),
(137, 'Braid Bash', 'bash8716@schoolpetal.com', 1, 6, NULL, NULL, '51893080914376462', NULL, '$2y$10$bBV6EdM1svgLU0lQhHy5d.8s8UPgT/lJc6G1jh4eZ6YJaPqANOkJ2', 0, NULL, 1, '2022-01-13 08:31:39', '2022-01-13 09:56:43'),
(138, 'Uche Doe', 'doe48545@schoolpetal.com', 1, 6, NULL, NULL, '10102045563800460', NULL, '$2y$10$2/1rTjJxo3gWM8a4zQW5muEnl9SNK6hKFbg7guyZOF6tLQrLna2dC', 0, NULL, 1, '2022-01-13 08:31:39', '2022-01-13 09:56:43'),
(139, 'Doe Ammon', 'ammon74472@schoolpetal.com', 1, 9, NULL, NULL, '25308501735923065', NULL, '$2y$10$ZRDTlechrmvCHpyExPsTi.A5ujuhgSUUgSxfp6M6L5cxfO7Zmb7NK', 0, NULL, 1, '2022-01-13 08:31:40', '2022-01-13 09:56:43'),
(140, 'Dollar Yoncy', 'yoncy99259@schoolpetal.com', 1, 9, NULL, NULL, '53383542021047078', NULL, '$2y$10$2CMRJXqcPTdeEbkCe06xCuTHmjTLyYncCOrxofA5l7QkLKKng/2zC', 0, NULL, 1, '2022-01-13 08:31:40', '2022-01-13 09:56:43'),
(141, 'Yoncy Joe', 'joe84360@schoolpetal.com', 1, 8, NULL, NULL, '44795787360309736', NULL, '$2y$10$zN63rYCDln0bZ3Cj3AopZev8GfBKCx6h./y.SXYiejwXCRt2D3f0y', 0, NULL, 1, '2022-01-13 08:31:40', '2022-01-13 09:56:43'),
(142, 'Joe Nimi', 'nimi3251@schoolpetal.com', 1, 7, NULL, NULL, '11779916072775172', NULL, '$2y$10$wPO0rf6v8kP5rx2HWT2b5OFTHI80eFvTx7NdMOYmS/joFf3vcIIoC', 0, NULL, 1, '2022-01-13 08:31:40', '2022-01-13 09:56:43'),
(143, 'Gideon Samuel', 'samuel35180@schoolpetal.com', 1, 7, NULL, NULL, '42315754419816946', NULL, '$2y$10$6a.XEB2uU73MlTKkp4q43eo7uCD2bo/b7ymY.L9ORRNoK0TBNnZRa', 0, NULL, 1, '2022-01-13 08:31:40', '2022-01-13 09:56:43'),
(144, 'Blaze Tem', 'tem18541@schoolpetal.com', 1, 6, NULL, NULL, '25896934885734374', NULL, '$2y$10$qBh4j6oXvdEhqj9cMtxVo.YNiCTq5kDpF4vb0t5zaUWcfFKlzq.Zm', 0, NULL, 1, '2022-01-13 08:31:40', '2022-01-13 09:56:43'),
(145, 'Dayo Gideon', 'gideon32803@schoolpetal.com', 1, 6, NULL, NULL, '1729483822078650', NULL, '$2y$10$hxIZiIepcEPdQ9X3VVI7QO5BRyKjk90Egn9sN.L3E/Ru67uLb1csa', 0, NULL, 1, '2022-01-13 08:31:41', '2022-01-13 09:56:43'),
(146, 'Blaze Poe', 'poe58699@schoolpetal.com', 1, 7, NULL, NULL, '34829303149605489', NULL, '$2y$10$PgU41p5OEmvHDmCx3bbpL..4ukJ59j1JYME7FH9rzIHlfbRIRT3Eu', 0, NULL, 1, '2022-01-13 08:31:41', '2022-01-13 09:56:43'),
(147, 'Dorcas Nimi', 'nimi2667@schoolpetal.com', 1, 6, NULL, NULL, '55719388103852299', NULL, '$2y$10$lGMhq2GBCJiDlTmHodL5Q.2Vzmz2oK9ivt07p/3fvBI4p9OzJUzYa', 0, NULL, 1, '2022-01-13 08:31:41', '2022-01-13 09:56:43'),
(148, 'Yoncy Gideon', 'gideon64373@schoolpetal.com', 1, 6, NULL, NULL, '61894303819923980', NULL, '$2y$10$xsM8bqPfQ4/sUVOieG4NLe7PCVXFTj3dDCxX8BR4Cy2xiPvdwBbBa', 0, NULL, 1, '2022-01-13 08:31:41', '2022-01-13 09:56:43'),
(149, 'Doe Ammon', 'ammon70845@schoolpetal.com', 1, 8, NULL, NULL, '67869304922399611', NULL, '$2y$10$sC2TOxcOCNv0UDhU4pGeI.rNB4s8gjzK9OQh30r29CKfHkZ6yTnN2', 0, NULL, 1, '2022-01-13 08:31:41', '2022-01-13 09:56:43'),
(150, 'Nimi Braid', 'braid80671@schoolpetal.com', 1, 9, NULL, NULL, '1818813420439403', NULL, '$2y$10$xeBfIJpam610IadGrD5as.MB1UJOgFW7bM90BaTZWgV6LEHtU/IZK', 0, NULL, 1, '2022-01-13 08:31:41', '2022-01-13 09:56:43'),
(151, 'Perry Samuel', 'samuel87934@schoolpetal.com', 1, 6, NULL, NULL, '9325160963090349', NULL, '$2y$10$7QrSBwXmzDekTCMstG43puEcA8fcB.68SsxzQDM2IjjjLrQz9Unz6', 0, NULL, 1, '2022-01-13 08:31:42', '2022-01-13 09:56:43'),
(152, 'Tem Bowy', 'bowy83149@schoolpetal.com', 1, 8, NULL, NULL, '6322510788385787', NULL, '$2y$10$0CcteIyChQ9405uhJcHyg.LAe7RIclF4LXQ07OaBq0haV44CCwGDG', 0, NULL, 1, '2022-01-13 08:31:42', '2022-01-13 09:56:43'),
(153, 'Boss Dayo', 'dayo31395@schoolpetal.com', 1, 8, NULL, NULL, '89796088869978943', NULL, '$2y$10$mPk4dxbh26FrWsUI3qEi0udxwlG2MNRvsWwXmiSgyAE.PWhxvwg3W', 0, NULL, 1, '2022-01-13 08:31:42', '2022-01-13 09:56:43'),
(154, 'Bash Blaze', 'blaze14655@schoolpetal.com', 1, 8, NULL, NULL, '65414477587247601', NULL, '$2y$10$bOMDSUzaNG0ktgT8bEyNJuFEHX//gfNBeK8mwsalP.GcCvw2A1ONG', 0, NULL, 1, '2022-01-13 08:31:42', '2022-01-13 09:56:43'),
(155, 'Nimi Dollar', 'dollar16317@schoolpetal.com', 1, 7, NULL, NULL, '20976675894174339', NULL, '$2y$10$GlKsI0QLnNAQHW.Icz71ZuoCljSBx/iyYo70QkRg069ReloQe33hW', 0, NULL, 1, '2022-01-13 08:31:42', '2022-01-13 09:56:43'),
(156, 'Yoncy Joe', 'joe24201@schoolpetal.com', 1, 9, NULL, NULL, '10232314396585688', NULL, '$2y$10$h53bb45qAAK2JUXXumteteOSzfavMC45.3fg9Hp4lq9wKZxLI6ZqW', 0, NULL, 1, '2022-01-13 08:31:42', '2022-01-13 09:56:43'),
(157, 'Jay Yoncy', 'yoncy16198@schoolpetal.com', 1, 9, NULL, NULL, '64151242318032086', NULL, '$2y$10$ZzEsJvuFcy0TbZjDBpbH0eXJ2Z..mf3rw21vFfIYi7pKaTedx8I8.', 0, NULL, 1, '2022-01-13 08:31:43', '2022-01-13 09:56:43'),
(158, 'Uche Yusuf', 'yusuf63686@schoolpetal.com', 1, 7, NULL, NULL, '76395605312194766', NULL, '$2y$10$5CuskzsICmNEXR7Pf0XpK.haMmL2Ge62sYHBVgwiq/A5SFQLo.AXq', 0, NULL, 1, '2022-01-13 08:31:43', '2022-01-13 09:56:43'),
(159, 'Poe Ammon', 'ammon65417@schoolpetal.com', 1, 9, NULL, NULL, '28812189975840406', NULL, '$2y$10$Gx39GI5FEGihmFKxzrnDnuL1yDnxufiAx4EDmDTujLFSQIK6mHZMC', 0, NULL, 1, '2022-01-13 08:31:43', '2022-01-13 09:56:43'),
(160, 'Samuel Uche', 'uche13894@schoolpetal.com', 1, 7, NULL, NULL, '10361567206257376', NULL, '$2y$10$QvmtrtWW.YpV2qzsLZelw.ll9c2Y7FiMg4qEUl3AKbfe/jCF3NPpi', 0, NULL, 1, '2022-01-13 08:31:43', '2022-01-13 09:56:43'),
(161, 'Dorcas Poe', 'poe28944@schoolpetal.com', 1, 8, NULL, NULL, '55394413870943991', NULL, '$2y$10$hu5kgMofRioI7UZGHXKO8efxxs7hCCI.PT/JD6sDd1ud7b7lkK2u.', 0, NULL, 1, '2022-01-13 08:31:43', '2022-01-13 09:56:43'),
(162, 'Park Grace', 'grace81278@schoolpetal.com', 1, 7, NULL, NULL, '64910795468132667', NULL, '$2y$10$07DlsXBMtrJa19qjseL6L.8WcQ6U.9xCEbEJtavqieso3gvkYbAeG', 0, NULL, 1, '2022-01-13 08:31:43', '2022-01-13 09:56:44'),
(163, 'Ammon Grace', 'grace7243@schoolpetal.com', 1, 7, NULL, NULL, '19405243475435362', NULL, '$2y$10$6sWGSnIPPy/hZ0cXtHzV1.HmwfCdqdQyov7QsXTLuj2xRwU0OrYPm', 0, NULL, 1, '2022-01-13 08:31:44', '2022-01-13 09:56:44'),
(164, 'Doe Perry', 'perry2192@schoolpetal.com', 1, 8, NULL, NULL, '34000330324750352', NULL, '$2y$10$D/rnAFVO1dGZviaUCEvwUuiI1s1N6A55py8sIyMQ96EbT0f6.MBxi', 0, NULL, 1, '2022-01-13 08:31:44', '2022-01-13 09:56:44'),
(165, 'Park Blaze', 'blaze23280@schoolpetal.com', 1, 7, NULL, NULL, '49923881236942964', NULL, '$2y$10$cWZOF8g0Z/CrImGpqYdbZ./6HNUtBpvhUUweH9/zJzz6aHYcWOuue', 0, NULL, 1, '2022-01-13 08:31:44', '2022-01-13 09:56:44'),
(166, 'Poe Yoncy', 'yoncy88954@schoolpetal.com', 1, 6, NULL, NULL, '94440011748802397', NULL, '$2y$10$tJrE06MpEN26Sb6z4.pUdOwW4SyzihFohniV/TSbY2jMeLF7tGEMW', 0, NULL, 1, '2022-01-13 08:31:44', '2022-01-13 09:56:44'),
(167, 'Gideon Moscow', 'moscow33697@schoolpetal.com', 1, 6, NULL, NULL, '53305038812187319', NULL, '$2y$10$8VcFYwLTaZESNPbYpT0v0.aUhxGEKrG/PIb4VAk634jBil.cyZke6', 0, NULL, 1, '2022-01-13 08:31:44', '2022-01-13 09:56:44'),
(168, 'Ravo Jazzy', 'jazzy55922@schoolpetal.com', 1, 8, NULL, NULL, '43563227931541338', NULL, '$2y$10$Uz1p0uf/I/iYaZY3JBL2tum2f.lL.JcihkT2S6zudB/ITKSwRU0AC', 0, NULL, 1, '2022-01-13 08:31:45', '2022-01-13 09:56:44'),
(169, 'Yoncy Tem', 'tem50464@schoolpetal.com', 1, 6, NULL, NULL, '24321878759096303', NULL, '$2y$10$SSje5HDvsIFEvPBWT/fZY.B0V3tKXgzgvHYR4yNn4ljaVctzrNDA6', 0, NULL, 1, '2022-01-13 08:31:45', '2022-01-13 09:56:44'),
(170, 'Jazzy Perry', 'perry20452@schoolpetal.com', 1, 7, NULL, NULL, '28379621378282263', NULL, '$2y$10$aM9SvnOIAwz5o0JENU0Dx.7WuarYeh0VwDy//vQ3ZaS0zZV6a8czK', 0, NULL, 1, '2022-01-13 08:31:45', '2022-01-13 09:56:44'),
(171, 'Ammon Grace', 'grace63399@schoolpetal.com', 1, 6, NULL, NULL, '62936248705779118', NULL, '$2y$10$66LRT/uHtDrgMjuh4CviFORyzDb/hxyGJ5ltM.SVGokY/cP03wvn.', 0, NULL, 1, '2022-01-13 08:31:45', '2022-01-13 09:56:44'),
(172, 'Boss Braid', 'braid18930@schoolpetal.com', 1, 9, NULL, NULL, '5323282790206170', NULL, '$2y$10$o4ykdWbELhyXqWwtoh25KOskjp2SVPCvf5iT0Kdcl1m4nFY..aosu', 0, NULL, 1, '2022-01-13 08:31:45', '2022-01-13 09:56:44'),
(173, 'Gideon Moscow', 'moscow92681@schoolpetal.com', 1, 8, NULL, NULL, '55658099664056167', NULL, '$2y$10$5FgV8dk7Y7Y7aYY.i6keceS4wS35XkeCWJC9tEYZwMo17ZQKx7yiG', 0, NULL, 1, '2022-01-13 08:38:22', '2022-01-13 09:56:44'),
(174, 'Boss Doe', 'doe49571@schoolpetal.com', 1, 9, NULL, NULL, '66004637755799045', NULL, '$2y$10$3nzrXAtjE3IrqqUzv6r0yu/y6YuiXoFubnwR4XcENgrJ0AQOJXmw6', 0, NULL, 1, '2022-01-13 08:38:22', '2022-01-13 09:56:44'),
(175, 'Moscow Yusuf', 'yusuf49142@schoolpetal.com', 1, 7, NULL, NULL, '29056935479746095', NULL, '$2y$10$cM1cjJy9mB/59Cy.gEb28unrs5yL3uzI9C6gyvLeJQj8kGULHS5ne', 0, NULL, 1, '2022-01-13 08:38:22', '2022-01-13 09:56:44'),
(176, 'Jay Yusuf', 'yusuf26082@schoolpetal.com', 1, 9, NULL, NULL, '7220731796805628', NULL, '$2y$10$mme7iaNbkHU05zQ3p3cmYuvq89d5tvwM5JAneyzN3WOC/wuK/OQjm', 0, NULL, 1, '2022-01-13 08:38:23', '2022-01-13 09:56:44'),
(177, 'Bash Grace', 'grace38796@schoolpetal.com', 1, 9, NULL, NULL, '35539293205056378', NULL, '$2y$10$VIMmDzmnzJK7boE3JcZGXuZHX8xd6O5e8aS1lwnMrhwZbJfwT7PjK', 0, NULL, 1, '2022-01-13 08:38:23', '2022-01-13 09:56:44'),
(178, 'Yusuf Doe', 'doe5102@schoolpetal.com', 1, 8, NULL, NULL, '94592354069930625', NULL, '$2y$10$6yHR2kpuzYru80/89bTrve.1BoD4vANlrcNFdLN7h3BCObX.luJKe', 0, NULL, 1, '2022-01-13 08:38:23', '2022-01-13 09:56:44'),
(179, 'Park Doe', 'doe64264@schoolpetal.com', 1, 8, NULL, NULL, '53242828661158157', NULL, '$2y$10$oNKrMzlZsfHLBqxbz/I33.LRVFoynhmhNfSEaIp8hA/yC/77f.nma', 0, NULL, 1, '2022-01-13 08:38:23', '2022-01-13 09:56:44'),
(180, 'Park Ammon', 'ammon39040@schoolpetal.com', 1, 8, NULL, NULL, '51749104199160844', NULL, '$2y$10$Gasa6bOlwCZzNe17jzzzTefls1T.CN4tIs.o15fnBT2tPd1jPfUwO', 0, NULL, 1, '2022-01-13 08:38:24', '2022-01-13 09:56:44'),
(181, 'Bash Samuel', 'samuel86475@schoolpetal.com', 1, 8, NULL, NULL, '12765197012311372', NULL, '$2y$10$oKTv2Veu5MtuCrHfu7Axlug4ls6vjeoTHqD7wNe2XgQIwGSI5Ghi.', 0, NULL, 1, '2022-01-13 08:38:24', '2022-01-13 09:56:44'),
(182, 'Jazzy Dayo', 'dayo56527@schoolpetal.com', 1, 9, NULL, NULL, '10759525134482276', NULL, '$2y$10$VjjjF2dfhZiCVRcvKMO6zu3pIPV8Iv2Z1LpeZ0JhvkTNTTjV2ZP/q', 0, NULL, 1, '2022-01-13 08:38:24', '2022-01-13 09:56:44'),
(183, 'Dollar Ravo', 'ravo24980@schoolpetal.com', 1, 8, NULL, NULL, '33300918896913027', NULL, '$2y$10$e7aTRoOce75TgKAbiWmk2ODSuuu31JojRGzbc9JL5aImYdXdG.PLa', 0, NULL, 1, '2022-01-13 08:38:24', '2022-01-13 09:56:44'),
(184, 'Nimi Bash', 'bash3574@schoolpetal.com', 1, 7, NULL, NULL, '10625334287416955', NULL, '$2y$10$VZkTkjkgNg9yOiUsHYaVG.bTqcYLVLk6e0.X/sE7DhqQwM56udb6C', 0, NULL, 1, '2022-01-13 08:38:25', '2022-01-13 09:56:44'),
(185, 'Tem Braid', 'braid37709@schoolpetal.com', 1, 8, NULL, NULL, '67534320979374542', NULL, '$2y$10$uB3Qi1J/6/hUSPrs8jrHZu1tm5fVVJgLSH.DPBS2lQUxzj9hsciWC', 0, NULL, 1, '2022-01-13 08:38:25', '2022-01-13 09:56:44'),
(186, 'Uche Moscow', 'moscow31958@schoolpetal.com', 1, 8, NULL, NULL, '11308752524689639', NULL, '$2y$10$IK.cWnJQCU9xmK1fPRC4xeqUETMN4d6tXU1hzgCclxw0KeourNWL2', 0, NULL, 1, '2022-01-13 08:38:25', '2022-01-13 09:56:44'),
(187, 'Dorcas Saliu', 'saliu25558@schoolpetal.com', 1, 7, NULL, NULL, '55513999506024031', NULL, '$2y$10$h/wDruHOejI7TvzeAHSVtOmGqnJ1vrmDFVrbTRiAn8q418k2FWvQi', 0, NULL, 1, '2022-01-13 08:38:25', '2022-01-13 09:56:44'),
(188, 'Blaze Blaze', 'blaze74976@schoolpetal.com', 1, 8, NULL, NULL, '38614346808020772', NULL, '$2y$10$M5idxLz2iCE9aY31vZJwfeBFgS34psuxXogfYxZ074OY/6xwJZntW', 0, NULL, 1, '2022-01-13 08:38:25', '2022-01-13 09:56:44'),
(189, 'Ravo Valentine', 'valentine31554@schoolpetal.com', 1, 6, NULL, NULL, '15198009791860646', NULL, '$2y$10$mPwFezzTpjqUZq25Dh4At.JhtxOhi4WvMpNI1Pge7ZF4fB8khitaK', 0, NULL, 1, '2022-01-13 08:38:26', '2022-01-13 09:56:44'),
(190, 'Ravo Ammon', 'ammon28810@schoolpetal.com', 1, 9, NULL, NULL, '72309389183612927', NULL, '$2y$10$r/bV6viV/5bUm8usNOun0eqFoG8tnANJLJKQfcmndsMP7sXQZNg.2', 0, NULL, 1, '2022-01-13 08:38:26', '2022-01-13 09:56:44'),
(191, 'Kaka Joe', 'joe4105@schoolpetal.com', 1, 9, NULL, NULL, '75149584477139646', NULL, '$2y$10$TW3AZ6qIrd.4ZWux1HSqveWZneN6GtyCfB1O2gvUamNw3R7aGvLdm', 0, NULL, 1, '2022-01-13 08:38:26', '2022-01-13 09:56:44'),
(192, 'Saliu Dayo', 'dayo43365@schoolpetal.com', 1, 8, NULL, NULL, '54909117079140008', NULL, '$2y$10$M.4rcm4KaRvYdwBCyg2e1uMnNiqpl5p5BbX7peNACxXssYRqB2mxS', 0, NULL, 1, '2022-01-13 08:38:26', '2022-01-13 09:56:44'),
(193, 'Nimi Braid', 'braid73742@schoolpetal.com', 1, 8, NULL, NULL, '90208222600377069', NULL, '$2y$10$GDcuCB3D.9mOUTy9C2ZfjuvgTny7CTF8XhJPe7xhn335jdfcYU6cW', 0, NULL, 1, '2022-01-13 08:38:26', '2022-01-13 09:56:44'),
(194, 'Kaka Jay', 'jay50341@schoolpetal.com', 1, 9, NULL, NULL, '92545760602014870', NULL, '$2y$10$igYfE6pVxZy3ItZL4OqR2ORtj.fkRlX8fsnxXL4RXHo9dnhxKVqAe', 0, NULL, 1, '2022-01-13 08:38:26', '2022-01-13 09:56:44'),
(195, 'Blaze Jay', 'jay76006@schoolpetal.com', 1, 9, NULL, NULL, '89684695656863956', NULL, '$2y$10$OaR2PPW6ZQPfep0SFZKtqOcuPvLKaBlB9zLziG92FPYbZUUSuJtCm', 0, NULL, 1, '2022-01-13 08:38:27', '2022-01-13 09:56:44'),
(196, 'Bowy Ravo', 'ravo8763@schoolpetal.com', 1, 8, NULL, NULL, '48639834407732872', NULL, '$2y$10$l3Y8wcKbe/R9r9MCR9b00.GWaW7Pyrgto5jqY/9RZQslHz1LN0uqq', 0, NULL, 1, '2022-01-13 08:38:27', '2022-01-13 09:56:45'),
(197, 'Grace Braid', 'braid96177@schoolpetal.com', 1, 8, NULL, NULL, '77081250748989821', NULL, '$2y$10$1Lr.zUoHg.MEIzFDMXzhqu4prY0.FV9S6UbDnCc3m8NCXaxXoCpPW', 0, NULL, 1, '2022-01-13 08:38:27', '2022-01-13 09:56:45'),
(198, 'Blaze Dorcas', 'dorcas23834@schoolpetal.com', 1, 9, NULL, NULL, '56412690031800883', NULL, '$2y$10$yNKv0wikKnf9X5Qpw8t1J.eve0EE/70SJYjaQvY9rs8L/IVV1BHFO', 0, NULL, 1, '2022-01-13 08:38:27', '2022-01-13 09:56:45'),
(199, 'Boss Ravo', 'ravo13333@schoolpetal.com', 1, 9, NULL, NULL, '73838979835556936', NULL, '$2y$10$R7VPuq74blBd0LxrowhgPuE60VPvxWxqjK0EpG6UYxvir67VaXUt2', 0, NULL, 1, '2022-01-13 08:38:27', '2022-01-13 09:56:45'),
(200, 'Tem Perry', 'perry18503@schoolpetal.com', 1, 8, NULL, NULL, '96937569588959549', NULL, '$2y$10$bYEMaimn6Lz.ds3E4fi58uE6JtfCH0zDj7vQgaviC//87HHJd0qHK', 0, NULL, 1, '2022-01-13 08:38:28', '2022-01-13 09:56:45'),
(201, 'Uche Ravo', 'ravo63932@schoolpetal.com', 1, 8, NULL, NULL, '31399133861394223', NULL, '$2y$10$bY/bfPFBJmJwrq3/0empZuRt65OTEEzeBIv7R6gNJhgKaliSUpi0O', 0, NULL, 1, '2022-01-13 08:38:28', '2022-01-13 09:56:45'),
(202, 'Gideon Jazzy', 'jazzy65700@schoolpetal.com', 1, 8, NULL, NULL, '60544676283453598', NULL, '$2y$10$L4a9q65K/hMpgZwX9qjpY.p1g3s5nnqEOp6JpvAo0WSqqg5WKwouS', 0, NULL, 1, '2022-01-13 08:38:28', '2022-01-13 09:56:45'),
(203, 'Perry Jazzy', 'jazzy15280@schoolpetal.com', 1, 6, NULL, NULL, '11855161291925014', NULL, '$2y$10$GZo9nQFll79C6RP0.lB/tuNpfA6K6bFROENj57R2Tq8VA8CZ1x8J.', 0, NULL, 1, '2022-01-13 08:38:28', '2022-01-13 09:56:45'),
(204, 'Yusuf Joe', 'joe23148@schoolpetal.com', 1, 9, NULL, NULL, '78857047337755373', NULL, '$2y$10$1zugI1skacmRPlA9FcsGJePq2M5.fh6VvrJvMsNBc9HXs5jgQtzdi', 0, NULL, 1, '2022-01-13 08:38:28', '2022-01-13 09:56:45'),
(205, 'Valentine Dayo', 'dayo28201@schoolpetal.com', 1, 9, NULL, NULL, '46729966480399117', NULL, '$2y$10$Vf2n89mM8nWnkubcYU771e8vBovxw0yTvIiEbJc3fXMTIOfeTC3hm', 0, NULL, 1, '2022-01-13 08:38:28', '2022-01-13 09:56:45'),
(206, 'Braid Dorcas', 'dorcas41170@schoolpetal.com', 1, 7, NULL, NULL, '39239563556707545', NULL, '$2y$10$NLGCxHqVi0PfdWtYt6O2ieKww3v885eqssSxPrsOhv/hovrOFS7Q.', 0, NULL, 1, '2022-01-13 08:38:28', '2022-01-13 09:56:45'),
(207, 'Grace Samuel', 'samuel18728@schoolpetal.com', 1, 6, NULL, NULL, '97273234829806236', NULL, '$2y$10$0UyCRCzVVGHIsXVsNEgsG.J9QNT.W.awE2Oz05STCp7AlY8BQ/5v2', 0, NULL, 1, '2022-01-13 08:38:29', '2022-01-13 09:56:45'),
(208, 'Saliu Park', 'park1619@schoolpetal.com', 1, 8, NULL, NULL, '86951652401861953', NULL, '$2y$10$VKuvEtZTmEXWTo2ZSg9l3.gBjWLUZjMWisWuoL4/Q6HFPNSTh9LBa', 0, NULL, 1, '2022-01-13 08:38:29', '2022-01-13 09:56:45'),
(209, 'Dorcas Ammon', 'ammon18194@schoolpetal.com', 1, 7, NULL, NULL, '88523656201020394', NULL, '$2y$10$Sf2MJUl.G70Kp4P.G1TryuHk7oUQaa899BZ2FdMT0u/rZL4vwOpJy', 0, NULL, 1, '2022-01-13 08:38:29', '2022-01-13 09:56:45'),
(210, 'Gideon Uche', 'uche69652@schoolpetal.com', 1, 6, NULL, NULL, '48993742604402661', NULL, '$2y$10$Eih2LmZcZDKX7ihR1wUaj.wJQhBHd.87m9e.TxoBu/KIcawvm0aPe', 0, NULL, 1, '2022-01-13 08:38:29', '2022-01-13 09:56:45'),
(211, 'Dorcas Poe', 'poe81503@schoolpetal.com', 1, 9, NULL, NULL, '77406768036413910', NULL, '$2y$10$3Lm.9MoA.GWpY.KwCO4ePe5/v./QixkxVCg/VjQd3JXjIFIW9Ecbe', 0, NULL, 1, '2022-01-13 08:38:29', '2022-01-13 09:56:45'),
(212, 'Doe Blaze', 'blaze6887@schoolpetal.com', 1, 6, NULL, NULL, '90800182321905834', NULL, '$2y$10$ZscjPToC3ftxV/N.tb.8iOeC4HqNl7p4G8LjKQyGBBcNx/tyfTsva', 0, NULL, 1, '2022-01-13 08:38:30', '2022-01-13 09:56:45'),
(213, 'Jazzy Samuel', 'samuel74179@schoolpetal.com', 1, 9, NULL, NULL, '57166367701215296', NULL, '$2y$10$rcYsXCoDodJaPEf0OXqey.RrUBpk/SgJ1zVU.opOxnE2CWTxIp7m2', 0, NULL, 1, '2022-01-13 08:38:30', '2022-01-13 09:56:45'),
(214, 'Jay Bowy', 'bowy2251@schoolpetal.com', 1, 8, NULL, NULL, '98997975293927581', NULL, '$2y$10$I74eynM8KZyVEvDvl4ARq.iwsb/Uf78Rr4AlNzQqG0FNpwU5ymaKS', 0, NULL, 1, '2022-01-13 08:38:30', '2022-01-13 09:56:45'),
(215, 'Ushie Dollar', 'dollar62292@schoolpetal.com', 1, 8, NULL, NULL, '71980380436478062', NULL, '$2y$10$8O2ocOoGStZtw/aBZ/65Q.rsIsuZUUDYUmVP/9fE.NNa51g7Cf0.2', 0, NULL, 1, '2022-01-13 08:38:30', '2022-01-13 09:56:45'),
(216, 'Dollar Dayo', 'dayo97719@schoolpetal.com', 1, 7, NULL, NULL, '9259221209373829', NULL, '$2y$10$gTOVQhR1.HHuUcGFZLkN2eYTtJqLHh.qGPwt.bnxpXfBqpPXyGMGq', 0, NULL, 1, '2022-01-13 08:38:31', '2022-01-13 09:56:46'),
(217, 'Nimi Poe', 'poe85055@schoolpetal.com', 1, 8, NULL, NULL, '15012230602652782', NULL, '$2y$10$sQYOCmprYqSLPMoJjEUUTegL4cDw2AfXhFwYqNf2eLy3ZodAOc2PC', 0, NULL, 1, '2022-01-13 08:38:31', '2022-01-13 09:56:46'),
(218, 'Gideon Poe', 'poe45772@schoolpetal.com', 1, 7, NULL, NULL, '20139397184352972', NULL, '$2y$10$6p3uRAzZ6nZEcMixSyGFTOcGk5o8qq8YE0wyEpgIAfeJOXe4IGIxa', 0, NULL, 1, '2022-01-13 08:38:31', '2022-01-13 09:56:46'),
(219, 'Samuel Nimi', 'nimi38786@schoolpetal.com', 1, 9, NULL, NULL, '96329124596500825', NULL, '$2y$10$vq4UcdqD2q08Bh5R1APoE.vG3c2rI3fI5UJkBHsxXPnxgntCgaMtG', 0, NULL, 1, '2022-01-13 08:38:31', '2022-01-13 09:56:46'),
(220, 'Ravo Gideon', 'gideon88053@schoolpetal.com', 1, 8, NULL, NULL, '2160102582727397', NULL, '$2y$10$A9b1xqxMXfXkqkkYwCnFDO7lcZwXchB2Ndv1kbPUQ1tifSAqtMWGm', 0, NULL, 1, '2022-01-13 08:38:31', '2022-01-13 09:56:46'),
(221, 'Uche Jay', 'jay59844@schoolpetal.com', 1, 8, NULL, NULL, '27278288163991279', NULL, '$2y$10$3XrsNUsX6r/83OxnBk6wXeRQvn7yV7Uyhnzbv89KaEwQyMEw4ZiRG', 0, NULL, 1, '2022-01-13 08:38:31', '2022-01-13 09:56:46'),
(222, 'Ravo Tem', 'tem87395@schoolpetal.com', 1, 7, NULL, NULL, '7262747913998721', NULL, '$2y$10$DOnyWud2lx7rK1Cg7RPcje3PKtValEz2i0l3aWXYQBB72aheE3Efe', 0, NULL, 1, '2022-01-13 08:38:32', '2022-01-13 09:56:46'),
(223, 'Bash Perry', 'perry54518@schoolpetal.com', 1, 8, NULL, NULL, '13134558809318369', NULL, '$2y$10$6E.FHbMii5LFXmVzeMA1wOKOplJuKvUzaf9HvwmcPGjyQD1d06t6.', 0, NULL, 1, '2022-01-13 08:38:32', '2022-01-13 09:56:46'),
(224, 'Nimi Braid', 'thomasonyemechi03@gmail.com', 1, 9, NULL, NULL, '08067544387', NULL, '$2y$10$KPC/XwJMkzdeD37fdUHa0ucQ/4B7hoqu5g3tONtXPAGp3O4mtk73u', 0, NULL, 1, '2022-01-13 13:14:01', '2022-01-13 13:14:01'),
(225, 'thomasonyemechi', 'admin@agile.com', 1, 8, NULL, NULL, '09038772366', NULL, '$2y$10$DJ5nSoze5UOKrMQX.fEZcOWdJXYSisup4hyS0Li.CSyLvCcEKoIua', 0, NULL, 1, '2022-01-13 14:15:03', '2022-01-13 14:15:03'),
(226, 'Mouse Pads', 'ajidax01@gmail.com', 1, 9, NULL, NULL, '73473742', NULL, '$2y$10$cBxlCAATlVEhU8tbFW8cV.6AefQ3fgA6m.dBWSszQkh.M8bCIU5J2', 0, NULL, 1, '2022-01-13 14:16:07', '2022-01-13 14:16:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_arms`
--
ALTER TABLE `class_arms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_categories`
--
ALTER TABLE `class_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_cores`
--
ALTER TABLE `class_cores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fee_categories`
--
ALTER TABLE `fee_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result_summaries`
--
ALTER TABLE `result_summaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_subjects`
--
ALTER TABLE `set_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_arms`
--
ALTER TABLE `class_arms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `class_categories`
--
ALTER TABLE `class_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `class_cores`
--
ALTER TABLE `class_cores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_categories`
--
ALTER TABLE `fee_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result_summaries`
--
ALTER TABLE `result_summaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `set_subjects`
--
ALTER TABLE `set_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
