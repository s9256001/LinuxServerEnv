CREATE DATABASE  IF NOT EXISTS `cegame` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `cegame`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 10.40.0.199    Database: cegame
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_type` int(11) NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `money` bigint(20) NOT NULL,
  `flag` bigint(20) unsigned NOT NULL,
  `client_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (33,1,1,'7f670b0b-0212-47c5-83c2-c2c6f9dfd420','test0001','a','testplayer1',1000000000000,0,'','2018-11-14 16:47:36',NULL),(34,1,2,'48341caf-c86e-4cf4-a5ea-9f2262021cee','test0002','a','testplayer2',1000000000000,0,'','2018-11-14 16:47:36',NULL),(35,1,3,'c52a006a-7282-41e0-a6be-28d2428c1700','test0003','a','testplayer3',1000000000000,0,'','2018-11-14 16:47:36',NULL),(36,1,4,'f873a790-838b-4d13-b5bb-fa8d82585533','test0004','a','testplayer4',1000000000000,0,'','2018-11-14 16:47:36',NULL),(37,1,5,'1bc3ba65-f46d-4763-a382-857760eb6d0c','test0005','a','testplayer5',1000000000000,0,'','2018-11-14 16:47:36',NULL),(38,1,6,'51a02844-93da-4d45-b63c-0aad520ab09e','test0006','a','testplayer6',1000000000000,0,'','2018-11-14 16:47:36',NULL),(39,1,7,'5588f01f-46f6-4a8c-b541-07003837c0bf','test0007','a','testplayer7',1000000000000,0,'','2018-11-14 16:47:36',NULL),(40,1,8,'c94158d0-1622-418a-86fa-c7cbb9f198a3','test0008','a','testplayer8',1000000000000,0,'','2018-11-14 16:47:36',NULL),(41,1,9,'1565f2e3-031f-4da8-9f81-2e48789a436a','test0009','a','testplayer9',1000000000000,0,'','2018-11-14 16:47:36',NULL),(42,1,10,'3e903e67-a5f9-4e9d-a294-15b7fd570162','test0010','a','testplayer10',1000000000000,0,'','2018-11-14 16:47:36',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bet`
--

DROP TABLE IF EXISTS `bet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bet_id` bigint(20) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `game_id` int(11) NOT NULL,
  `round_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `bet` bigint(20) NOT NULL,
  `win` bigint(20) NOT NULL,
  `money` bigint(20) NOT NULL,
  `bet_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `settle_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bet`
--

LOCK TABLES `bet` WRITE;
/*!40000 ALTER TABLE `bet` DISABLE KEYS */;
/*!40000 ALTER TABLE `bet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `room_num` int(11) NOT NULL,
  `seat_num` int(11) NOT NULL,
  `valid_bet_units` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `max_bet` bigint(20) NOT NULL,
  `flag` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,1,10,10,'10000000,50000000,100000000,500000000,1000000000',10000000000,1);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_result`
--

DROP TABLE IF EXISTS `game_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_result_id` bigint(20) unsigned NOT NULL,
  `game_id` int(11) NOT NULL,
  `round_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `result` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_result`
--

LOCK TABLES `game_result` WRITE;
/*!40000 ALTER TABLE `game_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-16 16:37:21
