-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlybanhang
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `manv` varchar(4) NOT NULL,
  `hoten` varchar(30) DEFAULT NULL,
  `gioitinh` bit(1) DEFAULT NULL,
  `diachi` varchar(50) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `dienthoai` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `noisinh` varchar(20) DEFAULT NULL,
  `ngayvaolam` datetime DEFAULT NULL,
  `manql` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`manv`),
  KEY `manql` (`manql`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`manql`) REFERENCES `nhanvien` (`manv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES ('NV01','Nguyen Van A',_binary '','123 Nguyen Hue, TP.HCM','1990-01-15','0901234567','nv.a@example.com','TP.HCM','2020-01-01 08:00:00',NULL),('NV02','Tran Thi B',_binary '\0','456 Le Loi, TP.HCM','1995-05-20','0912345678','tt.b@example.com','TP.HCM','2021-03-15 09:30:00','NV02'),('NV03','Pham Van C',_binary '','789 Vo Van Tan, TP.HCM','1988-11-02','0987654321','pv.c@example.com','TP.HCM','2019-10-10 07:45:00','NV02'),('NV04','Nguyen Thi D',_binary '\0','My Dinh,Ha Noi','1996-04-27','0967585702','ntd@gmail.com','Ha Noi','2021-09-27 00:00:00',NULL);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 19:51:30
