-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2021 at 10:32 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(6, '2021_01_02_073223_create_penjualans_table', 1),
(11, '2021_01_06_045741_create_transaksis_table', 2),
(69, '2021_01_04_044741_create_countries_states_table', 3),
(74, '2021_02_08_161531_create_penjualan_details_table', 3),
(133, '2014_10_12_100000_create_password_resets_table', 4),
(134, '2019_08_19_000000_create_failed_jobs_table', 4),
(135, '2021_01_02_012505_create_barangs_table', 4),
(136, '2021_01_02_025846_create_suppliers_table', 4),
(137, '2021_01_02_233418_create_kategoris_table', 4),
(138, '2021_01_03_000733_satuan', 4),
(139, '2021_01_04_111024_create_mejas_table', 4),
(140, '2021_02_02_142436_create_menus_table', 4),
(141, '2021_02_03_045330_create_komposisis_table', 4),
(142, '2021_02_05_061214_create_transaksis_table', 4),
(143, '2021_02_08_162955_create_penjualans_table', 4),
(144, '2021_02_12_082257_pembelian', 4),
(145, '2021_02_12_113120_pembelian_detail', 4),
(146, '2021_02_21_073842_kartustok', 4),
(147, '2021_02_27_174740_users', 4),
(148, '2021_03_02_091025_stokopname', 4),
(149, '2021_03_02_174311_create_stok_opname_details_table', 4);

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
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbarang`
--

CREATE TABLE `tblbarang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` double NOT NULL,
  `hrgJual` double NOT NULL,
  `ktgBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merek` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stkBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMin` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMax` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stsBarang` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblbarang`
--

INSERT INTO `tblbarang` (`id`, `kdBarang`, `nmBarang`, `hrgPokok`, `hrgJual`, `ktgBarang`, `satuanBarang`, `merek`, `stkBarang`, `qtyMin`, `qtyMax`, `stsBarang`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'DB-2021-1', 'Nasi Goreng', 2000, 5000, 'KT-2021-1', 'Gram', 'Nasi', '-998', '200', '5000', '1', 'Nasi Goreng spesial', '2021-03-04 11:36:39', '2021-03-04 11:36:39'),
(2, 'DB-2021-2', 'Aqua 600ml', 2000, 4000, 'KT-2021-1', 'Botol', 'Aqua', '1', '2', '50', '1', 'Aqua tanggung', '2021-03-04 12:02:17', '2021-03-04 12:02:17'),
(3, 'DB-2021-3', 'Nasi Putih', 30, 50, 'KT-2021-1', 'Gram', 'Nasi', '2688', '100', '6000', '1', 'Nasi Putih', '2021-03-04 12:08:38', '2021-03-04 12:08:38'),
(4, 'DB-2021-4', 'Kecap Manis', 30, 50, 'KT-2021-1', 'Gram', 'Kecap Manis', '4954', '100', '6000', '1', 'Nasi Putih', '2021-03-04 12:09:18', '2021-03-04 12:09:18'),
(5, 'DB-2021-5', 'Telur Ayam', 1500, 2000, 'KT-2021-1', 'Butir', 'Kecap Manis', '21', '10', '50', '2', 'Telur Ayam Mentah', '2021-03-04 12:10:05', '2021-03-05 09:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `tblkartustok`
--

CREATE TABLE `tblkartustok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMasuk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyKeluar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTransaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblkartustok`
--

INSERT INTO `tblkartustok` (`id`, `kdBarang`, `tglKartu`, `qtyMasuk`, `qtyKeluar`, `noTransaksi`, `keteranganKartu`, `satuanKartu`, `created_at`, `updated_at`) VALUES
(1, 'DB-2021-1', '2021/03/04', '0', '1', 'INV-2021-1-1', 'Penjualan', 'Gram', '2021-03-04 11:36:59', '2021-03-04 11:36:59'),
(2, 'DB-2021-1', '2021/03/04', '0', '1', 'INV-2021-2-2', 'Penjualan', 'Gram', '2021-03-04 11:58:16', '2021-03-04 11:58:16'),
(4, 'DB-2021-2', '2021/03/04', '0', '2', 'INV-2021-2-3', 'Penjualan', 'Botol', '2021-03-04 12:11:26', '2021-03-04 12:11:26'),
(5, 'DB-2021-3', '2021/03/04', '0', '200', 'INV-2021-2-3', 'Penjualan Menu', 'Gram', NULL, NULL),
(6, 'DB-2021-4', '2021/03/04', '0', '4', 'INV-2021-2-3', 'Penjualan Menu', 'Gram', NULL, NULL),
(7, 'DB-2021-5', '2021/03/04', '0', '2', 'INV-2021-2-3', 'Penjualan Menu', 'Butir', NULL, NULL),
(24, 'DB-2021-5', '2021/03/05', '1', '0', 'OP-2021-1', 'Stok Opname-dsfa', 'Butir', '2021-03-05 00:00:36', '2021-03-05 00:00:36'),
(25, 'DB-2021-2', '2021/03/05', '0', '-1', 'OP-2021-1', 'Stok Opname-fdsf', 'Botol', '2021-03-05 00:00:53', '2021-03-05 00:00:53'),
(26, 'DB-2021-1', '2021/03/05', '0', '1', 'INV-2021-1-4', 'Penjualan', 'Gram', '2021-03-05 01:24:34', '2021-03-05 01:24:34'),
(27, 'DB-2021-3', '2021/03/05', '0', '100', 'INV-2021-1-4', 'Penjualan Menu', 'Gram', NULL, NULL),
(28, 'DB-2021-4', '2021/03/05', '0', '2', 'INV-2021-1-4', 'Penjualan Menu', 'Gram', NULL, NULL),
(29, 'DB-2021-5', '2021/03/05', '0', '1', 'INV-2021-1-4', 'Penjualan Menu', 'Butir', NULL, NULL),
(30, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-3-5', 'Penjualan', 'Botol', '2021-03-05 01:26:42', '2021-03-05 01:26:42'),
(31, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-3-5', 'Penjualan Menu', 'Gram', NULL, NULL),
(32, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-3-5', 'Penjualan Menu', 'Gram', NULL, NULL),
(33, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-5', 'Penjualan Menu', 'Butir', NULL, NULL),
(34, 'DB-2021-1', '2021/03/05', '20', '0', 'PB-2021-1', 'Pembelian', 'Gram', '2021-03-05 02:39:14', '2021-03-05 02:39:14'),
(35, 'DB-2021-5', '2021/03/05', '20', '0', 'PB-2021-1', 'Pembelian', 'Butir', '2021-03-05 02:39:22', '2021-03-05 02:39:22'),
(36, 'DB-2021-2', '2021/03/05', '21', '0', 'PB-2021-1', 'Pembelian', 'Botol', '2021-03-05 02:39:28', '2021-03-05 02:39:28'),
(37, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-2-6', 'Penjualan', 'Gram', '2021-03-05 03:01:26', '2021-03-05 03:01:26'),
(38, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-2-6', 'Penjualan', 'Botol', '2021-03-05 03:01:34', '2021-03-05 03:01:34'),
(39, 'DB-2021-3', '2021/03/05', '0', '2', 'INV-2021-3-7', 'Penjualan', 'Gram', '2021-03-05 03:02:47', '2021-03-05 03:02:47'),
(40, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-3-7', 'Penjualan Menu', 'Gram', NULL, NULL),
(41, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-3-7', 'Penjualan Menu', 'Gram', NULL, NULL),
(42, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-7', 'Penjualan Menu', 'Butir', NULL, NULL),
(43, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-3-7', 'Penjualan', 'Botol', '2021-03-05 03:02:59', '2021-03-05 03:02:59'),
(44, 'DB-2021-2', '2021/03/05', '3', '0', 'PB-2021-2', 'Pembelian', 'Botol', '2021-03-05 03:16:33', '2021-03-05 03:16:33'),
(45, 'DB-2021-5', '2021/03/05', '3', '0', 'PB-2021-2', 'Pembelian', 'Butir', '2021-03-05 03:16:40', '2021-03-05 03:16:40'),
(46, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-1-8', 'Penjualan', 'Botol', '2021-03-05 03:29:52', '2021-03-05 03:29:52'),
(47, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-1-8', 'Penjualan Menu', 'Gram', NULL, NULL),
(48, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-1-8', 'Penjualan Menu', 'Gram', NULL, NULL),
(49, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-1-8', 'Penjualan Menu', 'Butir', NULL, NULL),
(50, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-2-9', 'Penjualan', 'Gram', '2021-03-05 03:39:53', '2021-03-05 03:39:53'),
(51, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-2-9', 'Penjualan Menu', 'Gram', NULL, NULL),
(52, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-2-9', 'Penjualan Menu', 'Gram', NULL, NULL),
(53, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-2-9', 'Penjualan Menu', 'Butir', NULL, NULL),
(54, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-1-10', 'Penjualan', 'Botol', '2021-03-05 03:41:43', '2021-03-05 03:41:43'),
(55, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-1-10', 'Penjualan Menu', 'Gram', NULL, NULL),
(56, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-1-10', 'Penjualan Menu', 'Gram', NULL, NULL),
(57, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-1-10', 'Penjualan Menu', 'Butir', NULL, NULL),
(58, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-3-11', 'Penjualan', 'Gram', '2021-03-05 03:51:28', '2021-03-05 03:51:28'),
(59, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-1-1', 'Penjualan', 'Gram', '2021-03-05 04:02:41', '2021-03-05 04:02:41'),
(60, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-1-1', 'Penjualan Menu', 'Gram', NULL, NULL),
(61, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-1-1', 'Penjualan Menu', 'Gram', NULL, NULL),
(62, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-1-1', 'Penjualan Menu', 'Butir', NULL, NULL),
(63, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-3-2', 'Penjualan', 'Gram', '2021-03-05 04:11:21', '2021-03-05 04:11:21'),
(64, 'DB-2021-3', '2021/03/05', '0', '2', 'INV-2021-3-2', 'Penjualan', 'Gram', '2021-03-05 04:11:29', '2021-03-05 04:11:29'),
(65, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-2', 'Penjualan', 'Butir', '2021-03-05 04:11:35', '2021-03-05 04:11:35'),
(66, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-3-2', 'Penjualan Menu', 'Gram', NULL, NULL),
(67, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-3-2', 'Penjualan Menu', 'Gram', NULL, NULL),
(68, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-2', 'Penjualan Menu', 'Butir', NULL, NULL),
(69, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-3-3', 'Penjualan', 'Gram', '2021-03-05 04:13:39', '2021-03-05 04:13:39'),
(70, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-3-3', 'Penjualan Menu', 'Gram', NULL, NULL),
(71, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-3-3', 'Penjualan Menu', 'Gram', NULL, NULL),
(72, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-3', 'Penjualan Menu', 'Butir', NULL, NULL),
(73, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-3-3', 'Penjualan', 'Botol', '2021-03-05 04:13:49', '2021-03-05 04:13:49'),
(74, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-3-4', 'Penjualan', 'Gram', '2021-03-05 04:15:34', '2021-03-05 04:15:34'),
(75, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-3-4', 'Penjualan', 'Botol', '2021-03-05 04:15:42', '2021-03-05 04:15:42'),
(76, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-3-5', 'Penjualan', 'Gram', '2021-03-05 04:17:13', '2021-03-05 04:17:13'),
(77, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-3-5', 'Penjualan', 'Botol', '2021-03-05 04:17:20', '2021-03-05 04:17:20'),
(78, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-3-6', 'Penjualan', 'Gram', '2021-03-05 04:20:03', '2021-03-05 04:20:03'),
(79, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-6', 'Penjualan', 'Butir', '2021-03-05 04:20:11', '2021-03-05 04:20:11'),
(80, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-3-7', 'Penjualan', 'Botol', '2021-03-05 04:25:56', '2021-03-05 04:25:56'),
(81, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-3-7', 'Penjualan Menu', 'Gram', NULL, NULL),
(82, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-3-7', 'Penjualan Menu', 'Gram', NULL, NULL),
(83, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-7', 'Penjualan Menu', 'Butir', NULL, NULL),
(84, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-7', 'Penjualan', 'Butir', '2021-03-05 04:26:08', '2021-03-05 04:26:08'),
(85, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-8', 'Penjualan', 'Butir', '2021-03-05 05:02:12', '2021-03-05 05:02:12'),
(86, 'DB-2021-3', '2021/03/05', '0', '200', 'INV-2021-3-8', 'Penjualan Menu', 'Gram', NULL, NULL),
(87, 'DB-2021-4', '2021/03/05', '0', '4', 'INV-2021-3-8', 'Penjualan Menu', 'Gram', NULL, NULL),
(88, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-8', 'Penjualan Menu', 'Butir', NULL, NULL),
(89, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-2-9', 'Penjualan', 'Butir', '2021-03-05 05:04:39', '2021-03-05 05:04:39'),
(90, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-2-9', 'Penjualan', 'Botol', '2021-03-05 05:04:52', '2021-03-05 05:04:52'),
(91, 'DB-2021-5', '2021/03/05', '0', '2', 'INV-2021-3-10', 'Penjualan', 'Butir', '2021-03-05 05:09:23', '2021-03-05 05:09:23'),
(92, 'DB-2021-2', '2021/03/05', '0', '2', 'INV-2021-3-10', 'Penjualan', 'Botol', '2021-03-05 05:09:36', '2021-03-05 05:09:36'),
(93, 'DB-2021-1', '2021/03/05', '1', '0', 'OP-2021-2', 'Stok Opname-kj', 'Gram', '2021-03-05 05:31:24', '2021-03-05 05:31:24'),
(94, 'DB-2021-2', '2021/03/05', '0', '-5', 'OP-2021-2', 'Stok Opname-jhgjh', 'Botol', '2021-03-05 05:31:36', '2021-03-05 05:31:36'),
(97, 'DB-2021-1', '2021/03/05', '0', '2', 'INV-2021-3-11', 'Penjualan', 'Gram', '2021-03-05 09:05:02', '2021-03-05 09:05:02'),
(98, 'DB-2021-1', '2021/03/05', '0', '200', 'INV-2021-3-11', 'Penjualan Menu', 'Gram', NULL, NULL),
(99, 'DB-2021-1', '2021/03/05', '0', '4', 'INV-2021-3-12', 'Penjualan', 'Gram', '2021-03-05 09:14:19', '2021-03-05 09:14:19'),
(100, 'DB-2021-1', '2021/03/05', '0', '800', 'INV-2021-3-12', 'Penjualan Menu', 'Gram', NULL, NULL),
(101, 'DB-2021-2', '2021/03/05', '0', '4', 'INV-2021-3-12', 'Penjualan', 'Botol', '2021-03-05 09:14:52', '2021-03-05 09:14:52'),
(102, 'DB-2021-3', '2021/03/05', '0', '8', 'INV-2021-2-12', 'Penjualan', 'Gram', '2021-03-05 09:15:11', '2021-03-05 09:15:11'),
(103, 'DB-2021-5', '2021/03/05', '0', '8', 'INV-2021-2-12', 'Penjualan', 'Butir', '2021-03-05 09:15:23', '2021-03-05 09:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `tblkategori`
--

CREATE TABLE `tblkategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kodeKtg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaKtg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblkategori`
--

INSERT INTO `tblkategori` (`id`, `kodeKtg`, `namaKtg`, `created_at`, `updated_at`) VALUES
(1, 'KT-2021-1', 'Makanan', '2021-03-04 11:35:57', '2021-03-04 11:35:57'),
(2, 'KT-2021-2', 'Minuman', '2021-03-04 12:02:36', '2021-03-04 12:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `tblkomposisi`
--

CREATE TABLE `tblkomposisi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBarang` double NOT NULL,
  `satuanBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaBarang` double NOT NULL,
  `totalBarang` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblkomposisi`
--

INSERT INTO `tblkomposisi` (`id`, `idMenu`, `idBarang`, `qtyBarang`, `satuanBarang`, `hargaBarang`, `totalBarang`, `created_at`, `updated_at`) VALUES
(1, 'MN-2021-1', 'DB-2021-3', 100, 'Gram', 50, 5000, '2021-03-04 12:10:26', '2021-03-04 12:10:26'),
(2, 'MN-2021-1', 'DB-2021-4', 2, 'Gram', 50, 100, '2021-03-04 12:10:43', '2021-03-04 12:10:43'),
(3, 'MN-2021-1', 'DB-2021-5', 1, 'Butir', 2000, 2000, '2021-03-04 12:10:55', '2021-03-04 12:10:55'),
(4, 'MN-2021-2', 'DB-2021-1', 200, 'Gram', 5000, 1000000, '2021-03-05 08:50:29', '2021-03-05 08:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `tblmeja`
--

CREATE TABLE `tblmeja` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noMeja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paxMeja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblmeja`
--

INSERT INTO `tblmeja` (`id`, `noMeja`, `paxMeja`, `status`, `time`, `created_at`, `updated_at`) VALUES
(1, '1', '4', '0', NULL, '2021-03-04 11:35:45', '2021-03-05 09:13:51'),
(2, '2', '4', '1', NULL, '2021-03-04 11:58:01', '2021-03-05 09:14:59'),
(3, '6', '4', '0', NULL, '2021-03-05 01:26:21', '2021-03-05 09:14:03'),
(4, '5', '4', '0', NULL, '2021-03-05 09:10:23', '2021-03-05 09:13:49');

-- --------------------------------------------------------

--
-- Table structure for table `tblmenu`
--

CREATE TABLE `tblmenu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaMenu` double NOT NULL,
  `stokMenu` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblmenu`
--

INSERT INTO `tblmenu` (`id`, `kdMenu`, `nmMenu`, `hargaMenu`, `stokMenu`, `created_at`, `updated_at`) VALUES
(1, 'MN-2021-1', 'Nasi Goreng', 15000, '1', '2021-03-04 12:07:11', '2021-03-04 12:07:11'),
(2, 'MN-2021-2', 'JAJO uli', 5000, '1', '2021-03-05 08:50:08', '2021-03-05 08:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `tblpembelian`
--

CREATE TABLE `tblpembelian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userPembelian` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblpembelian`
--

INSERT INTO `tblpembelian` (`id`, `idSupplier`, `noNotaPembelian`, `tglNotaPembelian`, `totalNotaPembelian`, `userPembelian`, `created_at`, `updated_at`) VALUES
(1, 'SP-2021-1', 'PB-2021-1', '2021/03/05', '112000', NULL, '2021-03-05 02:40:45', '2021-03-05 02:40:45'),
(2, 'SP-2021-1', 'PB-2021-2', '2021/03/05', '10500', '1', '2021-03-05 03:16:58', '2021-03-05 03:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblpembeliandetail`
--

CREATE TABLE `tblpembeliandetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblpembeliandetail`
--

INSERT INTO `tblpembeliandetail` (`id`, `noNotaPembelian`, `kdBarang`, `hrgPokok`, `qtyBeli`, `totalBeli`, `created_at`, `updated_at`) VALUES
(1, 'PB-2021-1', 'DB-2021-1', '2000', '20', '40000', '2021-03-05 02:39:14', '2021-03-05 02:39:14'),
(2, 'PB-2021-1', 'DB-2021-5', '1500', '20', '30000', '2021-03-05 02:39:22', '2021-03-05 02:39:22'),
(3, 'PB-2021-1', 'DB-2021-2', '2000', '21', '42000', '2021-03-05 02:39:28', '2021-03-05 02:39:28'),
(4, 'PB-2021-2', 'DB-2021-2', '2000', '3', '6000', '2021-03-05 03:16:33', '2021-03-05 03:16:33'),
(5, 'PB-2021-2', 'DB-2021-5', '1500', '3', '4500', '2021-03-05 03:16:40', '2021-03-05 03:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualan`
--

CREATE TABLE `tblpenjualan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noMeja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelangganNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskonNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userNota` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblpenjualan`
--

INSERT INTO `tblpenjualan` (`id`, `noNota`, `noMeja`, `pelangganNota`, `tglNota`, `totalNota`, `taxNota`, `diskonNota`, `bayarNota`, `kembalianNota`, `userNota`, `created_at`, `updated_at`) VALUES
(1, 'INV-2021-1-1', '1', 'Cash', '2021/03/05', '40000', '0', '0', '50000', '10000', '1', '2021-03-05 04:02:53', '2021-03-05 04:02:53'),
(2, 'INV-2021-3-2', '3', 'Cash', '2021/03/05', '46084.5', '4410', '2425.5', '50000', '3915.5', '1', '2021-03-05 04:11:55', '2021-03-05 04:11:55'),
(3, 'INV-2021-3-3', '3', 'Cash', '2021/03/05', '48000', '0', '0', '50000', '2000', '1', '2021-03-05 04:14:04', '2021-03-05 04:14:04'),
(4, 'INV-2021-3-4', '3', 'Cash', '2021/03/05', '18000', '0', '0', '20000', '2000', '1', '2021-03-05 04:15:49', '2021-03-05 04:15:49'),
(5, 'INV-2021-3-5', '3', 'Cash', '2021/03/05', '18000', '0', '0', '20000', '2000', '1', '2021-03-05 04:17:29', '2021-03-05 04:17:29'),
(6, 'INV-2021-3-6', '3', 'Cash', '2021/03/05', '14000', '0', '0', '15000', '1000', '1', '2021-03-05 04:20:19', '2021-03-05 04:20:19'),
(7, 'INV-2021-3-7', '3', 'Cash', '2021/03/05', '42000', '0', '0', '50000', '8000', '1', '2021-03-05 04:26:16', '2021-03-05 04:26:16'),
(8, 'INV-2021-3-8', '3', 'Cash', '2021/03/05', '34000', '0', '0', '50000', '16000', '3', '2021-03-05 05:03:21', '2021-03-05 05:03:21'),
(9, 'INV-2021-2-9', '2', 'Cash', '2021/03/05', '12000', '0', '0', '15000', '3000', '3', '2021-03-05 05:06:32', '2021-03-05 05:06:32'),
(10, 'INV-2021-3-10', '3', 'Cash', '2021/03/05', '12000', '0', '0', '15000', '3000', '3', '2021-03-05 05:09:47', '2021-03-05 05:09:47'),
(11, 'INV-2021-3-11', '3', 'Cash', '2021/03/05', '15000', '0', '0', '20000', '5000', '1', '2021-03-05 09:07:04', '2021-03-05 09:07:04'),
(12, 'INV-2021-3-12', '3', 'Cash', '2021/03/05', '56000', '0', '0', '60000', '4000', '3', '2021-03-05 09:15:49', '2021-03-05 09:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualandetail`
--

CREATE TABLE `tblpenjualandetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noMeja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblpenjualandetail`
--

INSERT INTO `tblpenjualandetail` (`id`, `noNota`, `noMeja`, `kdBarang`, `hrgJual`, `qty`, `total`, `type`, `nmBarang`, `created_at`, `updated_at`) VALUES
(1, 'INV-2021-1-1', '1', 'DB-2021-1', '5000', '2', '10000', 'KT-2021-1', 'Nasi Goreng', NULL, NULL),
(2, 'INV-2021-1-1', '1', 'MN-2021-1', '15000', '2', '30000', 'MN-2021-1', 'Nasi Goreng', NULL, NULL),
(3, 'INV-2021-3-2', '3', 'DB-2021-1', '5000', '2', '10000', 'KT-2021-1', 'Nasi Goreng', NULL, NULL),
(4, 'INV-2021-3-2', '3', 'DB-2021-3', '50', '2', '100', 'KT-2021-1', 'Nasi Putih', NULL, NULL),
(5, 'INV-2021-3-2', '3', 'DB-2021-5', '2000', '2', '4000', 'KT-2021-1', 'Telur Ayam', NULL, NULL),
(6, 'INV-2021-3-2', '3', 'MN-2021-1', '15000', '2', '30000', 'MN-2021-1', 'Nasi Goreng', NULL, NULL),
(7, 'INV-2021-3-3', '3', 'DB-2021-1', '5000', '2', '10000', 'KT-2021-1', 'Nasi Goreng', NULL, NULL),
(8, 'INV-2021-3-3', '3', 'MN-2021-1', '15000', '2', '30000', 'MN-2021-1', 'Nasi Goreng', NULL, NULL),
(9, 'INV-2021-3-3', '3', 'DB-2021-2', '4000', '2', '8000', 'KT-2021-1', 'Aqua 600ml', NULL, NULL),
(10, 'INV-2021-3-4', '3', 'DB-2021-1', '5000', '2', '10000', 'KT-2021-1', 'Nasi Goreng', NULL, NULL),
(11, 'INV-2021-3-4', '3', 'DB-2021-2', '4000', '2', '8000', 'KT-2021-1', 'Aqua 600ml', NULL, NULL),
(12, 'INV-2021-3-5', '3', 'DB-2021-1', '5000', '2', '10000', 'KT-2021-1', 'Nasi Goreng', NULL, NULL),
(13, 'INV-2021-3-5', '3', 'DB-2021-2', '4000', '2', '8000', 'KT-2021-1', 'Aqua 600ml', NULL, NULL),
(14, 'INV-2021-3-6', '3', 'DB-2021-1', '5000', '2', '10000', 'KT-2021-1', 'Nasi Goreng', NULL, NULL),
(15, 'INV-2021-3-6', '3', 'DB-2021-5', '2000', '2', '4000', 'KT-2021-1', 'Telur Ayam', NULL, NULL),
(16, 'INV-2021-3-7', '3', 'DB-2021-2', '4000', '2', '8000', 'KT-2021-1', 'Aqua 600ml', NULL, NULL),
(17, 'INV-2021-3-7', '3', 'MN-2021-1', '15000', '2', '30000', 'MN-2021-1', 'Nasi Goreng', NULL, NULL),
(18, 'INV-2021-3-7', '3', 'DB-2021-5', '2000', '2', '4000', 'KT-2021-1', 'Telur Ayam', NULL, NULL),
(19, 'INV-2021-3-8', '3', 'DB-2021-5', '2000', '2', '4000', 'KT-2021-1', 'Telur Ayam', NULL, NULL),
(20, 'INV-2021-3-8', '3', 'MN-2021-1', '15000', '2', '30000', 'MN-2021-1', 'Nasi Goreng', NULL, NULL),
(21, 'INV-2021-2-9', '2', 'DB-2021-5', '2000', '2', '4000', 'KT-2021-1', 'Telur Ayam', NULL, NULL),
(22, 'INV-2021-2-9', '2', 'DB-2021-2', '4000', '2', '8000', 'KT-2021-1', 'Aqua 600ml', NULL, NULL),
(23, 'INV-2021-3-10', '3', 'DB-2021-5', '2000', '2', '4000', 'KT-2021-1', 'Telur Ayam', NULL, NULL),
(24, 'INV-2021-3-10', '3', 'DB-2021-2', '4000', '2', '8000', 'KT-2021-1', 'Aqua 600ml', NULL, NULL),
(25, 'INV-2021-3-11', '3', 'DB-2021-1', '5000', '2', '10000', 'KT-2021-1', 'Nasi Goreng', NULL, NULL),
(26, 'INV-2021-3-11', '3', 'MN-2021-2', '5000', '1', '5000', 'MN-2021-2', 'JAJO uli', NULL, NULL),
(27, 'INV-2021-3-12', '3', 'DB-2021-1', '5000', '4', '20000', 'KT-2021-1', 'Nasi Goreng', NULL, NULL),
(28, 'INV-2021-3-12', '3', 'MN-2021-2', '5000', '4', '20000', 'MN-2021-2', 'JAJO uli', NULL, NULL),
(29, 'INV-2021-3-12', '3', 'DB-2021-2', '4000', '4', '16000', 'KT-2021-1', 'Aqua 600ml', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblsatuan`
--

CREATE TABLE `tblsatuan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ktgSatuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtySatuan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblstokopname`
--

CREATE TABLE `tblstokopname` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noStokOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblstokopname`
--

INSERT INTO `tblstokopname` (`id`, `noStokOpname`, `tglStok`, `totalOpname`, `created_at`, `updated_at`) VALUES
(1, 'OP-2021-1', '2021/03/05', '-500', '2021-03-05 00:01:01', '2021-03-05 00:01:01'),
(2, 'OP-2021-2', '2021/03/05', '-8000', '2021-03-05 05:31:39', '2021-03-05 05:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `tblstokopnamedetail`
--

CREATE TABLE `tblstokopnamedetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noStokOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyGudang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selisihStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nilaiStok` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblstokopnamedetail`
--

INSERT INTO `tblstokopnamedetail` (`id`, `noStokOpname`, `kdBarang`, `qtyGudang`, `selisihStok`, `keteranganStok`, `satuanStok`, `created_at`, `updated_at`, `nilaiStok`) VALUES
(17, 'OP-2021-1', 'DB-2021-5', '39', '1', 'dsfa', 'Butir', '2021-03-05 00:00:36', '2021-03-05 00:00:36', '1500'),
(18, 'OP-2021-1', 'DB-2021-2', '8', '-1', 'fdsf', 'Botol', '2021-03-05 00:00:53', '2021-03-05 00:00:53', '-2000'),
(19, 'OP-2021-2', 'DB-2021-1', '8', '1', 'kj', 'Gram', '2021-03-05 05:31:24', '2021-03-05 05:31:24', '2000'),
(20, 'OP-2021-2', 'DB-2021-2', '5', '-5', 'jhgjh', 'Botol', '2021-03-05 05:31:36', '2021-03-05 05:31:36', '-10000');

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almtSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noHp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontakSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblsupplier`
--

INSERT INTO `tblsupplier` (`id`, `kdSupplier`, `nmSupplier`, `almtSupplier`, `noHp`, `kontakSupplier`, `created_at`, `updated_at`) VALUES
(1, 'SP-2021-1', 'Tunas Jaya', 'Sesetan', '2545566', 'Andi', '2021-03-05 02:40:14', '2021-03-05 02:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbltmp_transaksi`
--

CREATE TABLE `tbltmp_transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbltmp_transaksidetail`
--

CREATE TABLE `tbltmp_transaksidetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noMejaTmp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kdBarangTmp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hrgJualTmp` double DEFAULT NULL,
  `qtyTmp` double DEFAULT NULL,
  `totalTmp` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `typeTmp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nmBarangTmp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noNotaTmp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbltmp_transaksidetail`
--

INSERT INTO `tbltmp_transaksidetail` (`id`, `noMejaTmp`, `kdBarangTmp`, `hrgJualTmp`, `qtyTmp`, `totalTmp`, `created_at`, `updated_at`, `typeTmp`, `nmBarangTmp`, `noNotaTmp`) VALUES
(246, '2', 'DB-2021-3', 50, 8, 400, '2021-03-05 09:15:11', '2021-03-05 09:15:11', 'KT-2021-1', 'Nasi Putih', 'INV-2021-2-12'),
(247, '2', 'DB-2021-5', 2000, 8, 16000, '2021-03-05 09:15:23', '2021-03-05 09:15:23', 'KT-2021-1', 'Telur Ayam', 'INV-2021-2-12');

-- --------------------------------------------------------

--
-- Table structure for table `tbltmp_transaksis`
--

CREATE TABLE `tbltmp_transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `role`, `email`, `password`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'Admin', 'admin@yahoo.com', '$2y$10$pNMEGH7lfUhIMh8R177T5eHEe1hPJo9ds/6.B8caUJFtsyseAOOua', NULL, '2021-03-04 11:56:19', '2021-03-04 11:56:19'),
(3, 'rihan adi', 'rihan', 'Admin', 'rihan@yahoo.com', '$2y$10$RovRCrxmLzfw3hLvtxdvceYAyx/Xl7M0l2Gx9mxfckIfZOXIno0D.', NULL, '2021-03-05 04:47:36', '2021-03-05 04:47:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbarang`
--
ALTER TABLE `tblbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblkartustok`
--
ALTER TABLE `tblkartustok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblkategori`
--
ALTER TABLE `tblkategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblkomposisi`
--
ALTER TABLE `tblkomposisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmeja`
--
ALTER TABLE `tblmeja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmenu`
--
ALTER TABLE `tblmenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpembelian`
--
ALTER TABLE `tblpembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpembeliandetail`
--
ALTER TABLE `tblpembeliandetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpenjualandetail`
--
ALTER TABLE `tblpenjualandetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsatuan`
--
ALTER TABLE `tblsatuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstokopname`
--
ALTER TABLE `tblstokopname`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstokopnamedetail`
--
ALTER TABLE `tblstokopnamedetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltmp_transaksi`
--
ALTER TABLE `tbltmp_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltmp_transaksidetail`
--
ALTER TABLE `tbltmp_transaksidetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltmp_transaksis`
--
ALTER TABLE `tbltmp_transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbarang`
--
ALTER TABLE `tblbarang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblkartustok`
--
ALTER TABLE `tblkartustok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `tblkategori`
--
ALTER TABLE `tblkategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblkomposisi`
--
ALTER TABLE `tblkomposisi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblmeja`
--
ALTER TABLE `tblmeja`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblmenu`
--
ALTER TABLE `tblmenu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpembelian`
--
ALTER TABLE `tblpembelian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpembeliandetail`
--
ALTER TABLE `tblpembeliandetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblpenjualandetail`
--
ALTER TABLE `tblpenjualandetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblsatuan`
--
ALTER TABLE `tblsatuan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblstokopname`
--
ALTER TABLE `tblstokopname`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblstokopnamedetail`
--
ALTER TABLE `tblstokopnamedetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbltmp_transaksi`
--
ALTER TABLE `tbltmp_transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbltmp_transaksidetail`
--
ALTER TABLE `tbltmp_transaksidetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `tbltmp_transaksis`
--
ALTER TABLE `tbltmp_transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
