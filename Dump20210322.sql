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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(6,'2021_01_02_073223_create_penjualans_table',1),(11,'2021_01_06_045741_create_transaksis_table',2),(69,'2021_01_04_044741_create_countries_states_table',3),(74,'2021_02_08_161531_create_penjualan_details_table',3),(150,'2014_10_12_100000_create_password_resets_table',4),(151,'2019_08_19_000000_create_failed_jobs_table',4),(152,'2021_01_02_012505_create_barangs_table',4),(153,'2021_01_02_025846_create_suppliers_table',4),(154,'2021_01_02_233418_create_kategoris_table',4),(155,'2021_01_03_000733_satuan',4),(156,'2021_01_04_111024_create_mejas_table',4),(157,'2021_02_02_142436_create_menus_table',4),(158,'2021_02_03_045330_create_komposisis_table',4),(159,'2021_02_05_061214_create_transaksis_table',4),(160,'2021_02_08_162955_create_penjualans_table',4),(161,'2021_02_12_082257_pembelian',4),(162,'2021_02_12_113120_pembelian_detail',4),(163,'2021_02_21_073842_kartustok',4),(164,'2021_02_27_174740_users',4),(165,'2021_03_02_091025_stokopname',4),(166,'2021_03_02_174311_create_stok_opname_details_table',4),(168,'2021_03_19_215018_create_inventoris_table',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBarang`
--

LOCK TABLES `tblBarang` WRITE;
/*!40000 ALTER TABLE `tblBarang` DISABLE KEYS */;
INSERT INTO `tblBarang` VALUES (1,'DB-2021-1','Paha Ayam',6800,8000,'KT-2021-1','Gram','Ayam','9000',NULL,'500','5000','2','Ayam Paha Mentah','2021-03-19 23:05:52','2021-03-19 23:05:52'),(2,'DB-2021-2','Dada Ayam',6800,9000,'KT-2021-1','Gram','Ayam','2000',NULL,'500','5000','2','Dada Ayam','2021-03-19 23:08:42','2021-03-19 23:08:42'),(3,'DB-2021-3','Sayap Ayam',5000,7000,'KT-2021-1','Gram','Ayam','1500',NULL,'300','2000','2','Sayap Ayam','2021-03-19 23:15:14','2021-03-19 23:15:14'),(4,'DB-2021-4','Kepala Ayam',200,500,'KT-2021-1','Gram','Ayam','2000',NULL,'200','2000','2','Ayam Metah','2021-03-19 23:19:43','2021-03-19 23:19:43'),(5,'DB-2021-5','Kerang Hijau',200,500,'KT-2021-1','Gram','Kerang','3023',NULL,'200','5000','2','Kerang Hijau','2021-03-19 23:22:47','2021-03-19 23:22:47'),(6,'DB-2021-6','Mujair',200,500,'KT-2021-1','Gram','Ikan','2000',NULL,'200','3000','2','Mujair','2021-03-19 23:38:11','2021-03-19 23:38:11'),(7,'DB-2021-7','Ikan Lele',200,600,'KT-2021-1','Gram','Lele','2040',NULL,'200','5000','2','Lele Dumbo','2021-03-19 23:45:03','2021-03-19 23:45:03'),(8,'DB-2021-8','Iga',200,500,'KT-2021-1','Gram','Iga Sapi','4000',NULL,'200','5000','2','Iga Sapi','2021-03-19 23:53:21','2021-03-19 23:53:21'),(23,'DB-2021-9','Cola 600ml',2000,4000,'KT-2021-2','Botol','Coca','20',NULL,'2','100','1','Coca Cola','2021-03-21 23:25:03','2021-03-21 23:25:03'),(24,'DB-2021-10','Akua 600ml',2000,5000,'KT-2021-2','Botol','Akua','35',NULL,'2','50','1','Akua','2021-03-21 23:30:50','2021-03-21 23:30:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblInventori`
--

LOCK TABLES `tblInventori` WRITE;
/*!40000 ALTER TABLE `tblInventori` DISABLE KEYS */;
INSERT INTO `tblInventori` VALUES (1,'DB-2021-1','25',NULL,'2021-03-19 23:05:52','2021-03-19 23:05:52','5667','167'),(2,'DB-2021-2','2995',NULL,'2021-03-19 23:08:42','2021-03-19 23:08:42','6800',NULL),(3,'DB-2021-3',NULL,NULL,'2021-03-19 23:15:14','2021-03-19 23:15:14',NULL,NULL),(4,'DB-2021-4',NULL,NULL,'2021-03-19 23:19:43','2021-03-19 23:19:43',NULL,NULL),(5,'DB-2021-5','15',NULL,'2021-03-19 23:22:47','2021-03-19 23:22:47',NULL,NULL),(6,'DB-2021-6',NULL,NULL,'2021-03-19 23:38:11','2021-03-19 23:38:11',NULL,NULL),(7,'DB-2021-7',NULL,NULL,'2021-03-19 23:45:03','2021-03-19 23:45:03',NULL,NULL),(8,'DB-2021-8',NULL,NULL,'2021-03-19 23:53:21','2021-03-19 23:53:21',NULL,NULL),(13,'DB-2021-9','20',NULL,'2021-03-21 23:25:03','2021-03-21 23:25:03','0',NULL),(14,'DB-2021-10','20',NULL,'2021-03-21 23:30:50','2021-03-21 23:30:50','2000','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKartuStok`
--

LOCK TABLES `tblKartuStok` WRITE;
/*!40000 ALTER TABLE `tblKartuStok` DISABLE KEYS */;
INSERT INTO `tblKartuStok` VALUES (24,'DB-2021-1','2021/03/21','2000','0','PB-2021-3','Pembelian','Gram','2021-03-21 03:11:30','2021-03-21 03:11:30'),(26,'DB-2021-10','2021/03/21','10','0','PB-2021-3','Pembelian','Botol','2021-03-21 23:32:19','2021-03-21 23:32:19'),(30,'DB-2021-1','2021/03/21','3000','0','PB-2021-4','Pembelian','Gram','2021-03-21 23:40:26','2021-03-21 23:40:26'),(31,'DB-2021-1','2021/03/21','1000','0','PB-2021-5','Pembelian','Gram','2021-03-21 23:44:51','2021-03-21 23:44:51'),(33,'DB-2021-1','2021/03/21','1000','0','PB-2021-6','Pembelian','Gram','2021-03-21 23:47:19','2021-03-21 23:47:19'),(35,'DB-2021-10','2021/03/21','10','0','PB-2021-6','Pembelian','Botol','2021-03-21 23:48:41','2021-03-21 23:48:41');
/*!40000 ALTER TABLE `tblKartuStok` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKomposisi`
--

LOCK TABLES `tblKomposisi` WRITE;
/*!40000 ALTER TABLE `tblKomposisi` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMeja`
--

LOCK TABLES `tblMeja` WRITE;
/*!40000 ALTER TABLE `tblMeja` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMenu`
--

LOCK TABLES `tblMenu` WRITE;
/*!40000 ALTER TABLE `tblMenu` DISABLE KEYS */;
INSERT INTO `tblMenu` VALUES (1,'MN-2021-1','Ayam Bakar',25000,'1',NULL,'2021-03-21 02:58:57','2021-03-21 02:58:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPembelian`
--

LOCK TABLES `tblPembelian` WRITE;
/*!40000 ALTER TABLE `tblPembelian` DISABLE KEYS */;
INSERT INTO `tblPembelian` VALUES (1,'SP-2021-2','PB-2021-1','2021/03/20','12000','1','2021-03-20 00:14:56','2021-03-20 00:14:56'),(2,'SP-2021-2','PB-2021-2','2021/03/20','88000','1','2021-03-20 00:17:49','2021-03-20 00:17:49'),(3,'SP-2021-2','PB-2021-3','2021/03/21','88000','1','2021-03-21 23:32:34','2021-03-21 23:32:34'),(4,'SP-2021-2','PB-2021-4','2021/03/21','102000','1','2021-03-21 23:44:32','2021-03-21 23:44:32'),(5,'SP-2021-2','PB-2021-5','2021/03/21','34000','1','2021-03-21 23:46:20','2021-03-21 23:46:20'),(6,'SP-2021-1','PB-2021-6','2021/03/21','54000','1','2021-03-21 23:49:14','2021-03-21 23:49:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPembelianDetail`
--

LOCK TABLES `tblPembelianDetail` WRITE;
/*!40000 ALTER TABLE `tblPembelianDetail` DISABLE KEYS */;
INSERT INTO `tblPembelianDetail` VALUES (7,'PB-2021-1','DB-2021-5','200','20','4000','2021-03-20 00:13:13','2021-03-20 00:13:13',NULL),(9,'PB-2021-1','DB-2021-7','200','40','8000','2021-03-20 00:14:08','2021-03-20 00:14:08',NULL),(12,'PB-2021-2','DB-2021-5','20','1000','20000','2021-03-20 00:17:08','2021-03-20 00:17:08',NULL),(13,'PB-2021-2','DB-2021-1','68','1000','68000','2021-03-20 00:17:32','2021-03-20 00:17:32',NULL),(28,'PB-2021-3','DB-2021-1','34','2000','68000','2021-03-21 03:11:30','2021-03-21 03:11:30','7'),(30,'PB-2021-3','DB-2021-10','2000','10','20000','2021-03-21 23:32:19','2021-03-21 23:32:19','10'),(34,'PB-2021-4','DB-2021-1','34','3000','102000','2021-03-21 23:40:26','2021-03-21 23:40:26','7'),(35,'PB-2021-5','DB-2021-1','34','1000','34000','2021-03-21 23:44:51','2021-03-21 23:44:51','7'),(37,'PB-2021-6','DB-2021-1','34','1000','34000','2021-03-21 23:47:19','2021-03-21 23:47:19','6'),(39,'PB-2021-6','DB-2021-10','2000','10','20000','2021-03-21 23:48:41','2021-03-21 23:48:41','10');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPenjualan`
--

LOCK TABLES `tblPenjualan` WRITE;
/*!40000 ALTER TABLE `tblPenjualan` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpenjualandetail`
--

LOCK TABLES `tblpenjualandetail` WRITE;
/*!40000 ALTER TABLE `tblpenjualandetail` DISABLE KEYS */;
INSERT INTO `tblpenjualandetail` VALUES (1,'INV-2021-1-1','1','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(2,'INV-2021-1-1','1','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(3,'INV-2021-3-2','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(4,'INV-2021-3-2','3','DB-2021-3','50','2','100','KT-2021-1','Nasi Putih',NULL,NULL),(5,'INV-2021-3-2','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(6,'INV-2021-3-2','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(7,'INV-2021-3-3','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(8,'INV-2021-3-3','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(9,'INV-2021-3-3','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(10,'INV-2021-3-4','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(11,'INV-2021-3-4','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(12,'INV-2021-3-5','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(13,'INV-2021-3-5','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(14,'INV-2021-3-6','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(15,'INV-2021-3-6','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(16,'INV-2021-3-7','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(17,'INV-2021-3-7','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(18,'INV-2021-3-7','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(19,'INV-2021-3-8','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(20,'INV-2021-3-8','3','MN-2021-1','15000','2','30000','MN-2021-1','Nasi Goreng',NULL,NULL),(21,'INV-2021-2-9','2','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(22,'INV-2021-2-9','2','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(23,'INV-2021-3-10','3','DB-2021-5','2000','2','4000','KT-2021-1','Telur Ayam',NULL,NULL),(24,'INV-2021-3-10','3','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(25,'INV-2021-3-11','3','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(26,'INV-2021-3-11','3','MN-2021-2','5000','1','5000','MN-2021-2','JAJO uli',NULL,NULL),(27,'INV-2021-3-12','3','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL),(28,'INV-2021-3-12','3','MN-2021-2','5000','4','20000','MN-2021-2','JAJO uli',NULL,NULL),(29,'INV-2021-3-12','3','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(30,'INV-2021-2-13','2','DB-2021-3','50','8','400','KT-2021-1','Nasi Putih',NULL,NULL),(31,'INV-2021-2-13','2','DB-2021-5','2000','8','16000','KT-2021-1','Telur Ayam',NULL,NULL),(32,'INV-2021-5-14','5','DB-2021-1','5000','2','10000','KT-2021-1','Nasi Goreng',NULL,NULL),(33,'INV-2021-5-14','5','MN-2021-2','5000','2','10000','MN-2021-2','JAJO uli',NULL,NULL),(34,'INV-2021-5-14','5','DB-2021-2','4000','2','8000','KT-2021-1','Aqua 600ml',NULL,NULL),(35,'INV-2021-2-15','2','DB-2021-1','5000','3','15000','KT-2021-1','Nasi Goreng',NULL,NULL),(36,'INV-2021-2-15','2','MN-2021-1','15000','3','45000','MN-2021-1','Nasi Goreng',NULL,NULL),(37,'INV-2021-2-15','2','DB-2021-5','2000','3','6000','KT-2021-1','Telur Ayam',NULL,NULL),(38,'INV-2021-4-16','4','DB-2021-3','50','50','2500','KT-2021-1','Nasi Putih',NULL,NULL),(39,'INV-2021-4-16','4','DB-2021-5','2000','5','10000','KT-2021-1','Telur Ayam',NULL,NULL),(40,'INV-2021-4-16','4','MN-2021-1','15000','5','75000','MN-2021-1','Nasi Goreng',NULL,NULL),(41,'INV-2021-5-17','5','DB-2021-1','5000','100','500000','KT-2021-1','Nasi Goreng',NULL,NULL),(42,'INV-2021-5-18','5','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(43,'INV-2021-5-18','5','DB-2021-5','2000','4','8000','KT-2021-1','Telur Ayam',NULL,NULL),(44,'INV-2021-2-19','2','MN-2021-2','20000','2','40000','MN-2021-2','JAJO uli',NULL,NULL),(45,'INV-2021-5-20','5','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(46,'INV-2021-5-20','5','MN-2021-3','25000','4','100000','MN-2021-3','Ayam Goreng',NULL,NULL),(47,'INV-2021-1-21','1','MN-2021-3','25000','4','100000','MN-2021-3','Ayam Goreng',NULL,NULL),(48,'INV-2021-1-22','1','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(49,'INV-2021-5-23','5','DB-2021-5','2000','4','8000','KT-2021-1','Telur Ayam',NULL,NULL),(50,'INV-2021-6-24','6','DB-2021-3','50','40','2000','KT-2021-1','Nasi Putih',NULL,NULL),(51,'INV-2021-6-25','6','DB-2021-4','50','50','2500','KT-2021-1','Kecap Manis',NULL,NULL),(52,'INV-2021-5-26','5','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(53,'INV-2021-3-27','3','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(54,'INV-2021-5-28','5','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(55,'INV-2021-5-29','5','DB-2021-1','5000','6','30000','KT-2021-1','Nasi Goreng',NULL,NULL),(56,'INV-2021-6-30','6','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(57,'INV-2021-6-30','6','DB-2021-5','2000','5','10000','KT-2021-1','Telur Ayam',NULL,NULL),(58,'INV-2021-6-31','6','DB-2021-2','4000','5','20000','KT-2021-1','Aqua 600ml',NULL,NULL),(59,'INV-2021-6-32','6','DB-2021-6','5000','2','10000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(60,'INV-2021-6-32','6','MN-2021-5','35000','2','70000','MN-2021-5','Kerang Bakar',NULL,NULL),(61,'INV-2021-3-33','3','DB-2021-5','2000','4','8000','KT-2021-1','Telur Ayam',NULL,NULL),(62,'INV-2021-2-34','2','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL),(63,'INV-2021-2-34','2','DB-2021-6','5000','2','10000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(64,'INV-2021-3-35','3','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(65,'INV-2021-5-36','5','DB-2021-1','5000','3','15000','KT-2021-1','Nasi Goreng',NULL,NULL),(66,'INV-2021-4-37','4','DB-2021-1','5000','5','25000','KT-2021-1','Nasi Goreng',NULL,NULL),(67,'INV-2021-4-38','4','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(68,'INV-2021-5-39','5','DB-2021-6','5000','3','15000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(69,'INV-2021-6-40','6','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(70,'INV-2021-6-40','6','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(71,'INV-2021-6-41','6','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL),(72,'INV-2021-6-41','6','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(73,'INV-2021-6-41','6','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(74,'INV-2021-5-42','5','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(75,'INV-2021-5-42','5','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(76,'INV-2021-5-43','5','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(77,'INV-2021-5-43','5','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(78,'INV-2021-6-44','6','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(79,'INV-2021-6-45','6','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(80,'INV-2021-6-45','6','DB-2021-4','50','4','200','KT-2021-1','Kecap Manis',NULL,NULL),(81,'INV-2021-3-46','3','DB-2021-2','4000','4','16000','KT-2021-1','Aqua 600ml',NULL,NULL),(82,'INV-2021-3-46','3','DB-2021-8','50','10','500','KT-2021-1','Kentang',NULL,NULL),(83,'INV-2021-1-47','1','DB-2021-6','5000','4','20000','KT-2021-2','Coca Cola 300Ml',NULL,NULL),(84,'INV-2021-1-47','1','MN-2021-5','35000','4','140000','MN-2021-5','Kerang Bakar',NULL,NULL),(85,'INV-2021-4-48','4','DB-2021-1','5000','4','20000','KT-2021-1','Nasi Goreng',NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblStokOpname`
--

LOCK TABLES `tblStokOpname` WRITE;
/*!40000 ALTER TABLE `tblStokOpname` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblStokOpnameDetail`
--

LOCK TABLES `tblStokOpnameDetail` WRITE;
/*!40000 ALTER TABLE `tblStokOpnameDetail` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','Admin','admin@admin.com','$2y$10$1M/zZK917.HJrYuNrWF2yued.SVCPw89I5RVZqliW9ndVZAUSmuFu',NULL,'2021-03-19 22:39:16','2021-03-19 22:39:16');
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

-- Dump completed on 2021-03-22  7:51:18
