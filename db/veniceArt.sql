-- MySQL dump 10.13  Distrib 5.6.12, for Win32 (x86)
--
-- Host: localhost    Database: veniceArt
-- ------------------------------------------------------
-- Server version	5.6.12

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
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art` (
  `artId` int(11) NOT NULL AUTO_INCREMENT,
  `artistId` int(11) DEFAULT NULL,
  `buildingId` int(11) DEFAULT NULL,
  `artName` varchar(225) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`artId`),
  KEY `artistId` (`artistId`),
  KEY `buildingId` (`buildingId`),
  CONSTRAINT `art_ibfk_1` FOREIGN KEY (`artistId`) REFERENCES `artists` (`artistId`),
  CONSTRAINT `art_ibfk_2` FOREIGN KEY (`buildingId`) REFERENCES `buildings` (`buildingId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
INSERT INTO `art` VALUES (1,1,1,'Assumption of the Madonna','This masterpiece was commissioned when Titian was only 28. It is thought to be the largest altarpiece in Venice and was returned to the Frari after World War One - it had been on display in a specially built room of the Accademia for some time. The painting is divided in three, with the apostles, modelled after local fishermen, depicted in the lowest layer painted in colder tones, with Mary depicted in warmer tones in the centre of the picture, and God emerging from the brightness of the heavens at the top. This dramatic painting caused some controversy at the time, although it is now widely recognised as a masterpiece. Oscar Wilde called it \"Certainly the best picture in Italy\" in 1875 when it was still in the Accademia. ');
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `artistId` int(11) NOT NULL AUTO_INCREMENT,
  `artistName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`artistId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Titian'),(2,'Andrea Celesti'),(3,'Gregorio Lazzarini'),(4,'Alberto Calvetti'),(5,'Pietro Liberi'),(6,'Paolo Caliari'),(7,'Iacopo Nigreti'),(8,'Carl Loth'),(9,'Peter Paul Rubens'),(10,'Jacopo Comin'),(11,'Antonio Zanchi'),(12,'Carl Loth');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buildings` (
  `buildingId` int(11) NOT NULL AUTO_INCREMENT,
  `buildingName` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`buildingId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
INSERT INTO `buildings` VALUES (1,'Santa Maria Gloriosa dei Frari'),(2,'Santa Croce degli Armeni'),(3,'San Luca'),(4,'Santa Maria del Giglio');
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-28 17:04:57
