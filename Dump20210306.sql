-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: restoDB
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(6,'2021_01_02_073223_create_penjualans_table',1),(11,'2021_01_06_045741_create_transaksis_table',2),(69,'2021_01_04_044741_create_countries_states_table',3),(74,'2021_02_08_161531_create_penjualan_details_table',3),(133,'2014_10_12_100000_create_password_resets_table',4),(134,'2019_08_19_000000_create_failed_jobs_table',4),(135,'2021_01_02_012505_create_barangs_table',4),(136,'2021_01_02_025846_create_suppliers_table',4),(137,'2021_01_02_233418_create_kategoris_table',4),(138,'2021_01_03_000733_satuan',4),(139,'2021_01_04_111024_create_mejas_table',4),(140,'2021_02_02_142436_create_menus_table',4),(141,'2021_02_03_045330_create_komposisis_table',4),(142,'2021_02_05_061214_create_transaksis_table',4),(143,'2021_02_08_162955_create_penjualans_table',4),(144,'2021_02_12_082257_pembelian',4),(145,'2021_02_12_113120_pembelian_detail',4),(146,'2021_02_21_073842_kartustok',4),(147,'2021_02_27_174740_users',4),(148,'2021_03_02_091025_stokopname',4),(149,'2021_03_02_174311_create_stok_opname_details_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbarang`
--

DROP TABLE IF EXISTS `tblbarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblbarang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` double NOT NULL,
  `hrgJual` double NOT NULL,
  `ktgBarang` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanBarang` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `merek` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stkBarang` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMin` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMax` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stsBarang` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbarang`
--

LOCK TABLES `tblbarang` WRITE;
/*!40000 ALTER TABLE `tblbarang` DISABLE KEYS */;
INSERT INTO `tblbarang` VALUES (1,'DB-2021-1','Nasi Goreng',2000,5000,'KT-2021-1','Gram','Nasi','49900','200','5000','2','Nasi Goreng spesial','2021-03-04 11:36:39','2021-03-05 23:17:02'),(2,'DB-2021-2','Aqua 600ml',2000,4000,'KT-2021-1','Botol','Aqua','30','2','50','1','Aqua tanggung','2021-03-04 12:02:17','2021-03-04 12:02:17'),(3,'DB-2021-3','Nasi Putih',30,50,'KT-2021-1','Gram','Nasi','1638','100','6000','1','Nasi Putih','2021-03-04 12:08:38','2021-03-04 12:08:38'),(4,'DB-2021-4','Kecap Manis',30,50,'KT-2021-1','Gram','Kecap Manis','5238','100','6000','1','Nasi Putih','2021-03-04 12:09:18','2021-03-04 12:09:18'),(5,'DB-2021-5','Telur Ayam',1500,2000,'KT-2021-1','Butir','Kecap Manis','21','10','50','2','Telur Ayam Mentah','2021-03-04 12:10:05','2021-03-05 09:19:33'),(6,'DB-2021-6','Coca Cola 300Ml',3000,5000,'KT-2021-2','Botol','Coca Cola','40','10','60','1','Coca Cola Company','2021-03-05 23:42:25','2021-03-05 23:42:25');
/*!40000 ALTER TABLE `tblbarang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkartustok`
--

DROP TABLE IF EXISTS `tblkartustok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblkartustok` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglKartu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMasuk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyKeluar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTransaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganKartu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanKartu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkartustok`
--

LOCK TABLES `tblkartustok` WRITE;
/*!40000 ALTER TABLE `tblkartustok` DISABLE KEYS */;
INSERT INTO `tblkartustok` VALUES (1,'DB-2021-1','2021/03/04','0','1','INV-2021-1-1','Penjualan','Gram','2021-03-04 11:36:59','2021-03-04 11:36:59'),(2,'DB-2021-1','2021/03/04','0','1','INV-2021-2-2','Penjualan','Gram','2021-03-04 11:58:16','2021-03-04 11:58:16'),(4,'DB-2021-2','2021/03/04','0','2','INV-2021-2-3','Penjualan','Botol','2021-03-04 12:11:26','2021-03-04 12:11:26'),(5,'DB-2021-3','2021/03/04','0','200','INV-2021-2-3','Penjualan Menu','Gram',NULL,NULL),(6,'DB-2021-4','2021/03/04','0','4','INV-2021-2-3','Penjualan Menu','Gram',NULL,NULL),(7,'DB-2021-5','2021/03/04','0','2','INV-2021-2-3','Penjualan Menu','Butir',NULL,NULL),(24,'DB-2021-5','2021/03/05','1','0','OP-2021-1','Stok Opname-dsfa','Butir','2021-03-05 00:00:36','2021-03-05 00:00:36'),(25,'DB-2021-2','2021/03/05','0','-1','OP-2021-1','Stok Opname-fdsf','Botol','2021-03-05 00:00:53','2021-03-05 00:00:53'),(26,'DB-2021-1','2021/03/05','0','1','INV-2021-1-4','Penjualan','Gram','2021-03-05 01:24:34','2021-03-05 01:24:34'),(27,'DB-2021-3','2021/03/05','0','100','INV-2021-1-4','Penjualan Menu','Gram',NULL,NULL),(28,'DB-2021-4','2021/03/05','0','2','INV-2021-1-4','Penjualan Menu','Gram',NULL,NULL),(29,'DB-2021-5','2021/03/05','0','1','INV-2021-1-4','Penjualan Menu','Butir',NULL,NULL),(30,'DB-2021-2','2021/03/05','0','2','INV-2021-3-5','Penjualan','Botol','2021-03-05 01:26:42','2021-03-05 01:26:42'),(31,'DB-2021-3','2021/03/05','0','200','INV-2021-3-5','Penjualan Menu','Gram',NULL,NULL),(32,'DB-2021-4','2021/03/05','0','4','INV-2021-3-5','Penjualan Menu','Gram',NULL,NULL),(33,'DB-2021-5','2021/03/05','0','2','INV-2021-3-5','Penjualan Menu','Butir',NULL,NULL),(34,'DB-2021-1','2021/03/05','20','0','PB-2021-1','Pembelian','Gram','2021-03-05 02:39:14','2021-03-05 02:39:14'),(35,'DB-2021-5','2021/03/05','20','0','PB-2021-1','Pembelian','Butir','2021-03-05 02:39:22','2021-03-05 02:39:22'),(36,'DB-2021-2','2021/03/05','21','0','PB-2021-1','Pembelian','Botol','2021-03-05 02:39:28','2021-03-05 02:39:28'),(37,'DB-2021-1','2021/03/05','0','2','INV-2021-2-6','Penjualan','Gram','2021-03-05 03:01:26','2021-03-05 03:01:26'),(38,'DB-2021-2','2021/03/05','0','2','INV-2021-2-6','Penjualan','Botol','2021-03-05 03:01:34','2021-03-05 03:01:34'),(39,'DB-2021-3','2021/03/05','0','2','INV-2021-3-7','Penjualan','Gram','2021-03-05 03:02:47','2021-03-05 03:02:47'),(40,'DB-2021-3','2021/03/05','0','200','INV-2021-3-7','Penjualan Menu','Gram',NULL,NULL),(41,'DB-2021-4','2021/03/05','0','4','INV-2021-3-7','Penjualan Menu','Gram',NULL,NULL),(42,'DB-2021-5','2021/03/05','0','2','INV-2021-3-7','Penjualan Menu','Butir',NULL,NULL),(43,'DB-2021-2','2021/03/05','0','2','INV-2021-3-7','Penjualan','Botol','2021-03-05 03:02:59','2021-03-05 03:02:59'),(44,'DB-2021-2','2021/03/05','3','0','PB-2021-2','Pembelian','Botol','2021-03-05 03:16:33','2021-03-05 03:16:33'),(45,'DB-2021-5','2021/03/05','3','0','PB-2021-2','Pembelian','Butir','2021-03-05 03:16:40','2021-03-05 03:16:40'),(46,'DB-2021-2','2021/03/05','0','2','INV-2021-1-8','Penjualan','Botol','2021-03-05 03:29:52','2021-03-05 03:29:52'),(47,'DB-2021-3','2021/03/05','0','200','INV-2021-1-8','Penjualan Menu','Gram',NULL,NULL),(48,'DB-2021-4','2021/03/05','0','4','INV-2021-1-8','Penjualan Menu','Gram',NULL,NULL),(49,'DB-2021-5','2021/03/05','0','2','INV-2021-1-8','Penjualan Menu','Butir',NULL,NULL),(50,'DB-2021-1','2021/03/05','0','2','INV-2021-2-9','Penjualan','Gram','2021-03-05 03:39:53','2021-03-05 03:39:53'),(51,'DB-2021-3','2021/03/05','0','200','INV-2021-2-9','Penjualan Menu','Gram',NULL,NULL),(52,'DB-2021-4','2021/03/05','0','4','INV-2021-2-9','Penjualan Menu','Gram',NULL,NULL),(53,'DB-2021-5','2021/03/05','0','2','INV-2021-2-9','Penjualan Menu','Butir',NULL,NULL),(54,'DB-2021-2','2021/03/05','0','2','INV-2021-1-10','Penjualan','Botol','2021-03-05 03:41:43','2021-03-05 03:41:43'),(55,'DB-2021-3','2021/03/05','0','200','INV-2021-1-10','Penjualan Menu','Gram',NULL,NULL),(56,'DB-2021-4','2021/03/05','0','4','INV-2021-1-10','Penjualan Menu','Gram',NULL,NULL),(57,'DB-2021-5','2021/03/05','0','2','INV-2021-1-10','Penjualan Menu','Butir',NULL,NULL),(58,'DB-2021-1','2021/03/05','0','2','INV-2021-3-11','Penjualan','Gram','2021-03-05 03:51:28','2021-03-05 03:51:28'),(59,'DB-2021-1','2021/03/05','0','2','INV-2021-1-1','Penjualan','Gram','2021-03-05 04:02:41','2021-03-05 04:02:41'),(60,'DB-2021-3','2021/03/05','0','200','INV-2021-1-1','Penjualan Menu','Gram',NULL,NULL),(61,'DB-2021-4','2021/03/05','0','4','INV-2021-1-1','Penjualan Menu','Gram',NULL,NULL),(62,'DB-2021-5','2021/03/05','0','2','INV-2021-1-1','Penjualan Menu','Butir',NULL,NULL),(63,'DB-2021-1','2021/03/05','0','2','INV-2021-3-2','Penjualan','Gram','2021-03-05 04:11:21','2021-03-05 04:11:21'),(64,'DB-2021-3','2021/03/05','0','2','INV-2021-3-2','Penjualan','Gram','2021-03-05 04:11:29','2021-03-05 04:11:29'),(65,'DB-2021-5','2021/03/05','0','2','INV-2021-3-2','Penjualan','Butir','2021-03-05 04:11:35','2021-03-05 04:11:35'),(66,'DB-2021-3','2021/03/05','0','200','INV-2021-3-2','Penjualan Menu','Gram',NULL,NULL),(67,'DB-2021-4','2021/03/05','0','4','INV-2021-3-2','Penjualan Menu','Gram',NULL,NULL),(68,'DB-2021-5','2021/03/05','0','2','INV-2021-3-2','Penjualan Menu','Butir',NULL,NULL),(69,'DB-2021-1','2021/03/05','0','2','INV-2021-3-3','Penjualan','Gram','2021-03-05 04:13:39','2021-03-05 04:13:39'),(70,'DB-2021-3','2021/03/05','0','200','INV-2021-3-3','Penjualan Menu','Gram',NULL,NULL),(71,'DB-2021-4','2021/03/05','0','4','INV-2021-3-3','Penjualan Menu','Gram',NULL,NULL),(72,'DB-2021-5','2021/03/05','0','2','INV-2021-3-3','Penjualan Menu','Butir',NULL,NULL),(73,'DB-2021-2','2021/03/05','0','2','INV-2021-3-3','Penjualan','Botol','2021-03-05 04:13:49','2021-03-05 04:13:49'),(74,'DB-2021-1','2021/03/05','0','2','INV-2021-3-4','Penjualan','Gram','2021-03-05 04:15:34','2021-03-05 04:15:34'),(75,'DB-2021-2','2021/03/05','0','2','INV-2021-3-4','Penjualan','Botol','2021-03-05 04:15:42','2021-03-05 04:15:42'),(76,'DB-2021-1','2021/03/05','0','2','INV-2021-3-5','Penjualan','Gram','2021-03-05 04:17:13','2021-03-05 04:17:13'),(77,'DB-2021-2','2021/03/05','0','2','INV-2021-3-5','Penjualan','Botol','2021-03-05 04:17:20','2021-03-05 04:17:20'),(78,'DB-2021-1','2021/03/05','0','2','INV-2021-3-6','Penjualan','Gram','2021-03-05 04:20:03','2021-03-05 04:20:03'),(79,'DB-2021-5','2021/03/05','0','2','INV-2021-3-6','Penjualan','Butir','2021-03-05 04:20:11','2021-03-05 04:20:11'),(80,'DB-2021-2','2021/03/05','0','2','INV-2021-3-7','Penjualan','Botol','2021-03-05 04:25:56','2021-03-05 04:25:56'),(81,'DB-2021-3','2021/03/05','0','200','INV-2021-3-7','Penjualan Menu','Gram',NULL,NULL),(82,'DB-2021-4','2021/03/05','0','4','INV-2021-3-7','Penjualan Menu','Gram',NULL,NULL),(83,'DB-2021-5','2021/03/05','0','2','INV-2021-3-7','Penjualan Menu','Butir',NULL,NULL),(84,'DB-2021-5','2021/03/05','0','2','INV-2021-3-7','Penjualan','Butir','2021-03-05 04:26:08','2021-03-05 04:26:08'),(85,'DB-2021-5','2021/03/05','0','2','INV-2021-3-8','Penjualan','Butir','2021-03-05 05:02:12','2021-03-05 05:02:12'),(86,'DB-2021-3','2021/03/05','0','200','INV-2021-3-8','Penjualan Menu','Gram',NULL,NULL),(87,'DB-2021-4','2021/03/05','0','4','INV-2021-3-8','Penjualan Menu','Gram',NULL,NULL),(88,'DB-2021-5','2021/03/05','0','2','INV-2021-3-8','Penjualan Menu','Butir',NULL,NULL),(89,'DB-2021-5','2021/03/05','0','2','INV-2021-2-9','Penjualan','Butir','2021-03-05 05:04:39','2021-03-05 05:04:39'),(90,'DB-2021-2','2021/03/05','0','2','INV-2021-2-9','Penjualan','Botol','2021-03-05 05:04:52','2021-03-05 05:04:52'),(91,'DB-2021-5','2021/03/05','0','2','INV-2021-3-10','Penjualan','Butir','2021-03-05 05:09:23','2021-03-05 05:09:23'),(92,'DB-2021-2','2021/03/05','0','2','INV-2021-3-10','Penjualan','Botol','2021-03-05 05:09:36','2021-03-05 05:09:36'),(93,'DB-2021-1','2021/03/05','1','0','OP-2021-2','Stok Opname-kj','Gram','2021-03-05 05:31:24','2021-03-05 05:31:24'),(94,'DB-2021-2','2021/03/05','0','-5','OP-2021-2','Stok Opname-jhgjh','Botol','2021-03-05 05:31:36','2021-03-05 05:31:36'),(97,'DB-2021-1','2021/03/05','0','2','INV-2021-3-11','Penjualan','Gram','2021-03-05 09:05:02','2021-03-05 09:05:02'),(98,'DB-2021-1','2021/03/05','0','200','INV-2021-3-11','Penjualan Menu','Gram',NULL,NULL),(99,'DB-2021-1','2021/03/05','0','4','INV-2021-3-12','Penjualan','Gram','2021-03-05 09:14:19','2021-03-05 09:14:19'),(100,'DB-2021-1','2021/03/05','0','800','INV-2021-3-12','Penjualan Menu','Gram',NULL,NULL),(101,'DB-2021-2','2021/03/05','0','4','INV-2021-3-12','Penjualan','Botol','2021-03-05 09:14:52','2021-03-05 09:14:52'),(102,'DB-2021-3','2021/03/05','0','8','INV-2021-2-12','Penjualan','Gram','2021-03-05 09:15:11','2021-03-05 09:15:11'),(103,'DB-2021-5','2021/03/05','0','8','INV-2021-2-12','Penjualan','Butir','2021-03-05 09:15:23','2021-03-05 09:15:23'),(104,'DB-2021-1','2021/03/05','0','2','INV-2021-5-14','Penjualan','Gram','2021-03-05 12:17:05','2021-03-05 12:17:05'),(105,'DB-2021-1','2021/03/05','0','400','INV-2021-5-14','Penjualan Menu','Gram',NULL,NULL),(106,'DB-2021-2','2021/03/05','0','2','INV-2021-5-14','Penjualan','Botol','2021-03-05 12:17:51','2021-03-05 12:17:51'),(107,'DB-2021-1','2021/03/05','0','3','INV-2021-2-15','Penjualan','Gram','2021-03-05 21:51:56','2021-03-05 21:51:56'),(108,'DB-2021-3','2021/03/05','0','300','INV-2021-2-15','Penjualan Menu','Gram',NULL,NULL),(109,'DB-2021-4','2021/03/05','0','6','INV-2021-2-15','Penjualan Menu','Gram',NULL,NULL),(110,'DB-2021-5','2021/03/05','0','3','INV-2021-2-15','Penjualan Menu','Butir',NULL,NULL),(111,'DB-2021-5','2021/03/05','0','3','INV-2021-2-15','Penjualan','Butir','2021-03-05 21:52:16','2021-03-05 21:52:16'),(112,'DB-2021-3','2021/03/05','0','50','INV-2021-4-15','Penjualan','Gram','2021-03-05 21:52:56','2021-03-05 21:52:56'),(113,'DB-2021-5','2021/03/05','0','5','INV-2021-4-15','Penjualan','Butir','2021-03-05 21:53:17','2021-03-05 21:53:17'),(114,'DB-2021-3','2021/03/05','0','500','INV-2021-4-15','Penjualan Menu','Gram',NULL,NULL),(115,'DB-2021-4','2021/03/05','0','10','INV-2021-4-15','Penjualan Menu','Gram',NULL,NULL),(116,'DB-2021-5','2021/03/05','0','5','INV-2021-4-15','Penjualan Menu','Butir',NULL,NULL),(117,'DB-2021-1','2021/03/05','51403','0','OP-2021-3','Stok Opname-kelebihan barang','Gram','2021-03-05 22:00:41','2021-03-05 22:00:41'),(118,'DB-2021-2','2021/03/05','11','0','OP-2021-3','Stok Opname-kelebihan barang','Botol','2021-03-05 22:01:14','2021-03-05 22:01:14'),(122,'DB-2021-2','2021/03/05','20','0','PB-2021-3','Pembelian','Botol','2021-03-05 22:55:45','2021-03-05 22:55:45'),(123,'DB-2021-4','2021/03/05','300','0','PB-2021-4','Pembelian','Gram','2021-03-05 23:07:13','2021-03-05 23:07:13'),(124,'DB-2021-5','2021/03/05','20','0','PB-2021-4','Pembelian','Butir','2021-03-05 23:07:26','2021-03-05 23:07:26'),(125,'DB-2021-1','2021/03/05','0','100','INV-2021-5-17','Penjualan','Gram','2021-03-05 23:18:02','2021-03-05 23:18:02'),(127,'DB-2021-6','2021/03/05','20','0','PB-2021-5','Pembelian','Botol','2021-03-05 23:45:41','2021-03-05 23:45:41'),(128,'DB-2021-6','2021/03/05','0','4','INV-2021-5-18','Penjualan','Botol','2021-03-05 23:47:07','2021-03-05 23:47:07'),(129,'DB-2021-5','2021/03/05','0','4','INV-2021-5-18','Penjualan','Butir','2021-03-05 23:47:22','2021-03-05 23:47:22'),(130,'DB-2021-3','2021/03/05','0','200','INV-2021-2-18','Penjualan Menu','Gram',NULL,NULL),(131,'DB-2021-6','2021/03/05','0','2','INV-2021-2-18','Penjualan Menu','Botol',NULL,NULL),(132,'DB-2021-6','2021/03/05','0','-4','OP-2021-4','Stok Opname-Pecah','Botol','2021-03-05 23:52:08','2021-03-05 23:52:08');
/*!40000 ALTER TABLE `tblkartustok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkategori`
--

DROP TABLE IF EXISTS `tblkategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblkategori` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kodeKtg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaKtg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkategori`
--

LOCK TABLES `tblkategori` WRITE;
/*!40000 ALTER TABLE `tblkategori` DISABLE KEYS */;
INSERT INTO `tblkategori` VALUES (1,'KT-2021-1','Makanan','2021-03-04 11:35:57','2021-03-04 11:35:57'),(2,'KT-2021-2','Minuman','2021-03-04 12:02:36','2021-03-04 12:02:36');
/*!40000 ALTER TABLE `tblkategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkomposisi`
--

DROP TABLE IF EXISTS `tblkomposisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblkomposisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idMenu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBarang` double NOT NULL,
  `satuanBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaBarang` double NOT NULL,
  `totalBarang` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkomposisi`
--

LOCK TABLES `tblkomposisi` WRITE;
/*!40000 ALTER TABLE `tblkomposisi` DISABLE KEYS */;
INSERT INTO `tblkomposisi` VALUES (1,'MN-2021-1','DB-2021-3',100,'Gram',50,5000,'2021-03-04 12:10:26','2021-03-04 12:10:26'),(2,'MN-2021-1','DB-2021-4',2,'Gram',50,100,'2021-03-04 12:10:43','2021-03-04 12:10:43'),(3,'MN-2021-1','DB-2021-5',1,'Butir',2000,2000,'2021-03-04 12:10:55','2021-03-04 12:10:55'),(5,'MN-2021-2','DB-2021-3',100,'Gram',50,5000,'2021-03-05 23:48:09','2021-03-05 23:48:09'),(6,'MN-2021-2','DB-2021-6',1,'Botol',5000,5000,'2021-03-05 23:48:22','2021-03-05 23:48:22');
/*!40000 ALTER TABLE `tblkomposisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmeja`
--

DROP TABLE IF EXISTS `tblmeja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblmeja` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noMeja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paxMeja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmeja`
--

LOCK TABLES `tblmeja` WRITE;
/*!40000 ALTER TABLE `tblmeja` DISABLE KEYS */;
INSERT INTO `tblmeja` VALUES (1,'1','4','0',NULL,'2021-03-04 11:35:45','2021-03-05 09:13:51'),(2,'2','4','0',NULL,'2021-03-04 11:58:01','2021-03-05 23:46:43'),(3,'6','4','0',NULL,'2021-03-05 01:26:21','2021-03-05 09:14:03'),(4,'5','4','0',NULL,'2021-03-05 09:10:23','2021-03-05 21:52:33'),(5,'3','6','0',NULL,'2021-03-05 12:16:12','2021-03-05 23:46:48'),(6,'4','4','0',NULL,'2021-03-05 12:16:25','2021-03-05 12:16:25');
/*!40000 ALTER TABLE `tblmeja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmenu`
--

DROP TABLE IF EXISTS `tblmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblmenu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdMenu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmMenu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaMenu` double NOT NULL,
  `stokMenu` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hppMenu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmenu`
--

LOCK TABLES `tblmenu` WRITE;
/*!40000 ALTER TABLE `tblmenu` DISABLE KEYS */;
INSERT INTO `tblmenu` VALUES (1,'MN-2021-1','Nasi Goreng',15000,'1','2021-03-04 12:07:11','2021-03-05 23:37:59','7100'),(2,'MN-2021-2','JAJO uli',20000,'1','2021-03-05 08:50:08','2021-03-05 23:48:29','10000');
/*!40000 ALTER TABLE `tblmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpembelian`
--

DROP TABLE IF EXISTS `tblpembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpembelian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idSupplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noNotaPembelian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNotaPembelian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNotaPembelian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userPembelian` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpembelian`
--

LOCK TABLES `tblpembelian` WRITE;
/*!40000 ALTER TABLE `tblpembelian` DISABLE KEYS */;
INSERT INTO `tblpembelian` VALUES (1,'SP-2021-1','PB-2021-1','2021/03/05','112000',NULL,'2021-03-05 02:40:45','2021-03-05 02:40:45'),(2,'SP-2021-1','PB-2021-2','2021/03/05','10500','1','2021-03-05 03:16:58','2021-03-05 03:16:58'),(3,'SP-2021-1','PB-2021-3','2021/03/05','40000','3','2021-03-05 22:55:57','2021-03-05 22:55:57'),(4,'SP-2021-1','PB-2021-4','2021/03/05','39000','3','2021-03-05 23:07:39','2021-03-05 23:07:39'),(5,'SP-2021-1','PB-2021-5','2021/03/05','60000','3','2021-03-05 23:45:51','2021-03-05 23:45:51');
/*!40000 ALTER TABLE `tblpembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpembeliandetail`
--

DROP TABLE IF EXISTS `tblpembeliandetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpembeliandetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNotaPembelian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalBeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpembeliandetail`
--

LOCK TABLES `tblpembeliandetail` WRITE;
/*!40000 ALTER TABLE `tblpembeliandetail` DISABLE KEYS */;
INSERT INTO `tblpembeliandetail` VALUES (1,'PB-2021-1','DB-2021-1','2000','20','40000','2021-03-05 02:39:14','2021-03-05 02:39:14'),(2,'PB-2021-1','DB-2021-5','1500','20','30000','2021-03-05 02:39:22','2021-03-05 02:39:22'),(3,'PB-2021-1','DB-2021-2','2000','21','42000','2021-03-05 02:39:28','2021-03-05 02:39:28'),(4,'PB-2021-2','DB-2021-2','2000','3','6000','2021-03-05 03:16:33','2021-03-05 03:16:33'),(5,'PB-2021-2','DB-2021-5','1500','3','4500','2021-03-05 03:16:40','2021-03-05 03:16:40'),(11,'PB-2021-3','DB-2021-2','2000','20','40000','2021-03-05 22:55:45','2021-03-05 22:55:45'),(12,'PB-2021-4','DB-2021-4','30','300','9000','2021-03-05 23:07:13','2021-03-05 23:07:13'),(13,'PB-2021-4','DB-2021-5','1500','20','30000','2021-03-05 23:07:26','2021-03-05 23:07:26'),(15,'PB-2021-5','DB-2021-6','3000','20','60000','2021-03-05 23:45:41','2021-03-05 23:45:41');
/*!40000 ALTER TABLE `tblpembeliandetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpenjualan`
--

DROP TABLE IF EXISTS `tblpenjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpenjualan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noMeja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelangganNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskonNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userNota` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpenjualan`
--

LOCK TABLES `tblpenjualan` WRITE;
/*!40000 ALTER TABLE `tblpenjualan` DISABLE KEYS */;
INSERT INTO `tblpenjualan` VALUES (1,'INV-2021-1-1','1','Cash','2021/03/05','40000','0','0','50000','10000','1','2021-03-05 04:02:53','2021-03-05 04:02:53'),(2,'INV-2021-3-2','3','Cash','2021/03/05','46084.5','4410','2425.5','50000','3915.5','1','2021-03-05 04:11:55','2021-03-05 04:11:55'),(3,'INV-2021-3-3','3','Cash','2021/03/05','48000','0','0','50000','2000','1','2021-03-05 04:14:04','2021-03-05 04:14:04'),(4,'INV-2021-3-4','3','Cash','2021/03/05','18000','0','0','20000','2000','1','2021-03-05 04:15:49','2021-03-05 04:15:49'),(5,'INV-2021-3-5','3','Cash','2021/03/05','18000','0','0','20000','2000','1','2021-03-05 04:17:29','2021-03-05 04:17:29'),(6,'INV-2021-3-6','3','Cash','2021/03/05','14000','0','0','15000','1000','1','2021-03-05 04:20:19','2021-03-05 04:20:19'),(7,'INV-2021-3-7','3','Cash','2021/03/05','42000','0','0','50000','8000','1','2021-03-05 04:26:16','2021-03-05 04:26:16'),(8,'INV-2021-3-8','3','Cash','2021/03/05','34000','0','0','50000','16000','3','2021-03-05 05:03:21','2021-03-05 05:03:21'),(9,'INV-2021-2-9','2','Cash','2021/03/05','12000','0','0','15000','3000','3','2021-03-05 05:06:32','2021-03-05 05:06:32'),(10,'INV-2021-3-10','3','Cash','2021/03/05','12000','0','0','15000','3000','3','2021-03-05 05:09:47','2021-03-05 05:09:47'),(11,'INV-2021-3-11','3','Cash','2021/03/05','15000','0','0','20000','5000','1','2021-03-05 09:07:04','2021-03-05 09:07:04'),(12,'INV-2021-3-12','3','Cash','2021/03/05','56000','0','0','60000','4000','3','2021-03-05 09:15:49','2021-03-05 09:15:49'),(13,'INV-2021-2-13','2','Cash','2021/03/05','16400','0','0','20000','3600','1','2021-03-05 12:15:49','2021-03-05 12:15:49'),(14,'INV-2021-5-14','5','Cash','2021/03/05','28000','0','0','30000','2000','1','2021-03-05 12:18:02','2021-03-05 12:18:02'),(15,'INV-2021-2-15','2','Cash','2021/03/05','66000','0','0','70000','4000','3','2021-03-05 21:54:28','2021-03-05 21:54:28'),(16,'INV-2021-4-16','4','Cash','2021/03/05','87500','0','0','90000','2500','3','2021-03-05 21:54:47','2021-03-05 21:54:47'),(17,'INV-2021-5-17','5','Cash','2021/03/05','500000','0','0','500000','0','3','2021-03-05 23:21:37','2021-03-05 23:21:37'),(18,'INV-2021-5-18','5','Cash','2021/03/05','28000','0','0','30000','2000','3','2021-03-05 23:49:39','2021-03-05 23:49:39'),(19,'INV-2021-2-19','2','Cash','2021/03/05','40000','0','0','50000','10000','3','2021-03-05 23:50:30','2021-03-05 23:50:30');
/*!40000 ALTER TABLE `tblpenjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpenjualandetail`
--

DROP TABLE IF EXISTS `tblpenjualandetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpenjualandetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noMeja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgJual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpenjualandetail`
--

LOCK TABLES `tblpenjualandetail` WRITE;
/*!40000 ALTER TABLE `tblpenjualandetail` DISABLE KEYS */;
INSERT INTO `tblpenjualandetail` VALUES (1,'INV-2021-1-1','1','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(2,'INV-2021-1-1','1','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(3,'INV-2021-3-2','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(4,'INV-2021-3-2','3','DB-2021-3','50','2','100','KT-2021-1','Nasi Putih',NULL,NULL),(5,'INV-2021-3-2','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(6,'INV-2021-3-2','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(7,'INV-2021-3-3','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(8,'INV-2021-3-3','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(9,'INV-2021-3-3','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(10,'INV-2021-3-4','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(11,'INV-2021-3-4','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(12,'INV-2021-3-5','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(13,'INV-2021-3-5','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(14,'INV-2021-3-6','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(15,'INV-2021-3-6','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(16,'INV-2021-3-7','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(17,'INV-2021-3-7','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(18,'INV-2021-3-7','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(19,'INV-2021-3-8','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(20,'INV-2021-3-8','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(21,'INV-2021-2-9','2','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(22,'INV-2021-2-9','2','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(23,'INV-2021-3-10','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(24,'INV-2021-3-10','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(25,'INV-2021-3-11','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(26,'INV-2021-3-11','3','MN-2021-2','5000','1','5000','MN-2021-2','JAJO uli',NULL,NULL),(27,'INV-2021-3-12','3','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL),(28,'INV-2021-3-12','3','MN-2021-2','5000','4','20000','MN-2021-2','JAJO uli',NULL,NULL),(29,'INV-2021-3-12','3','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(30,'INV-2021-2-13','2','DB-2021-3','50','8','400','KT-2021-1','Nasi Putih',NULL,NULL),(31,'INV-2021-2-13','2','DB-2021-5','2000','8','16000','KT-2021-1','Telur Ayam',NULL,NULL),(32,'INV-2021-5-14','5','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(33,'INV-2021-5-14','5','MN-2021-2','5000','2','10000','MN-2021-2','JAJO uli',NULL,NULL),(34,'INV-2021-5-14','5','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(35,'INV-2021-2-15','2','DB-2021-1','5000','3','15000','KT-2021-1','Nasi Goreng',NULL,NULL),(36,'INV-2021-2-15','2','MN-2021-1','15000','3','45000','MN-2021-1','Nasi Goreng',NULL,NULL),(37,'INV-2021-2-15','2','DB-2021-5','2000','3','6000','KT-2021-1','Telur Ayam',NULL,NULL),(38,'INV-2021-4-16','4','DB-2021-3','50','50','2500','KT-2021-1','Nasi Putih',NULL,NULL),(39,'INV-2021-4-16','4','DB-2021-5','2000','5','10000','KT-2021-1','Telur Ayam',NULL,NULL),(40,'INV-2021-4-16','4','MN-2021-1','15000','5','75000','MN-2021-1','Nasi Goreng',NULL,NULL),(41,'INV-2021-5-17','5','DB-2021-1','5000','100','500000','KT-2021-1','Nasi Goreng',NULL,NULL),(42,'INV-2021-5-18','5','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(43,'INV-2021-5-18','5','DB-2021-5','2000','4','8000','KT-2021-1','Telur Ayam',NULL,NULL),(44,'INV-2021-2-19','2','MN-2021-2','20000','2','40000','MN-2021-2','JAJO uli',NULL,NULL);
/*!40000 ALTER TABLE `tblpenjualandetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsatuan`
--

DROP TABLE IF EXISTS `tblsatuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblsatuan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ktgSatuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtySatuan` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsatuan`
--

LOCK TABLES `tblsatuan` WRITE;
/*!40000 ALTER TABLE `tblsatuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsatuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstokopname`
--

DROP TABLE IF EXISTS `tblstokopname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblstokopname` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noStokOpname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglStok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalOpname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstokopname`
--

LOCK TABLES `tblstokopname` WRITE;
/*!40000 ALTER TABLE `tblstokopname` DISABLE KEYS */;
INSERT INTO `tblstokopname` VALUES (1,'OP-2021-1','2021/03/05','-500','2021-03-05 00:01:01','2021-03-05 00:01:01'),(2,'OP-2021-2','2021/03/05','-8000','2021-03-05 05:31:39','2021-03-05 05:31:39'),(3,'OP-2021-3','2021/03/05','102828000','2021-03-05 22:01:25','2021-03-05 22:01:25'),(4,'OP-2021-4','2021/03/05','-12000','2021-03-05 23:52:14','2021-03-05 23:52:14');
/*!40000 ALTER TABLE `tblstokopname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstokopnamedetail`
--

DROP TABLE IF EXISTS `tblstokopnamedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblstokopnamedetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noStokOpname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyGudang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `selisihStok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganStok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanStok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nilaiStok` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstokopnamedetail`
--

LOCK TABLES `tblstokopnamedetail` WRITE;
/*!40000 ALTER TABLE `tblstokopnamedetail` DISABLE KEYS */;
INSERT INTO `tblstokopnamedetail` VALUES (17,'OP-2021-1','DB-2021-5','39','1','dsfa','Butir','2021-03-05 00:00:36','2021-03-05 00:00:36','1500'),(18,'OP-2021-1','DB-2021-2','8','-1','fdsf','Botol','2021-03-05 00:00:53','2021-03-05 00:00:53','-2000'),(19,'OP-2021-2','DB-2021-1','8','1','kj','Gram','2021-03-05 05:31:24','2021-03-05 05:31:24','2000'),(20,'OP-2021-2','DB-2021-2','5','-5','jhgjh','Botol','2021-03-05 05:31:36','2021-03-05 05:31:36','-10000'),(21,'OP-2021-3','DB-2021-1','50000','51403','kelebihan barang','Gram','2021-03-05 22:00:41','2021-03-05 22:00:41','102806000'),(22,'OP-2021-3','DB-2021-2','10','11','kelebihan barang','Botol','2021-03-05 22:01:14','2021-03-05 22:01:14','22000'),(23,'OP-2021-4','DB-2021-6','40','-4','Pecah','Botol','2021-03-05 23:52:08','2021-03-05 23:52:08','-12000');
/*!40000 ALTER TABLE `tblstokopnamedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsupplier`
--

DROP TABLE IF EXISTS `tblsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblsupplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdSupplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmSupplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `almtSupplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noHp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontakSupplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsupplier`
--

LOCK TABLES `tblsupplier` WRITE;
/*!40000 ALTER TABLE `tblsupplier` DISABLE KEYS */;
INSERT INTO `tblsupplier` VALUES (1,'SP-2021-1','Tunas Jaya','Sesetan','2545566','Andi','2021-03-05 02:40:14','2021-03-05 02:40:14');
/*!40000 ALTER TABLE `tblsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltmp_transaksi`
--

DROP TABLE IF EXISTS `tbltmp_transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbltmp_transaksi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltmp_transaksi`
--

LOCK TABLES `tbltmp_transaksi` WRITE;
/*!40000 ALTER TABLE `tbltmp_transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltmp_transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltmp_transaksidetail`
--

DROP TABLE IF EXISTS `tbltmp_transaksidetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbltmp_transaksidetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noMejaTmp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kdBarangTmp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hrgJualTmp` double DEFAULT NULL,
  `qtyTmp` double DEFAULT NULL,
  `totalTmp` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `typeTmp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nmBarangTmp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noNotaTmp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltmp_transaksidetail`
--

LOCK TABLES `tbltmp_transaksidetail` WRITE;
/*!40000 ALTER TABLE `tbltmp_transaksidetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltmp_transaksidetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltmp_transaksis`
--

DROP TABLE IF EXISTS `tbltmp_transaksis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbltmp_transaksis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltmp_transaksis`
--

LOCK TABLES `tbltmp_transaksis` WRITE;
/*!40000 ALTER TABLE `tbltmp_transaksis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltmp_transaksis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','Admin','admin@yahoo.com','$2y$10$pNMEGH7lfUhIMh8R177T5eHEe1hPJo9ds/6.B8caUJFtsyseAOOua',NULL,'2021-03-04 11:56:19','2021-03-04 11:56:19'),(3,'rihan adi','rihan','Admin','rihan@yahoo.com','$2y$10$RovRCrxmLzfw3hLvtxdvceYAyx/Xl7M0l2Gx9mxfckIfZOXIno0D.',NULL,'2021-03-05 04:47:36','2021-03-05 04:47:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-06  8:01:51
