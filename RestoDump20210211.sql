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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Indonesia',NULL,NULL),(2,'Malaysia',NULL,NULL),(3,'Spanyol',NULL,NULL);
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_01_02_012505_create_barangs_table',1),(5,'2021_01_02_025846_create_suppliers_table',1),(6,'2021_01_02_073223_create_penjualans_table',1),(7,'2021_01_02_233418_create_kategoris_table',1),(8,'2021_01_03_000733_satuan',1),(9,'2021_01_04_044741_create_countries_states_table',1),(10,'2021_01_04_111024_create_mejas_table',1),(11,'2021_01_06_045741_create_transaksis_table',2),(12,'2021_02_02_142436_create_menus_table',3),(13,'2021_02_03_045330_create_komposisis_table',4),(14,'2021_02_05_061214_create_transaksis_table',5),(17,'2021_02_08_161531_create_penjualan_details_table',6),(18,'2021_02_08_162955_create_penjualans_table',6);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,1,'Jakarta',NULL,NULL),(2,1,'Denpasar',NULL,NULL),(3,1,'Surabaya',NULL,NULL),(4,2,'Kuala Lumpur',NULL,NULL),(5,2,'Penang',NULL,NULL),(6,3,'Barcelona',NULL,NULL),(7,3,'Madrid',NULL,NULL);
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
  `qtyMin` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMax` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBarang`
--

LOCK TABLES `tblBarang` WRITE;
/*!40000 ALTER TABLE `tblBarang` DISABLE KEYS */;
INSERT INTO `tblBarang` VALUES (4,'KR002','Kerang Hijau',5000,7000,'M002','Gram','Kerang','988','250','5000','Kerang Hijau Enak','2021-02-03 15:36:25','2021-02-03 15:36:25'),(5,'IG001','IGA Sapi',3000,8000,'M002','Gram','Iga Sapi','2000','250','5000','Iga sapi yang sangat enak','2021-02-03 15:37:31','2021-02-03 15:37:31'),(6,'KLP01','Kelapa Muda',2000,5000,'M001','Buah','Kelapa Muda','4','2','20','Kalapa Muda BGT','2021-02-03 15:38:43','2021-02-03 15:38:43'),(7,'SD001','COca Cola',3000,5500,'M001','Botol','Coca Cola','-3','3','25','SoftDring','2021-02-03 15:39:43','2021-02-03 15:39:43'),(8,'BRS01','Beras Putih',3000,5500,'M002','Gram','Beras Nasi','9970','1000','25','Beras Nasi','2021-02-03 15:40:56','2021-02-03 15:40:56'),(9,'DB-/2021/6','AYam Paha',2000,5000,'M002','Gram','Ayam','995','500','5000','Ayam Mentah','2021-02-08 04:04:03','2021-02-08 04:04:03'),(10,'DB-/2021/7','Gurami',2000,4000,'M002','gram','gurami','2977','500','7000','gurami mentah','2021-02-08 04:10:30','2021-02-08 04:10:30'),(44,'DB-/2021/20220','Nasi Putih',2000,5000,'M002','Gram','Nasi','4954','500','5000','Nasi Putih','2021-02-08 10:56:07','2021-02-08 10:56:07');
/*!40000 ALTER TABLE `tblBarang` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKategori`
--

LOCK TABLES `tblKategori` WRITE;
/*!40000 ALTER TABLE `tblKategori` DISABLE KEYS */;
INSERT INTO `tblKategori` VALUES (1,'M001','Minuman',NULL,NULL),(2,'M002','Makanan',NULL,NULL),(3,'DS001','Desert',NULL,NULL),(4,'CM001','Camilan',NULL,NULL);
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
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qtyBarang` double DEFAULT NULL,
  `hargaBarang` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKomposisi`
--

LOCK TABLES `tblKomposisi` WRITE;
/*!40000 ALTER TABLE `tblKomposisi` DISABLE KEYS */;
INSERT INTO `tblKomposisi` VALUES (17,'8','4',200,7000,'2021-02-04 05:58:44','2021-02-04 05:58:44'),(19,'8','5',250,5000,'2021-02-04 15:02:27','2021-02-04 15:02:27'),(20,'8','6',500,20000,'2021-02-04 15:35:45','2021-02-04 15:35:45'),(21,'16','9',250,1000,'2021-02-08 10:55:12','2021-02-08 10:55:12'),(22,'16','44',250,5000,'2021-02-08 10:56:45','2021-02-08 10:56:45');
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
  `paxMeja` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMeja`
--

LOCK TABLES `tblMeja` WRITE;
/*!40000 ALTER TABLE `tblMeja` DISABLE KEYS */;
INSERT INTO `tblMeja` VALUES (3,'1','6',NULL,'2021-01-04 04:57:48','2021-02-09 22:31:40',0),(4,'2','6',NULL,'2021-01-04 04:58:32','2021-02-09 02:57:29',0);
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
  `nmMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stokMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kdMenu` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMenu`
--

LOCK TABLES `tblMenu` WRITE;
/*!40000 ALTER TABLE `tblMenu` DISABLE KEYS */;
INSERT INTO `tblMenu` VALUES (16,'AYam Bakar','20000','1','2021-02-08 10:54:46','2021-02-08 10:54:46','MN-/2021/767900');
/*!40000 ALTER TABLE `tblMenu` ENABLE KEYS */;
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
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `noMeja` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pelangganNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPenjualan`
--

LOCK TABLES `tblPenjualan` WRITE;
/*!40000 ALTER TABLE `tblPenjualan` DISABLE KEYS */;
INSERT INTO `tblPenjualan` VALUES (16,'INV-/2021/3/24314103','2021/02/09','95000','100000','5000','2021-02-09 02:43:45','2021-02-09 02:43:45','3',NULL),(17,'INV-/2021/4/6416962','2021/02/09','53500','55000','1500','2021-02-09 02:45:29','2021-02-09 02:45:29','4',NULL),(18,'INV-/2021/3/28050051','2021/02/09','42000','50000','8000','2021-02-09 02:51:46','2021-02-09 02:51:46','3',NULL),(19,'INV-/2021/4/86025131','2021/02/09','45000','50000','5000','2021-02-09 02:55:26','2021-02-09 02:55:26','4',NULL),(20,'INV-/2021/4/3733531','2021/02/09','20000','50000','30000','2021-02-09 02:57:58','2021-02-09 02:57:58','4','Cash'),(21,'INV-/2021/3/29562562','2021/02/09','70000','100000','30000','2021-02-09 22:39:28','2021-02-09 22:39:28','3','Cash');
/*!40000 ALTER TABLE `tblPenjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPenjualanDetail`
--

DROP TABLE IF EXISTS `tblPenjualanDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPenjualanDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noMeja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPenjualanDetail`
--

LOCK TABLES `tblPenjualanDetail` WRITE;
/*!40000 ALTER TABLE `tblPenjualanDetail` DISABLE KEYS */;
INSERT INTO `tblPenjualanDetail` VALUES (18,'INV-/2021/3/24314103','3','DB-/2021/6','5000','2','10000','M002','AYam Paha',NULL,NULL),(19,'INV-/2021/3/24314103','3','MN-/2021/767900','20000','3','60000','m','AYam Bakar',NULL,NULL),(20,'INV-/2021/3/24314103','3','DB-/2021/20220','5000','5','25000','M002','Nasi Putih',NULL,NULL),(21,'INV-/2021/4/6416962','4','DB-/2021/20220','5000','5','25000','M002','Nasi Putih',NULL,NULL),(22,'INV-/2021/4/6416962','4','SD001','5500','3','16500','M001','COca Cola',NULL,NULL),(23,'INV-/2021/4/6416962','4','DB-/2021/7','4000','3','12000','M002','Gurami',NULL,NULL),(24,'INV-/2021/3/28050051','3','DB-/2021/20220','5000','4','20000','M002','Nasi Putih',NULL,NULL),(25,'INV-/2021/3/28050051','3','SD001','5500','4','22000','M001','COca Cola',NULL,NULL),(26,'INV-/2021/4/86025131','4','DB-/2021/20220','5000','5','25000','M002','Nasi Putih',NULL,NULL),(27,'INV-/2021/4/86025131','4','DB-/2021/7','4000','5','20000','M002','Gurami',NULL,NULL),(28,'INV-/2021/4/3733531','4','DB-/2021/20220','5000','2','10000','M002','Nasi Putih',NULL,NULL),(29,'INV-/2021/4/3733531','4','DB-/2021/6','5000','2','10000','M002','AYam Paha',NULL,NULL),(30,'INV-/2021/3/29562562','3','DB-/2021/20220','5000','2','10000','M002','Nasi Putih',NULL,NULL),(31,'INV-/2021/3/29562562','3','MN-/2021/767900','20000','3','60000','MN-/2021/767900','AYam Bakar',NULL,NULL);
/*!40000 ALTER TABLE `tblPenjualanDetail` ENABLE KEYS */;
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
-- Table structure for table `tblSupplier`
--

DROP TABLE IF EXISTS `tblSupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblSupplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nmSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almtSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noHp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontakSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSupplier`
--

LOCK TABLES `tblSupplier` WRITE;
/*!40000 ALTER TABLE `tblSupplier` DISABLE KEYS */;
INSERT INTO `tblSupplier` VALUES (1,'tunas jaya','panjer','09876','deni',NULL,NULL),(2,'Blesing Komp','Pulau Kawe','098765','candra','2021-01-04 04:01:16','2021-01-04 04:01:16'),(3,'Adi Raya','Pulau Batam','098765467','Adi','2021-02-09 23:47:26','2021-02-09 23:47:26'),(4,'Wahana','Pulau Kawe','0987567','Orang','2021-02-09 23:47:51','2021-02-09 23:47:51');
/*!40000 ALTER TABLE `tblSupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblTmp_Transaksi`
--

DROP TABLE IF EXISTS `tblTmp_Transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblTmp_Transaksi` (
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
-- Dumping data for table `tblTmp_Transaksi`
--

LOCK TABLES `tblTmp_Transaksi` WRITE;
/*!40000 ALTER TABLE `tblTmp_Transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblTmp_Transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblTmp_TransaksiDetail`
--

DROP TABLE IF EXISTS `tblTmp_TransaksiDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblTmp_TransaksiDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noMejaTmp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kdBarangTmp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hrgJualTmp` double DEFAULT NULL,
  `qtyTmp` double DEFAULT NULL,
  `totalTmp` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `typeTmp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nmBarangTmp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noNotaTmp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblTmp_TransaksiDetail`
--

LOCK TABLES `tblTmp_TransaksiDetail` WRITE;
/*!40000 ALTER TABLE `tblTmp_TransaksiDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblTmp_TransaksiDetail` ENABLE KEYS */;
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2021-02-11  8:23:14
