-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: veranstaltungsverwaltung
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `nutzer`
--

DROP TABLE IF EXISTS `nutzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutzer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benutzername` varchar(255) NOT NULL,
  `passwort` varchar(60) NOT NULL,
  `istManager` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `benutzername_UNIQUE` (`benutzername`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutzer`
--

LOCK TABLES `nutzer` WRITE;
/*!40000 ALTER TABLE `nutzer` DISABLE KEYS */;
INSERT INTO `nutzer` VALUES (3,'jan','123456',1,'jan.raupach@gmail.com'),(4,'janni','123456',1,'jan.raupach@googlemail.com');
/*!40000 ALTER TABLE `nutzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservierung`
--

DROP TABLE IF EXISTS `reservierung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservierung` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nutzer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nutzer_idx` (`nutzer`),
  CONSTRAINT `FKijwyxyitttyy31nu8rogu5q0u` FOREIGN KEY (`nutzer`) REFERENCES `nutzer` (`id`),
  CONSTRAINT `nutzer` FOREIGN KEY (`nutzer`) REFERENCES `nutzer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservierung`
--

LOCK TABLES `reservierung` WRITE;
/*!40000 ALTER TABLE `reservierung` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservierung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `veranstaltung` int(11) NOT NULL,
  `reservierung` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservierung_idx` (`reservierung`),
  KEY `veranstaltung_idx` (`veranstaltung`),
  CONSTRAINT `reservierung` FOREIGN KEY (`reservierung`) REFERENCES `reservierung` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `veranstaltung` FOREIGN KEY (`veranstaltung`) REFERENCES `veranstaltung` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (25,4,NULL),(26,4,NULL),(27,4,NULL),(28,4,NULL),(29,4,NULL),(30,4,NULL),(31,4,NULL),(32,4,NULL),(33,4,NULL),(34,4,NULL),(35,4,NULL),(36,4,NULL),(37,4,NULL),(38,4,NULL),(39,4,NULL),(40,4,NULL),(41,4,NULL),(42,4,NULL),(43,4,NULL),(44,4,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veranstaltung`
--

DROP TABLE IF EXISTS `veranstaltung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veranstaltung` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `beschreibung` longtext NOT NULL,
  `datum` date NOT NULL,
  `ort` varchar(255) NOT NULL DEFAULT 'Noch nicht bekannt',
  `istveroeffentlicht` tinyint(4) NOT NULL,
  `manager` int(11) NOT NULL,
  `ticketpreis` double DEFAULT NULL,
  `bild` blob,
  `tour` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Manger_idx` (`manager`),
  KEY `Tour_idx` (`tour`),
  CONSTRAINT `Manger` FOREIGN KEY (`manager`) REFERENCES `nutzer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Tour` FOREIGN KEY (`tour`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veranstaltung`
--

LOCK TABLES `veranstaltung` WRITE;
/*!40000 ALTER TABLE `veranstaltung` DISABLE KEYS */;
INSERT INTO `veranstaltung` VALUES (4,'Stalken','ldifgoifdjgodgod','2011-01-11','Münster',1,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `veranstaltung` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-21 23:41:11