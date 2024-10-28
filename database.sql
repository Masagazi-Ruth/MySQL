CREATE DATABASE  IF NOT EXISTS `hall_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hall_management`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: hall_management
-- ------------------------------------------------------
-- Server version	8.0.39

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
  `AdminId` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `HallName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2001,'Nakatudde Rose','Africa','admin.africa@gmail.com'),(2002,'Nagawa Christine','Complex','admin.complex@gmail.com'),(2003,'Namutebi Carol','Marystuart','admin.marystuart@gmail.com'),(2004,'Segawa Jonathan','University Hall','admin.universityall@gmail.com'),(2005,'Mukisa Timothy','Mitchell','admin.mitchell@gmail.com'),(2006,'Sekyanzi Abdul','Nsibirwa','admin.nsibirwa@gmail.com'),(2007,'Mugenyi Allan','Nkrumah','admin.nkrumah@gmail.com'),(2008,'Matovu Peter','Livingstone','admin.livingstone@gmail.com'),(2009,'Lubega Hassan','Lumumba','admin.lumumba@gmail.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `BlockId` varchar(5) NOT NULL,
  `HallId` varchar(5) DEFAULT NULL,
  `BlockName` varchar(10) NOT NULL,
  `total_number_of_rooms` int DEFAULT NULL,
  `free_rooms` int DEFAULT NULL,
  `occupied_rooms` int DEFAULT NULL,
  PRIMARY KEY (`BlockId`),
  KEY `HallId` (`HallId`),
  CONSTRAINT `blocks_ibfk_1` FOREIGN KEY (`HallId`) REFERENCES `halls` (`HallId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES ('AAF','AF','Block A',20,5,15),('ACO','CO','Block A',20,4,16),('ALM','LM','Block A',20,10,10),('ALS','LS','Block A',20,15,5),('AMI','MI','Block A',20,8,12),('AMS','MS','Block A',20,7,13),('ANH','NH','Block A',20,2,18),('ANS','NS','Block A',20,10,10),('AUH','UH','Block A',20,10,10),('BAF','AF','Block B',20,5,15),('BCO','CO','Block B',20,5,15),('BLM','LM','Block B',20,5,15),('BLS','LS','Block B',20,5,15),('BMI','MI','Block B',20,5,15),('BMS','MS','Block B',20,5,15),('BNH','NH','Block B',20,5,15),('BNS','NS','Block B',20,5,15),('BUH','UH','Block B',20,5,15),('CAF','AF','Block C',20,5,15),('CCO','CO','Block C',20,5,15),('CLM','LM','Block C',20,5,15),('CLS','LS','Block C',20,5,15),('CMI','MI','Block C',20,5,15),('CMS','MS','Block C',20,5,15),('CNH','NH','Block C',20,5,15),('CNS','NS','Block C',20,5,15),('CUH','UH','Block C',20,5,15);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `HallId` varchar(5) NOT NULL,
  `AdminId` int DEFAULT NULL,
  `HallName` varchar(50) NOT NULL,
  PRIMARY KEY (`HallId`),
  KEY `AdminId` (`AdminId`),
  CONSTRAINT `halls_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `admin` (`AdminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES ('AF',2001,'Africa'),('CO',2002,'Complex'),('LM',2009,'Lumumba'),('LS',2008,'Livingstone'),('MI',2005,'Mitchell'),('MS',2003,'Marystuart'),('NH',2007,'Nkrumah'),('NS',2006,'Nsibirwa'),('UH',2004,'University Hall');
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `studenthalldetails`
--

DROP TABLE IF EXISTS `studenthalldetails`;
/*!50001 DROP VIEW IF EXISTS `studenthalldetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studenthalldetails` AS SELECT 
 1 AS `StudentNumber`,
 1 AS `StudentName`,
 1 AS `AdminName`,
 1 AS `AdminEmail`,
 1 AS `HallOfAttachment`,
 1 AS `TotalRooms`,
 1 AS `OccupiedRooms`,
 1 AS `FreeRooms`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentNumber` int NOT NULL,
  `HallId` varchar(5) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `HallOfAttachment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StudentNumber`),
  KEY `HallId` (`HallId`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`HallId`) REFERENCES `halls` (`HallId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (23007000,'AF','Kizito','John','Female','Africa'),(23007001,'AF','Akoth','Alice','Female','Africa'),(23007002,'NH','Okello','Peter','Male','Nkrumah'),(23007003,'NH','Kintu','Denis','Male','Nkrumah'),(23007004,'LM','Musa','Ahmed','Male','Lumumba'),(23007005,'MS','Nalubega','Joan','Female','Marystuart'),(23007006,'CO','Nantongo','Diana','Female','Complex'),(23007007,'UH','Mugisha','Allan','Male','University Hall'),(23007008,'LS','Mugisha','Balam','Male','Livingstone'),(23007009,'NS','Magezi','Benjamin','Male','Nsibirwa'),(23007010,'CO','Nangabane','Jackie','Female','Complex'),(23007011,'NS','Mutebi','Timothy','Male','Nsibirwa'),(23007012,'UH','Kabanda','Arthur','Male','University Hall');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `studenthalldetails`
--

/*!50001 DROP VIEW IF EXISTS `studenthalldetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studenthalldetails` AS select `s`.`StudentNumber` AS `StudentNumber`,concat(`s`.`Surname`,' ',`s`.`FirstName`) AS `StudentName`,`a`.`Username` AS `AdminName`,`a`.`Email` AS `AdminEmail`,`h`.`HallName` AS `HallOfAttachment`,sum(`b`.`total_number_of_rooms`) AS `TotalRooms`,sum(`b`.`occupied_rooms`) AS `OccupiedRooms`,(sum(`b`.`total_number_of_rooms`) - sum(`b`.`occupied_rooms`)) AS `FreeRooms` from (((`students` `s` join `halls` `h` on((`s`.`HallId` = `h`.`HallId`))) join `admin` `a` on((`h`.`AdminId` = `a`.`AdminId`))) join `blocks` `b` on((`h`.`HallId` = `b`.`HallId`))) group by `s`.`StudentNumber`,`s`.`Surname`,`s`.`FirstName`,`a`.`Username`,`a`.`Email`,`h`.`HallName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-24 13:40:16
