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
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`),
  KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=19419 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,1,'e11f7fae-0b1c-4117-9741-fd78e47642c5','test0001','a','testplayer1',1000000000000,0,'2018-12-26 16:51:54'),(2,1,2,'22b96e9b-3a62-4744-933d-fceb46dde9b0','test0002','a','testplayer2',1000000000000,0,'2018-12-26 16:51:54'),(3,1,3,'604d9a7b-64ff-4e3f-a87d-b89b3e9cdbbe','test0003','a','testplayer3',1000000000000,0,'2018-12-26 16:51:54'),(4,1,4,'9cef1fa6-8867-4a07-a2d0-d6373f61d44c','test0004','a','testplayer4',1000000000000,0,'2018-12-26 16:51:54'),(5,1,5,'0097f00a-5db4-4a41-9019-fd5f189e865a','test0005','a','testplayer5',1000000000000,0,'2018-12-26 16:51:54'),(6,1,6,'92fe6b37-bb77-4aa1-b0a1-7397f936ed64','test0006','a','testplayer6',1000000000000,0,'2018-12-26 16:51:54'),(7,1,7,'ebcc4bd7-9736-4760-9a46-a94914324dd4','test0007','a','testplayer7',1000000000000,0,'2018-12-26 16:51:54'),(8,1,8,'1852e135-300d-4af0-9229-5f7916e6128b','test0008','a','testplayer8',1000000000000,0,'2018-12-26 16:51:54'),(9,1,9,'fc8ea273-2002-4418-826c-bd4618c9d639','test0009','a','testplayer9',1000000000000,0,'2018-12-26 16:51:54'),(10,1,10,'efd8df58-9e5a-4abf-b7cd-9d9fdd364632','test0010','a','testplayer10',1000000000000,0,'2018-12-26 16:51:54'),(11,3,11,'1db0d043-c13c-40ee-8821-14a49953508b','test0011','a','testbackend1',1000000000000,0,'2018-12-26 16:51:54'),(12,3,12,'a9afd471-3e48-4cba-a380-1c4f203b60d5','test0012','a','testbackend2',1000000000000,0,'2018-12-26 16:51:54'),(13,3,13,'44520fc1-25c4-42ab-9942-117c87b9e0b7','test0013','a','testbackend3',1000000000000,0,'2018-12-26 16:51:54'),(14,3,14,'6bfebc86-1e46-41d6-9f0c-0dcda57fb74f','test0014','a','testbackend4',1000000000000,0,'2018-12-26 16:51:54'),(15,3,15,'38799ac1-c723-4bb6-aebd-168d1599e5d1','test0015','a','testbackend5',1000000000000,0,'2018-12-26 16:51:54'),(16,3,16,'0ad7418a-2f0d-4c30-85f4-87d316d054a8','test0016','a','testbackend6',1000000000000,0,'2018-12-26 16:51:54'),(17,3,17,'0d3a7628-84a8-43a3-86a0-cc141674aff2','test0017','a','testbackend7',1000000000000,0,'2018-12-26 16:51:54'),(18,3,18,'8114abe4-6410-44f6-a18f-fc108e183564','test0018','a','testbackend8',1000000000000,0,'2018-12-26 16:51:54'),(19,3,19,'0f9c6789-9c33-4fc7-a1da-811f7e9d85de','test0019','a','testbackend9',1000000000000,0,'2018-12-26 16:51:55'),(20,3,20,'4a638052-cb4c-4526-95b4-464c695ec0b3','test0020','a','testbackend10',1000000000000,0,'2018-12-26 16:51:55');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game` (
  `id` bigint(20) NOT NULL,
  `game_id` int(11) NOT NULL,
  `room_num` int(11) NOT NULL,
  `seat_num` int(11) NOT NULL,
  `valid_bet_units` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `max_bet` bigint(20) NOT NULL,
  `flag` bigint(20) unsigned NOT NULL,
  `total_win` bigint(20) NOT NULL,
  `total_monthly_win` bigint(20) NOT NULL,
  `total_monthly_win_create_time` datetime DEFAULT NULL,
  `total_win_limit` bigint(20) NOT NULL,
  `total_monthly_win_limit` bigint(20) NOT NULL,
  `control_spin_prob` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `game_id` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (3,1,10,10,'1000000,5000000,10000000,50000000,100000000',500000000,1,0,0,NULL,-9999900000000,-9999900000000,0);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_account`
--

DROP TABLE IF EXISTS `log_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` int(11) NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `client_ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_account`
--

LOCK TABLES `log_account` WRITE;
/*!40000 ALTER TABLE `log_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_bet`
--

DROP TABLE IF EXISTS `log_bet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_bet` (
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
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `bet_id` (`bet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_bet`
--

LOCK TABLES `log_bet` WRITE;
/*!40000 ALTER TABLE `log_bet` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_bet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_game_result`
--

DROP TABLE IF EXISTS `log_game_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_game_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_result_id` bigint(20) unsigned NOT NULL,
  `game_id` int(11) NOT NULL,
  `round_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `result` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `game_result_id` (`game_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_game_result`
--

LOCK TABLES `log_game_result` WRITE;
/*!40000 ALTER TABLE `log_game_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_game_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `server` (
  `id` bigint(20) NOT NULL,
  `total_win` bigint(20) NOT NULL,
  `total_monthly_win` bigint(20) NOT NULL,
  `total_monthly_win_create_time` datetime DEFAULT NULL,
  `total_win_limit` bigint(20) NOT NULL,
  `total_monthly_win_limit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,0,0,NULL,-9999900000000,-9999900000000);
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-28 17:22:22
