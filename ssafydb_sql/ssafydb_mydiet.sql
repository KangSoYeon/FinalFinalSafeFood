-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ssafydb
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `mydiet`
--

DROP TABLE IF EXISTS `mydiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mydiet` (
  `dno` int(11) NOT NULL AUTO_INCREMENT,
  `regdate` date DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `code` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`dno`),
  KEY `fd_foreign_mydiet_idx` (`code`),
  CONSTRAINT `fd_foreign_mydiet` FOREIGN KEY (`code`) REFERENCES `food` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydiet`
--

LOCK TABLES `mydiet` WRITE;
/*!40000 ALTER TABLE `mydiet` DISABLE KEYS */;
INSERT INTO `mydiet` VALUES (11,'2019-11-21',1,'12','ssafy'),(13,'2019-11-21',1,'6','ssafy'),(17,'2019-11-21',1,'1','ssafy'),(29,'2019-11-21',1,'12','ssafy'),(33,'2019-11-22',1,'6','ssafy'),(34,'2019-11-22',1,'4','ssafy'),(35,'2019-11-22',1,'4','ssafy'),(36,'2019-11-22',1,'9','ssafy'),(37,'2019-11-22',1,'14','ssafy'),(38,'2019-11-25',1,'15','ssafy'),(39,'2019-11-25',1,'15','ssafy'),(40,'2019-11-25',1,'4','ssafy'),(41,'2019-11-25',1,'4','ssafy'),(42,'2018-11-25',1,'4','ssafy'),(43,'2018-11-25',1,'4','ssafy'),(44,'2019-10-25',1,'4','ssafy'),(46,'2019-11-26',1,'21','ssafy'),(47,'2019-11-26',1,'21','ssafy'),(48,'2019-11-26',1,'21','ssafy'),(49,'2019-11-26',1,'21','ssafy'),(50,'2019-11-26',1,'21','ssafy'),(54,'2019-11-28',1,'18','ssafy');
/*!40000 ALTER TABLE `mydiet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-28 10:38:15
