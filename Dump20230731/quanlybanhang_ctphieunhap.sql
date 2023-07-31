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
-- Table structure for table `ctphieunhap`
--

DROP TABLE IF EXISTS `ctphieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctphieunhap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `masp` varchar(4) DEFAULT NULL,
  `sopn` varchar(5) DEFAULT NULL,
  `soluong` int DEFAULT '0',
  `gianhap` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `masp` (`masp`),
  KEY `sopn` (`sopn`),
  CONSTRAINT `ctphieunhap_ibfk_1` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`),
  CONSTRAINT `ctphieunhap_ibfk_2` FOREIGN KEY (`sopn`) REFERENCES `phieunhap` (`sopn`),
  CONSTRAINT `ctphieunhap_chk_1` CHECK ((`gianhap` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctphieunhap`
--

LOCK TABLES `ctphieunhap` WRITE;
/*!40000 ALTER TABLE `ctphieunhap` DISABLE KEYS */;
INSERT INTO `ctphieunhap` VALUES (1,'SP01','PN01',50,15000000),(2,'SP02','PN01',30,13000000),(3,'SP03','PN02',20,18000000),(4,'SP01','PN03',40,14500000);
/*!40000 ALTER TABLE `ctphieunhap` ENABLE KEYS */;
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
