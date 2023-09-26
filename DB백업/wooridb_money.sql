-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: database-2.catsg9unmalm.ap-northeast-2.rds.amazonaws.com    Database: wooridb
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `money`
--

DROP TABLE IF EXISTS `money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `money` (
  `money_no` int NOT NULL AUTO_INCREMENT,
  `days` datetime(6) DEFAULT NULL,
  `money` int NOT NULL,
  `money_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`money_no`),
  KEY `FKkhf9it7anfibhf6jxaun0jkcn` (`user_id`),
  CONSTRAINT `FKkhf9it7anfibhf6jxaun0jkcn` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money`
--

LOCK TABLES `money` WRITE;
/*!40000 ALTER TABLE `money` DISABLE KEYS */;
INSERT INTO `money` VALUES (16,'2023-09-03 00:00:00.000000',1000000,'income','company','admin'),(19,'2023-09-10 00:00:00.000000',53200,'expense','shopping','admin'),(20,'2023-09-15 00:00:00.000000',100000,'income','alba','soomkoyaki'),(21,'2023-09-15 00:00:00.000000',5000,'income','pin','admin'),(24,'2023-09-15 00:00:00.000000',50003,'income','company',NULL),(25,'2023-08-01 00:00:00.000000',10000,'income','pin','admin1'),(26,'2023-08-02 00:00:00.000000',5000,'expense','food','admin1'),(27,'2023-08-03 00:00:00.000000',500,'income','stock','admin1'),(28,'2023-09-18 00:00:00.000000',100000,'income','pin','admin1'),(29,'2023-09-03 00:00:00.000000',55000,'expense','shopping','admin1');
/*!40000 ALTER TABLE `money` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-26 14:41:25
