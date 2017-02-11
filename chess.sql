-- MySQL dump 10.14  Distrib 5.5.49-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: chess
-- ------------------------------------------------------
-- Server version	5.5.49-MariaDB-1ubuntu0.14.04.1

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
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `gameid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `whiteplayerid` int(11) NOT NULL DEFAULT '0',
  `blackplayerid` int(11) NOT NULL DEFAULT '0',
  `white_key` varchar(25) DEFAULT NULL,
  `black_key` varchar(25) DEFAULT NULL,
  `matchid` int(11) NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL,
  `timecontrol` int(11) NOT NULL DEFAULT '30',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `whitepresent` tinyint(1) NOT NULL DEFAULT '0',
  `blackpresent` tinyint(1) NOT NULL DEFAULT '0',
  `whitetime` int(11) NOT NULL DEFAULT '1800',
  `blacktime` int(11) NOT NULL DEFAULT '1800',
  PRIMARY KEY (`gameid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,1,2,'abc123','xyz123',1,'0000-00-00 00:00:00',30,'2016-01-06 17:01:35',1,1,425,-336),(2,0,0,'apple','banana',1,'0000-00-00 00:00:00',30,'2016-01-08 15:44:36',0,1,1800,1800),(3,0,0,'pear','orange',1,'0000-00-00 00:00:00',30,'2016-01-08 15:45:00',1,1,337,722),(4,1,2,'w1','b1',1,'0000-00-00 00:00:00',30,'2016-01-08 17:00:44',0,0,1800,1800);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moves`
--

DROP TABLE IF EXISTS `moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moves` (
  `moveid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_key` varchar(25) DEFAULT NULL,
  `fen` varchar(200) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `move` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`moveid`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moves`
--

LOCK TABLES `moves` WRITE;
/*!40000 ALTER TABLE `moves` DISABLE KEYS */;
INSERT INTO `moves` VALUES (1,'abc123','rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1',1,'2016-03-27 14:55:09','{\"from\":\"e2\",\"to\":\"e4\",\"promotion\":\"q\"}'),(2,'xyz123','rnbqkbnr/pppp1ppp/4p3/8/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2',1,'2016-03-27 14:55:35','{\"from\":\"e7\",\"to\":\"e6\",\"promotion\":\"q\"}'),(3,'abc123','rnbqkbnr/pppp1ppp/4p3/8/4P3/6P1/PPPP1P1P/RNBQKBNR b KQkq - 0 2',1,'2016-03-27 14:55:47','{\"from\":\"g2\",\"to\":\"g3\",\"promotion\":\"q\"}'),(4,'xyz123','rnbqkbnr/ppp2ppp/4p3/3p4/4P3/6P1/PPPP1P1P/RNBQKBNR w KQkq d6 0 3',1,'2016-03-27 14:55:53','{\"from\":\"d7\",\"to\":\"d5\",\"promotion\":\"q\"}'),(5,'abc123','rnbqkbnr/ppp2ppp/4p3/3p4/4P3/3P2P1/PPP2P1P/RNBQKBNR b KQkq - 0 3',1,'2016-03-27 14:56:07','{\"from\":\"d2\",\"to\":\"d3\",\"promotion\":\"q\"}'),(6,'xyz123','rnbqkbnr/1pp2ppp/4p3/p2p4/4P3/3P2P1/PPP2P1P/RNBQKBNR w KQkq a6 0 4',1,'2016-03-27 14:56:53','{\"from\":\"a7\",\"to\":\"a5\",\"promotion\":\"q\"}'),(7,'abc123','rnbqkbnr/1pp2ppp/4p3/p2p4/4P3/3P1PP1/PPP4P/RNBQKBNR b KQkq - 0 4',1,'2016-03-27 14:57:17','{\"from\":\"f2\",\"to\":\"f3\",\"promotion\":\"q\"}'),(8,'xyz123','rnbqk1nr/1pp2ppp/4p3/p2p4/1b2P3/3P1PP1/PPP4P/RNBQKBNR w KQkq - 1 5',1,'2016-03-27 14:57:31','{\"from\":\"f8\",\"to\":\"b4\",\"promotion\":\"q\"}'),(9,'abc123','rnbqk1nr/1pp2ppp/4p3/p2p4/1b2P3/2PP1PP1/PP5P/RNBQKBNR b KQkq - 0 5',1,'2016-03-27 14:57:38','{\"from\":\"c2\",\"to\":\"c3\",\"promotion\":\"q\"}'),(10,'xyz123','rnbqk1nr/1pp2ppp/4p3/p1bp4/4P3/2PP1PP1/PP5P/RNBQKBNR w KQkq - 1 6',1,'2016-03-27 14:57:48','{\"from\":\"b4\",\"to\":\"c5\",\"promotion\":\"q\"}'),(11,'abc123','rnbqk1nr/1pp2ppp/4p3/p1bp4/4P2P/2PP1PP1/PP6/RNBQKBNR b KQkq h3 0 6',1,'2016-03-27 14:58:01','{\"from\":\"h2\",\"to\":\"h4\",\"promotion\":\"q\"}'),(12,'xyz123','1nbqk1nr/1pp2ppp/r3p3/p1bp4/4P2P/2PP1PP1/PP6/RNBQKBNR w KQk - 1 7',1,'2016-03-27 14:58:33','{\"from\":\"a8\",\"to\":\"a6\",\"promotion\":\"q\"}'),(13,'abc123','1nbqk1nr/1pp2ppp/r3p3/p1bp4/Q3P2P/2PP1PP1/PP6/RNB1KBNR b KQk - 2 7',1,'2016-03-27 14:58:38','{\"from\":\"d1\",\"to\":\"a4\",\"promotion\":\"q\"}'),(14,'xyz123','1nbqk1nr/1p3ppp/r1p1p3/p1bp4/Q3P2P/2PP1PP1/PP6/RNB1KBNR w KQk - 0 8',1,'2016-03-27 14:59:03','{\"from\":\"c7\",\"to\":\"c6\",\"promotion\":\"q\"}'),(15,'abc123','1nbqk1nr/1p3ppp/r1p1p3/p1bp2B1/Q3P2P/2PP1PP1/PP6/RN2KBNR b KQk - 1 8',1,'2016-03-27 14:59:23','{\"from\":\"c1\",\"to\":\"g5\",\"promotion\":\"q\"}'),(16,'xyz123','1nb1k1nr/1p3ppp/r1pqp3/p1bp2B1/Q3P2P/2PP1PP1/PP6/RN2KBNR w KQk - 2 9',1,'2016-03-27 14:59:50','{\"from\":\"d8\",\"to\":\"d6\",\"promotion\":\"q\"}'),(17,'abc123','1nb1k1nr/1p3ppp/r1pqp3/p1bp2B1/Q3PP1P/2PP2P1/PP6/RN2KBNR b KQk - 0 9',1,'2016-03-27 15:00:44','{\"from\":\"f3\",\"to\":\"f4\",\"promotion\":\"q\"}'),(18,'xyz123','1nb1k1nr/5ppp/r1pqp3/ppbp2B1/Q3PP1P/2PP2P1/PP6/RN2KBNR w KQk b6 0 10',1,'2016-03-27 15:01:06','{\"from\":\"b7\",\"to\":\"b5\",\"promotion\":\"q\"}'),(19,'abc123','1nb1k1nr/5ppp/r1pqp3/ppbp2B1/4PP1P/1QPP2P1/PP6/RN2KBNR b KQk - 1 10',1,'2016-03-27 15:01:31','{\"from\":\"a4\",\"to\":\"b3\",\"promotion\":\"q\"}'),(20,'xyz123','1nb1k1nr/5ppp/r1pqp3/1pbp2B1/p3PP1P/1QPP2P1/PP6/RN2KBNR w KQk - 0 11',1,'2016-03-27 15:01:42','{\"from\":\"a5\",\"to\":\"a4\",\"promotion\":\"q\"}'),(21,'abc123','1nb1k1nr/5ppp/r1pqp3/1pbp2B1/p3PP1P/2PP2P1/PPQ5/RN2KBNR b KQk - 1 11',1,'2016-03-27 15:01:54','{\"from\":\"b3\",\"to\":\"c2\",\"promotion\":\"q\"}'),(22,'xyz123','2b1k1nr/3n1ppp/r1pqp3/1pbp2B1/p3PP1P/2PP2P1/PPQ5/RN2KBNR w KQk - 2 12',1,'2016-03-27 15:02:39','{\"from\":\"b8\",\"to\":\"d7\",\"promotion\":\"q\"}'),(23,'abc123','2b1k1nr/3n1ppp/r1pqp3/1pbpP1B1/p4P1P/2PP2P1/PPQ5/RN2KBNR b KQk - 0 12',1,'2016-03-27 15:02:46','{\"from\":\"e4\",\"to\":\"e5\",\"promotion\":\"q\"}'),(24,'xyz123','1qb1k1nr/3n1ppp/r1p1p3/1pbpP1B1/p4P1P/2PP2P1/PPQ5/RN2KBNR w KQk - 1 13',1,'2016-03-27 15:03:03','{\"from\":\"d6\",\"to\":\"b8\",\"promotion\":\"q\"}'),(25,'abc123','1qb1k1nr/3n1ppp/r1p1p3/1pbpP1B1/p4P1P/N1PP2P1/PPQ5/R3KBNR b KQk - 2 13',1,'2016-03-27 15:03:21','{\"from\":\"b1\",\"to\":\"a3\",\"promotion\":\"q\"}'),(26,'xyz123','1qb1k1nr/3n1pp1/r1p1p2p/1pbpP1B1/p4P1P/N1PP2P1/PPQ5/R3KBNR w KQk - 0 14',1,'2016-03-27 15:03:46','{\"from\":\"h7\",\"to\":\"h6\",\"promotion\":\"q\"}'),(27,'abc123','1qb1k1nr/3nBpp1/r1p1p2p/1pbpP3/p4P1P/N1PP2P1/PPQ5/R3KBNR b KQk - 1 14',1,'2016-03-27 15:04:50','{\"from\":\"g5\",\"to\":\"e7\",\"promotion\":\"q\"}'),(28,'xyz123','1qb1k1nr/3nbpp1/r1p1p2p/1p1pP3/p4P1P/N1PP2P1/PPQ5/R3KBNR w KQk - 0 15',1,'2016-03-27 15:05:24','{\"from\":\"c5\",\"to\":\"e7\",\"promotion\":\"q\"}'),(29,'abc123','1qb1k1nr/3nbpp1/r1p1p2p/1p1pP3/p1P2P1P/N2P2P1/PPQ5/R3KBNR b KQk - 0 15',1,'2016-03-27 15:05:35','{\"from\":\"c3\",\"to\":\"c4\",\"promotion\":\"q\"}'),(30,'xyz123','1qb1k1nr/3nbpp1/r1p1p2p/3pP3/ppP2P1P/N2P2P1/PPQ5/R3KBNR w KQk - 0 16',1,'2016-03-27 15:06:00','{\"from\":\"b5\",\"to\":\"b4\",\"promotion\":\"q\"}'),(31,'abc123','1qb1k1nr/3nbpp1/r1p1p2p/3pP3/ppP2P1P/3P2P1/PPQ5/RN2KBNR b KQk - 1 16',1,'2016-03-27 15:06:26','{\"from\":\"a3\",\"to\":\"b1\",\"promotion\":\"q\"}'),(32,'xyz123','1qb1k1nr/3nbpp1/r1p1p3/3pP2p/ppP2P1P/3P2P1/PPQ5/RN2KBNR w KQk - 0 17',1,'2016-03-27 15:07:06','{\"from\":\"h6\",\"to\":\"h5\",\"promotion\":\"q\"}'),(33,'abc123','1qb1k1nr/3nbpp1/r1p1p3/3pP2p/ppP2P1P/1P1P2P1/P1Q5/RN2KBNR b KQk - 0 17',1,'2016-03-27 15:07:10','{\"from\":\"b2\",\"to\":\"b3\",\"promotion\":\"q\"}'),(34,'xyz123','1qb1k2r/3nbpp1/r1p1p2n/3pP2p/ppP2P1P/1P1P2P1/P1Q5/RN2KBNR w KQk - 1 18',1,'2016-03-27 15:07:48','{\"from\":\"g8\",\"to\":\"h6\",\"promotion\":\"q\"}'),(35,'abc123','1qb1k2r/3nbpp1/r1p1p2n/3pP2p/PpP2P1P/3P2P1/P1Q5/RN2KBNR b KQk - 0 18',1,'2016-03-27 15:07:58','{\"from\":\"b3\",\"to\":\"a4\",\"promotion\":\"q\"}'),(36,'xyz123','1qb1k2r/4bpp1/rnp1p2n/3pP2p/PpP2P1P/3P2P1/P1Q5/RN2KBNR w KQk - 1 19',1,'2016-03-27 15:08:16','{\"from\":\"d7\",\"to\":\"b6\",\"promotion\":\"q\"}'),(37,'abc123','1qb1k2r/4bpp1/rnp1p2n/3pP2p/PpP2P1P/3P2P1/P1Q1N3/RN2KB1R b KQk - 2 19',1,'2016-03-27 15:08:34','{\"from\":\"g1\",\"to\":\"e2\",\"promotion\":\"q\"}'),(38,'xyz123','1qb1k2r/4bpp1/r1p1p2n/3pP2p/npP2P1P/3P2P1/P1Q1N3/RN2KB1R w KQk - 0 20',1,'2016-03-27 15:08:49','{\"from\":\"b6\",\"to\":\"a4\",\"promotion\":\"q\"}'),(39,'abc123','1qb1k2r/4bpp1/r1p1p2n/3pP2p/npP2P1P/3P2PB/P1Q1N3/RN2K2R b KQk - 1 20',1,'2016-03-27 15:09:37','{\"from\":\"f1\",\"to\":\"h3\",\"promotion\":\"q\"}'),(40,'xyz123','1qb1k2r/4bpp1/r1p1p2n/4P2p/npPp1P1P/3P2PB/P1Q1N3/RN2K2R w KQk - 0 21',1,'2016-03-27 15:10:18','{\"from\":\"d5\",\"to\":\"d4\",\"promotion\":\"q\"}'),(41,'abc123','1qb1k2r/4bpp1/r1p1p2n/4P2p/npPp1P1P/P2P2PB/2Q1N3/RN2K2R b KQk - 0 21',1,'2016-03-27 15:10:23','{\"from\":\"a2\",\"to\":\"a3\",\"promotion\":\"q\"}'),(42,'xyz123','1qb1k2r/4bpp1/r1p1p3/4Pn1p/npPp1P1P/P2P2PB/2Q1N3/RN2K2R w KQk - 1 22',1,'2016-03-27 15:10:55','{\"from\":\"h6\",\"to\":\"f5\",\"promotion\":\"q\"}'),(43,'abc123','1qb1k2r/4bpp1/r1p1p3/4Pn1p/nPPp1P1P/3P2PB/2Q1N3/RN2K2R b KQk - 0 22',1,'2016-03-27 15:11:03','{\"from\":\"a3\",\"to\":\"b4\",\"promotion\":\"q\"}'),(44,'xyz123','1qb1k2r/4bpp1/r1p1p3/4P2p/nPPp1P1P/3Pn1PB/2Q1N3/RN2K2R w KQk - 1 23',1,'2016-03-27 15:11:19','{\"from\":\"f5\",\"to\":\"e3\",\"promotion\":\"q\"}'),(45,'abc123','1qb1k2r/4bpp1/r1p1p3/4P2p/nPPp1P1P/1Q1Pn1PB/4N3/RN2K2R b KQk - 2 23',1,'2016-03-27 15:11:36','{\"from\":\"c2\",\"to\":\"b3\",\"promotion\":\"q\"}'),(46,'xyz123','1qb1k2r/4bpp1/r3p3/2p1P2p/nPPp1P1P/1Q1Pn1PB/4N3/RN2K2R w KQk - 0 24',1,'2016-03-27 15:12:12','{\"from\":\"c6\",\"to\":\"c5\",\"promotion\":\"q\"}'),(47,'abc123','1qb1k2r/4bpp1/r3p3/2p1P2p/nPPp1P1P/1QNPn1PB/8/RN2K2R b KQk - 1 24',1,'2016-03-27 15:13:11','{\"from\":\"e2\",\"to\":\"c3\",\"promotion\":\"q\"}'),(48,'xyz123','1qb1k2r/4bpp1/1r2p3/2p1P2p/nPPp1P1P/1QNPn1PB/8/RN2K2R w KQk - 2 25',1,'2016-03-27 15:13:36','{\"from\":\"a6\",\"to\":\"b6\",\"promotion\":\"q\"}'),(49,'abc123','1qb1k2r/4bpp1/1r2p3/2p1P2p/NPPp1P1P/1Q1Pn1PB/8/RN2K2R b KQk - 0 25',1,'2016-03-27 15:13:50','{\"from\":\"c3\",\"to\":\"a4\",\"promotion\":\"q\"}'),(50,'xyz123','1qb1k2r/4bpp1/4p3/2p1P2p/NrPp1P1P/1Q1Pn1PB/8/RN2K2R w KQk - 0 26',1,'2016-03-27 15:14:11','{\"from\":\"b6\",\"to\":\"b4\",\"promotion\":\"q\"}'),(51,'abc123','1qb1k2r/4bpp1/4p3/2p1P2p/NrPp1P1P/Q2Pn1PB/8/RN2K2R b KQk - 1 26',1,'2016-03-27 15:14:30','{\"from\":\"b3\",\"to\":\"a3\",\"promotion\":\"q\"}'),(52,'xyz123','1q2k2r/3bbpp1/4p3/2p1P2p/NrPp1P1P/Q2Pn1PB/8/RN2K2R w KQk - 2 27',1,'2016-03-27 15:15:18','{\"from\":\"c8\",\"to\":\"d7\",\"promotion\":\"q\"}'),(53,'abc123','1q2k2r/3bbpp1/4p3/2N1P2p/1rPp1P1P/Q2Pn1PB/8/RN2K2R b KQk - 0 27',1,'2016-03-27 15:15:44','{\"from\":\"a4\",\"to\":\"c5\",\"promotion\":\"q\"}'),(54,'xyz123','1q2k1r1/3bbpp1/4p3/2N1P2p/1rPp1P1P/Q2Pn1PB/8/RN2K2R w KQ - 1 28',1,'2016-03-27 15:16:56','{\"from\":\"h8\",\"to\":\"g8\",\"promotion\":\"q\"}'),(55,'abc123','1q2k1r1/3bbpp1/4p3/2N1PP1p/1rPp3P/Q2Pn1PB/8/RN2K2R b KQ - 0 28',1,'2016-03-27 15:17:35','{\"from\":\"f4\",\"to\":\"f5\",\"promotion\":\"q\"}'),(56,'xyz123','1q2k1r1/3bbpp1/4p3/2N1Pn1p/1rPp3P/Q2P2PB/8/RN2K2R w KQ - 0 29',1,'2016-03-27 15:18:35','{\"from\":\"e3\",\"to\":\"f5\",\"promotion\":\"q\"}'),(57,'abc123','1q2k1r1/3bbpp1/4p3/2N1Pn1p/1rPp3P/Q2P2PB/8/RN2KR2 b Q - 1 29',1,'2016-03-27 15:18:47','{\"from\":\"h1\",\"to\":\"f1\",\"promotion\":\"q\"}'),(58,'xyz123','1q2k2r/3bbpp1/4p3/2N1Pn1p/1rPp3P/Q2P2PB/8/RN2KR2 w Q - 2 30',1,'2016-03-27 15:19:51','{\"from\":\"g8\",\"to\":\"h8\",\"promotion\":\"q\"}'),(59,'abc123','1q2k2r/3bbpp1/4p3/2N1Pn1p/1rPp1R1P/Q2P2PB/8/RN2K3 b Q - 3 30',1,'2016-03-27 15:20:15','{\"from\":\"f1\",\"to\":\"f4\",\"promotion\":\"q\"}'),(60,'xyz123','1q2k2r/4bpp1/2b1p3/2N1Pn1p/1rPp1R1P/Q2P2PB/8/RN2K3 w Q - 4 31',1,'2016-03-27 15:21:12','{\"from\":\"d7\",\"to\":\"c6\",\"promotion\":\"q\"}'),(61,'abc123','1q2k2r/4bpp1/2b1p3/2N1Pn1p/1rPp1RPP/Q2P3B/8/RN2K3 b Q - 0 31',1,'2016-03-27 15:21:34','{\"from\":\"g3\",\"to\":\"g4\",\"promotion\":\"q\"}'),(62,'xyz123','1q2k2r/5pp1/2b1p3/2b1Pn1p/1rPp1RPP/Q2P3B/8/RN2K3 w Q - 0 32',1,'2016-03-27 15:23:01','{\"from\":\"e7\",\"to\":\"c5\",\"promotion\":\"q\"}'),(63,'abc123','1q2k2r/5pp1/2b1p3/2b1PP1p/1rPp1R1P/Q2P3B/8/RN2K3 b Q - 0 32',1,'2016-03-27 15:23:36','{\"from\":\"g4\",\"to\":\"f5\",\"promotion\":\"q\"}'),(64,'xyz123','1q2k2r/5pp1/2b1p3/2b1PP1p/2Pp1R1P/Q2P3B/8/Rr2K3 w Q - 0 33',1,'2016-03-27 15:24:08','{\"from\":\"b4\",\"to\":\"b1\",\"promotion\":\"q\"}'),(65,'abc123','1q2k2r/5pp1/2b1p3/2b1PP1p/2Pp1R1P/Q2P3B/3K4/Rr6 b - - 1 33',1,'2016-03-27 15:26:08','{\"from\":\"e1\",\"to\":\"d2\",\"promotion\":\"q\"}'),(66,'xyz123','1q2k2r/5pp1/2b1p3/2b1PP1p/2Pp1R1P/Q2P3B/3K4/r7 w - - 0 34',1,'2016-03-27 15:26:45','{\"from\":\"b1\",\"to\":\"a1\",\"promotion\":\"q\"}'),(67,'abc123','1q2k2r/5pp1/2b1p3/2b1PP1p/2Pp1R1P/3P3B/3K4/Q7 b - - 0 34',1,'2016-03-27 15:26:59','{\"from\":\"a3\",\"to\":\"a1\",\"promotion\":\"q\"}'),(68,'xyz123','4k2r/q4pp1/2b1p3/2b1PP1p/2Pp1R1P/3P3B/3K4/Q7 w - - 1 35',1,'2016-03-27 15:28:40','{\"from\":\"b8\",\"to\":\"a7\",\"promotion\":\"q\"}'),(69,'abc123','4k2r/q4pp1/2b1p3/2b1PP1p/2Pp3P/3P3B/3K4/Q4R2 b - - 2 35',1,'2016-03-27 15:28:50','{\"from\":\"f4\",\"to\":\"f1\",\"promotion\":\"q\"}'),(70,'xyz123','4k3/q4pp1/2b1p2r/2b1PP1p/2Pp3P/3P3B/3K4/Q4R2 w - - 3 36',1,'2016-03-27 15:29:29','{\"from\":\"h8\",\"to\":\"h6\",\"promotion\":\"q\"}'),(71,'abc123','4k3/q4pp1/2b1P2r/2b1P2p/2Pp3P/3P3B/3K4/Q4R2 b - - 0 36',1,'2016-03-27 15:30:04','{\"from\":\"f5\",\"to\":\"e6\",\"promotion\":\"q\"}'),(72,'xyz123','4k3/q5p1/2b1p2r/2b1P2p/2Pp3P/3P3B/3K4/Q4R2 w - - 0 37',1,'2016-03-27 15:30:35','{\"from\":\"f7\",\"to\":\"e6\",\"promotion\":\"q\"}'),(73,'abc123','4k3/q5p1/2b1p2r/2b1P2p/2Pp3P/3P3B/3K4/Q5R1 b - - 1 37',1,'2016-03-27 15:31:07','{\"from\":\"f1\",\"to\":\"g1\",\"promotion\":\"q\"}'),(74,'xyz123','4k3/q5p1/2b1p1r1/2b1P2p/2Pp3P/3P3B/3K4/Q5R1 w - - 2 38',1,'2016-03-27 15:31:29','{\"from\":\"h6\",\"to\":\"g6\",\"promotion\":\"q\"}'),(75,'abc123','4k3/q5p1/2b1p1r1/2b1P2p/2Pp3P/3P3B/3K4/Q4R2 b - - 3 38',1,'2016-03-27 15:31:52','{\"from\":\"g1\",\"to\":\"f1\",\"promotion\":\"q\"}'),(76,'xyz123','4k3/q5p1/2b1p3/2b1P2p/2Pp3P/3P3B/3K2r1/Q4R2 w - - 4 39',1,'2016-03-27 15:32:13','{\"from\":\"g6\",\"to\":\"g2\",\"promotion\":\"q\"}'),(77,'abc123','4k3/q5p1/2b1p3/2b1P2p/2Pp3P/3P4/3K2B1/Q4R2 b - - 0 39',1,'2016-03-27 15:33:14','{\"from\":\"h3\",\"to\":\"g2\",\"promotion\":\"q\"}'),(78,'xyz123','4k3/q5p1/2b1p3/4P2p/1bPp3P/3P4/3K2B1/Q4R2 w - - 1 40',1,'2016-03-27 15:34:05','{\"from\":\"c5\",\"to\":\"b4\",\"promotion\":\"q\"}'),(79,'abc123','4k3/q5p1/2b1p3/4P2p/1bPp3P/3P4/4K1B1/Q4R2 b - - 2 40',1,'2016-03-27 15:34:26','{\"from\":\"d2\",\"to\":\"e2\",\"promotion\":\"q\"}'),(80,'xyz123','4k3/6p1/2b1p3/q3P2p/1bPp3P/3P4/4K1B1/Q4R2 w - - 3 41',1,'2016-03-27 15:34:46','{\"from\":\"a7\",\"to\":\"a5\",\"promotion\":\"q\"}'),(81,'abc123','4k3/6p1/2B1p3/q3P2p/1bPp3P/3P4/4K3/Q4R2 b - - 0 41',1,'2016-03-27 15:34:54','{\"from\":\"g2\",\"to\":\"c6\",\"promotion\":\"q\"}'),(82,'xyz123','3k4/6p1/2B1p3/q3P2p/1bPp3P/3P4/4K3/Q4R2 w - - 1 42',1,'2016-03-27 15:35:39','{\"from\":\"e8\",\"to\":\"d8\",\"promotion\":\"q\"}'),(83,'abc123','3k4/6p1/2B1p3/q3P2p/1bPp3P/3P4/4K3/1Q3R2 b - - 2 42',1,'2016-03-27 15:36:06','{\"from\":\"a1\",\"to\":\"b1\",\"promotion\":\"q\"}'),(84,'xyz123','3k4/6p1/2B1p3/4P2p/1bPp3P/q2P4/4K3/1Q3R2 w - - 3 43',1,'2016-03-27 15:36:53','{\"from\":\"a5\",\"to\":\"a3\",\"promotion\":\"q\"}'),(85,'abc123','3k4/6p1/2B1p3/4P2p/1bPp3P/q2P4/4K3/2Q2R2 b - - 4 43',1,'2016-03-27 15:37:36','{\"from\":\"b1\",\"to\":\"c1\",\"promotion\":\"q\"}'),(86,'xyz123','3k4/6p1/2B1p3/4P2p/1bPp3P/3P4/q3K3/2Q2R2 w - - 5 44',1,'2016-03-27 15:38:05','{\"from\":\"a3\",\"to\":\"a2\",\"promotion\":\"q\"}'),(87,'abc123','3k4/6p1/2B1p3/4P2p/1bPp3P/3P1K2/q7/2Q2R2 b - - 6 44',1,'2016-03-27 15:38:21','{\"from\":\"e2\",\"to\":\"f3\",\"promotion\":\"q\"}'),(88,'xyz123','3k4/8/2B1p3/4P1pp/1bPp3P/3P1K2/q7/2Q2R2 w - g6 0 45',1,'2016-03-27 15:39:01','{\"from\":\"g7\",\"to\":\"g5\",\"promotion\":\"q\"}'),(89,'abc123','3k4/8/2B1p3/4P1Pp/1bPp4/3P1K2/q7/2Q2R2 b - - 0 45',1,'2016-03-27 15:39:33','{\"from\":\"h4\",\"to\":\"g5\",\"promotion\":\"q\"}'),(90,'xyz123','3k4/8/2B1p3/4P1P1/1bPp3p/3P1K2/q7/2Q2R2 w - - 0 46',1,'2016-03-27 15:39:41','{\"from\":\"h5\",\"to\":\"h4\",\"promotion\":\"q\"}'),(91,'abc123','3k4/8/2B1p1P1/4P3/1bPp3p/3P1K2/q7/2Q2R2 b - - 0 46',1,'2016-03-27 15:39:51','{\"from\":\"g5\",\"to\":\"g6\",\"promotion\":\"q\"}'),(92,'xyz123','3k4/8/2B1p1P1/4P3/1bPp4/3P1K1p/q7/2Q2R2 w - - 0 47',1,'2016-03-27 15:40:00','{\"from\":\"h4\",\"to\":\"h3\",\"promotion\":\"q\"}'),(93,'abc123','3k4/6P1/2B1p3/4P3/1bPp4/3P1K1p/q7/2Q2R2 b - - 0 47',1,'2016-03-27 15:40:04','{\"from\":\"g6\",\"to\":\"g7\",\"promotion\":\"q\"}'),(94,'xyz123','3k4/6P1/2B1p3/4P3/1bPp4/3P1K1p/6q1/2Q2R2 w - - 1 48',1,'2016-03-27 15:40:37','{\"from\":\"a2\",\"to\":\"g2\",\"promotion\":\"q\"}'),(95,'abc123','3k4/6P1/2B1p3/4P3/1bPp1K2/3P3p/6q1/2Q2R2 b - - 2 48',1,'2016-03-27 15:41:15','{\"from\":\"f3\",\"to\":\"f4\",\"promotion\":\"q\"}'),(96,'xyz123','3k4/6q1/2B1p3/4P3/1bPp1K2/3P3p/8/2Q2R2 w - - 0 49',1,'2016-03-27 15:41:53','{\"from\":\"g2\",\"to\":\"g7\",\"promotion\":\"q\"}'),(97,'abc123','3k4/6q1/2B1p3/4P3/1bPp1K2/3P3p/8/2Q3R1 b - - 1 49',1,'2016-03-27 15:42:15','{\"from\":\"f1\",\"to\":\"g1\",\"promotion\":\"q\"}'),(98,'xyz123','3k4/7q/2B1p3/4P3/1bPp1K2/3P3p/8/2Q3R1 w - - 2 50',1,'2016-03-27 15:43:11','{\"from\":\"g7\",\"to\":\"h7\",\"promotion\":\"q\"}'),(99,'abc123','3k4/7q/2B1p3/4P3/1bPp1K2/3P3p/8/1Q4R1 b - - 3 50',1,'2016-03-27 15:43:47','{\"from\":\"c1\",\"to\":\"b1\",\"promotion\":\"q\"}'),(100,'xyz123','3k4/7q/2B1p3/4P3/1bPp1K2/3P4/7p/1Q4R1 w - - 0 51',1,'2016-03-27 15:44:27','{\"from\":\"h3\",\"to\":\"h2\",\"promotion\":\"q\"}'),(101,'abc123','3k4/7q/2B1p3/4P3/1bPp1K2/3P4/7p/1Q5R b - - 1 51',1,'2016-03-27 15:45:12','{\"from\":\"g1\",\"to\":\"h1\",\"promotion\":\"q\"}'),(102,'xyz123','3k4/8/2B1p3/4P3/1bPp1K1q/3P4/7p/1Q5R w - - 2 52',1,'2016-03-27 15:45:43','{\"from\":\"h7\",\"to\":\"h4\",\"promotion\":\"q\"}'),(103,'abc123','3k4/8/2B1p3/4P3/1bPp3q/3P1K2/7p/1Q5R b - - 3 52',1,'2016-03-27 15:45:54','{\"from\":\"f4\",\"to\":\"f3\",\"promotion\":\"q\"}'),(104,'xyz123','3k4/8/2B1p3/4P3/1bPp4/3P1K1q/7p/1Q5R w - - 4 53',1,'2016-03-27 15:46:35','{\"from\":\"h4\",\"to\":\"h3\",\"promotion\":\"q\"}'),(105,'abc123','3k4/8/2B1p3/4P3/1bPp4/3P3q/4K2p/1Q5R b - - 5 53',1,'2016-03-27 15:46:43','{\"from\":\"f3\",\"to\":\"e2\",\"promotion\":\"q\"}'),(106,'xyz123','3k4/8/2B1p3/4P3/1bPp4/3P4/4K1qp/1Q5R w - - 6 54',1,'2016-03-27 15:47:04','{\"from\":\"h3\",\"to\":\"g2\",\"promotion\":\"q\"}'),(107,'abc123','3k4/8/4p3/4P3/1bPp4/3P4/4K1Bp/1Q5R b - - 0 54',1,'2016-03-27 15:47:24','{\"from\":\"c6\",\"to\":\"g2\",\"promotion\":\"q\"}'),(108,'xyz123','8/3k4/4p3/4P3/1bPp4/3P4/4K1Bp/1Q5R w - - 1 55',1,'2016-03-27 15:48:44','{\"from\":\"d8\",\"to\":\"d7\",\"promotion\":\"q\"}'),(109,'abc123','8/3k4/4p3/4P3/1QPp4/3P4/4K1Bp/7R b - - 0 55',1,'2016-03-27 15:48:58','{\"from\":\"b1\",\"to\":\"b4\",\"promotion\":\"q\"}'),(110,'xyz123','2k5/8/4p3/4P3/1QPp4/3P4/4K1Bp/7R w - - 1 56',1,'2016-03-27 15:49:39','{\"from\":\"d7\",\"to\":\"c8\",\"promotion\":\"q\"}'),(111,'abc123','2k5/8/4p3/4P3/1QPp4/3P4/4K1BR/8 b - - 0 56',1,'2016-03-27 15:49:46','{\"from\":\"h1\",\"to\":\"h2\",\"promotion\":\"q\"}'),(112,'xyz123','8/2k5/4p3/4P3/1QPp4/3P4/4K1BR/8 w - - 1 57',1,'2016-03-27 15:50:53','{\"from\":\"c8\",\"to\":\"c7\",\"promotion\":\"q\"}'),(113,'abc123','8/2k5/4p3/4P3/1QPp3R/3P4/4K1B1/8 b - - 2 57',1,'2016-03-27 15:51:32','{\"from\":\"h2\",\"to\":\"h4\",\"promotion\":\"q\"}'),(114,'xyz123','2k5/8/4p3/4P3/1QPp3R/3P4/4K1B1/8 w - - 3 58',1,'2016-03-27 15:52:31','{\"from\":\"c7\",\"to\":\"c8\",\"promotion\":\"q\"}'),(115,'abc123','2k5/8/4p3/4P3/1QPR4/3P4/4K1B1/8 b - - 0 58',1,'2016-03-27 15:52:43','{\"from\":\"h4\",\"to\":\"d4\",\"promotion\":\"q\"}'),(116,'xyz123','8/2k5/4p3/4P3/1QPR4/3P4/4K1B1/8 w - - 1 59',1,'2016-03-27 15:53:30','{\"from\":\"c8\",\"to\":\"c7\",\"promotion\":\"q\"}'),(117,'abc123','8/2k5/4p3/4P3/1QPR4/3P3B/4K3/8 b - - 2 59',1,'2016-03-27 15:53:34','{\"from\":\"g2\",\"to\":\"h3\",\"promotion\":\"q\"}'),(118,'xyz123','8/8/2k1p3/4P3/1QPR4/3P3B/4K3/8 w - - 3 60',1,'2016-03-27 15:53:57','{\"from\":\"c7\",\"to\":\"c6\",\"promotion\":\"q\"}'),(119,'abc123','8/8/2k1B3/4P3/1QPR4/3P4/4K3/8 b - - 0 60',1,'2016-03-27 15:54:10','{\"from\":\"h3\",\"to\":\"e6\",\"promotion\":\"q\"}'),(120,'xyz123','8/2k5/4B3/4P3/1QPR4/3P4/4K3/8 w - - 1 61',1,'2016-03-27 15:54:23','{\"from\":\"c6\",\"to\":\"c7\",\"promotion\":\"q\"}'),(121,'abc123','8/2k5/4B3/Q3P3/2PR4/3P4/4K3/8 b - - 2 61',1,'2016-03-27 15:54:36','{\"from\":\"b4\",\"to\":\"a5\",\"promotion\":\"q\"}'),(122,'xyz123','1k6/8/4B3/Q3P3/2PR4/3P4/4K3/8 w - - 3 62',1,'2016-03-27 15:54:47','{\"from\":\"c7\",\"to\":\"b8\",\"promotion\":\"q\"}'),(123,'abc123','1k1R4/8/4B3/Q3P3/2P5/3P4/4K3/8 b - - 4 62',1,'2016-03-27 15:54:59','{\"from\":\"d4\",\"to\":\"d8\",\"promotion\":\"q\"}'),(124,'xyz123','3R4/1k6/4B3/Q3P3/2P5/3P4/4K3/8 w - - 5 63',1,'2016-03-27 15:55:30','{\"from\":\"b8\",\"to\":\"b7\",\"promotion\":\"q\"}'),(125,'abc123','3R4/1k6/8/Q2BP3/2P5/3P4/4K3/8 b - - 6 63',1,'2016-03-27 15:55:47','{\"from\":\"e6\",\"to\":\"d5\",\"promotion\":\"q\"}'),(126,'pear','rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1',3,'2016-03-28 18:19:30','{\"from\":\"e2\",\"to\":\"e4\",\"promotion\":\"q\"}'),(127,'orange','rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq e6 0 2',3,'2016-03-28 18:19:56','{\"from\":\"e7\",\"to\":\"e5\",\"promotion\":\"q\"}'),(128,'pear','rnbqkbnr/pppp1ppp/8/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2',3,'2016-03-28 18:20:26','{\"from\":\"g1\",\"to\":\"f3\",\"promotion\":\"q\"}'),(129,'orange','rnbqkbnr/pp1p1ppp/2p5/4p3/4P3/5N2/PPPP1PPP/RNBQKB1R w KQkq - 0 3',3,'2016-03-28 18:20:32','{\"from\":\"c7\",\"to\":\"c6\",\"promotion\":\"q\"}'),(130,'pear','rnbqkbnr/pp1p1ppp/2p5/4p3/4P3/2N2N2/PPPP1PPP/R1BQKB1R b KQkq - 1 3',3,'2016-03-28 18:20:54','{\"from\":\"b1\",\"to\":\"c3\",\"promotion\":\"q\"}'),(131,'orange','rnbqkbnr/pp3ppp/2p5/3pp3/4P3/2N2N2/PPPP1PPP/R1BQKB1R w KQkq d6 0 4',3,'2016-03-28 18:21:06','{\"from\":\"d7\",\"to\":\"d5\",\"promotion\":\"q\"}'),(132,'pear','rnbqkbnr/pp3ppp/2p5/3pN3/4P3/2N5/PPPP1PPP/R1BQKB1R b KQkq - 0 4',3,'2016-03-28 18:21:21','{\"from\":\"f3\",\"to\":\"e5\",\"promotion\":\"q\"}'),(133,'orange','rnbqkbnr/pp4pp/2p2p2/3pN3/4P3/2N5/PPPP1PPP/R1BQKB1R w KQkq - 0 5',3,'2016-03-28 18:21:32','{\"from\":\"f7\",\"to\":\"f6\",\"promotion\":\"q\"}'),(134,'pear','rnbqkbnr/pp4pp/2p2p2/3p4/4P3/2N2N2/PPPP1PPP/R1BQKB1R b KQkq - 1 5',3,'2016-03-28 18:22:00','{\"from\":\"e5\",\"to\":\"f3\",\"promotion\":\"q\"}'),(135,'orange','rnbqkbnr/pp4pp/2p2p2/8/4p3/2N2N2/PPPP1PPP/R1BQKB1R w KQkq - 0 6',3,'2016-03-28 18:22:06','{\"from\":\"d5\",\"to\":\"e4\",\"promotion\":\"q\"}'),(136,'pear','rnbqkbnr/pp4pp/2p2p2/8/4N3/5N2/PPPP1PPP/R1BQKB1R b KQkq - 0 6',3,'2016-03-28 18:22:38','{\"from\":\"c3\",\"to\":\"e4\",\"promotion\":\"q\"}'),(137,'orange','rn1qkbnr/pp4pp/2p2p2/5b2/4N3/5N2/PPPP1PPP/R1BQKB1R w KQkq - 1 7',3,'2016-03-28 18:22:52','{\"from\":\"c8\",\"to\":\"f5\",\"promotion\":\"q\"}'),(138,'pear','rn1qkbnr/pp4pp/2p2p2/5b2/8/2N2N2/PPPP1PPP/R1BQKB1R b KQkq - 2 7',3,'2016-03-28 18:23:19','{\"from\":\"e4\",\"to\":\"c3\",\"promotion\":\"q\"}'),(139,'orange','rn1qkb1r/pp2n1pp/2p2p2/5b2/8/2N2N2/PPPP1PPP/R1BQKB1R w KQkq - 3 8',3,'2016-03-28 18:23:37','{\"from\":\"g8\",\"to\":\"e7\",\"promotion\":\"q\"}'),(140,'pear','rn1qkb1r/pp2n1pp/2p2p2/5b2/7P/2N2N2/PPPP1PP1/R1BQKB1R b KQkq h3 0 8',3,'2016-03-28 18:24:26','{\"from\":\"h2\",\"to\":\"h4\",\"promotion\":\"q\"}'),(141,'orange','rn1qkb1r/pp4pp/2p2p2/3n1b2/7P/2N2N2/PPPP1PP1/R1BQKB1R w KQkq - 1 9',3,'2016-03-28 18:25:02','{\"from\":\"e7\",\"to\":\"d5\",\"promotion\":\"q\"}'),(142,'pear','rn1qkb1r/pp4pp/2p2p2/3N1b2/7P/5N2/PPPP1PP1/R1BQKB1R b KQkq - 0 9',3,'2016-03-28 18:25:58','{\"from\":\"c3\",\"to\":\"d5\",\"promotion\":\"q\"}'),(143,'orange','rn1qkb1r/pp4pp/5p2/3p1b2/7P/5N2/PPPP1PP1/R1BQKB1R w KQkq - 0 10',3,'2016-03-28 18:26:10','{\"from\":\"c6\",\"to\":\"d5\",\"promotion\":\"q\"}'),(144,'pear','rn1qkb1r/pp4pp/5p2/3p1b2/3P3P/5N2/PPP2PP1/R1BQKB1R b KQkq d3 0 10',3,'2016-03-28 18:27:35','{\"from\":\"d2\",\"to\":\"d4\",\"promotion\":\"q\"}'),(145,'orange','rn1qk2r/pp4pp/5p2/3p1b2/1b1P3P/5N2/PPP2PP1/R1BQKB1R w KQkq - 1 11',3,'2016-03-28 18:28:34','{\"from\":\"f8\",\"to\":\"b4\",\"promotion\":\"q\"}'),(146,'pear','rn1qk2r/pp4pp/5p2/3p1b2/1b1P3P/2P2N2/PP3PP1/R1BQKB1R b KQkq - 0 11',3,'2016-03-28 18:28:50','{\"from\":\"c2\",\"to\":\"c3\",\"promotion\":\"q\"}'),(147,'orange','rn1qk2r/pp4pp/5p2/b2p1b2/3P3P/2P2N2/PP3PP1/R1BQKB1R w KQkq - 1 12',3,'2016-03-28 18:28:59','{\"from\":\"b4\",\"to\":\"a5\",\"promotion\":\"q\"}'),(148,'pear','rn1qk2r/pp4pp/5p2/b2p1b2/3P1B1P/2P2N2/PP3PP1/R2QKB1R b KQkq - 2 12',3,'2016-03-28 18:29:47','{\"from\":\"c1\",\"to\":\"f4\",\"promotion\":\"q\"}'),(149,'orange','rn1qk2r/pp5p/5p2/b2p1bp1/3P1B1P/2P2N2/PP3PP1/R2QKB1R w KQkq g6 0 13',3,'2016-03-28 18:30:10','{\"from\":\"g7\",\"to\":\"g5\",\"promotion\":\"q\"}'),(150,'pear','rn1qk2r/pp5p/5p2/b2p1bP1/3P1B2/2P2N2/PP3PP1/R2QKB1R b KQkq - 0 13',3,'2016-03-28 18:30:31','{\"from\":\"h4\",\"to\":\"g5\",\"promotion\":\"q\"}'),(151,'orange','rn1qk2r/pp5p/8/b2p1bp1/3P1B2/2P2N2/PP3PP1/R2QKB1R w KQkq - 0 14',3,'2016-03-28 18:30:50','{\"from\":\"f6\",\"to\":\"g5\",\"promotion\":\"q\"}'),(152,'pear','rn1qk2r/pp5p/8/b2p1bN1/3P1B2/2P5/PP3PP1/R2QKB1R b KQkq - 0 14',3,'2016-03-28 18:31:42','{\"from\":\"f3\",\"to\":\"g5\",\"promotion\":\"q\"}'),(153,'orange','rn1qk1r1/pp5p/8/b2p1bN1/3P1B2/2P5/PP3PP1/R2QKB1R w KQq - 1 15',3,'2016-03-28 18:31:48','{\"from\":\"h8\",\"to\":\"g8\",\"promotion\":\"q\"}'),(154,'pear','rn1qk1r1/pp5N/8/b2p1b2/3P1B2/2P5/PP3PP1/R2QKB1R b KQq - 0 15',3,'2016-03-28 18:32:32','{\"from\":\"g5\",\"to\":\"h7\",\"promotion\":\"q\"}'),(155,'orange','rn1qk3/pp5N/8/b2p1b2/3P1Br1/2P5/PP3PP1/R2QKB1R w KQq - 1 16',3,'2016-03-28 18:32:38','{\"from\":\"g8\",\"to\":\"g4\",\"promotion\":\"q\"}'),(156,'pear','rB1qk3/pp5N/8/b2p1b2/3P2r1/2P5/PP3PP1/R2QKB1R b KQq - 0 16',3,'2016-03-28 18:33:41','{\"from\":\"f4\",\"to\":\"b8\",\"promotion\":\"q\"}'),(157,'orange','1r1qk3/pp5N/8/b2p1b2/3P2r1/2P5/PP3PP1/R2QKB1R w KQ - 0 17',3,'2016-03-28 18:34:00','{\"from\":\"a8\",\"to\":\"b8\",\"promotion\":\"q\"}'),(158,'pear','1r1qk3/pp5N/8/b2p1b2/3P2r1/2P2P2/PP4P1/R2QKB1R b KQ - 0 17',3,'2016-03-28 18:34:49','{\"from\":\"f2\",\"to\":\"f3\",\"promotion\":\"q\"}'),(159,'orange','1r1qk3/pp5N/8/b2p1b2/3Pr3/2P2P2/PP4P1/R2QKB1R w KQ - 1 18',3,'2016-03-28 18:35:07','{\"from\":\"g4\",\"to\":\"e4\",\"promotion\":\"q\"}'),(160,'pear','1r1qk3/pp5N/8/b2p1b2/3PP3/2P5/PP4P1/R2QKB1R b KQ - 0 18',3,'2016-03-28 18:35:20','{\"from\":\"f3\",\"to\":\"e4\",\"promotion\":\"q\"}'),(161,'orange','1r1qk3/pp5N/8/b4b2/3Pp3/2P5/PP4P1/R2QKB1R w KQ - 0 19',3,'2016-03-28 18:35:41','{\"from\":\"d5\",\"to\":\"e4\",\"promotion\":\"q\"}'),(162,'pear','1r1qk3/pp5N/8/b4b1R/3Pp3/2P5/PP4P1/R2QKB2 b Q - 1 19',3,'2016-03-28 18:36:16','{\"from\":\"h1\",\"to\":\"h5\",\"promotion\":\"q\"}'),(163,'orange','1r1qk3/pp5N/6b1/b6R/3Pp3/2P5/PP4P1/R2QKB2 w Q - 2 20',3,'2016-03-28 18:37:18','{\"from\":\"f5\",\"to\":\"g6\",\"promotion\":\"q\"}'),(164,'pear','1r1qk3/pp5N/6b1/R7/3Pp3/2P5/PP4P1/R2QKB2 b Q - 0 20',3,'2016-03-28 18:38:13','{\"from\":\"h5\",\"to\":\"a5\",\"promotion\":\"q\"}'),(165,'orange','1r1qk3/pp5b/8/R7/3Pp3/2P5/PP4P1/R2QKB2 w Q - 0 21',3,'2016-03-28 18:38:44','{\"from\":\"g6\",\"to\":\"h7\",\"promotion\":\"q\"}'),(166,'pear','1r1qk3/Rp5b/8/8/3Pp3/2P5/PP4P1/R2QKB2 b Q - 0 21',3,'2016-03-28 18:38:53','{\"from\":\"a5\",\"to\":\"a7\",\"promotion\":\"q\"}'),(167,'orange','1r2k3/Rp5b/1q6/8/3Pp3/2P5/PP4P1/R2QKB2 w Q - 1 22',3,'2016-03-28 18:39:17','{\"from\":\"d8\",\"to\":\"b6\",\"promotion\":\"q\"}'),(168,'pear','1r2k3/1p5b/1q6/8/3Pp3/R1P5/PP4P1/R2QKB2 b Q - 2 22',3,'2016-03-28 18:40:12','{\"from\":\"a7\",\"to\":\"a3\",\"promotion\":\"q\"}'),(169,'orange','1r2k3/1p5b/8/8/3Pp3/R1P5/Pq4P1/R2QKB2 w Q - 0 23',3,'2016-03-28 18:40:19','{\"from\":\"b6\",\"to\":\"b2\",\"promotion\":\"q\"}'),(170,'pear','1r2k3/1p5b/8/3P4/4p3/R1P5/Pq4P1/R2QKB2 b Q - 0 23',3,'2016-03-28 18:40:50','{\"from\":\"d4\",\"to\":\"d5\",\"promotion\":\"q\"}'),(171,'orange','1r2k3/1p5b/8/3P4/4p3/q1P5/P5P1/R2QKB2 w Q - 0 24',3,'2016-03-28 18:41:02','{\"from\":\"b2\",\"to\":\"a3\",\"promotion\":\"q\"}'),(172,'pear','1r2k3/1p5b/8/3P4/4p3/q1P5/P5P1/RQ2KB2 b Q - 1 24',3,'2016-03-28 18:42:07','{\"from\":\"d1\",\"to\":\"b1\",\"promotion\":\"q\"}'),(173,'orange','1r2k3/1p5b/8/3P4/4p3/2q5/P5P1/RQ2KB2 w Q - 0 25',3,'2016-03-28 18:42:34','{\"from\":\"a3\",\"to\":\"c3\",\"promotion\":\"q\"}'),(174,'pear','1r2k3/1p5b/8/3P4/4p3/2q5/P3K1P1/RQ3B2 b - - 1 25',3,'2016-03-28 18:43:16','{\"from\":\"e1\",\"to\":\"e2\",\"promotion\":\"q\"}'),(175,'orange','1r2k3/1p5b/8/3P4/2q1p3/8/P3K1P1/RQ3B2 w - - 2 26',3,'2016-03-28 18:43:34','{\"from\":\"c3\",\"to\":\"c4\",\"promotion\":\"q\"}'),(176,'pear','1r2k3/1p5b/8/3P4/2q1p3/3Q4/P3K1P1/R4B2 b - - 3 26',3,'2016-03-28 18:43:58','{\"from\":\"b1\",\"to\":\"d3\",\"promotion\":\"q\"}'),(177,'orange','1r2k3/1p5b/8/3P4/2q5/3p4/P3K1P1/R4B2 w - - 0 27',3,'2016-03-28 18:44:35','{\"from\":\"e4\",\"to\":\"d3\",\"promotion\":\"q\"}'),(178,'pear','1r2k3/1p5b/8/3P4/2q5/3p4/P4KP1/R4B2 b - - 1 27',3,'2016-03-28 18:44:48','{\"from\":\"e2\",\"to\":\"f2\",\"promotion\":\"q\"}'),(179,'orange','1r2k3/1p5b/8/3q4/8/3p4/P4KP1/R4B2 w - - 0 28',3,'2016-03-28 18:45:06','{\"from\":\"c4\",\"to\":\"d5\",\"promotion\":\"q\"}'),(180,'pear','1r2k3/1p5b/8/3q4/8/3B4/P4KP1/R7 b - - 0 28',3,'2016-03-28 18:46:01','{\"from\":\"f1\",\"to\":\"d3\",\"promotion\":\"q\"}'),(181,'orange','1r2k3/1p5b/8/8/8/3q4/P4KP1/R7 w - - 0 29',3,'2016-03-28 18:46:32','{\"from\":\"d5\",\"to\":\"d3\",\"promotion\":\"q\"}'),(182,'pear','1r2k3/1p5b/8/8/8/3q4/P5P1/R5K1 b - - 1 29',3,'2016-03-28 18:46:55','{\"from\":\"f2\",\"to\":\"g1\",\"promotion\":\"q\"}'),(183,'orange','1r2k3/1p5b/8/8/8/2q5/P5P1/R5K1 w - - 2 30',3,'2016-03-28 18:47:15','{\"from\":\"d3\",\"to\":\"c3\",\"promotion\":\"q\"}'),(184,'pear','1r2k3/1p5b/8/8/8/2q5/P5P1/5RK1 b - - 3 30',3,'2016-03-28 18:47:24','{\"from\":\"a1\",\"to\":\"f1\",\"promotion\":\"q\"}'),(185,'orange','1r2k3/1p6/8/8/8/2qb4/P5P1/5RK1 w - - 4 31',3,'2016-03-28 18:47:53','{\"from\":\"h7\",\"to\":\"d3\",\"promotion\":\"q\"}'),(186,'pear','1r2k3/1p6/8/8/8/2qb1R2/P5P1/6K1 b - - 5 31',3,'2016-03-28 18:48:12','{\"from\":\"f1\",\"to\":\"f3\",\"promotion\":\"q\"}'),(187,'orange','1r2k3/1p6/8/8/8/3b1R2/P5P1/2q3K1 w - - 6 32',3,'2016-03-28 18:48:45','{\"from\":\"c3\",\"to\":\"c1\",\"promotion\":\"q\"}'),(188,'pear','1r2k3/1p6/8/8/8/3b4/P5P1/2q2RK1 b - - 7 32',3,'2016-03-28 18:49:11','{\"from\":\"f3\",\"to\":\"f1\",\"promotion\":\"q\"}'),(189,'orange','1r2k3/1p6/8/8/8/8/P5P1/2q2bK1 w - - 0 33',3,'2016-03-28 18:49:31','{\"from\":\"d3\",\"to\":\"f1\",\"promotion\":\"q\"}'),(190,'pear','1r2k3/1p6/8/8/8/8/P5PK/2q2b2 b - - 1 33',3,'2016-03-28 18:49:47','{\"from\":\"g1\",\"to\":\"h2\",\"promotion\":\"q\"}'),(191,'orange','1r2k3/8/8/1p6/8/8/P5PK/2q2b2 w - b6 0 34',3,'2016-03-28 18:49:53','{\"from\":\"b7\",\"to\":\"b5\",\"promotion\":\"q\"}'),(192,'pear','1r2k3/8/8/1p6/8/6P1/P6K/2q2b2 b - - 0 34',3,'2016-03-28 18:49:56','{\"from\":\"g2\",\"to\":\"g3\",\"promotion\":\"q\"}'),(193,'orange','4k3/8/1r6/1p6/8/6P1/P6K/2q2b2 w - - 1 35',3,'2016-03-28 18:50:04','{\"from\":\"b8\",\"to\":\"b6\",\"promotion\":\"q\"}'),(194,'pear','4k3/8/1r6/1p6/6P1/8/P6K/2q2b2 b - - 0 35',3,'2016-03-28 18:50:47','{\"from\":\"g3\",\"to\":\"g4\",\"promotion\":\"q\"}'),(195,'orange','4k3/8/7r/1p6/6P1/8/P6K/2q2b2 w - - 1 36',3,'2016-03-28 18:50:55','{\"from\":\"b6\",\"to\":\"h6\",\"promotion\":\"q\"}'),(196,'pear','4k3/8/7r/1p6/6P1/6K1/P7/2q2b2 b - - 2 36',3,'2016-03-28 18:51:29','{\"from\":\"h2\",\"to\":\"g3\",\"promotion\":\"q\"}'),(197,'orange','4k3/8/7r/1p6/6P1/6K1/P7/4qb2 w - - 3 37',3,'2016-03-28 18:52:10','{\"from\":\"c1\",\"to\":\"e1\",\"promotion\":\"q\"}'),(198,'pear','4k3/8/7r/1p6/6P1/5K2/P7/4qb2 b - - 4 37',3,'2016-03-28 18:52:26','{\"from\":\"g3\",\"to\":\"f3\",\"promotion\":\"q\"}'),(199,'orange','4k3/8/8/1p6/6P1/5K1r/P7/4qb2 w - - 5 38',3,'2016-03-28 18:52:32','{\"from\":\"h6\",\"to\":\"h3\",\"promotion\":\"q\"}'),(200,'pear','4k3/8/8/1p6/5KP1/7r/P7/4qb2 b - - 6 38',3,'2016-03-28 18:53:27','{\"from\":\"f3\",\"to\":\"f4\",\"promotion\":\"q\"}'),(201,'orange','4k3/8/8/1p6/5KP1/7r/P7/2q2b2 w - - 7 39',3,'2016-03-28 18:53:46','{\"from\":\"e1\",\"to\":\"c1\",\"promotion\":\"q\"}'),(202,'pear','4k3/8/8/1p6/4K1P1/7r/P7/2q2b2 b - - 8 39',3,'2016-03-28 18:54:28','{\"from\":\"f4\",\"to\":\"e4\",\"promotion\":\"q\"}'),(203,'orange','4k3/8/8/1p6/4K1P1/7r/P5b1/2q5 w - - 9 40',3,'2016-03-28 18:54:34','{\"from\":\"f1\",\"to\":\"g2\",\"promotion\":\"q\"}'),(204,'pear','4k3/8/8/1p2K3/6P1/7r/P5b1/2q5 b - - 10 40',3,'2016-03-28 18:54:49','{\"from\":\"e4\",\"to\":\"e5\",\"promotion\":\"q\"}'),(205,'orange','4k3/8/8/1p2K3/6P1/7r/P5b1/4q3 w - - 11 41',3,'2016-03-28 18:55:37','{\"from\":\"c1\",\"to\":\"e1\",\"promotion\":\"q\"}'),(206,'pear','4k3/8/8/1p6/3K2P1/7r/P5b1/4q3 b - - 12 41',3,'2016-03-28 18:55:43','{\"from\":\"e5\",\"to\":\"d4\",\"promotion\":\"q\"}'),(207,'orange','4k3/8/8/1p6/3K2Pr/8/P5b1/4q3 w - - 13 42',3,'2016-03-28 18:56:25','{\"from\":\"h3\",\"to\":\"h4\",\"promotion\":\"q\"}'),(208,'pear','4k3/8/8/1p6/6Pr/3K4/P5b1/4q3 b - - 14 42',3,'2016-03-28 18:57:02','{\"from\":\"d4\",\"to\":\"d3\",\"promotion\":\"q\"}'),(209,'orange','4k3/8/8/1p6/6r1/3K4/P5b1/4q3 w - - 0 43',3,'2016-03-28 18:57:07','{\"from\":\"h4\",\"to\":\"g4\",\"promotion\":\"q\"}'),(210,'pear','4k3/8/8/1p6/P5r1/3K4/6b1/4q3 b - a3 0 43',3,'2016-03-28 18:57:12','{\"from\":\"a2\",\"to\":\"a4\",\"promotion\":\"q\"}'),(211,'orange','4k3/8/8/1p6/r7/3K4/6b1/4q3 w - - 0 44',3,'2016-03-28 18:57:50','{\"from\":\"g4\",\"to\":\"a4\",\"promotion\":\"q\"}'),(212,'pear','4k3/8/8/1p6/r7/8/2K3b1/4q3 b - - 1 44',3,'2016-03-28 18:58:47','{\"from\":\"d3\",\"to\":\"c2\",\"promotion\":\"q\"}'),(213,'orange','4k3/8/8/1p6/r3b3/8/2K5/4q3 w - - 2 45',3,'2016-03-28 18:59:21','{\"from\":\"g2\",\"to\":\"e4\",\"promotion\":\"q\"}'),(214,'pear','4k3/8/8/1p6/r3b3/8/1K6/4q3 b - - 3 45',3,'2016-03-28 18:59:41','{\"from\":\"c2\",\"to\":\"b2\",\"promotion\":\"q\"}'),(215,'orange','4k3/8/8/1p6/r3b3/8/1K1q4/8 w - - 4 46',3,'2016-03-28 19:00:25','{\"from\":\"e1\",\"to\":\"d2\",\"promotion\":\"q\"}'),(216,'pear','4k3/8/8/1p6/r3b3/1K6/3q4/8 b - - 5 46',3,'2016-03-28 19:00:33','{\"from\":\"b2\",\"to\":\"b3\",\"promotion\":\"q\"}'),(217,'orange','4k3/8/8/1p6/r7/1K6/2bq4/8 w - - 6 47',3,'2016-03-28 19:01:21','{\"from\":\"e4\",\"to\":\"c2\",\"promotion\":\"q\"}'),(218,'pear','4k3/8/8/1p6/r7/8/1Kbq4/8 b - - 7 47',3,'2016-03-28 19:01:35','{\"from\":\"b3\",\"to\":\"b2\",\"promotion\":\"q\"}'),(219,'orange','4k3/8/8/1p6/1r6/8/1Kbq4/8 w - - 8 48',3,'2016-03-28 19:02:09','{\"from\":\"a4\",\"to\":\"b4\",\"promotion\":\"q\"}'),(220,'pear','4k3/8/8/1p6/1r6/8/K1bq4/8 b - - 9 48',3,'2016-03-28 19:02:38','{\"from\":\"b2\",\"to\":\"a2\",\"promotion\":\"q\"}'),(221,'orange','4k3/8/8/1p6/1r6/8/K1b5/2q5 w - - 10 49',3,'2016-03-28 19:03:27','{\"from\":\"d2\",\"to\":\"c1\",\"promotion\":\"q\"}');
/*!40000 ALTER TABLE `moves` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-11 11:12:41