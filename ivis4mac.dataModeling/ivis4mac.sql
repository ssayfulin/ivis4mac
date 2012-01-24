-- MySQL dump 10.13  Distrib 5.5.20, for Win32 (x86)
--
-- Host: localhost    Database: ivis4mac
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Country` longtext,
  `Region` longtext,
  `District` longtext,
  `City` longtext,
  `Street` longtext,
  `Building` longtext,
  `Appartment` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Russia','Saint-Petersburg','Ivanovsky','Saint-Petersburg','Ivana Ivanova','1A',1),(2,'Russia','Saint-Petersburg','Konstantinovsky','Saint-Petersburg','Konstantina Konstantinova','1A',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothingitem`
--

DROP TABLE IF EXISTS `clothingitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothingitem` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Color_Id` int(11) DEFAULT NULL,
  `Type_Id` int(11) DEFAULT NULL,
  `MissingPerson_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Color_Id` (`Color_Id`),
  KEY `Type_Id` (`Type_Id`),
  KEY `MissingPerson_Id` (`MissingPerson_Id`),
  CONSTRAINT `MissingPerson_Clothing` FOREIGN KEY (`MissingPerson_Id`) REFERENCES `missingperson` (`Id`),
  CONSTRAINT `ClothingItem_Color` FOREIGN KEY (`Color_Id`) REFERENCES `color` (`Id`),
  CONSTRAINT `ClothingItem_Type` FOREIGN KEY (`Type_Id`) REFERENCES `clothingitemtype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothingitem`
--

LOCK TABLES `clothingitem` WRITE;
/*!40000 ALTER TABLE `clothingitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothingitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothingitemtype`
--

DROP TABLE IF EXISTS `clothingitemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothingitemtype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothingitemtype`
--

LOCK TABLES `clothingitemtype` WRITE;
/*!40000 ALTER TABLE `clothingitemtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothingitemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `R` int(11) NOT NULL,
  `G` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Phone` longtext,
  `PhoneWorking` longtext,
  `Email` longtext,
  `Skype` longtext,
  `ICQ` longtext,
  `Site` longtext,
  `CallTimeFrom` int(11) NOT NULL,
  `CallTimeTo` int(11) NOT NULL,
  `ExtraInformation_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ExtraInformation_Id` (`ExtraInformation_Id`),
  CONSTRAINT `Contact_ExtraInformation` FOREIGN KEY (`ExtraInformation_Id`) REFERENCES `document` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,NULL,'79211111111',NULL,'ivan@ivan.com',NULL,NULL,NULL,0,0,NULL),(2,NULL,'79218888888',NULL,NULL,NULL,NULL,NULL,10,22,NULL),(3,NULL,'79218888888',NULL,NULL,NULL,NULL,NULL,10,22,NULL),(4,NULL,'79211111111',NULL,'Konstantin@Konstantin.com',NULL,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Text` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'Left home in the night');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edmmetadata`
--

DROP TABLE IF EXISTS `edmmetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edmmetadata` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ModelHash` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edmmetadata`
--

LOCK TABLES `edmmetadata` WRITE;
/*!40000 ALTER TABLE `edmmetadata` DISABLE KEYS */;
INSERT INTO `edmmetadata` VALUES (1,'19D3A9E50B98343AE9AD817B9CCDF3BEE319926D2044C9CBF13EC45C41636260');
/*!40000 ALTER TABLE `edmmetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Quantity` int(11) NOT NULL,
  `Type_Id` int(11) DEFAULT NULL,
  `Volonteer_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Type_Id` (`Type_Id`),
  KEY `Volonteer_Id` (`Volonteer_Id`),
  CONSTRAINT `Volonteer_Equipment` FOREIGN KEY (`Volonteer_Id`) REFERENCES `volonteer` (`Id`),
  CONSTRAINT `Equipment_Type` FOREIGN KEY (`Type_Id`) REFERENCES `equipmenttype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipmenttype`
--

DROP TABLE IF EXISTS `equipmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipmenttype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipmenttype`
--

LOCK TABLES `equipmenttype` WRITE;
/*!40000 ALTER TABLE `equipmenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filelink`
--

DROP TABLE IF EXISTS `filelink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filelink` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Path` longtext,
  `MissingPerson_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `MissingPerson_Id` (`MissingPerson_Id`),
  CONSTRAINT `MissingPerson_Images` FOREIGN KEY (`MissingPerson_Id`) REFERENCES `missingperson` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filelink`
--

LOCK TABLES `filelink` WRITE;
/*!40000 ALTER TABLE `filelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `filelink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IncidentId` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Publicity_Id` int(11) DEFAULT NULL,
  `Missing_Id` int(11) DEFAULT NULL,
  `PoliceApplication_Id` int(11) DEFAULT NULL,
  `State_Id` int(11) DEFAULT NULL,
  `IncidentDescription_Id` int(11) DEFAULT NULL,
  `Notes_Id` int(11) DEFAULT NULL,
  `Contacts_Id` int(11) DEFAULT NULL,
  `Coordinator_Id` int(11) DEFAULT NULL,
  `CoordinatingOrganization_Id` int(11) DEFAULT NULL,
  `Links_Id` int(11) DEFAULT NULL,
  `FilesLink_Id` int(11) DEFAULT NULL,
  `MapLink_Id` int(11) DEFAULT NULL,
  `Registrator_Id` int(11) DEFAULT NULL,
  `RegistrationDate_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Publicity_Id` (`Publicity_Id`),
  KEY `Missing_Id` (`Missing_Id`),
  KEY `PoliceApplication_Id` (`PoliceApplication_Id`),
  KEY `State_Id` (`State_Id`),
  KEY `IncidentDescription_Id` (`IncidentDescription_Id`),
  KEY `Notes_Id` (`Notes_Id`),
  KEY `Contacts_Id` (`Contacts_Id`),
  KEY `Coordinator_Id` (`Coordinator_Id`),
  KEY `CoordinatingOrganization_Id` (`CoordinatingOrganization_Id`),
  KEY `Links_Id` (`Links_Id`),
  KEY `FilesLink_Id` (`FilesLink_Id`),
  KEY `MapLink_Id` (`MapLink_Id`),
  KEY `Registrator_Id` (`Registrator_Id`),
  KEY `RegistrationDate_Id` (`RegistrationDate_Id`),
  CONSTRAINT `Incident_RegistrationDate` FOREIGN KEY (`RegistrationDate_Id`) REFERENCES `person` (`Id`),
  CONSTRAINT `Incident_Contacts` FOREIGN KEY (`Contacts_Id`) REFERENCES `document` (`Id`),
  CONSTRAINT `Incident_CoordinatingOrganization` FOREIGN KEY (`CoordinatingOrganization_Id`) REFERENCES `organization` (`Id`),
  CONSTRAINT `Incident_Coordinator` FOREIGN KEY (`Coordinator_Id`) REFERENCES `person` (`Id`),
  CONSTRAINT `Incident_FilesLink` FOREIGN KEY (`FilesLink_Id`) REFERENCES `filelink` (`Id`),
  CONSTRAINT `Incident_IncidentDescription` FOREIGN KEY (`IncidentDescription_Id`) REFERENCES `document` (`Id`),
  CONSTRAINT `Incident_Links` FOREIGN KEY (`Links_Id`) REFERENCES `document` (`Id`),
  CONSTRAINT `Incident_MapLink` FOREIGN KEY (`MapLink_Id`) REFERENCES `maplink` (`Id`),
  CONSTRAINT `Incident_Missing` FOREIGN KEY (`Missing_Id`) REFERENCES `missingperson` (`Id`),
  CONSTRAINT `Incident_Notes` FOREIGN KEY (`Notes_Id`) REFERENCES `document` (`Id`),
  CONSTRAINT `Incident_PoliceApplication` FOREIGN KEY (`PoliceApplication_Id`) REFERENCES `policeapplication` (`Id`),
  CONSTRAINT `Incident_Publicity` FOREIGN KEY (`Publicity_Id`) REFERENCES `publicitytype` (`Id`),
  CONSTRAINT `Incident_Registrator` FOREIGN KEY (`Registrator_Id`) REFERENCES `person` (`Id`),
  CONSTRAINT `Incident_State` FOREIGN KEY (`State_Id`) REFERENCES `incidentstate` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident`
--

LOCK TABLES `incident` WRITE;
/*!40000 ALTER TABLE `incident` DISABLE KEYS */;
INSERT INTO `incident` VALUES (1,0,'2012-01-24 23:40:45',NULL,1,1,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidentstate`
--

DROP TABLE IF EXISTS `incidentstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidentstate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `State` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidentstate`
--

LOCK TABLES `incidentstate` WRITE;
/*!40000 ALTER TABLE `incidentstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidentstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maplink`
--

DROP TABLE IF EXISTS `maplink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maplink` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` int(11) NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maplink`
--

LOCK TABLES `maplink` WRITE;
/*!40000 ALTER TABLE `maplink` DISABLE KEYS */;
/*!40000 ALTER TABLE `maplink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missingperson`
--

DROP TABLE IF EXISTS `missingperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missingperson` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Person_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Person_Id` (`Person_Id`),
  CONSTRAINT `MissingPerson_Person` FOREIGN KEY (`Person_Id`) REFERENCES `person` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missingperson`
--

LOCK TABLES `missingperson` WRITE;
/*!40000 ALTER TABLE `missingperson` DISABLE KEYS */;
INSERT INTO `missingperson` VALUES (1,1);
/*!40000 ALTER TABLE `missingperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrganizationName` longtext,
  `OrganizationType_Id` int(11) DEFAULT NULL,
  `Address_Id` int(11) DEFAULT NULL,
  `Contact_Id` int(11) DEFAULT NULL,
  `Information_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OrganizationType_Id` (`OrganizationType_Id`),
  KEY `Address_Id` (`Address_Id`),
  KEY `Contact_Id` (`Contact_Id`),
  KEY `Information_Id` (`Information_Id`),
  CONSTRAINT `Organization_Information` FOREIGN KEY (`Information_Id`) REFERENCES `document` (`Id`),
  CONSTRAINT `Organization_Address` FOREIGN KEY (`Address_Id`) REFERENCES `address` (`Id`),
  CONSTRAINT `Organization_Contact` FOREIGN KEY (`Contact_Id`) REFERENCES `contact` (`Id`),
  CONSTRAINT `Organization_OrganizationType` FOREIGN KEY (`OrganizationType_Id`) REFERENCES `organizationtype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizationtype`
--

DROP TABLE IF EXISTS `organizationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizationtype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizationtype`
--

LOCK TABLES `organizationtype` WRITE;
/*!40000 ALTER TABLE `organizationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` longtext,
  `LastName` longtext,
  `PatronymicName` longtext,
  `BirthDay` datetime NOT NULL,
  `Address_Id` int(11) DEFAULT NULL,
  `Contact_Id` int(11) DEFAULT NULL,
  `Volonteer_Id` int(11) DEFAULT NULL,
  `MissingPerson_Id` int(11) DEFAULT NULL,
  `PoliceApplication_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Address_Id` (`Address_Id`),
  KEY `Contact_Id` (`Contact_Id`),
  KEY `Volonteer_Id` (`Volonteer_Id`),
  KEY `MissingPerson_Id` (`MissingPerson_Id`),
  KEY `PoliceApplication_Id` (`PoliceApplication_Id`),
  CONSTRAINT `PoliceApplication_ContactPersons` FOREIGN KEY (`PoliceApplication_Id`) REFERENCES `policeapplication` (`Id`),
  CONSTRAINT `MissingPerson_Relatives` FOREIGN KEY (`MissingPerson_Id`) REFERENCES `missingperson` (`Id`),
  CONSTRAINT `Person_Address` FOREIGN KEY (`Address_Id`) REFERENCES `address` (`Id`),
  CONSTRAINT `Person_Contact` FOREIGN KEY (`Contact_Id`) REFERENCES `contact` (`Id`),
  CONSTRAINT `Volonteer_Relatives` FOREIGN KEY (`Volonteer_Id`) REFERENCES `volonteer` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Ivan','Ivanov','Ivanovich','1990-10-22 00:00:00',1,1,NULL,NULL,NULL),(2,'Ivan','Pronin',NULL,'0001-01-01 00:00:00',NULL,2,NULL,NULL,NULL),(3,'Konstantin','Konstantinov','Ivanovich','1990-10-22 00:00:00',2,4,NULL,NULL,NULL),(4,'Ivanna','Ivanova',NULL,'0001-01-01 00:00:00',NULL,3,NULL,NULL,1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personsign`
--

DROP TABLE IF EXISTS `personsign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personsign` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Value` longtext,
  `SignType_Id` int(11) DEFAULT NULL,
  `MissingPerson_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SignType_Id` (`SignType_Id`),
  KEY `MissingPerson_Id` (`MissingPerson_Id`),
  CONSTRAINT `MissingPerson_PersonSigns` FOREIGN KEY (`MissingPerson_Id`) REFERENCES `missingperson` (`Id`),
  CONSTRAINT `PersonSign_SignType` FOREIGN KEY (`SignType_Id`) REFERENCES `personsigntype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personsign`
--

LOCK TABLES `personsign` WRITE;
/*!40000 ALTER TABLE `personsign` DISABLE KEYS */;
/*!40000 ALTER TABLE `personsign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personsigntype`
--

DROP TABLE IF EXISTS `personsigntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personsigntype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personsigntype`
--

LOCK TABLES `personsigntype` WRITE;
/*!40000 ALTER TABLE `personsigntype` DISABLE KEYS */;
/*!40000 ALTER TABLE `personsigntype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policeapplication`
--

DROP TABLE IF EXISTS `policeapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policeapplication` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationDate` datetime NOT NULL,
  `InvestigationProcessed` tinyint(1) NOT NULL,
  `LowArticle` tinyint(1) NOT NULL,
  `Number` longtext,
  `Organization_Id` int(11) DEFAULT NULL,
  `InvestigationOfficer_Id` int(11) DEFAULT NULL,
  `Type_Id` int(11) DEFAULT NULL,
  `History_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Organization_Id` (`Organization_Id`),
  KEY `InvestigationOfficer_Id` (`InvestigationOfficer_Id`),
  KEY `Type_Id` (`Type_Id`),
  KEY `History_Id` (`History_Id`),
  CONSTRAINT `PoliceApplication_History` FOREIGN KEY (`History_Id`) REFERENCES `document` (`Id`),
  CONSTRAINT `PoliceApplication_InvestigationOfficer` FOREIGN KEY (`InvestigationOfficer_Id`) REFERENCES `person` (`Id`),
  CONSTRAINT `PoliceApplication_Organization` FOREIGN KEY (`Organization_Id`) REFERENCES `organization` (`Id`),
  CONSTRAINT `PoliceApplication_Type` FOREIGN KEY (`Type_Id`) REFERENCES `policerecordtype` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policeapplication`
--

LOCK TABLES `policeapplication` WRITE;
/*!40000 ALTER TABLE `policeapplication` DISABLE KEYS */;
INSERT INTO `policeapplication` VALUES (1,'2012-01-23 23:40:45',1,0,NULL,NULL,2,NULL,1);
/*!40000 ALTER TABLE `policeapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policerecordtype`
--

DROP TABLE IF EXISTS `policerecordtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policerecordtype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RecordType` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policerecordtype`
--

LOCK TABLES `policerecordtype` WRITE;
/*!40000 ALTER TABLE `policerecordtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `policerecordtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicitytype`
--

DROP TABLE IF EXISTS `publicitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicitytype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicitytype`
--

LOCK TABLES `publicitytype` WRITE;
/*!40000 ALTER TABLE `publicitytype` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volonteer`
--

DROP TABLE IF EXISTS `volonteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volonteer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Skill` longtext,
  `Profession` longtext,
  `Person_Id` int(11) DEFAULT NULL,
  `VolonteerCar_Id` int(11) DEFAULT NULL,
  `Skills_Id` int(11) DEFAULT NULL,
  `ExtraInformation_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Person_Id` (`Person_Id`),
  KEY `VolonteerCar_Id` (`VolonteerCar_Id`),
  KEY `Skills_Id` (`Skills_Id`),
  KEY `ExtraInformation_Id` (`ExtraInformation_Id`),
  CONSTRAINT `Volonteer_ExtraInformation` FOREIGN KEY (`ExtraInformation_Id`) REFERENCES `document` (`Id`),
  CONSTRAINT `Volonteer_Person` FOREIGN KEY (`Person_Id`) REFERENCES `person` (`Id`),
  CONSTRAINT `Volonteer_Skills` FOREIGN KEY (`Skills_Id`) REFERENCES `document` (`Id`),
  CONSTRAINT `Volonteer_VolonteerCar` FOREIGN KEY (`VolonteerCar_Id`) REFERENCES `volonteercartype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volonteer`
--

LOCK TABLES `volonteer` WRITE;
/*!40000 ALTER TABLE `volonteer` DISABLE KEYS */;
/*!40000 ALTER TABLE `volonteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volonteeractivitytype`
--

DROP TABLE IF EXISTS `volonteeractivitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volonteeractivitytype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` longtext,
  `Volonteer_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Volonteer_Id` (`Volonteer_Id`),
  CONSTRAINT `Volonteer_Activities` FOREIGN KEY (`Volonteer_Id`) REFERENCES `volonteer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volonteeractivitytype`
--

LOCK TABLES `volonteeractivitytype` WRITE;
/*!40000 ALTER TABLE `volonteeractivitytype` DISABLE KEYS */;
/*!40000 ALTER TABLE `volonteeractivitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volonteercartype`
--

DROP TABLE IF EXISTS `volonteercartype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volonteercartype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volonteercartype`
--

LOCK TABLES `volonteercartype` WRITE;
/*!40000 ALTER TABLE `volonteercartype` DISABLE KEYS */;
/*!40000 ALTER TABLE `volonteercartype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-01-24 23:52:17
