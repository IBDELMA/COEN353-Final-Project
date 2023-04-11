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
  CONSTRAINT `Employed_FK_Facility` FOREIGN KEY (`Facility Name`, `Facility Phone Number`) REFERENCES `Facility` (`Name`, `Phone Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jbc353_4`@`172.16.0.0/255.240.0.0`*/ /*!50003 TRIGGER `CheckCapacityInsert` BEFORE INSERT ON `Employed` FOR EACH ROW BEGIN
	SET @capacity = 
		(SELECT Capacity FROM Facility f
		WHERE f.Name = NEW.`Facility Name` AND f.`Phone Number` = NEW.`Facility Phone Number`);
	SET @currentCount =
		(SELECT COUNT(*) FROM Employed ed 
		WHERE ed.`Facility Name` = NEW.`Facility Name` AND ed.`Facility Phone Number` = NEW.`Facility Phone Number` AND ed.`End Date` IS NULL);
	IF (@currentCount >= @capacity) AND (NEW.`End Date` IS NULL)
	THEN
		SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Facility already at capacity. Unable to add this employee to this facility.";
	END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jbc353_4`@`172.16.0.0/255.240.0.0`*/ /*!50003 TRIGGER `CheckCapacityUpdate` BEFORE UPDATE ON `Employed` FOR EACH ROW BEGIN
	SET @capacity = 
		(SELECT Capacity FROM Facility f
		WHERE f.Name = NEW.`Facility Name` AND f.`Phone Number` = NEW.`Facility Phone Number`);
	SET @currentCount =
		(SELECT COUNT(*) FROM Employed ed 
		WHERE ed.`Facility Name` = NEW.`Facility Name` AND ed.`Facility Phone Number` = NEW.`Facility Phone Number` AND ed.`End Date` IS NULL);
	IF (@currentCount >= @capacity) AND (NEW.`End Date` IS NULL)
	THEN
		SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Facility already at capacity. Unable to add this employee to this facility.";
	END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  PRIMARY KEY (`Medicare Number`),
  KEY `Employee_FK` (`Postal Code`),
  CONSTRAINT `Employee_FK` FOREIGN KEY (`Postal Code`) REFERENCES `PostalCode` (`Postal Code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `Facility_FK_1` (`Postal Code`),
  CONSTRAINT `Facility_FK` FOREIGN KEY (`Manager Medicare Number`) REFERENCES `Employee` (`Medicare Number`) ON UPDATE CASCADE,
  CONSTRAINT `Facility_FK_1` FOREIGN KEY (`Postal Code`) REFERENCES `PostalCode` (`Postal Code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jbc353_4`@`172.16.0.0/255.240.0.0`*/ /*!50003 TRIGGER `InfectionInsert` BEFORE INSERT ON `Infection` FOR EACH ROW BEGIN
	IF NEW.Type = 'COVID-19'
	THEN
		DELETE FROM Scheduled s	
		WHERE s.`Employee Medicare Number` = NEW.`Employee Medicare Number` 
		AND (DATEDIFF(s.`Date`, NEW.Date) <= 14 AND DATEDIFF(s.`Date`, NEW.Date) >= 0);
	END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jbc353_4`@`172.16.0.0/255.240.0.0`*/ /*!50003 TRIGGER `InfectionUpdate` BEFORE UPDATE ON `Infection` FOR EACH ROW BEGIN
	IF NEW.Type = 'COVID-19'
	THEN
		DELETE FROM Scheduled s	
		WHERE s.`Employee Medicare Number` = NEW.`Employee Medicare Number` 
		AND (DATEDIFF(s.`Date`, NEW.Date) <= 14 AND DATEDIFF(s.`Date`, NEW.Date) >= 0);
	END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Table structure for table `Scheduled`
--

DROP TABLE IF EXISTS `Scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Scheduled` (
  `Facility Name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Facility Phone Number` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Employee Medicare Number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Start Time` time NOT NULL,
  `End Time` time NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Facility Name`,`Facility Phone Number`,`Employee Medicare Number`,`Start Time`,`Date`),
  KEY `Scheduled_FK_1` (`Employee Medicare Number`),
  CONSTRAINT `Scheduled_FK` FOREIGN KEY (`Facility Name`, `Facility Phone Number`) REFERENCES `Facility` (`Name`, `Phone Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Scheduled_FK_1` FOREIGN KEY (`Employee Medicare Number`) REFERENCES `Employee` (`Medicare Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jbc353_4`@`172.16.0.0/255.240.0.0`*/ /*!50003 TRIGGER `CheckSchedConflictInsert` BEFORE INSERT ON `Scheduled` FOR EACH ROW IF EXISTS (
	SELECT * FROM Scheduled
	WHERE Scheduled.`Date` = NEW.`Date` AND Scheduled.`Employee Medicare Number` = NEW.`Employee Medicare Number`
	AND ((Scheduled.`Start Time` < NEW.`Start Time` AND Scheduled.`End Time` >= NEW.`Start Time`)
	OR (Scheduled.`Start Time` >= NEW.`Start Time` AND Scheduled.`End Time` <= NEW.`End Time`)
	OR (Scheduled.`Start Time` > NEW.`Start Time` AND Scheduled.`End Time` < NEW.`End Time`)
	OR (Scheduled.`Start Time` <= NEW.`End Time` AND Scheduled.`End Time` > NEW.`End Time`)
	OR (TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) < TIME('1:00') AND TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) >= TIME('0:00')) 
	OR (TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) < TIME('1:00') AND TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) >= TIME('0:00'))))
THEN
	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Scheduling time conflict. Unable to add this schedule for this time.";
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jbc353_4`@`172.16.0.0/255.240.0.0`*/ /*!50003 TRIGGER `CheckSchedConflictUpdate` BEFORE UPDATE ON `Scheduled` FOR EACH ROW IF EXISTS (
	SELECT * FROM Scheduled
	WHERE Scheduled.`Date` = NEW.`Date` AND Scheduled.`Employee Medicare Number` = NEW.`Employee Medicare Number`
	AND ((Scheduled.`Start Time` < NEW.`Start Time` AND Scheduled.`End Time` >= NEW.`Start Time`)
	OR (Scheduled.`Start Time` >= NEW.`Start Time` AND Scheduled.`End Time` <= NEW.`End Time`)
	OR (Scheduled.`Start Time` > NEW.`Start Time` AND Scheduled.`End Time` < NEW.`End Time`)
	OR (Scheduled.`Start Time` <= NEW.`End Time` AND Scheduled.`End Time` > NEW.`End Time`)
	OR (TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) < TIME('1:00') AND TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) >= TIME('0:00')) 
	OR (TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) < TIME('1:00') AND TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) >= TIME('0:00'))))
THEN
	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Scheduling time conflict. Unable to update schedule for this time.";
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  KEY `Vaccination_FK_1` (`Employee Medicare Number`),
  KEY `Vaccination_FK` (`Facility Name`,`Facility Phone Number`),
  CONSTRAINT `Vaccination_FK` FOREIGN KEY (`Facility Name`, `Facility Phone Number`) REFERENCES `Facility` (`Name`, `Phone Number`) ON UPDATE CASCADE,
  CONSTRAINT `Vaccination_FK_1` FOREIGN KEY (`Employee Medicare Number`) REFERENCES `Employee` (`Medicare Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'jbc353_4'
--
/*!50003 DROP FUNCTION IF EXISTS `CheckSchedConflict` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jbc353_4`@`172.16.0.0/255.240.0.0` FUNCTION `CheckSchedConflict`(Medicare Varchar(50), Date_ Date, StartTime Time, EndTime Time) RETURNS tinyint(1)
BEGIN
	IF EXISTS
	(SELECT *
	FROM Scheduled
	WHERE Scheduled.`Date` = Date_ AND Scheduled.`Employee Medicare Number` = Medicare AND
	((DATEDIFF(Scheduled.`End Time`, StartTime) >= 1) OR (DATEDIFF(EndTime, Scheduled.`Start Time`) >= 1)))
	THEN RETURN 1;
	ELSE RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11  5:01:04
