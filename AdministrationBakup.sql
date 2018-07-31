-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: Administration
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `UAccountEditsLog`
--

DROP TABLE IF EXISTS `UAccountEditsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UAccountEditsLog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(200) CHARACTER SET utf8 NOT NULL,
  `EditDateTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `EditString` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `EditType` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `IPAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UAccountEditsLog`
--

LOCK TABLES `UAccountEditsLog` WRITE;
/*!40000 ALTER TABLE `UAccountEditsLog` DISABLE KEYS */;
INSERT INTO `UAccountEditsLog` VALUES (1,'vikram@gmail.com','2018-07-29 21:59:48','{upassword: uvik1234, ucontact: u9611703294, uname: uVikram, uemail: uvikram@gmail.com}','New Account','127.0.0.1'),(2,'vikram@gmail.com','2018-07-29 22:02:50','{password: vik12345, contact: 9611703294, name: Vikram, email: vikram@gmail.com}','New Account','127.0.0.1'),(3,'vikram@gmail.com','2018-07-29 22:04:28','{password: 6f86720fbd74c59f019c2e38d743a54c, contact: 9611703294, name: Vikram, email: vikram@gmail.com}','Updated','127.0.0.1'),(4,'pra123@gmail.com','2018-07-30 20:20:21','{password: ad3455a8fc67280b76ff8c81eb6a10cd, contact: 76876876, name: prasanna, email: pra123@gmail.com}','New Account','127.0.0.1'),(5,'ritu@disha.com','2018-07-30 23:41:32','{password: d44273a27369a7f34474e2186f2a997d, contact: 9958381316, name: Ritudisha Biswas, email: ritu@disha.com}','Updated','127.0.0.1'),(6,'ritu@disha.com','2018-07-30 23:58:10','{password: d41d8cd98f00b204e9800998ecf8427e, contact: 9958381316, name: Ritudisha Biswas, email: ritu@disha.com}','Updated','127.0.0.1'),(7,'ritu@disha.com','2018-07-31 00:00:41','{password: 40297ccb312e943dae03e9a3271f7112, contact: 9958381316, name: Ritudisha Biswas, email: ritu@disha.com}','Updated','127.0.0.1'),(8,'ritu@disha.com','2018-07-31 08:55:20','{password: d41d8cd98f00b204e9800998ecf8427e, contact: 9958381317, name: Ritudisha Biswas, email: ritu@disha.com}','Updated','127.0.0.1'),(9,'ritu@disha.com','2018-07-31 08:59:32','{password: 042273c5ad3ebbaf436a9c78fbe713b7, contact: 9958381317, name: Ritudisha Biswas, email: ritu@disha.com}','Updated','127.0.0.1'),(10,'ritu@disha.com','2018-07-31 09:01:41','{password: , contact: 9958381316, name: Ritudisha Biswas, email: ritu@disha.com}','Updated','127.0.0.1'),(11,'vikram.january@gmail.com','2018-07-31 21:43:29','{password: 4f03a3d7d3dffa764d27606ff3773311, contact: 9611703294, name: Vikram, email: vikram.january@gmail.com}','New Account','127.0.0.1');
/*!40000 ALTER TABLE `UAccountEditsLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAccountAccessLog`
--

DROP TABLE IF EXISTS `UserAccountAccessLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAccountAccessLog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `LoginDateTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `LogoutDateTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IPAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAccountAccessLog`
--

LOCK TABLES `UserAccountAccessLog` WRITE;
/*!40000 ALTER TABLE `UserAccountAccessLog` DISABLE KEYS */;
INSERT INTO `UserAccountAccessLog` VALUES (1,1,'2018-07-29 19:14:33',NULL,'127.0.0.1'),(2,2,'2018-07-30 13:35:19','2018-07-31 20:10:41','127.0.0.1'),(3,2,'2018-07-30 14:03:54','2018-07-31 20:10:41','127.0.0.1'),(4,2,'2018-07-30 20:14:21','2018-07-31 20:10:41','127.0.0.1'),(5,2,'2018-07-30 20:14:21','2018-07-31 20:10:41','127.0.0.1'),(6,2,'2018-07-30 20:14:28','2018-07-31 20:10:41','127.0.0.1'),(7,2,'2018-07-30 21:55:02','2018-07-31 20:10:41','127.0.0.1'),(8,2,'2018-07-30 21:57:47','2018-07-31 20:10:41','127.0.0.1'),(9,2,'2018-07-30 21:59:26','2018-07-31 20:10:41','127.0.0.1'),(10,2,'2018-07-30 22:11:53','2018-07-31 20:10:41','127.0.0.1'),(11,2,'2018-07-30 22:14:27','2018-07-31 20:10:41','127.0.0.1'),(12,2,'2018-07-30 22:32:18','2018-07-31 20:10:41','127.0.0.1'),(13,2,'2018-07-30 22:36:52','2018-07-31 20:10:41','127.0.0.1'),(14,2,'2018-07-30 22:39:28','2018-07-31 20:10:41','127.0.0.1'),(15,2,'2018-07-30 23:09:53','2018-07-31 20:10:41','127.0.0.1'),(16,2,'2018-07-30 23:19:28','2018-07-31 20:10:41','127.0.0.1'),(17,2,'2018-07-30 23:49:28','2018-07-31 20:10:41','127.0.0.1'),(18,2,'2018-07-31 00:00:13','2018-07-31 20:10:41','127.0.0.1'),(19,2,'2018-07-31 08:59:20','2018-07-31 20:10:41','127.0.0.1'),(20,2,'2018-07-31 09:01:10','2018-07-31 20:10:41','127.0.0.1'),(21,2,'2018-07-31 09:07:48','2018-07-31 20:10:41','127.0.0.1'),(22,2,'2018-07-31 09:12:13','2018-07-31 20:10:41','127.0.0.1'),(23,2,'2018-07-31 09:12:45','2018-07-31 20:10:41','127.0.0.1'),(24,2,'2018-07-31 19:59:55','2018-07-31 20:10:41','127.0.0.1'),(25,5,'2018-07-31 21:44:06','2018-07-31 22:17:59','127.0.0.1'),(26,2,'2018-07-31 22:18:44',NULL,'127.0.0.1');
/*!40000 ALTER TABLE `UserAccountAccessLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserDetails`
--

DROP TABLE IF EXISTS `UserDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserDetails` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Contact` varchar(10) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserDetails`
--

LOCK TABLES `UserDetails` WRITE;
/*!40000 ALTER TABLE `UserDetails` DISABLE KEYS */;
INSERT INTO `UserDetails` VALUES (1,'Disha','ritu1@gmail.com','897879987','dfffdcd77e5291c45bf9700d53814f44'),(2,'Ritudisha Biswas','ritu@disha.com','9958381316','042273c5ad3ebbaf436a9c78fbe713b7'),(3,'Vikram','vikram@gmail.com','9611703294','6f86720fbd74c59f019c2e38d743a54c'),(4,'prasanna','pra123@gmail.com','76876876','ad3455a8fc67280b76ff8c81eb6a10cd'),(5,'Vikram','vikram.january@gmail.com','9611703294','4f03a3d7d3dffa764d27606ff3773311');
/*!40000 ALTER TABLE `UserDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserEditsLog`
--

DROP TABLE IF EXISTS `UserEditsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserEditsLog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(200) CHARACTER SET utf8 NOT NULL,
  `EditDateTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `EditString` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `EditType` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `IPAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserEditsLog`
--

LOCK TABLES `UserEditsLog` WRITE;
/*!40000 ALTER TABLE `UserEditsLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserEditsLog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-01  2:33:43
