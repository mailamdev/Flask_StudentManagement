-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: database
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietdiem`
--

DROP TABLE IF EXISTS `chitietdiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdiem` (
  `maCTD` int NOT NULL AUTO_INCREMENT,
  `maLD` int NOT NULL,
  `maDiem` int NOT NULL,
  `diemSo` float NOT NULL,
  PRIMARY KEY (`maCTD`),
  KEY `maLD` (`maLD`),
  KEY `maDiem` (`maDiem`),
  CONSTRAINT `chitietdiem_ibfk_1` FOREIGN KEY (`maLD`) REFERENCES `loaidiem` (`maLD`),
  CONSTRAINT `chitietdiem_ibfk_2` FOREIGN KEY (`maDiem`) REFERENCES `diem` (`maDiem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdiem`
--

LOCK TABLES `chitietdiem` WRITE;
/*!40000 ALTER TABLE `chitietdiem` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitietdiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diem`
--

DROP TABLE IF EXISTS `diem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diem` (
  `maDiem` int NOT NULL AUTO_INCREMENT,
  `maHK` int NOT NULL,
  `maMH` int NOT NULL,
  `maHS` int NOT NULL,
  `diemTB` float DEFAULT NULL,
  PRIMARY KEY (`maDiem`),
  KEY `maHK` (`maHK`),
  KEY `maMH` (`maMH`),
  KEY `maHS` (`maHS`),
  CONSTRAINT `diem_ibfk_1` FOREIGN KEY (`maHK`) REFERENCES `hocky` (`maHK`),
  CONSTRAINT `diem_ibfk_2` FOREIGN KEY (`maMH`) REFERENCES `monhoc` (`maMH`),
  CONSTRAINT `diem_ibfk_3` FOREIGN KEY (`maHS`) REFERENCES `hocsinh` (`maHS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diem`
--

LOCK TABLES `diem` WRITE;
/*!40000 ALTER TABLE `diem` DISABLE KEYS */;
/*!40000 ALTER TABLE `diem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocky`
--

DROP TABLE IF EXISTS `hocky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hocky` (
  `maHK` int NOT NULL AUTO_INCREMENT,
  `tenHK` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maHK`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocky`
--

LOCK TABLES `hocky` WRITE;
/*!40000 ALTER TABLE `hocky` DISABLE KEYS */;
INSERT INTO `hocky` VALUES (1,'Học Kỳ 1'),(2,'Học Kỳ 2');
/*!40000 ALTER TABLE `hocky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocsinh`
--

DROP TABLE IF EXISTS `hocsinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hocsinh` (
  `maHS` int NOT NULL AUTO_INCREMENT,
  `tenHS` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioiTinh` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `diaChi` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maLop` int DEFAULT NULL,
  PRIMARY KEY (`maHS`),
  KEY `hocsinh_ibfk_1` (`maLop`),
  CONSTRAINT `hocsinh_ibfk_1` FOREIGN KEY (`maLop`) REFERENCES `lop` (`maLop`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocsinh`
--

LOCK TABLES `hocsinh` WRITE;
/*!40000 ALTER TABLE `hocsinh` DISABLE KEYS */;
INSERT INTO `hocsinh` VALUES (24,'Nguyễn Hoàng Phúc','Nam','2003-02-01','602/5 Điện Biên Phủ , Quận Bình Thạnh, Hồ Chí Minh.',NULL,121),(25,'Trần Thu Hiền','Nữ','2005-09-08','312/5 Bạch Đằng , Quận Bình Thạnh, Hồ Chí Minh.',NULL,102),(26,'Nguyễn Ngọc Anh','Nữ','2004-02-21','127/24 Quang Trung, Quận Gò Vấp, Hồ Chí Minh','ngocanh2102@gmail.com',113),(27,'Nguyễn Thiên An','Nam','2004-05-12','247/4 Lê Quang Định, Quận Gò Vấp, Hồ Chí Minh','annguyen2004@gmail.com',113),(28,'Hoàng Thị Diệu Hiền','Nữ','2004-09-09','512/4/2 Bạch Đằng , Quận Bình Thạnh, Hồ Chí Minh.','hien090904@gmail.com',113),(29,'Lê Thị Thùy Dương','Nữ','2003-10-09','142 Lê Lợi, Quận Gò Vấp, Hồ Chí Minh','',122),(30,'Đặng Minh Đạt','Nam','2003-09-09','310/2/5 Cộng Hòa, Quận Tân Bình, Hồ Chí Minh','datd9923@gmail.com',121),(31,'Phan Anh Quân','Nam','2005-01-12','94/5 Đinh Bộ Lĩnh, Quận Bình Thạnh, Hồ Chí Minh','',113),(32,'Phan Thị Yến Nhi','Nữ','2005-02-05','527/24 Dương Quảng Hàm, Quận Gò Vấp, Hồ Chí Minh','',NULL),(34,'Nguyễn Thị Ngọc Linh','Nữ','2005-11-16','90/8 Hoàng Văn Thụ , Quận Bình Thạnh, Hồ Chí Minh.','',NULL),(35,'Hà Thị Nguyệt Ánh','Nữ','2005-12-07','122/5 Phan Văn Trị , Quận Bình Thạnh, Hồ Chí Minh.','',NULL);
/*!40000 ALTER TABLE `hocsinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoi`
--

DROP TABLE IF EXISTS `khoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoi` (
  `maKhoi` int NOT NULL AUTO_INCREMENT,
  `tenKhoi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soLop` int NOT NULL,
  PRIMARY KEY (`maKhoi`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoi`
--

LOCK TABLES `khoi` WRITE;
/*!40000 ALTER TABLE `khoi` DISABLE KEYS */;
INSERT INTO `khoi` VALUES (10,'Khối 10',4),(11,'Khối 11',3),(12,'Khối 12',2);
/*!40000 ALTER TABLE `khoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaidiem`
--

DROP TABLE IF EXISTS `loaidiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaidiem` (
  `maLD` int NOT NULL AUTO_INCREMENT,
  `tenLD` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maLD`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaidiem`
--

LOCK TABLES `loaidiem` WRITE;
/*!40000 ALTER TABLE `loaidiem` DISABLE KEYS */;
INSERT INTO `loaidiem` VALUES (1,'Điểm 15 phút'),(2,'Điểm 1 tiết'),(3,'Điểm cuối Học Kỳ');
/*!40000 ALTER TABLE `loaidiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop`
--

DROP TABLE IF EXISTS `lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop` (
  `maLop` int NOT NULL AUTO_INCREMENT,
  `tenLop` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siSo` int NOT NULL,
  `maKhoi` int NOT NULL,
  PRIMARY KEY (`maLop`),
  KEY `maKhoi` (`maKhoi`),
  CONSTRAINT `lop_ibfk_1` FOREIGN KEY (`maKhoi`) REFERENCES `khoi` (`maKhoi`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop`
--

LOCK TABLES `lop` WRITE;
/*!40000 ALTER TABLE `lop` DISABLE KEYS */;
INSERT INTO `lop` VALUES (101,'Lớp 10A1',0,10),(102,'Lớp 10A2',0,10),(103,'Lớp 10A3',0,10),(104,'Lớp 10A4',0,10),(111,'Lớp 11A1',0,11),(112,'Lớp 11A2',0,11),(113,'Lớp 11A3',0,11),(121,'Lớp 12A1',0,12),(122,'Lớp 12A2',0,12);
/*!40000 ALTER TABLE `lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhoc` (
  `maMH` int NOT NULL AUTO_INCREMENT,
  `tenMH` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maMH`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES (1,'Toán'),(2,'Lý'),(3,'Hóa'),(4,'Sinh'),(5,'Sử'),(6,'Địa'),(7,'Văn'),(8,'Đạo Đức'),(9,'Thể Dục');
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quydinh`
--

DROP TABLE IF EXISTS `quydinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quydinh` (
  `maQD` int NOT NULL AUTO_INCREMENT,
  `tenQD` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noiDung` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maQD`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quydinh`
--

LOCK TABLES `quydinh` WRITE;
/*!40000 ALTER TABLE `quydinh` DISABLE KEYS */;
INSERT INTO `quydinh` VALUES (1,'Quy định tuổi học sinh','Tuổi học sinh từ 15 đến 20.'),(2,'Quy định số lượng lớp','Có 3 khối lớp ( 10, 11, 12 ). Khối 10 có 4 lớp (10A1, 10A2, 10A3,10A4 ). Khối 11 có 3 lớp ( 11A1, 11A2, 11A3 ). Khối 12 có 2 lớp (12A1, 12A2). Mỗi lớp không quá 40 học sinh.'),(3,'Quy định học kỳ và môn học','Có 2 học kỳ ( 1, 2 ). Có 9 môn học ( Toán, Lý, Hóa, Sinh, Sử, Địa, Văn, Đạo đức, Thể dục).'),(4,'Quy định điểm','Học sinh đạt môn nếu có điểm trung bình >= 5.'),(5,'Quy định thay đổi','Có thể thay đổi các qui định : Tuổi tối thiểu, tuổi tối đa. Ssĩ số tối đa của các lớp, số lượng và tên các lớp. Thay đổi số lượng và tên các môn học. Điểm chuẩn đạt môn.');
/*!40000 ALTER TABLE `quydinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thaydoiqd`
--

DROP TABLE IF EXISTS `thaydoiqd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thaydoiqd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maQD` int NOT NULL,
  `maAdmin` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maQD` (`maQD`),
  KEY `maAdmin` (`maAdmin`),
  CONSTRAINT `thaydoiqd_ibfk_1` FOREIGN KEY (`maQD`) REFERENCES `quydinh` (`maQD`),
  CONSTRAINT `thaydoiqd_ibfk_2` FOREIGN KEY (`maAdmin`) REFERENCES `admin` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thaydoiqd`
--

LOCK TABLES `thaydoiqd` WRITE;
/*!40000 ALTER TABLE `thaydoiqd` DISABLE KEYS */;
/*!40000 ALTER TABLE `thaydoiqd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chucvu` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyễn An','admin','e10adc3949ba59abbe56e057f20f883e',NULL,'admin',1),(2,'Ngọc Ánh','giaovien1','4297f44b13955235245b2497399d7a93',NULL,'giaovien',1),(3,'Hồng Anh','giaovu1','4297f44b13955235245b2497399d7a93',NULL,'giaovu',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15 20:54:32
