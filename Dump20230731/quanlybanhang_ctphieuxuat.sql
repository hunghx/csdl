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
-- Table structure for table `ctphieuxuat`
--

DROP TABLE IF EXISTS `ctphieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctphieuxuat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sopx` varchar(5) DEFAULT NULL,
  `masp` varchar(4) DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `giaban` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopx` (`sopx`),
  KEY `masp` (`masp`),
  CONSTRAINT `ctphieuxuat_ibfk_1` FOREIGN KEY (`sopx`) REFERENCES `phieuxuat` (`sopx`),
  CONSTRAINT `ctphieuxuat_ibfk_2` FOREIGN KEY (`masp`) REFERENCES `sanpham` (`masp`),
  CONSTRAINT `ctphieuxuat_chk_1` CHECK ((`soluong` > 0)),
  CONSTRAINT `ctphieuxuat_chk_2` CHECK ((`giaban` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctphieuxuat`
--

LOCK TABLES `ctphieuxuat` WRITE;
/*!40000 ALTER TABLE `ctphieuxuat` DISABLE KEYS */;
INSERT INTO `ctphieuxuat` VALUES (1,'PX01','SP01',10,20000000),(2,'PX01','SP02',20,18000000),(3,'PX02','SP03',5,22000000),(4,'PX03','SP01',15,19500000),(5,'PX04','SP02',10,18000000),(6,'PX04','SP03',15,25000000),(7,'PX05','SP02',20,20000000);
/*!40000 ALTER TABLE `ctphieuxuat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 19:51:29
