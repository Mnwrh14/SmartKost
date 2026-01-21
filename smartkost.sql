-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2026 at 02:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartkost`
--

-- --------------------------------------------------------

--
-- Table structure for table `boarding_houses`
--

CREATE TABLE `boarding_houses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boarding_houses`
--

INSERT INTO `boarding_houses` (`id`, `name`, `slug`, `thumbnail`, `city_id`, `category_id`, `description`, `price`, `address`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Royal Palace', 'royal-palace', 'boarding-houses/01KD7MMMNXB9N7DPP1BVV7XSSY.jpg', 1, 1, '<p>With fast WIFI and comfortable kitchen, with an Hotel is ready to be a place good Working From Home, a quick escape reality</p>', 500000, 'Jalan Husein  Sastranegara No.Kav. 1', NULL, '2025-12-23 23:37:10', '2026-01-06 19:18:56'),
(2, 'Svara Apartment', 'svara-apartment', 'boarding-houses/01KEB8AP7W9VG1TM6VCJQPVXGN.jpg', 3, 2, '<p>With fast WIFI and comfortable kitchen, with an apartment is ready to be a place good Working From Home, a quick escape reality</p>', 6800000, 'Jl. DR. Sardjito, Terban, Gondokusuman, Yogyakarta City, Special Region of Yogyakarta 55223, Indonesia.', NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(3, 'Kala Resort', 'kala-resort', 'boarding-houses/01KFFZW9ZW66NGWJEQR0DEAA2R.jpg', 2, 3, '<p>Experience a serene getaway with breathtaking natural views and world-class amenities designed for your ultimate relaxation.</p>', 1500000, 'Jl. Kartika Plaza, Tuban, Kec. Kuta, Kabupaten Badung, Bali 80361', NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(4, 'The Misty Mountain Villa', 'the-misty-mountain-villa', 'boarding-houses/01KFG1KNT6HMDHEMG7NJSQR3YA.jpg', 4, 4, '<p>Experience ultimate tranquility in this stunning tropical villa. Nestled amidst lush greenery with a breathtaking mountain backdrop, this property features a private infinity pool, modern wooden architecture, and spacious open-air living areas designed for your perfect escape.</p>', 4500000, 'Jl. Dago Pakar Permai I No. 9 Kav. 96, Mekarsaluyu, Kec. Cimenyan, Kabupaten Bandung, Jawa Barat 40198.', NULL, '2026-01-21 02:29:09', '2026-01-21 02:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

CREATE TABLE `bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `boarding_house_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bonuses`
--

INSERT INTO `bonuses` (`id`, `boarding_house_id`, `image`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'bonuses/01KD7MMMVV6ZSNZ76EK47Q0M1Q.jpg', 'Clean Laundry', 'Super Fast', NULL, '2025-12-23 23:37:10', '2025-12-23 23:37:10'),
(2, 1, 'bonuses/01KD7MMMW1DMW98R2QJN80RD4B.jpg', 'Healthy Catering', 'Animal Base', NULL, '2025-12-23 23:37:10', '2025-12-23 23:37:10'),
(3, 1, 'bonuses/01KD7MMMW7ZYY2Y14539GZXYPQ.jpg', 'Coworkin Space', 'Comportable', NULL, '2025-12-23 23:37:10', '2025-12-23 23:37:10'),
(4, 2, 'bonuses/01KEB8AP8Q1B837VN7K85PT8JX.jpg', 'Kitchen', 'Modern Minimalist', NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(5, 2, 'bonuses/01KEB8AP8T6G7WGVQXQS22BB43.jpg', 'Living Room', 'Cozy and Functional', NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(6, 2, 'bonuses/01KEB8AP8Y2W3JPV1D3EG9WHVV.jpg', 'Bathroom', 'Clean and Modern', NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(7, 2, 'bonuses/01KEB8AP93ZEPSWPFE5ZSEGT5C.jpg', 'Laundry Area', 'Clean and Functional', NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(8, 3, 'bonuses/01KFFZWA3DTRWRYNMQB0KYMX8P.jpg', 'View', 'A very beautiful view and pleasing to the eyes', NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(9, 3, 'bonuses/01KFFZWA3JS10XCPCMB0HQJY4B.jpg', 'Food', 'Delicious food with beautiful views', NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(10, 3, 'bonuses/01KFFZWA3QCHPCXSF92NSJ6G36.jpg', 'Beach', 'Beautiful beach with blue sea', NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(11, 4, 'bonuses/01KFG1KPJJB3DAFEAKY0VR9HW1.jpg', 'Swimming Pool', 'Swimming pool with natural beauty', NULL, '2026-01-21 02:29:09', '2026-01-21 02:29:09'),
(12, 4, 'bonuses/01KFG1KPJQ5ABYPHJ9CN1G8DVP.jpg', 'Living Area', 'Comfortabel and charming living room', NULL, '2026-01-21 02:29:09', '2026-01-21 02:29:09'),
(13, 4, 'bonuses/01KFG1KPJVQW3GP8Q30SC1TF4G.jpg', 'Fully Equipped Kitchen', 'A complete and clean kitchen', NULL, '2026-01-21 02:29:09', '2026-01-21 02:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-da4b9237bacccdf19c0760cab7aec4a8359010b0', 'i:1;', 1768991784),
('laravel-cache-da4b9237bacccdf19c0760cab7aec4a8359010b0:timer', 'i:1768991784;', 1768991784),
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:1;', 1768987623),
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1768987623;', 1768987623);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `image`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'cities/01KD7JJ04HWCJQ3E897ZR70G62.jpg', 'Hotel', 'hotel', NULL, '2025-12-23 23:00:45', '2025-12-23 23:00:45'),
(2, 'cities/01KEB1ZMWYFQZ7WP9W3GTWF8YY.jpg', 'Apartemen', 'apartemen', NULL, '2026-01-06 17:43:46', '2026-01-06 17:43:46'),
(3, 'cities/01KEB2ACZBZ6GS0HK8Q5BGY8TS.jpg', 'Resort', 'resort', NULL, '2026-01-06 17:49:39', '2026-01-06 17:49:39'),
(4, 'cities/01KEB2J4Y473JX88V1PZYR9JCY.jpg', 'Vila', 'vila', NULL, '2026-01-06 17:53:53', '2026-01-06 17:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `image`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'cities/01KD7JD87WVKK0NN28JJM7WHYC.jpg', 'Jakarta', 'jakarta', NULL, '2025-12-23 22:58:10', '2025-12-23 22:58:10'),
(2, 'cities/01KEB459P5B933E43VAAP476BH.jpg', 'Bali', 'bali', NULL, '2026-01-06 18:21:49', '2026-01-06 18:21:49'),
(3, 'cities/01KEB4643Z5SN7XTTHAJGC3NYE.jpg', 'Yogyakarta', 'yogyakarta', NULL, '2026-01-06 18:22:16', '2026-01-06 18:22:16'),
(4, 'cities/01KEB47C2QZ73HKKEQBFKGVSFH.jpg', 'Bandung', 'bandung', NULL, '2026-01-06 18:22:57', '2026-01-06 18:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_24_015552_create_cities_table', 1),
(5, '2025_12_24_015553_create_categories_table', 1),
(6, '2025_12_24_015554_create_boarding_houses_table', 1),
(7, '2025_12_24_015554_create_rooms_table', 1),
(8, '2025_12_24_015555_create_room_images_table', 1),
(9, '2025_12_24_015556_create_bonuses_table', 1),
(10, '2025_12_24_015557_create_testimonials_table', 1),
(11, '2025_12_24_015627_create_transactions_table', 1),
(12, '2025_12_24_035706_add_name_column_to_testimonials_table', 2),
(13, '2026_01_14_053112_create_personal_access_tokens_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `boarding_house_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `room_type` varchar(255) NOT NULL,
  `square_feet` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `price_per_month` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `boarding_house_id`, `name`, `room_type`, `square_feet`, `capacity`, `price_per_month`, `is_available`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Deluxe Room', 'A', 184, 1, 793444, 1, NULL, '2025-12-23 23:37:10', '2026-01-06 19:18:56'),
(2, 1, 'Executive Room', 'B', 245, 2, 900900, 1, NULL, '2025-12-23 23:37:10', '2026-01-06 19:18:56'),
(3, 2, 'Deluxe Room', 'A', 184, 1, 6800000, 1, NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(4, 2, 'Executive Room', 'B', 245, 2, 9000000, 1, NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(5, 3, 'Ocean Breeze Suite', 'Premier', 450, 2, 1250000, 1, NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(6, 3, 'Tropical Terrace Room', 'Standard', 320, 2, 650000, 1, NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(7, 4, 'Skyline Penthouse Villa', 'Luxury Suite', 1200, 2, 3200000, 1, NULL, '2026-01-21 02:29:09', '2026-01-21 02:29:09'),
(8, 4, 'Emerald Hill Villa', '2-Bedroom Villa', 2500, 4, 4500000, 1, NULL, '2026-01-21 02:29:09', '2026-01-21 02:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`id`, `room_id`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'room-images/01KD7MMMWGEQ5SDCVRZR6NWR7H.jpg', NULL, '2025-12-23 23:37:10', '2025-12-23 23:37:10'),
(2, 1, 'room-images/01KD7MMMWQJ1X81HNQ2JBHVTC8.jpg', NULL, '2025-12-23 23:37:10', '2025-12-23 23:37:10'),
(3, 2, 'room-images/01KD7MMMX0VN3NGQPW94C12FG1.jpg', NULL, '2025-12-23 23:37:10', '2025-12-23 23:37:10'),
(4, 2, 'room-images/01KD7MMMX87AH2FKZTT4RS06J0.jpg', NULL, '2025-12-23 23:37:10', '2025-12-23 23:37:10'),
(5, 3, 'room-images/01KEB8AP99FBFPFY8TAEEK4ARM.jpg', NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(6, 4, 'room-images/01KEB8AP9CMSFE88K2A3150VHS.jpg', NULL, '2026-01-06 19:34:40', '2026-01-06 19:34:40'),
(7, 5, 'room-images/01KFFZWA3WTMCB6DDYEEHZMXGA.jpg', NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(8, 5, 'room-images/01KFFZWA41MPQS6AZVY6320VJS.jpg', NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(9, 6, 'room-images/01KFFZWA46KGMQHVNX8M01ANEC.jpg', NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(10, 6, 'room-images/01KFFZWA4DSG6GQD4KS34V147F.jpg', NULL, '2026-01-21 01:58:54', '2026-01-21 01:58:54'),
(11, 7, 'room-images/01KFG1KPK0TST8YFE47F6J96X9.jpg', NULL, '2026-01-21 02:29:09', '2026-01-21 02:29:09'),
(12, 8, 'room-images/01KFG1KPK8WCB06SE92111WNCT.jpg', NULL, '2026-01-21 02:29:09', '2026-01-21 02:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gEfoPdun80FtJqVeAHp4IE2RtcENFTSMPeXOqshD', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMG1vTVVkZ1JTN2dHcDE3eUtVQjZRVFIyaHVTNHhpYmJZdG00VUpraSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdG9yYWdlL3ByaXZhdGUvYm9hcmRpbmctaG91c2VzLzAxS0ZHMUtOVDZITURIRU1HN05KU1FSM1lBLmpwZyI7czo1OiJyb3V0ZSI7czoxNToicHJpdmF0ZS5zdG9yYWdlIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJGdkWjRwakdBVFdpcXg0QXJIVzdDQXVEeU1McDFhenk5L0NMa2xPS2xTQ3JyTEhvb3NoUkp1IjtzOjY6InRhYmxlcyI7YToyOntzOjQwOiI5NmJlNmMxNTc0YWNjNTNhYzYwMzc1OTY5MDBkMWIzNV9jb2x1bW5zIjthOjY6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJ0aHVtYm5haWwiO3M6NToibGFiZWwiO3M6OToiVGh1bWJuYWlsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjQ6Ik5hbWUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6ImNpdHkubmFtZSI7czo1OiJsYWJlbCI7czo0OiJDaXR5IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoiY2F0ZWdvcnkubmFtZSI7czo1OiJsYWJlbCI7czo4OiJDYXRlZ29yeSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToicHJpY2UiO3M6NToibGFiZWwiO3M6NToiUHJpY2UiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjZjNDQ0MzI0MmNhMjcxM2M0N2ExZmNiMDAwNjJiNWQzX2NvbHVtbnMiO2E6Njp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6InBob3RvIjtzOjU6ImxhYmVsIjtzOjU6IlBob3RvIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjQ6Ik5hbWUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE4OiJib2FyZGluZ0hvdXNlLm5hbWUiO3M6NToibGFiZWwiO3M6MTQ6IkJvYXJkaW5nIEhvdXNlIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJjb250ZW50IjtzOjU6ImxhYmVsIjtzOjc6IkNvbnRlbnQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjY6InJhdGluZyI7czo1OiJsYWJlbCI7czo2OiJSYXRpbmciO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIEF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fX1zOjg6ImZpbGFtZW50IjthOjA6e319', 1768991814);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `boarding_house_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `boarding_house_id`, `photo`, `name`, `content`, `rating`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'testimonials/01KD7N3BREZ9HAF14A6HMJQXY1.jpg', 'Jennie', 'Very comfortable and clean boarding house. Next time, i will come to this place again.', 5, NULL, '2025-12-23 23:45:11', '2025-12-23 23:45:11'),
(2, 3, 'testimonials/01KFG1T2TYPJWTC7NHW8KXJH3V.jpg', 'Go Younjung', 'Luxury resort with beautiful natural views.', 5, NULL, '2026-01-21 02:32:38', '2026-01-21 02:32:38'),
(3, 2, 'testimonials/01KFG1YKEBC5ME2H3M8QQTJW5K.jpg', 'Jeyda', 'Good and clean apartment', 5, NULL, '2026-01-21 02:35:06', '2026-01-21 02:35:06'),
(4, 4, 'testimonials/01KFG21BTCDVE4S5RR0QZ0JRG7.jpg', 'Ahn keonho', 'Comfortable villa with promising views', 5, NULL, '2026-01-21 02:36:37', '2026-01-21 02:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `boarding_house_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `payment_method` enum('down_payment','full_payment') DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `duration` int(11) NOT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `code`, `boarding_house_id`, `room_id`, `name`, `email`, `phone_number`, `payment_method`, `payment_status`, `start_date`, `duration`, `total_amount`, `transaction_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(6, 'TRX462644', 1, 1, 'mnwrh', 'mwarah1401@gmail.com', '085752671084', 'down_payment', 'pending', '2026-01-15', 1, 266597, '2026-01-14', NULL, '2026-01-13 18:37:37', '2026-01-13 18:37:37'),
(7, 'TRX187973', 1, 1, 'mnwrh', 'mwarah1401@gmail.com', '085752671084', 'down_payment', 'pending', '2026-01-15', 1, 266597, '2026-01-14', NULL, '2026-01-13 18:51:36', '2026-01-13 18:51:36'),
(8, 'TRX482493', 1, 1, 'mnwrh', 'mwarah1401@gmail.com', '085752671084', 'down_payment', 'pending', '2026-01-15', 1, 266597, '2026-01-14', NULL, '2026-01-13 22:46:15', '2026-01-13 22:46:15'),
(9, 'TRX662114', 1, 1, 'mnwrh', 'mwarah1401@gmail.com', '085752671084', 'down_payment', 'pending', '2026-01-15', 1, 266597, '2026-01-14', NULL, '2026-01-13 23:02:25', '2026-01-13 23:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-12-23 19:48:38', '$2y$12$8zDGpnJpnq9b54QMJGN9L.sr6spF9/r9pur1OcIsU7cr9AueDLFya', 'Scdgzk9gYV', '2025-12-23 19:48:38', '2025-12-23 19:48:38'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$12$gdZ4pjGATWiqx4ArHW7CAuDyMLp1azy9/CLklOKlSCrrLHooshRJu', 'N98SW7RpgWJg9ybYzzsH1kLhmux6rHgWOv1pp1W8V5NTT340KO6jID5zT1Kz', '2025-12-23 19:49:42', '2025-12-23 19:49:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boarding_houses_city_id_foreign` (`city_id`),
  ADD KEY `boarding_houses_category_id_foreign` (`category_id`);

--
-- Indexes for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonuses_boarding_house_id_foreign` (`boarding_house_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_boarding_house_id_foreign` (`boarding_house_id`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_images_room_id_foreign` (`room_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_boarding_house_id_foreign` (`boarding_house_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_boarding_house_id_foreign` (`boarding_house_id`),
  ADD KEY `transactions_room_id_foreign` (`room_id`);

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
-- AUTO_INCREMENT for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  ADD CONSTRAINT `boarding_houses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `boarding_houses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD CONSTRAINT `bonuses_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
