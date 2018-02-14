DROP SCHEMA IF EXISTS `flights`;
CREATE SCHEMA `flights`;
USE `flights`;

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 33.33.33.1    Database: flights
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.12.04.1

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `reg_nr` varchar(10) NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`reg_nr`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `aircraft_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('BAW000',1),('BAW001',1),('BAW002',1),('BAW003',3),('BAW004',3),('BAW005',3);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_model`
--

DROP TABLE IF EXISTS `aircraft_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft_model`
--

LOCK TABLES `aircraft_model` WRITE;
/*!40000 ALTER TABLE `aircraft_model` DISABLE KEYS */;
INSERT INTO `aircraft_model` VALUES (1,'Boeing 747-400'),(2,'AirBus A380'),(3,'Cessna 172');
/*!40000 ALTER TABLE `aircraft_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport` (
  `icao_code` varchar(4) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`icao_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('EBBR','Brussel Zaventem','BE'),('EGLL','London Heathrow','UK'),('EHAM','Amsterdam Schiphol','NL');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `flight_nr` varchar(16) NOT NULL,
  `departure_airport_code` varchar(4) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_airport_code` varchar(4) DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `aircraft_reg_nr` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`flight_nr`),
  KEY `departure_airport_code` (`departure_airport_code`),
  KEY `arrival_airport_code` (`arrival_airport_code`),
  KEY `aircraft_reg_nr` (`aircraft_reg_nr`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`departure_airport_code`) REFERENCES `airport` (`icao_code`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`arrival_airport_code`) REFERENCES `airport` (`icao_code`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`aircraft_reg_nr`) REFERENCES `aircraft` (`reg_nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('ABC123','EHAM','2018-02-14 09:13:02','EGLL','2018-02-14 09:13:02','BAW000'),('BAW2115','EGLL','2018-02-14 09:13:02','EBBR','2018-02-14 09:13:02','BAW000'),('K1053QC','EHAM','2018-02-14 09:13:02','EBBR','2018-02-14 09:13:02','BAW003');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2018-02-14  9:16:22
