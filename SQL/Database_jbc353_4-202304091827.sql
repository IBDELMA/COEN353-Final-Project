-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: jbc353.encs.concordia.ca    Database: jbc353_4
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Employed`
--

DROP TABLE IF EXISTS `Employed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employed` (
  `Facility Name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Facility Phone Number` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Medicare Number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Start Date` date DEFAULT NULL,
  `End Date` date DEFAULT NULL,
  PRIMARY KEY (`Facility Name`,`Medicare Number`,`Facility Phone Number`),
  KEY `Employed_FK_Employee` (`Medicare Number`),
  KEY `Employed_FK_Facility` (`Facility Name`,`Facility Phone Number`),
  CONSTRAINT `Employed_FK_Employee` FOREIGN KEY (`Medicare Number`) REFERENCES `Employee` (`Medicare Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Employed_FK_Facility` FOREIGN KEY (`Facility Name`, `Facility Phone Number`) REFERENCES `Facility` (`Name`, `Phone Number`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employed`
--

LOCK TABLES `Employed` WRITE;
/*!40000 ALTER TABLE `Employed` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Medicare Number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Last Name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `First Name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Birth Date` date DEFAULT NULL,
  `Address` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Postal Code` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Phone Number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Citizenship` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Role` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Medicare Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facility`
--

DROP TABLE IF EXISTS `Facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facility` (
  `Name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Phone Number` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Address` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Postal Code` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Capacity` int unsigned DEFAULT NULL,
  `Type` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Web Address` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Manager Medicare Number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Name`,`Phone Number`),
  KEY `Facility_FK` (`Manager Medicare Number`),
  CONSTRAINT `Facility_FK` FOREIGN KEY (`Manager Medicare Number`) REFERENCES `Employee` (`Medicare Number`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facility`
--

LOCK TABLES `Facility` WRITE;
/*!40000 ALTER TABLE `Facility` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Infection`
--

DROP TABLE IF EXISTS `Infection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Infection` (
  `Type` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Employee Medicare Number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`Type`,`Date`,`Employee Medicare Number`),
  KEY `Infection_FK` (`Employee Medicare Number`),
  CONSTRAINT `Infection_FK` FOREIGN KEY (`Employee Medicare Number`) REFERENCES `Employee` (`Medicare Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Infection`
--

LOCK TABLES `Infection` WRITE;
/*!40000 ALTER TABLE `Infection` DISABLE KEYS */;
/*!40000 ALTER TABLE `Infection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Log` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Date` datetime DEFAULT NULL,
  `Receiver` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Sender` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Subject` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Body` varchar(90) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostalCode`
--

DROP TABLE IF EXISTS `PostalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PostalCode` (
  `Postal Code` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `City` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Province` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Postal Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostalCode`
--

LOCK TABLES `PostalCode` WRITE;
/*!40000 ALTER TABLE `PostalCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `PostalCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scheduled`
--

DROP TABLE IF EXISTS `Scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Scheduled` (
  `Facility Name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Facility Phone Number` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Employee Medicare Number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Start Time` time NOT NULL,
  `End Time` time NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Facility Name`,`Facility Phone Number`,`Employee Medicare Number`,`Start Time`,`Date`),
  KEY `Scheduled_FK_1` (`Employee Medicare Number`),
  CONSTRAINT `Scheduled_FK` FOREIGN KEY (`Facility Name`, `Facility Phone Number`) REFERENCES `Facility` (`Name`, `Phone Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Scheduled_FK_1` FOREIGN KEY (`Employee Medicare Number`) REFERENCES `Employee` (`Medicare Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scheduled`
--

LOCK TABLES `Scheduled` WRITE;
/*!40000 ALTER TABLE `Scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `Scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vaccination`
--

DROP TABLE IF EXISTS `Vaccination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vaccination` (
  `Type` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Dose Number` smallint unsigned NOT NULL,
  `Facility Name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Facility Phone Number` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Employee Medicare Number` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Type`,`Dose Number`,`Facility Name`,`Facility Phone Number`,`Employee Medicare Number`),
  KEY `Vaccination_FK` (`Facility Name`,`Facility Phone Number`),
  KEY `Vaccination_FK_1` (`Employee Medicare Number`),
  CONSTRAINT `Vaccination_FK` FOREIGN KEY (`Facility Name`, `Facility Phone Number`) REFERENCES `Facility` (`Name`, `Phone Number`) ON UPDATE CASCADE,
  CONSTRAINT `Vaccination_FK_1` FOREIGN KEY (`Employee Medicare Number`) REFERENCES `Employee` (`Medicare Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vaccination`
--

LOCK TABLES `Vaccination` WRITE;
/*!40000 ALTER TABLE `Vaccination` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vaccination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jbc353_4'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-09 18:27:27
