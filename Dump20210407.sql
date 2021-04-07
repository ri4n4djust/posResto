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
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(6,'2021_01_02_073223_create_penjualans_table',1),(11,'2021_01_06_045741_create_transaksis_table',2),(69,'2021_01_04_044741_create_countries_states_table',3),(74,'2021_02_08_161531_create_penjualan_details_table',3),(150,'2014_10_12_100000_create_password_resets_table',4),(151,'2019_08_19_000000_create_failed_jobs_table',4),(152,'2021_01_02_012505_create_barangs_table',4),(153,'2021_01_02_025846_create_suppliers_table',4),(154,'2021_01_02_233418_create_kategoris_table',4),(155,'2021_01_03_000733_satuan',4),(156,'2021_01_04_111024_create_mejas_table',4),(157,'2021_02_02_142436_create_menus_table',4),(158,'2021_02_03_045330_create_komposisis_table',4),(159,'2021_02_05_061214_create_transaksis_table',4),(160,'2021_02_08_162955_create_penjualans_table',4),(161,'2021_02_12_082257_pembelian',4),(162,'2021_02_12_113120_pembelian_detail',4),(163,'2021_02_21_073842_kartustok',4),(164,'2021_02_27_174740_users',4),(165,'2021_03_02_091025_stokopname',4),(166,'2021_03_02_174311_create_stok_opname_details_table',4),(168,'2021_03_19_215018_create_inventoris_table',5),(169,'2021_03_22_114649_create_kartu_stok_inventoris_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `tblBarang`
--

DROP TABLE IF EXISTS `tblBarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblBarang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` double NOT NULL,
  `hrgJual` double NOT NULL,
  `ktgBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merek` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stkBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stkSatuan` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qtyMin` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMax` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stsBarang` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBarang`
--

LOCK TABLES `tblBarang` WRITE;
/*!40000 ALTER TABLE `tblBarang` DISABLE KEYS */;
INSERT INTO `tblBarang` VALUES (1,'DB-2021-1','Paha Ayam',34,8000,'KT-2021-1','Gram','Ayam','8326',NULL,'500','5000','2','Ayam Paha Mentah','2021-03-19 23:05:52','2021-03-19 23:05:52'),(2,'DB-2021-2','Dada Ayam',34,9000,'KT-2021-1','Gram','Ayam','3000',NULL,'500','5000','2','Dada Ayam','2021-03-19 23:08:42','2021-03-19 23:08:42'),(3,'DB-2021-3','Sayap Ayam',34,7000,'KT-2021-1','Gram','Ayam','3500',NULL,'300','2000','2','Sayap Ayam','2021-03-19 23:15:14','2021-03-19 23:15:14'),(5,'DB-2021-5','Kerang Hijau',50,500,'KT-2021-1','Gram','Kerang','1685',NULL,'200','5000','2','Kerang Hijau','2021-03-19 23:22:47','2021-03-19 23:22:47'),(7,'DB-2021-7','Ikan Lele',50,600,'KT-2021-1','Gram','Lele','3040',NULL,'200','5000','2','Lele Dumbo','2021-03-19 23:45:03','2021-03-19 23:45:03'),(8,'DB-2021-8','Iga',55,500,'KT-2021-1','Gram','Iga Sapi','5000',NULL,'200','5000','2','Iga Sapi','2021-03-19 23:53:21','2021-03-19 23:53:21'),(23,'DB-2021-9','Cola 600ml',2000,4000,'KT-2021-2','Botol','Coca','-8',NULL,'2','100','1','Coca Cola','2021-03-21 23:25:03','2021-03-21 23:25:03'),(24,'DB-2021-10','Akua 600ml',2000,5000,'KT-2021-2','Botol','Akua','21',NULL,'2','50','1','Akua','2021-03-21 23:30:50','2021-03-21 23:30:50'),(25,'DB-2021-11','Udang',50,80,'KT-2021-1','Gram','Udang','1000',NULL,'100','6000','2','Udang Merah','2021-03-23 12:41:45','2021-03-23 12:41:45'),(26,'DB-2021-12','Kentang Mentah',20,40,'KT-2021-1','Gram','Kentang','300',NULL,'10','10000','2','Kentang','2021-03-24 00:03:53','2021-03-24 00:03:53'),(27,'DB-2021-13','SUpermi Ayam Bawang',2000,4000,'KT-2021-1','Buah','Supermi','2',NULL,'2','10','1','Supermi Ayam Bawang Enak','2021-03-31 23:08:38','2021-03-31 23:08:38');
/*!40000 ALTER TABLE `tblBarang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblInventori`
--

DROP TABLE IF EXISTS `tblInventori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblInventori` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stkInventori` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuanInventori` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hrgSatuan` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stkSatuan` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblInventori`
--

LOCK TABLES `tblInventori` WRITE;
/*!40000 ALTER TABLE `tblInventori` DISABLE KEYS */;
INSERT INTO `tblInventori` VALUES (1,'DB-2021-1','16',NULL,'2021-03-19 23:05:52','2021-03-19 23:05:52','6800','200'),(2,'DB-2021-2','3001',NULL,'2021-03-19 23:08:42','2021-03-19 23:08:42','5667','167'),(3,'DB-2021-3','12',NULL,'2021-03-19 23:15:14','2021-03-19 23:15:14','5667','167'),(5,'DB-2021-5','7',NULL,'2021-03-19 23:22:47','2021-03-19 23:22:47','8334','167'),(7,'DB-2021-7','6',NULL,'2021-03-19 23:45:03','2021-03-19 23:45:03','8334','167'),(8,'DB-2021-8','6',NULL,'2021-03-19 23:53:21','2021-03-19 23:53:21','9167','167'),(13,'DB-2021-9','-8',NULL,'2021-03-21 23:25:03','2021-03-21 23:25:03','2000','1'),(14,'DB-2021-10','6',NULL,'2021-03-21 23:30:50','2021-03-21 23:30:50','2000','1'),(15,'DB-2021-11','7',NULL,'2021-03-23 12:41:45','2021-03-23 12:41:45','50','1'),(16,'DB-2021-12','3',NULL,'2021-03-24 00:03:53','2021-03-24 00:03:53','2000','100'),(17,'DB-2021-13','2',NULL,'2021-03-31 23:08:38','2021-03-31 23:08:38','2000','1');
/*!40000 ALTER TABLE `tblInventori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKartuStok`
--

DROP TABLE IF EXISTS `tblKartuStok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblKartuStok` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMasuk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyKeluar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTransaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKartuStok`
--

LOCK TABLES `tblKartuStok` WRITE;
/*!40000 ALTER TABLE `tblKartuStok` DISABLE KEYS */;
INSERT INTO `tblKartuStok` VALUES (24,'DB-2021-1','2021/03/21','2000','0','PB-2021-3','Pembelian','Gram','2021-03-21 03:11:30','2021-03-21 03:11:30'),(26,'DB-2021-10','2021/03/21','10','0','PB-2021-3','Pembelian','Botol','2021-03-21 23:32:19','2021-03-21 23:32:19'),(30,'DB-2021-1','2021/03/21','3000','0','PB-2021-4','Pembelian','Gram','2021-03-21 23:40:26','2021-03-21 23:40:26'),(31,'DB-2021-1','2021/03/21','1000','0','PB-2021-5','Pembelian','Gram','2021-03-21 23:44:51','2021-03-21 23:44:51'),(33,'DB-2021-1','2021/03/21','1000','0','PB-2021-6','Pembelian','Gram','2021-03-21 23:47:19','2021-03-21 23:47:19'),(35,'DB-2021-10','2021/03/21','10','0','PB-2021-6','Pembelian','Botol','2021-03-21 23:48:41','2021-03-21 23:48:41'),(36,'DB-2021-2','2021/03/23','1000','0','PB-2021-7','Pembelian','Gram','2021-03-23 00:26:42','2021-03-23 00:26:42'),(38,'DB-2021-9','2021/03/23','20','0','PB-2021-8','Pembelian','Botol','2021-03-23 00:31:05','2021-03-23 00:31:05'),(39,'DB-2021-5','2021/03/23','1000','0','PB-2021-9','Pembelian','Gram','2021-03-23 00:32:41','2021-03-23 00:32:41'),(40,'DB-2021-10','2021/03/23','0','2','INV-2021-4-1','Penjualan','Botol','2021-03-23 00:35:02','2021-03-23 00:35:02'),(41,'DB-2021-1','2021/03/23','0','334','INV-2021-4-1','Penjualan Menu','Gram',NULL,NULL),(42,'DB-2021-9','2021/03/23','0','2','INV-2021-4-1','Penjualan Menu','Botol',NULL,NULL),(43,'DB-2021-9','2021/03/23','0','4','INV-2021-3-2','Penjualan','Botol','2021-03-23 23:07:18','2021-03-23 23:07:18'),(44,'DB-2021-5','2021/03/23','0','668','INV-2021-3-2','Penjualan Menu','Gram',NULL,NULL),(45,'DB-2021-9','2021/03/23','0','4','INV-2021-3-2','Penjualan Menu','Botol',NULL,NULL),(46,'DB-2021-10','2021/03/23','0','4','INV-2021-2-3','Penjualan','Botol','2021-03-23 23:52:02','2021-03-23 23:52:02'),(47,'DB-2021-1','2021/03/23','0','668','INV-2021-2-3','Penjualan Menu','Gram',NULL,NULL),(48,'DB-2021-9','2021/03/23','0','4','INV-2021-2-3','Penjualan Menu','Botol',NULL,NULL),(51,'DB-2021-13','2021/03/31','20','0','PB-2021-10','Pembelian','Buah','2021-03-31 23:09:58','2021-03-31 23:09:58'),(52,'DB-2021-13','2021/03/31','0','4','INV-2021-2-5','Penjualan Menu','Buah',NULL,NULL),(53,'DB-2021-10','2021/03/31','0','4','INV-2021-2-5','Penjualan','Botol','2021-03-31 23:12:44','2021-03-31 23:12:44'),(54,'DB-2021-6','2021/04/01','0','-500','OP-2021-1','Stok Opname-Busuk','Gram','2021-04-01 11:35:56','2021-04-01 11:35:56'),(55,'DB-2021-1','2021/04/01','1000','0','PB-2021-11','Pembelian','Gram','2021-04-01 11:37:50','2021-04-01 11:37:50'),(56,'DB-2021-3','2021/04/01','2000','0','PB-2021-12','Pembelian','Gram','2021-04-01 11:40:14','2021-04-01 11:40:14'),(57,'DB-2021-13','2021/04/01','0','2','INV-2021-2-6','Penjualan Menu','Buah',NULL,NULL),(58,'DB-2021-9','2021/04/01','0','2','INV-2021-2-6','Penjualan','Botol','2021-04-01 11:43:40','2021-04-01 11:43:40'),(59,'DB-2021-13','2021/04/01','0','4','INV-2021-1-7','Penjualan Menu','Buah',NULL,NULL),(60,'DB-2021-10','2021/04/01','0','4','INV-2021-1-7','Penjualan','Botol','2021-04-01 13:26:05','2021-04-01 13:26:05'),(61,'DB-2021-12','2021/04/02','2000','0','PB-2021-13','Pembelian','Gram','2021-04-02 12:23:10','2021-04-02 12:23:10'),(62,'DB-2021-12','2021/04/02','0','200','INV-2021-2-8','Penjualan Menu','Gram',NULL,NULL),(63,'DB-2021-5','2021/04/02','0','334','INV-2021-2-8','Penjualan Menu','Gram',NULL,NULL),(64,'DB-2021-9','2021/04/02','0','2','INV-2021-2-8','Penjualan Menu','Botol',NULL,NULL),(65,'DB-2021-9','2021/04/02','0','2','INV-2021-2-8','Penjualan','Botol','2021-04-02 12:27:41','2021-04-02 12:27:41'),(66,'DB-2021-9','2021/04/02','0','4','INV-2021-1-9','Penjualan','Botol','2021-04-02 12:58:09','2021-04-02 12:58:09'),(67,'DB-2021-12','2021/04/02','0','400','INV-2021-3-10','Penjualan Menu','Gram',NULL,NULL),(68,'DB-2021-13','2021/04/02','0','4','INV-2021-1-11','Penjualan Menu','Buah',NULL,NULL),(69,'DB-2021-12','2021/04/02','0','400','INV-2021-2-12','Penjualan Menu','Gram',NULL,NULL),(70,'DB-2021-12','2021/04/02','0','300','INV-2021-2-13','Penjualan Menu','Gram',NULL,NULL),(71,'DB-2021-1','2021/04/02','0','668','INV-2021-4-14','Penjualan Menu','Gram',NULL,NULL),(72,'DB-2021-9','2021/04/02','0','4','INV-2021-4-14','Penjualan Menu','Botol',NULL,NULL),(73,'DB-2021-9','2021/04/02','0','4','INV-2021-4-14','Penjualan','Botol','2021-04-02 13:09:39','2021-04-02 13:09:39'),(74,'DB-2021-9','2021/04/02','0','4','INV-2021-1-15','Penjualan','Botol','2021-04-02 13:11:29','2021-04-02 13:11:29'),(75,'DB-2021-5','2021/04/02','0','668','INV-2021-3-16','Penjualan Menu','Gram',NULL,NULL),(76,'DB-2021-9','2021/04/02','0','4','INV-2021-3-16','Penjualan Menu','Botol',NULL,NULL),(77,'DB-2021-13','2021/04/02','0','4','INV-2021-1-17','Penjualan Menu','Buah',NULL,NULL),(78,'DB-2021-7','2021/04/02','1000','0','PB-2021-14','Pembelian','Gram','2021-04-02 23:25:31','2021-04-02 23:25:31'),(80,'DB-2021-8','2021/04/02','1000','0','PB-2021-14','Pembelian','Gram','2021-04-02 23:26:27','2021-04-02 23:26:27'),(81,'DB-2021-1','2021/04/07','0','4','INV-2021-2-18','Penjualan','Gram','2021-04-07 12:57:03','2021-04-07 12:57:03'),(82,'DB-2021-9','2021/04/07','0','4','INV-2021-2-18','Penjualan','Botol','2021-04-07 12:57:14','2021-04-07 12:57:14'),(83,'DB-2021-12','2021/04/07','0','400','INV-2021-2-18','Penjualan Menu','Gram',NULL,NULL),(84,'DB-2021-5','2021/04/07','0','668','INV-2021-2-18','Penjualan Menu','Gram',NULL,NULL),(85,'DB-2021-9','2021/04/07','0','4','INV-2021-2-18','Penjualan Menu','Botol',NULL,NULL);
/*!40000 ALTER TABLE `tblKartuStok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKartuStokInventori`
--

DROP TABLE IF EXISTS `tblKartuStokInventori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblKartuStokInventori` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglInv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMasukInv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyKeluarInv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTransaksiInv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganKartuInv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanKartuInv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKartuStokInventori`
--

LOCK TABLES `tblKartuStokInventori` WRITE;
/*!40000 ALTER TABLE `tblKartuStokInventori` DISABLE KEYS */;
INSERT INTO `tblKartuStokInventori` VALUES (1,'DB-2021-2','2021/03/23','6','0','PB-2021-7','Pembelian','Gram','2021-03-23 00:26:42','2021-03-23 00:26:42'),(2,'DB-2021-4','2021/03/23','9','0','PB-2021-7','Pembelian','Gram','2021-03-23 00:27:06','2021-03-23 00:27:06'),(3,'DB-2021-9','2021/03/23','20','0','PB-2021-8','Pembelian','Botol','2021-03-23 00:31:05','2021-03-23 00:31:05'),(4,'DB-2021-5','2021/03/23','6','0','PB-2021-9','Pembelian','Gram','2021-03-23 00:32:41','2021-03-23 00:32:41'),(5,'DB-2021-10','2021/03/23','0','2','INV-2021-4-1','Penjualan','Botol','2021-03-23 00:35:02','2021-03-23 00:35:02'),(6,'DB-2021-1','2021/03/23','0','2','INV-2021-4-1','Penjualan Menu','Gram',NULL,NULL),(7,'DB-2021-9','2021/03/23','0','2','INV-2021-4-1','Penjualan Menu','Botol',NULL,NULL),(8,'DB-2021-9','2021/03/23','0','4','INV-2021-3-2','Penjualan','Botol','2021-03-23 23:07:18','2021-03-23 23:07:18'),(9,'DB-2021-5','2021/03/23','0','4','INV-2021-3-2','Penjualan Menu','Gram',NULL,NULL),(10,'DB-2021-9','2021/03/23','0','4','INV-2021-3-2','Penjualan Menu','Botol',NULL,NULL),(11,'DB-2021-10','2021/03/23','0','4','INV-2021-2-3','Penjualan','Botol','2021-03-23 23:52:02','2021-03-23 23:52:02'),(12,'DB-2021-1','2021/03/23','0','4','INV-2021-2-3','Penjualan Menu','Gram',NULL,NULL),(13,'DB-2021-9','2021/03/23','0','4','INV-2021-2-3','Penjualan Menu','Botol',NULL,NULL),(16,'DB-2021-13','2021/03/31','20','0','PB-2021-10','Pembelian','Buah','2021-03-31 23:09:58','2021-03-31 23:09:58'),(17,'DB-2021-13','2021/03/31','0','4','INV-2021-2-5','Penjualan Menu','Buah',NULL,NULL),(18,'DB-2021-10','2021/03/31','0','4','INV-2021-2-5','Penjualan','Botol','2021-03-31 23:12:44','2021-03-31 23:12:44'),(19,'DB-2021-1','2021/04/01','5','0','PB-2021-11','Pembelian','Gram','2021-04-01 11:37:50','2021-04-01 11:37:50'),(20,'DB-2021-3','2021/04/01','12','0','PB-2021-12','Pembelian','Gram','2021-04-01 11:40:14','2021-04-01 11:40:14'),(21,'DB-2021-13','2021/04/01','0','2','INV-2021-2-6','Penjualan Menu','Buah',NULL,NULL),(22,'DB-2021-9','2021/04/01','0','2','INV-2021-2-6','Penjualan','Botol','2021-04-01 11:43:40','2021-04-01 11:43:40'),(23,'DB-2021-13','2021/04/01','0','4','INV-2021-1-7','Penjualan Menu','Buah',NULL,NULL),(24,'DB-2021-10','2021/04/01','0','4','INV-2021-1-7','Penjualan','Botol','2021-04-01 13:26:05','2021-04-01 13:26:05'),(25,'DB-2021-12','2021/04/02','20','0','PB-2021-13','Pembelian','Gram','2021-04-02 12:23:10','2021-04-02 12:23:10'),(26,'DB-2021-12','2021/04/02','0','2','INV-2021-2-8','Penjualan Menu','Gram',NULL,NULL),(27,'DB-2021-5','2021/04/02','0','2','INV-2021-2-8','Penjualan Menu','Gram',NULL,NULL),(28,'DB-2021-9','2021/04/02','0','2','INV-2021-2-8','Penjualan Menu','Botol',NULL,NULL),(29,'DB-2021-9','2021/04/02','0','2','INV-2021-2-8','Penjualan','Botol','2021-04-02 12:27:41','2021-04-02 12:27:41'),(30,'DB-2021-9','2021/04/02','0','4','INV-2021-1-9','Penjualan','Botol','2021-04-02 12:58:09','2021-04-02 12:58:09'),(31,'DB-2021-12','2021/04/02','0','4','INV-2021-3-10','Penjualan Menu','Gram',NULL,NULL),(32,'DB-2021-13','2021/04/02','0','4','INV-2021-1-11','Penjualan Menu','Buah',NULL,NULL),(33,'DB-2021-12','2021/04/02','0','4','INV-2021-2-12','Penjualan Menu','Gram',NULL,NULL),(34,'DB-2021-12','2021/04/02','0','3','INV-2021-2-13','Penjualan Menu','Gram',NULL,NULL),(35,'DB-2021-1','2021/04/02','0','4','INV-2021-4-14','Penjualan Menu','Gram',NULL,NULL),(36,'DB-2021-9','2021/04/02','0','4','INV-2021-4-14','Penjualan Menu','Botol',NULL,NULL),(37,'DB-2021-9','2021/04/02','0','4','INV-2021-4-14','Penjualan','Botol','2021-04-02 13:09:39','2021-04-02 13:09:39'),(38,'DB-2021-9','2021/04/02','0','4','INV-2021-1-15','Penjualan','Botol','2021-04-02 13:11:29','2021-04-02 13:11:29'),(39,'DB-2021-5','2021/04/02','0','4','INV-2021-3-16','Penjualan Menu','Gram',NULL,NULL),(40,'DB-2021-9','2021/04/02','0','4','INV-2021-3-16','Penjualan Menu','Botol',NULL,NULL),(41,'DB-2021-13','2021/04/02','0','4','INV-2021-1-17','Penjualan Menu','Buah',NULL,NULL),(42,'DB-2021-7','2021/04/02','6','0','PB-2021-14','Pembelian','Gram','2021-04-02 23:25:31','2021-04-02 23:25:31'),(44,'DB-2021-8','2021/04/02','6','0','PB-2021-14','Pembelian','Gram','2021-04-02 23:26:27','2021-04-02 23:26:27'),(45,'DB-2021-1','2021/04/07','0','4','INV-2021-2-18','Penjualan','Gram','2021-04-07 12:57:03','2021-04-07 12:57:03'),(46,'DB-2021-9','2021/04/07','0','4','INV-2021-2-18','Penjualan','Botol','2021-04-07 12:57:14','2021-04-07 12:57:14'),(47,'DB-2021-12','2021/04/07','0','4','INV-2021-2-18','Penjualan Menu','Gram',NULL,NULL),(48,'DB-2021-5','2021/04/07','0','4','INV-2021-2-18','Penjualan Menu','Gram',NULL,NULL),(49,'DB-2021-9','2021/04/07','0','4','INV-2021-2-18','Penjualan Menu','Botol',NULL,NULL);
/*!40000 ALTER TABLE `tblKartuStokInventori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKategori`
--

DROP TABLE IF EXISTS `tblKategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblKategori` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kodeKtg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaKtg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKategori`
--

LOCK TABLES `tblKategori` WRITE;
/*!40000 ALTER TABLE `tblKategori` DISABLE KEYS */;
INSERT INTO `tblKategori` VALUES (1,'KT-2021-1','Makanan','2021-03-19 22:40:29','2021-03-19 22:40:29'),(2,'KT-2021-2','Minuman','2021-03-19 22:40:36','2021-03-19 22:40:36');
/*!40000 ALTER TABLE `tblKategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKomposisi`
--

DROP TABLE IF EXISTS `tblKomposisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblKomposisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBarang` double NOT NULL,
  `satuanBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaBarang` double NOT NULL,
  `totalBarang` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `totalSatuan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKomposisi`
--

LOCK TABLES `tblKomposisi` WRITE;
/*!40000 ALTER TABLE `tblKomposisi` DISABLE KEYS */;
INSERT INTO `tblKomposisi` VALUES (1,'MN-2021-1','DB-2021-1',167,'Gram',5667,5667,'2021-03-23 00:29:54','2021-03-23 00:29:54','1'),(2,'MN-2021-1','DB-2021-9',1,'Botol',2000,2000,'2021-03-23 00:31:52','2021-03-23 00:31:52','1'),(3,'MN-2021-2','DB-2021-5',167,'Gram',8334,8334,'2021-03-23 00:33:16','2021-03-23 00:33:16','1'),(4,'MN-2021-2','DB-2021-9',1,'Botol',2000,2000,'2021-03-23 00:33:28','2021-03-23 00:33:28','1'),(5,'MN-2021-4','DB-2021-13',1,'Buah',2000,2000,'2021-03-31 23:11:39','2021-03-31 23:11:39','1'),(7,'MN-2021-3','DB-2021-12',100,'Gram',2000,2000,'2021-04-02 12:24:01','2021-04-02 12:24:01','1');
/*!40000 ALTER TABLE `tblKomposisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMeja`
--

DROP TABLE IF EXISTS `tblMeja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblMeja` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noMeja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paxMeja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `waiterMeja` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMeja`
--

LOCK TABLES `tblMeja` WRITE;
/*!40000 ALTER TABLE `tblMeja` DISABLE KEYS */;
INSERT INTO `tblMeja` VALUES (1,'1','4','0',NULL,'2021-03-23 00:34:30','2021-04-02 13:15:32','2'),(2,'2','4','0',NULL,'2021-03-23 00:34:36','2021-04-07 12:56:52','2'),(3,'3','4','0',NULL,'2021-03-23 00:34:41','2021-04-02 13:12:28','2'),(4,'4','4','0',NULL,'2021-03-23 00:34:47','2021-04-02 13:09:19','2');
/*!40000 ALTER TABLE `tblMeja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMenu`
--

DROP TABLE IF EXISTS `tblMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblMenu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaMenu` double NOT NULL,
  `stokMenu` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hppMenu` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMenu`
--

LOCK TABLES `tblMenu` WRITE;
/*!40000 ALTER TABLE `tblMenu` DISABLE KEYS */;
INSERT INTO `tblMenu` VALUES (1,'MN-2021-1','Ayam Bakar',25000,'1','7667','2021-03-21 02:58:57','2021-03-23 00:31:55'),(2,'MN-2021-2','Kerang Bakar',35000,'1','10334','2021-03-23 00:27:44','2021-03-23 00:33:35'),(3,'MN-2021-3','Kentang Goreng',15000,'1','2000','2021-03-24 00:01:44','2021-04-02 12:24:13'),(4,'MN-2021-4','Mi rebus Mantap',5000,'1','2000','2021-03-31 23:11:23','2021-03-31 23:11:44');
/*!40000 ALTER TABLE `tblMenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPembelian`
--

DROP TABLE IF EXISTS `tblPembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPembelian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPembelian`
--

LOCK TABLES `tblPembelian` WRITE;
/*!40000 ALTER TABLE `tblPembelian` DISABLE KEYS */;
INSERT INTO `tblPembelian` VALUES (1,'SP-2021-2','PB-2021-1','2021/03/20','12000','1','2021-03-20 00:14:56','2021-03-20 00:14:56'),(2,'SP-2021-2','PB-2021-2','2021/03/20','88000','1','2021-03-20 00:17:49','2021-03-20 00:17:49'),(3,'SP-2021-2','PB-2021-3','2021/03/21','88000','1','2021-03-21 23:32:34','2021-03-21 23:32:34'),(4,'SP-2021-2','PB-2021-4','2021/03/21','102000','1','2021-03-21 23:44:32','2021-03-21 23:44:32'),(5,'SP-2021-2','PB-2021-5','2021/03/21','34000','1','2021-03-21 23:46:20','2021-03-21 23:46:20'),(6,'SP-2021-1','PB-2021-6','2021/03/21','54000','1','2021-03-21 23:49:14','2021-03-21 23:49:14'),(7,'SP-2021-2','PB-2021-7','2021/03/23','59000','1','2021-03-23 00:27:19','2021-03-23 00:27:19'),(8,'SP-2021-1','PB-2021-8','2021/03/23','40000','1','2021-03-23 00:31:16','2021-03-23 00:31:16'),(9,'SP-2021-2','PB-2021-9','2021/03/23','50000','1','2021-03-23 00:32:53','2021-03-23 00:32:53'),(10,'SP-2021-2','PB-2021-10','2021/03/31','40000','1','2021-03-31 23:10:09','2021-03-31 23:10:09'),(12,'SP-2021-2','PB-2021-12','2021/04/01','68000','1','2021-04-01 11:40:27','2021-04-01 11:40:27'),(13,'SP-2021-2','PB-2021-13','2021/04/02','40000','2','2021-04-02 12:23:22','2021-04-02 12:23:22'),(14,'SP-2021-2','PB-2021-14','2021/04/02','105000','1','2021-04-02 23:27:06','2021-04-02 23:27:06');
/*!40000 ALTER TABLE `tblPembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPembelianDetail`
--

DROP TABLE IF EXISTS `tblPembelianDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPembelianDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qtySatuan` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPembelianDetail`
--

LOCK TABLES `tblPembelianDetail` WRITE;
/*!40000 ALTER TABLE `tblPembelianDetail` DISABLE KEYS */;
INSERT INTO `tblPembelianDetail` VALUES (7,'PB-2021-1','DB-2021-5','200','20','4000','2021-03-20 00:13:13','2021-03-20 00:13:13',NULL),(9,'PB-2021-1','DB-2021-7','200','40','8000','2021-03-20 00:14:08','2021-03-20 00:14:08',NULL),(12,'PB-2021-2','DB-2021-5','20','1000','20000','2021-03-20 00:17:08','2021-03-20 00:17:08',NULL),(13,'PB-2021-2','DB-2021-1','68','1000','68000','2021-03-20 00:17:32','2021-03-20 00:17:32',NULL),(28,'PB-2021-3','DB-2021-1','34','2000','68000','2021-03-21 03:11:30','2021-03-21 03:11:30','7'),(30,'PB-2021-3','DB-2021-10','2000','10','20000','2021-03-21 23:32:19','2021-03-21 23:32:19','10'),(34,'PB-2021-4','DB-2021-1','34','3000','102000','2021-03-21 23:40:26','2021-03-21 23:40:26','7'),(35,'PB-2021-5','DB-2021-1','34','1000','34000','2021-03-21 23:44:51','2021-03-21 23:44:51','7'),(37,'PB-2021-6','DB-2021-1','34','1000','34000','2021-03-21 23:47:19','2021-03-21 23:47:19','6'),(39,'PB-2021-6','DB-2021-10','2000','10','20000','2021-03-21 23:48:41','2021-03-21 23:48:41','10'),(40,'PB-2021-7','DB-2021-2','34','1000','34000','2021-03-23 00:26:42','2021-03-23 00:26:42','6'),(41,'PB-2021-7','DB-2021-4','25','1000','25000','2021-03-23 00:27:06','2021-03-23 00:27:06','9'),(42,'PB-2021-8','DB-2021-9','2000','20','40000','2021-03-23 00:31:05','2021-03-23 00:31:05','20'),(43,'PB-2021-9','DB-2021-5','50','1000','50000','2021-03-23 00:32:41','2021-03-23 00:32:41','6'),(45,'PB-2021-10','DB-2021-13','2000','20','40000','2021-03-31 23:09:58','2021-03-31 23:09:58','20'),(47,'PB-2021-12','DB-2021-3','34','2000','68000','2021-04-01 11:40:14','2021-04-01 11:40:14','12'),(48,'PB-2021-13','DB-2021-12','20','2000','40000','2021-04-02 12:23:10','2021-04-02 12:23:10','20'),(49,'PB-2021-14','DB-2021-7','50','1000','50000','2021-04-02 23:25:31','2021-04-02 23:25:31','6'),(51,'PB-2021-14','DB-2021-8','55','1000','55000','2021-04-02 23:26:27','2021-04-02 23:26:27','6');
/*!40000 ALTER TABLE `tblPembelianDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPenjualan`
--

DROP TABLE IF EXISTS `tblPenjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPenjualan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noMeja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelangganNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskonNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `waiterNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPenjualan`
--

LOCK TABLES `tblPenjualan` WRITE;
/*!40000 ALTER TABLE `tblPenjualan` DISABLE KEYS */;
INSERT INTO `tblPenjualan` VALUES (5,'INV-2021-2-5','2','Cash','2021/03/31','40000','0','0','50000','10000','1','2021-03-31 23:13:04','2021-03-31 23:13:04','2'),(6,'INV-2021-2-6','2','Cash','2021/04/01','18810','1800','990','20000','1190','1','2021-04-01 13:20:35','2021-04-01 13:20:35','2'),(8,'INV-2021-2-8','2','Cash','2021/04/02','108000','0','0','120000','12000','2','2021-04-02 12:28:03','2021-04-02 12:28:03','2'),(9,'INV-2021-1-9','1','Cash','2021/04/02','16000','0','0','20000','4000','2','2021-04-02 12:58:20','2021-04-02 12:58:20','2'),(11,'INV-2021-1-11','1','Cash','2021/04/02','20000','0','0','20000','0','2','2021-04-02 13:03:09','2021-04-02 13:03:09','2'),(12,'INV-2021-2-12','2','Cash','2021/04/02','60000','0','0','60000','0','2','2021-04-02 13:04:31','2021-04-02 13:04:31','2'),(14,'INV-2021-4-14','4','Cash','2021/04/02','116000','0','0','120000','4000','2','2021-04-02 13:09:49','2021-04-02 13:09:49','2'),(15,'INV-2021-1-15','1','Cash','2021/04/02','16000','0','0','20000','4000','2','2021-04-02 13:11:38','2021-04-02 13:11:38','2'),(16,'INV-2021-3-16','3','Cash','2021/04/02','140000','0','0','150000','10000','2','2021-04-02 13:12:49','2021-04-02 13:12:49','2'),(17,'INV-2021-1-17','1','Cash','2021/04/02','20000','0','0','20000','0','2','2021-04-02 13:16:06','2021-04-02 13:16:06','2'),(18,'INV-2021-2-18','2','Cash','2021/04/07','259160','24800','13640','260000','840','1','2021-04-07 12:58:09','2021-04-07 12:58:09','kasir');
/*!40000 ALTER TABLE `tblPenjualan` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpenjualandetail`
--

LOCK TABLES `tblpenjualandetail` WRITE;
/*!40000 ALTER TABLE `tblpenjualandetail` DISABLE KEYS */;
INSERT INTO `tblpenjualandetail` VALUES (1,'INV-2021-1-1','1','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(2,'INV-2021-1-1','1','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(3,'INV-2021-3-2','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(4,'INV-2021-3-2','3','DB-2021-3','50','2','100','KT-2021-1','Nasi Putih',NULL,NULL),(5,'INV-2021-3-2','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(6,'INV-2021-3-2','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(7,'INV-2021-3-3','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(8,'INV-2021-3-3','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(9,'INV-2021-3-3','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(10,'INV-2021-3-4','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(11,'INV-2021-3-4','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(12,'INV-2021-3-5','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(13,'INV-2021-3-5','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(14,'INV-2021-3-6','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(15,'INV-2021-3-6','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(16,'INV-2021-3-7','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(17,'INV-2021-3-7','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(18,'INV-2021-3-7','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(19,'INV-2021-3-8','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(20,'INV-2021-3-8','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(21,'INV-2021-2-9','2','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(22,'INV-2021-2-9','2','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(25,'INV-2021-3-11','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(26,'INV-2021-3-11','3','MN-2021-2','5000','1','5000','MN-2021-2','JAJO uli',NULL,NULL),(27,'INV-2021-3-12','3','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL),(28,'INV-2021-3-12','3','MN-2021-2','5000','4','20000','MN-2021-2','JAJO uli',NULL,NULL),(29,'INV-2021-3-12','3','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(32,'INV-2021-5-14','5','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(33,'INV-2021-5-14','5','MN-2021-2','5000','2','10000','MN-2021-2','JAJO uli',NULL,NULL),(34,'INV-2021-5-14','5','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(35,'INV-2021-2-15','2','DB-2021-1','5000','3','15000','KT-2021-1','Nasi Goreng',NULL,NULL),(36,'INV-2021-2-15','2','MN-2021-1','15000','3','45000','MN-2021-1','Nasi Goreng',NULL,NULL),(37,'INV-2021-2-15','2','DB-2021-5','2000','3','6000','KT-2021-1','Telur Ayam',NULL,NULL),(38,'INV-2021-4-16','4','DB-2021-3','50','50','2500','KT-2021-1','Nasi Putih',NULL,NULL),(39,'INV-2021-4-16','4','DB-2021-5','2000','5','10000','KT-2021-1','Telur Ayam',NULL,NULL),(40,'INV-2021-4-16','4','MN-2021-1','15000','5','75000','MN-2021-1','Nasi Goreng',NULL,NULL),(41,'INV-2021-5-17','5','DB-2021-1','5000','100','500000','KT-2021-1','Nasi Goreng',NULL,NULL),(42,'INV-2021-5-18','5','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(43,'INV-2021-5-18','5','DB-2021-5','2000','4','8000','KT-2021-1','Telur Ayam',NULL,NULL),(44,'INV-2021-2-19','2','MN-2021-2','20000','2','40000','MN-2021-2','JAJO uli',NULL,NULL),(45,'INV-2021-5-20','5','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(46,'INV-2021-5-20','5','MN-2021-3','25000','4','100000','MN-2021-3','Ayam Goreng',NULL,NULL),(47,'INV-2021-1-21','1','MN-2021-3','25000','4','100000','MN-2021-3','Ayam Goreng',NULL,NULL),(48,'INV-2021-1-22','1','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(49,'INV-2021-5-23','5','DB-2021-5','2000','4','8000','KT-2021-1','Telur Ayam',NULL,NULL),(50,'INV-2021-6-24','6','DB-2021-3','50','40','2000','KT-2021-1','Nasi Putih',NULL,NULL),(51,'INV-2021-6-25','6','DB-2021-4','50','50','2500','KT-2021-1','Kecap Manis',NULL,NULL),(52,'INV-2021-5-26','5','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(53,'INV-2021-3-27','3','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(54,'INV-2021-5-28','5','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(55,'INV-2021-5-29','5','DB-2021-1','5000','6','30000','KT-2021-1','Nasi Goreng',NULL,NULL),(56,'INV-2021-6-30','6','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(57,'INV-2021-6-30','6','DB-2021-5','2000','5','10000','KT-2021-1','Telur Ayam',NULL,NULL),(58,'INV-2021-6-31','6','DB-2021-2','4000','5','20000','KT-2021-1','Aqua 600ml',NULL,NULL),(59,'INV-2021-6-32','6','DB-2021-6','5000','2','10000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(60,'INV-2021-6-32','6','MN-2021-5','35000','2','70000','MN-2021-5','Kerang Bakar',NULL,NULL),(61,'INV-2021-3-33','3','DB-2021-5','2000','4','8000','KT-2021-1','Telur Ayam',NULL,NULL),(62,'INV-2021-2-34','2','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL),(63,'INV-2021-2-34','2','DB-2021-6','5000','2','10000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(64,'INV-2021-3-35','3','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(65,'INV-2021-5-36','5','DB-2021-1','5000','3','15000','KT-2021-1','Nasi Goreng',NULL,NULL),(66,'INV-2021-4-37','4','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(67,'INV-2021-4-38','4','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(68,'INV-2021-5-39','5','DB-2021-6','5000','3','15000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(69,'INV-2021-6-40','6','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(70,'INV-2021-6-40','6','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(71,'INV-2021-6-41','6','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL),(72,'INV-2021-6-41','6','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(73,'INV-2021-6-41','6','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(74,'INV-2021-5-42','5','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(75,'INV-2021-5-42','5','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(76,'INV-2021-5-43','5','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(77,'INV-2021-5-43','5','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(78,'INV-2021-6-44','6','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(79,'INV-2021-6-45','6','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(80,'INV-2021-6-45','6','DB-2021-4','50','4','200','KT-2021-1','Kecap Manis',NULL,NULL),(81,'INV-2021-3-46','3','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(82,'INV-2021-3-46','3','DB-2021-8','50','10','500','KT-2021-1','Kentang',NULL,NULL),(83,'INV-2021-1-47','1','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(84,'INV-2021-1-47','1','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(85,'INV-2021-4-48','4','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL),(93,'INV-2021-2-5','2','MN-2021-4','5000','4','20000','MN-2021-4','Mi rebus Mantap',NULL,NULL),(94,'INV-2021-2-5','2','DB-2021-10','5000','4','20000','KT-2021-2','Akua 600ml',NULL,NULL),(95,'INV-2021-2-6','2','MN-2021-4','5000','2','10000','MN-2021-4','Mi rebus Mantap',NULL,NULL),(96,'INV-2021-2-6','2','DB-2021-9','4000','2','8000','KT-2021-2','Cola 600ml',NULL,NULL),(99,'INV-2021-2-8','2','MN-2021-3','15000','2','30000','MN-2021-3','Kentang Goreng',NULL,NULL),(100,'INV-2021-2-8','2','MN-2021-2','35000','2','70000','MN-2021-2','Kerang Bakar',NULL,NULL),(101,'INV-2021-2-8','2','DB-2021-9','4000','2','8000','KT-2021-2','Cola 600ml',NULL,NULL),(102,'INV-2021-1-9','1','DB-2021-9','4000','4','16000','KT-2021-2','Cola 600ml',NULL,NULL),(104,'INV-2021-1-11','1','MN-2021-4','5000','4','20000','MN-2021-4','Mi rebus Mantap',NULL,NULL),(105,'INV-2021-2-12','2','MN-2021-3','15000','4','60000','MN-2021-3','Kentang Goreng',NULL,NULL),(107,'INV-2021-4-14','4','MN-2021-1','25000','4','100000','MN-2021-1','Ayam Bakar',NULL,NULL),(108,'INV-2021-4-14','4','DB-2021-9','4000','4','16000','KT-2021-2','Cola 600ml',NULL,NULL),(109,'INV-2021-1-15','1','DB-2021-9','4000','4','16000','KT-2021-2','Cola 600ml',NULL,NULL),(110,'INV-2021-3-16','3','MN-2021-2','35000','4','140000','MN-2021-2','Kerang Bakar',NULL,NULL),(111,'INV-2021-1-17','1','MN-2021-4','5000','4','20000','MN-2021-4','Mi rebus Mantap',NULL,NULL),(112,'INV-2021-2-18','2','DB-2021-1','8000','4','32000','KT-2021-1','Paha Ayam',NULL,NULL),(113,'INV-2021-2-18','2','DB-2021-9','4000','4','16000','KT-2021-2','Cola 600ml',NULL,NULL),(114,'INV-2021-2-18','2','MN-2021-3','15000','4','60000','MN-2021-3','Kentang Goreng',NULL,NULL),(115,'INV-2021-2-18','2','MN-2021-2','35000','4','140000','MN-2021-2','Kerang Bakar',NULL,NULL);
/*!40000 ALTER TABLE `tblpenjualandetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSatuan`
--

DROP TABLE IF EXISTS `tblSatuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblSatuan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ktgSatuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtySatuan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSatuan`
--

LOCK TABLES `tblSatuan` WRITE;
/*!40000 ALTER TABLE `tblSatuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblSatuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblStokOpname`
--

DROP TABLE IF EXISTS `tblStokOpname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblStokOpname` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noStokOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblStokOpname`
--

LOCK TABLES `tblStokOpname` WRITE;
/*!40000 ALTER TABLE `tblStokOpname` DISABLE KEYS */;
INSERT INTO `tblStokOpname` VALUES (1,'OP-2021-1','2021/04/01','-100000','2021-04-01 11:36:08','2021-04-01 11:36:08');
/*!40000 ALTER TABLE `tblStokOpname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblStokOpnameDetail`
--

DROP TABLE IF EXISTS `tblStokOpnameDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblStokOpnameDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noStokOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyGudang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selisihStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilaiStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblStokOpnameDetail`
--

LOCK TABLES `tblStokOpnameDetail` WRITE;
/*!40000 ALTER TABLE `tblStokOpnameDetail` DISABLE KEYS */;
INSERT INTO `tblStokOpnameDetail` VALUES (1,'OP-2021-1','DB-2021-6','1500','-500','Busuk','-100000','Gram','2021-04-01 11:35:56','2021-04-01 11:35:56');
/*!40000 ALTER TABLE `tblStokOpnameDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSupplier`
--

DROP TABLE IF EXISTS `tblSupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblSupplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almtSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noHp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontakSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSupplier`
--

LOCK TABLES `tblSupplier` WRITE;
/*!40000 ALTER TABLE `tblSupplier` DISABLE KEYS */;
INSERT INTO `tblSupplier` VALUES (1,'SP-2021-1','Pasar','Badung','9977','-','2021-03-19 22:41:10','2021-03-19 22:41:10'),(2,'SP-2021-2','Peken','-','988667','-','2021-03-19 22:41:52','2021-03-19 22:41:52');
/*!40000 ALTER TABLE `tblSupplier` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltmp_transaksidetail`
--

LOCK TABLES `tbltmp_transaksidetail` WRITE;
/*!40000 ALTER TABLE `tbltmp_transaksidetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltmp_transaksidetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblTmp_Transaksis`
--

DROP TABLE IF EXISTS `tblTmp_Transaksis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblTmp_Transaksis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblTmp_Transaksis`
--

LOCK TABLES `tblTmp_Transaksis` WRITE;
/*!40000 ALTER TABLE `tblTmp_Transaksis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblTmp_Transaksis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','Admin','admin@admin.com','$2y$10$1M/zZK917.HJrYuNrWF2yued.SVCPw89I5RVZqliW9ndVZAUSmuFu',NULL,'2021-03-19 22:39:16','2021-03-19 22:39:16'),(2,'kasir','kasir','Kasir','kasir@gmail.com','$2y$10$zjzkHBIY.e0juInxKZNTLuzeFlaVi3GkKM17AibJduaKwo6.qAlom',NULL,'2021-03-29 11:58:46','2021-03-29 11:58:46');
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

-- Dump completed on 2021-04-07 21:58:30
