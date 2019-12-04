-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: teste
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `campeonato`
--

DROP TABLE IF EXISTS `campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campeonato` (
  `idCampeonato` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `dataInicial` date NOT NULL,
  `dataFinal` date NOT NULL,
  `qntdTimesParticipantes` int(11) NOT NULL,
  `premiacaoTotal` decimal(10,2) DEFAULT NULL,
  `paisFK` int(11) DEFAULT NULL,
  `local` varchar(50) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idCampeonato`),
  KEY `paisFK` (`paisFK`),
  CONSTRAINT `campeonato_ibfk_1` FOREIGN KEY (`paisFK`) REFERENCES `paises` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeonato`
--

LOCK TABLES `campeonato` WRITE;
/*!40000 ALTER TABLE `campeonato` DISABLE KEYS */;
INSERT INTO `campeonato` VALUES (1,'ESL Pro League Season 10 Finals','2019-11-03','2019-11-08',8,500000.00,60,'Odense',NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(2,'BLAST Pro Series Global Final 2019','2019-12-12','2019-12-14',8,500000.00,23,'Riffa',NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57');
/*!40000 ALTER TABLE `campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuicaoPremiacaoCampeonato`
--

DROP TABLE IF EXISTS `distribuicaoPremiacaoCampeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribuicaoPremiacaoCampeonato` (
  `idDistribuicao` int(11) NOT NULL AUTO_INCREMENT,
  `idCampeonatoFK` int(11) NOT NULL,
  `colocacao` int(11) NOT NULL,
  `premiacao` decimal(10,2) NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idDistribuicao`),
  KEY `idCampeonatoFK` (`idCampeonatoFK`),
  CONSTRAINT `distribuicaoPremiacaoCampeonato_ibfk_1` FOREIGN KEY (`idCampeonatoFK`) REFERENCES `campeonato` (`idCampeonato`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuicaoPremiacaoCampeonato`
--

LOCK TABLES `distribuicaoPremiacaoCampeonato` WRITE;
/*!40000 ALTER TABLE `distribuicaoPremiacaoCampeonato` DISABLE KEYS */;
INSERT INTO `distribuicaoPremiacaoCampeonato` VALUES (1,1,1,250000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(2,1,2,125000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(3,1,3,50000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(4,1,4,50000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(5,1,5,10000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(6,1,6,10000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(7,1,7,2500.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(8,1,8,2500.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(9,2,1,250000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(10,2,2,125000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(11,2,3,50000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(12,2,4,50000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(13,2,5,10000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(14,2,6,10000.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(15,2,7,2500.00,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(16,2,8,2500.00,'2019-12-02 01:23:57','2019-12-02 01:23:57');
/*!40000 ALTER TABLE `distribuicaoPremiacaoCampeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe` (
  `idEquipe` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `paisDeOrigemFK` int(11) NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idEquipe`),
  KEY `paisDeOrigemFK` (`paisDeOrigemFK`),
  CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`paisDeOrigemFK`) REFERENCES `paises` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Made in Brazil','mibr',33,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(2,'Astralis','Astralis',60,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(3,'Fnatic','Fnatic',223,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(4,'Evil Geniuses','EG',69,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(5,'Team Liquid','Liquid',69,'2019-12-01 22:18:09','2019-12-01 22:18:09'),(6,'Vitality Esports','Vitality',76,'2019-12-01 22:18:09','2019-12-01 22:18:09'),(7,'Faze Clan','Faze',253,'2019-12-01 22:18:09','2019-12-01 22:18:09'),(8,'Ninjas in Pyjamas','NiP',223,'2019-12-01 22:18:09','2019-12-01 22:18:09'),(9,'Fúria Esports','FURIA',33,'2019-12-01 22:18:09','2019-12-01 22:18:09'),(10,'Natus Vincere','Na\'Vi',201,'2019-12-01 22:18:09','2019-12-01 22:18:09');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipesCampeonato`
--

DROP TABLE IF EXISTS `equipesCampeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipesCampeonato` (
  `idEquipeCampeonato` int(11) NOT NULL AUTO_INCREMENT,
  `idCampeonatoFK` int(11) NOT NULL,
  `idEquipeFK` int(11) NOT NULL,
  `idJogador1FK` int(11) DEFAULT NULL,
  `idJogador2FK` int(11) DEFAULT NULL,
  `idJogador3FK` int(11) DEFAULT NULL,
  `idJogador4FK` int(11) DEFAULT NULL,
  `idJogador5FK` int(11) DEFAULT NULL,
  `colocacao` int(11) DEFAULT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idEquipeCampeonato`),
  KEY `idEquipeFK` (`idEquipeFK`),
  KEY `idJogador1FK` (`idJogador1FK`),
  KEY `idJogador2FK` (`idJogador2FK`),
  KEY `idJogador3FK` (`idJogador3FK`),
  KEY `idJogador4FK` (`idJogador4FK`),
  KEY `idJogador5FK` (`idJogador5FK`),
  KEY `idCampeonatoFK` (`idCampeonatoFK`),
  CONSTRAINT `equipesCampeonato_ibfk_1` FOREIGN KEY (`idEquipeFK`) REFERENCES `equipe` (`idEquipe`),
  CONSTRAINT `equipesCampeonato_ibfk_2` FOREIGN KEY (`idJogador1FK`) REFERENCES `jogador` (`idJogador`),
  CONSTRAINT `equipesCampeonato_ibfk_3` FOREIGN KEY (`idJogador2FK`) REFERENCES `jogador` (`idJogador`),
  CONSTRAINT `equipesCampeonato_ibfk_4` FOREIGN KEY (`idJogador3FK`) REFERENCES `jogador` (`idJogador`),
  CONSTRAINT `equipesCampeonato_ibfk_5` FOREIGN KEY (`idJogador4FK`) REFERENCES `jogador` (`idJogador`),
  CONSTRAINT `equipesCampeonato_ibfk_6` FOREIGN KEY (`idJogador5FK`) REFERENCES `jogador` (`idJogador`),
  CONSTRAINT `equipesCampeonato_ibfk_7` FOREIGN KEY (`idCampeonatoFK`) REFERENCES `campeonato` (`idCampeonato`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipesCampeonato`
--

LOCK TABLES `equipesCampeonato` WRITE;
/*!40000 ALTER TABLE `equipesCampeonato` DISABLE KEYS */;
INSERT INTO `equipesCampeonato` VALUES (1,1,1,1,2,3,4,5,5,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(2,1,2,6,7,8,9,10,2,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(3,1,3,11,12,13,14,15,3,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(4,1,4,16,17,18,19,20,1,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(5,1,5,21,22,23,24,25,4,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(6,1,6,26,27,28,29,30,7,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(7,1,7,31,32,33,34,35,6,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(8,1,8,36,37,38,39,40,8,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(9,2,1,1,2,3,4,5,NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(10,2,2,6,7,8,9,10,NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(11,2,3,11,12,13,14,15,NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(12,2,4,16,17,18,19,20,NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(13,2,5,21,22,23,24,25,NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(14,2,6,26,27,28,29,30,NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(15,2,7,31,32,33,34,35,NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57'),(16,2,8,36,37,38,39,40,NULL,'2019-12-02 01:23:57','2019-12-02 01:23:57');
/*!40000 ALTER TABLE `equipesCampeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicoJogador`
--

DROP TABLE IF EXISTS `historicoJogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historicoJogador` (
  `idHistoricoJogador` int(11) NOT NULL AUTO_INCREMENT,
  `idJogadorFK` int(11) NOT NULL,
  `idEquipeFK` int(11) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date DEFAULT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idHistoricoJogador`),
  KEY `idJogadorFK` (`idJogadorFK`),
  KEY `idEquipeFK` (`idEquipeFK`),
  CONSTRAINT `historicoJogador_ibfk_1` FOREIGN KEY (`idJogadorFK`) REFERENCES `jogador` (`idJogador`),
  CONSTRAINT `historicoJogador_ibfk_2` FOREIGN KEY (`idEquipeFK`) REFERENCES `equipe` (`idEquipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicoJogador`
--

LOCK TABLES `historicoJogador` WRITE;
/*!40000 ALTER TABLE `historicoJogador` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicoJogador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogador`
--

DROP TABLE IF EXISTS `jogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogador` (
  `idJogador` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(100) DEFAULT NULL,
  `apelido` varchar(30) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `paisDeOrigemFK` int(11) DEFAULT NULL,
  `equipeFK` int(11) DEFAULT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idJogador`),
  KEY `paisDeOrigemFK` (`paisDeOrigemFK`),
  KEY `equipeFK` (`equipeFK`),
  CONSTRAINT `jogador_ibfk_1` FOREIGN KEY (`paisDeOrigemFK`) REFERENCES `paises` (`idPais`),
  CONSTRAINT `jogador_ibfk_2` FOREIGN KEY (`equipeFK`) REFERENCES `equipe` (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogador`
--

LOCK TABLES `jogador` WRITE;
/*!40000 ALTER TABLE `jogador` DISABLE KEYS */;
INSERT INTO `jogador` VALUES (1,'Gabriel','Toledo','FalleN','1992-03-20',33,1,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(2,'Vito','Giuseppe','kNgV-','1993-04-30',33,1,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(3,'Fernando','Alvarenga','fer','1991-01-22',33,1,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(4,'Lucas','Teles','LUCAS1','1995-02-02',33,1,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(5,'Epitacio','de Melo','TACO','1995-01-30',33,1,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(6,'Andreas','Højsleth','Xyp9x','1995-01-30',60,2,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(7,'Peter','Rasmussen','dupreeh','1995-01-30',60,2,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(8,'Lukas','Rossander','gla1ve','1995-01-30',60,2,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(9,'Nicolai','Reedtz','device','1995-01-30',60,2,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(10,'Emil','Reif','Magisk','1995-01-30',60,2,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(11,'Robin','Rönnquist','flusha','1995-01-30',223,3,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(12,'Jesper','Wecksell','JW','1995-01-30',223,3,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(13,'Freddy','Johansson','KRIMZ','1995-01-30',223,3,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(14,'Maikil','Selim','Golden','1995-01-30',223,3,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(15,'Ludvig','Brolin','Brollan','1995-01-30',223,3,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(16,'Peter','Jarguz','stanislaw','1995-01-30',42,4,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(17,'Tarik','Celik','tarik','1995-01-30',69,4,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(18,'Vincent','Cayonte','Brehze','1995-01-30',69,4,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(19,'Ethan','Arnold','Ethan','1995-01-30',69,4,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(20,'Tsvetelin','Dimitrov','CeRq','1995-01-30',35,4,'2019-11-30 00:40:30','2019-11-30 00:40:30'),(21,'Nick','Cannella','nitr0','1995-01-30',69,5,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(22,'Keith','Markovic','NAF','1997-01-30',42,5,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(23,'Jonathan','Jablonowski','EliGE','1997-08-28',69,5,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(24,'Jake','Yip','Stewie2K','1998-01-30',69,5,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(25,'Russel','Van Dulken','Twistzz','1999-04-27',42,5,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(26,'Richard','Papillon','shox','1993-01-30',76,6,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(27,'Cédric','Guipouy','RpK','1989-01-30',76,6,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(28,'Dan','Madesclaire','apEX','1993-08-28',76,6,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(29,'Alex','McMeekin','ALEX','1995-01-30',196,6,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(30,'Mathieu','Herbaut','ZywOo','2000-04-27',76,6,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(31,'Olof','Kajbjer','olofmeister','1992-01-30',223,7,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(32,'Nikola','Kovač','NiKo','1998-01-30',31,7,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(33,'Håvard','Nygaard','rain','1994-08-28',178,7,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(34,'Marcelo','David','coldzera','1994-01-30',33,7,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(35,'Helvijs','Saukants','broky','2000-04-27',142,7,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(36,'Patrik','Lindberg','f0rest','1989-01-30',223,8,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(37,'Simon','Eliasson','twist','1995-01-30',223,8,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(38,'Jonas','Olofsson','Lekr0','1993-08-28',223,8,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(39,'Fredrik','Sterner','REZ','1998-01-30',223,8,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(40,'Nicolas','Gonzalez Zamora','Plopski','2000-04-27',223,8,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(41,'Henrique','Teles','HEN1','1995-01-30',33,9,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(42,'Andrei','Piovezan','arT','1996-01-30',33,9,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(43,'Yuri','Santos','yuurih','2000-08-28',33,9,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(44,'Vinicius','Figueiredo','VINI','1999-01-30',33,9,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(45,'Kaike','Cerato','KSCERATO','1999-04-27',33,9,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(46,'Ladislav','Kovács','GuardiaN','1992-01-30',66,10,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(47,'Egor','Vasilyev','flamie','1997-01-30',201,10,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(48,'Aleksandr','Kostyliev','s1mple','1997-08-28',243,10,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(49,'Denis','Sharipov','electronic','1999-01-30',201,10,'2019-12-01 22:52:50','2019-12-01 22:52:50'),(50,'Kirill','Mikhailov','Boombl4','1999-04-27',201,10,'2019-12-01 22:52:50','2019-12-01 22:52:50');
/*!40000 ALTER TABLE `jogador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogadorPartida`
--

DROP TABLE IF EXISTS `jogadorPartida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogadorPartida` (
  `idJogadorPartida` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idPartidaFK` int(11) NOT NULL,
  `idJogadorFK` int(11) DEFAULT NULL,
  `qntdVitimas` int(11) DEFAULT NULL,
  `qntdMortes` int(11) DEFAULT NULL,
  `qntdAssistencias` int(11) DEFAULT NULL,
  `porcentagemHeadshot` int(11) DEFAULT NULL,
  `mediaDanoPorRodada` int(11) DEFAULT NULL,
  `idEquipeFK` int(11) NOT NULL,
  `partidaResultado` tinyint(1) DEFAULT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idJogadorPartida`),
  KEY `idPartidaFK` (`idPartidaFK`),
  KEY `idJogadorFK` (`idJogadorFK`),
  KEY `idEquipeFK` (`idEquipeFK`),
  CONSTRAINT `jogadorPartida_ibfk_1` FOREIGN KEY (`idPartidaFK`) REFERENCES `partidas` (`idPartida`),
  CONSTRAINT `jogadorPartida_ibfk_2` FOREIGN KEY (`idJogadorFK`) REFERENCES `jogador` (`idJogador`),
  CONSTRAINT `jogadorPartida_ibfk_3` FOREIGN KEY (`idEquipeFK`) REFERENCES `equipe` (`idEquipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadorPartida`
--

LOCK TABLES `jogadorPartida` WRITE;
/*!40000 ALTER TABLE `jogadorPartida` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogadorPartida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapas`
--

DROP TABLE IF EXISTS `mapas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapas` (
  `idMapa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idMapa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapas`
--

LOCK TABLES `mapas` WRITE;
/*!40000 ALTER TABLE `mapas` DISABLE KEYS */;
INSERT INTO `mapas` VALUES (1,'Dust2','2019-12-03 23:30:32','2019-12-03 23:30:32'),(2,'Inferno','2019-12-03 23:30:32','2019-12-03 23:30:32'),(3,'Mirage','2019-12-03 23:30:32','2019-12-03 23:30:32'),(4,'Overpass','2019-12-03 23:30:32','2019-12-03 23:30:32'),(5,'Vertigo','2019-12-03 23:30:32','2019-12-03 23:30:32'),(6,'Train','2019-12-03 23:30:32','2019-12-03 23:30:32'),(7,'Nuke','2019-12-03 23:30:32','2019-12-03 23:30:32');
/*!40000 ALTER TABLE `mapas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) NOT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  `sigla` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'AFEGANISTÃO',NULL,NULL),(2,'ACROTÍRI E DECELIA',NULL,NULL),(3,'ÁFRICA DO SUL',NULL,NULL),(4,'ALBÂNIA',NULL,NULL),(5,'ALEMANHA',NULL,NULL),(6,'AMERICAN SAMOA',NULL,NULL),(7,'ANDORRA',NULL,NULL),(8,'ANGOLA',NULL,NULL),(9,'ANGUILLA',NULL,NULL),(10,'ANTÍGUA E BARBUDA',NULL,NULL),(11,'ANTILHAS NEERLANDESAS',NULL,NULL),(12,'ARÁBIA SAUDITA',NULL,NULL),(13,'ARGÉLIA',NULL,NULL),(14,'ARGENTINA',NULL,NULL),(15,'ARMÉNIA',NULL,NULL),(16,'ARUBA',NULL,NULL),(17,'AUSTRÁLIA',NULL,NULL),(18,'ÁUSTRIA',NULL,NULL),(19,'AZERBAIJÃO',NULL,NULL),(20,'BAHAMAS',NULL,NULL),(21,'BANGLADECHE',NULL,NULL),(22,'BARBADOS',NULL,NULL),(23,'BARÉM',NULL,NULL),(24,'BASSAS DA ÍNDIA',NULL,NULL),(25,'BÉLGICA',NULL,NULL),(26,'BELIZE',NULL,NULL),(27,'BENIM',NULL,NULL),(28,'BERMUDAS',NULL,NULL),(29,'BIELORRÚSSIA',NULL,NULL),(30,'BOLÍVIA',NULL,NULL),(31,'BÓSNIA E HERZEGOVINA',NULL,NULL),(32,'BOTSUANA',NULL,NULL),(33,'BRASIL',NULL,NULL),(34,'BRUNEI DARUSSALAM',NULL,NULL),(35,'BULGÁRIA',NULL,NULL),(36,'BURQUINA FASO',NULL,NULL),(37,'BURUNDI',NULL,NULL),(38,'BUTÃO',NULL,NULL),(39,'CABO VERDE',NULL,NULL),(40,'CAMARÕES',NULL,NULL),(41,'CAMBOJA',NULL,NULL),(42,'CANADÁ',NULL,NULL),(43,'CATAR',NULL,NULL),(44,'CAZAQUISTÃO',NULL,NULL),(45,'CENTRO-AFRICANA REPÚBLICA',NULL,NULL),(46,'CHADE',NULL,NULL),(47,'CHILE',NULL,NULL),(48,'CHINA',NULL,NULL),(49,'CHIPRE',NULL,NULL),(50,'COLÔMBIA',NULL,NULL),(51,'COMORES',NULL,NULL),(52,'CONGO',NULL,NULL),(53,'CONGO REPÚBLICA DEMOCRÁTICA',NULL,NULL),(54,'COREIA DO NORTE',NULL,NULL),(55,'COREIA DO SUL',NULL,NULL),(56,'COSTA DO MARFIM',NULL,NULL),(57,'COSTA RICA',NULL,NULL),(58,'CROÁCIA',NULL,NULL),(59,'CUBA',NULL,NULL),(60,'DINAMARCA',NULL,NULL),(61,'DOMÍNICA',NULL,NULL),(62,'EGIPTO',NULL,NULL),(63,'EMIRADOS ÁRABES UNIDOS',NULL,NULL),(64,'EQUADOR',NULL,NULL),(65,'ERITREIA',NULL,NULL),(66,'ESLOVÁQUIA',NULL,NULL),(67,'ESLOVÉNIA',NULL,NULL),(68,'ESPANHA',NULL,NULL),(69,'ESTADOS UNIDOS',NULL,NULL),(70,'ESTÓNIA',NULL,NULL),(71,'ETIÓPIA',NULL,NULL),(72,'FAIXA DE GAZA',NULL,NULL),(73,'FIJI',NULL,NULL),(74,'FILIPINAS',NULL,NULL),(75,'FINLÂNDIA',NULL,NULL),(76,'FRANÇA',NULL,NULL),(77,'GABÃO',NULL,NULL),(78,'GÂMBIA',NULL,NULL),(79,'GANA',NULL,NULL),(80,'GEÓRGIA',NULL,NULL),(81,'GIBRALTAR',NULL,NULL),(82,'GRANADA',NULL,NULL),(83,'GRÉCIA',NULL,NULL),(84,'GRONELÂNDIA',NULL,NULL),(85,'GUADALUPE',NULL,NULL),(86,'GUAM',NULL,NULL),(87,'GUATEMALA',NULL,NULL),(88,'GUERNSEY',NULL,NULL),(89,'GUIANA',NULL,NULL),(90,'GUIANA FRANCESA',NULL,NULL),(91,'GUINÉ',NULL,NULL),(92,'GUINÉ EQUATORIAL',NULL,NULL),(93,'GUINÉ-BISSAU',NULL,NULL),(94,'HAITI',NULL,NULL),(95,'HONDURAS',NULL,NULL),(96,'HONG KONG',NULL,NULL),(97,'HUNGRIA',NULL,NULL),(98,'IÉMEN',NULL,NULL),(99,'ILHA BOUVET',NULL,NULL),(100,'ILHA CHRISTMAS',NULL,NULL),(101,'ILHA DE CLIPPERTON',NULL,NULL),(102,'ILHA DE JOÃO DA NOVA',NULL,NULL),(103,'ILHA DE MAN',NULL,NULL),(104,'ILHA DE NAVASSA',NULL,NULL),(105,'ILHA EUROPA',NULL,NULL),(106,'ILHA NORFOLK',NULL,NULL),(107,'ILHA TROMELIN',NULL,NULL),(108,'ILHAS ASHMORE E CARTIER',NULL,NULL),(109,'ILHAS CAIMAN',NULL,NULL),(110,'ILHAS COCOS (KEELING)',NULL,NULL),(111,'ILHAS COOK',NULL,NULL),(112,'ILHAS DO MAR DE CORAL',NULL,NULL),(113,'ILHAS FALKLANDS (ILHAS MALVINAS)',NULL,NULL),(114,'ILHAS FEROE',NULL,NULL),(115,'ILHAS GEÓRGIA DO SUL E SANDWICH DO SUL',NULL,NULL),(116,'ILHAS MARIANAS DO NORTE',NULL,NULL),(117,'ILHAS MARSHALL',NULL,NULL),(118,'ILHAS PARACEL',NULL,NULL),(119,'ILHAS PITCAIRN',NULL,NULL),(120,'ILHAS SALOMÃO',NULL,NULL),(121,'ILHAS SPRATLY',NULL,NULL),(122,'ILHAS VIRGENS AMERICANAS',NULL,NULL),(123,'ILHAS VIRGENS BRITÂNICAS',NULL,NULL),(124,'ÍNDIA',NULL,NULL),(125,'INDONÉSIA',NULL,NULL),(126,'IRÃO',NULL,NULL),(127,'IRAQUE',NULL,NULL),(128,'IRLANDA',NULL,NULL),(129,'ISLÂNDIA',NULL,NULL),(130,'ISRAEL',NULL,NULL),(131,'ITÁLIA',NULL,NULL),(132,'JAMAICA',NULL,NULL),(133,'JAN MAYEN',NULL,NULL),(134,'JAPÃO',NULL,NULL),(135,'JERSEY',NULL,NULL),(136,'JIBUTI',NULL,NULL),(137,'JORDÂNIA',NULL,NULL),(138,'KIRIBATI',NULL,NULL),(139,'KOWEIT',NULL,NULL),(140,'LAOS',NULL,NULL),(141,'LESOTO',NULL,NULL),(142,'LETÓNIA',NULL,NULL),(143,'LÍBANO',NULL,NULL),(144,'LIBÉRIA',NULL,NULL),(145,'LÍBIA',NULL,NULL),(146,'LISTENSTAINE',NULL,NULL),(147,'LITUÂNIA',NULL,NULL),(148,'LUXEMBURGO',NULL,NULL),(149,'MACAU',NULL,NULL),(150,'MACEDÓNIA',NULL,NULL),(151,'MADAGÁSCAR',NULL,NULL),(152,'MALÁSIA',NULL,NULL),(153,'MALAVI',NULL,NULL),(154,'MALDIVAS',NULL,NULL),(155,'MALI',NULL,NULL),(156,'MALTA',NULL,NULL),(157,'MARROCOS',NULL,NULL),(158,'MARTINICA',NULL,NULL),(159,'MAURÍCIA',NULL,NULL),(160,'MAURITÂNIA',NULL,NULL),(161,'MAYOTTE',NULL,NULL),(162,'MÉXICO',NULL,NULL),(163,'MIANMAR',NULL,NULL),(164,'MICRONÉSIA',NULL,NULL),(165,'MOÇAMBIQUE',NULL,NULL),(166,'MOLDÁVIA',NULL,NULL),(167,'MÓNACO',NULL,NULL),(168,'MONGÓLIA',NULL,NULL),(169,'MONTENEGRO',NULL,NULL),(170,'MONTSERRAT',NULL,NULL),(171,'NAMÍBIA',NULL,NULL),(172,'NAURU',NULL,NULL),(173,'NEPAL',NULL,NULL),(174,'NICARÁGUA',NULL,NULL),(175,'NÍGER',NULL,NULL),(176,'NIGÉRIA',NULL,NULL),(177,'NIUE',NULL,NULL),(178,'NORUEGA',NULL,NULL),(179,'NOVA CALEDÓNIA',NULL,NULL),(180,'NOVA ZELÂNDIA',NULL,NULL),(181,'OMÃ',NULL,NULL),(182,'PAÍSES BAIXOS',NULL,NULL),(183,'PALAU',NULL,NULL),(184,'PALESTINA',NULL,NULL),(185,'PANAMÁ',NULL,NULL),(186,'PAPUÁSIA-NOVA GUINÉ',NULL,NULL),(187,'PAQUISTÃO',NULL,NULL),(188,'PARAGUAI',NULL,NULL),(189,'PERU',NULL,NULL),(190,'POLINÉSIA FRANCESA',NULL,NULL),(191,'POLÓNIA',NULL,NULL),(192,'PORTO RICO',NULL,NULL),(193,'PORTUGAL',NULL,NULL),(194,'QUÉNIA',NULL,NULL),(195,'QUIRGUIZISTÃO',NULL,NULL),(196,'REINO UNIDO',NULL,NULL),(197,'REPÚBLICA CHECA',NULL,NULL),(198,'REPÚBLICA DOMINICANA',NULL,NULL),(199,'ROMÉNIA',NULL,NULL),(200,'RUANDA',NULL,NULL),(201,'RÚSSIA',NULL,NULL),(202,'SAHARA OCCIDENTAL',NULL,NULL),(203,'SALVADOR',NULL,NULL),(204,'SAMOA',NULL,NULL),(205,'SANTA HELENA',NULL,NULL),(206,'SANTA LÚCIA',NULL,NULL),(207,'SANTA SÉ',NULL,NULL),(208,'SÃO CRISTÓVÃO E NEVES',NULL,NULL),(209,'SÃO MARINO',NULL,NULL),(210,'SÃO PEDRO E MIQUELÃO',NULL,NULL),(211,'SÃO TOMÉ E PRÍNCIPE',NULL,NULL),(212,'SÃO VICENTE E GRANADINAS',NULL,NULL),(213,'SEICHELES',NULL,NULL),(214,'SENEGAL',NULL,NULL),(215,'SERRA LEOA',NULL,NULL),(216,'SÉRVIA',NULL,NULL),(217,'SINGAPURA',NULL,NULL),(218,'SÍRIA',NULL,NULL),(219,'SOMÁLIA',NULL,NULL),(220,'SRI LANCA',NULL,NULL),(221,'SUAZILÂNDIA',NULL,NULL),(222,'SUDÃO',NULL,NULL),(223,'SUÉCIA',NULL,NULL),(224,'SUÍÇA',NULL,NULL),(225,'SURINAME',NULL,NULL),(226,'SVALBARD',NULL,NULL),(227,'TAILÂNDIA',NULL,NULL),(228,'TAIWAN',NULL,NULL),(229,'TAJIQUISTÃO',NULL,NULL),(230,'TANZÂNIA',NULL,NULL),(231,'TERRITÓRIO BRITÂNICO DO OCEANO ÍNDICO',NULL,NULL),(232,'TERRITÓRIO DAS ILHAS HEARD E MCDONALD',NULL,NULL),(233,'TIMOR-LESTE',NULL,NULL),(234,'TOGO',NULL,NULL),(235,'TOKELAU',NULL,NULL),(236,'TONGA',NULL,NULL),(237,'TRINDADE E TOBAGO',NULL,NULL),(238,'TUNÍSIA',NULL,NULL),(239,'TURKS E CAICOS',NULL,NULL),(240,'TURQUEMENISTÃO',NULL,NULL),(241,'TURQUIA',NULL,NULL),(242,'TUVALU',NULL,NULL),(243,'UCRÂNIA',NULL,NULL),(244,'UGANDA',NULL,NULL),(245,'URUGUAI',NULL,NULL),(246,'USBEQUISTÃO',NULL,NULL),(247,'VANUATU',NULL,NULL),(248,'VENEZUELA',NULL,NULL),(249,'VIETNAME',NULL,NULL),(250,'WALLIS E FUTUNA',NULL,NULL),(251,'ZÂMBIA',NULL,NULL),(252,'ZIMBABUÉ',NULL,NULL),(253,'EUROPA',NULL,NULL);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partidas` (
  `idPartida` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `categoria` enum('LAN','ONLINE') NOT NULL,
  `idCampeonatoFK` int(11) DEFAULT NULL,
  `idMapaFK` int(11) NOT NULL,
  `idEquipeA` int(11) DEFAULT NULL,
  `idEquipeB` int(11) DEFAULT NULL,
  `melhorDe` enum('1, 2, 3, 5') NOT NULL,
  `numeroPartida` int(11) NOT NULL,
  `prorrogacao` tinyint(1) DEFAULT NULL,
  `partidaEncerrada` tinyint(1) NOT NULL,
  `pontuacaoEquipeA` int(11) DEFAULT NULL,
  `pontuacaoEquipeB` int(11) DEFAULT NULL,
  `idEquipeVitoriaFK` int(11) DEFAULT NULL,
  `idEquipeDerrotaFK` int(11) DEFAULT NULL,
  `idPrimeiraPartidaFK` int(11) DEFAULT NULL,
  `dataCriacao` datetime NOT NULL,
  `dataAlteracao` datetime NOT NULL,
  PRIMARY KEY (`idPartida`),
  KEY `idCampeonatoFK` (`idCampeonatoFK`),
  KEY `idMapaFK` (`idMapaFK`),
  KEY `idEquipeA` (`idEquipeA`),
  KEY `idEquipeB` (`idEquipeB`),
  KEY `idEquipeVitoriaFK` (`idEquipeVitoriaFK`),
  KEY `idEquipeDerrotaFK` (`idEquipeDerrotaFK`),
  KEY `idPrimeiraPartidaFK` (`idPrimeiraPartidaFK`),
  CONSTRAINT `partidas_ibfk_1` FOREIGN KEY (`idCampeonatoFK`) REFERENCES `campeonato` (`idCampeonato`),
  CONSTRAINT `partidas_ibfk_2` FOREIGN KEY (`idMapaFK`) REFERENCES `mapas` (`idMapa`),
  CONSTRAINT `partidas_ibfk_3` FOREIGN KEY (`idEquipeA`) REFERENCES `equipe` (`idEquipe`),
  CONSTRAINT `partidas_ibfk_4` FOREIGN KEY (`idEquipeB`) REFERENCES `equipe` (`idEquipe`),
  CONSTRAINT `partidas_ibfk_5` FOREIGN KEY (`idEquipeVitoriaFK`) REFERENCES `equipe` (`idEquipe`),
  CONSTRAINT `partidas_ibfk_6` FOREIGN KEY (`idEquipeDerrotaFK`) REFERENCES `equipe` (`idEquipe`),
  CONSTRAINT `partidas_ibfk_7` FOREIGN KEY (`idPrimeiraPartidaFK`) REFERENCES `partidas` (`idPartida`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
INSERT INTO `partidas` VALUES (43,'2019-11-20 14:00:00','LAN',1,3,1,2,'1, 2, 3, 5',1,0,1,16,12,1,2,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(44,'2019-11-20 15:00:00','LAN',1,5,3,4,'1, 2, 3, 5',1,0,1,16,10,3,4,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(45,'2019-11-20 16:00:00','LAN',1,1,5,6,'1, 2, 3, 5',1,0,1,16,9,5,6,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(46,'2019-11-20 17:00:00','LAN',1,2,7,8,'1, 2, 3, 5',1,0,1,16,11,7,8,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(47,'2019-11-21 14:00:00','LAN',1,1,1,3,'1, 2, 3, 5',1,0,1,16,10,1,3,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(48,'2019-11-21 15:00:00','LAN',1,7,5,7,'1, 2, 3, 5',1,0,1,16,13,5,7,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(49,'2019-11-22 14:00:00','LAN',1,4,1,5,'1, 2, 3, 5',1,0,1,16,8,1,5,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(50,'2019-12-07 14:00:00','LAN',2,2,1,2,'1, 2, 3, 5',1,NULL,0,NULL,NULL,NULL,NULL,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(51,'2019-12-07 15:00:00','LAN',2,4,3,4,'1, 2, 3, 5',1,NULL,0,NULL,NULL,NULL,NULL,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(52,'2019-12-07 16:00:00','LAN',2,3,5,6,'1, 2, 3, 5',1,NULL,0,NULL,NULL,NULL,NULL,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(53,'2019-12-07 17:00:00','LAN',2,1,7,8,'1, 2, 3, 5',1,NULL,0,NULL,NULL,NULL,NULL,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(54,'2019-12-08 14:00:00','LAN',2,6,1,3,'1, 2, 3, 5',1,NULL,0,NULL,NULL,NULL,NULL,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(55,'2019-12-08 15:00:00','LAN',2,1,5,7,'1, 2, 3, 5',1,NULL,0,NULL,NULL,NULL,NULL,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31'),(56,'2019-12-09 14:00:00','LAN',2,3,1,5,'1, 2, 3, 5',1,NULL,0,NULL,NULL,NULL,NULL,NULL,'2019-12-04 00:09:31','2019-12-04 00:09:31');
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04  1:05:26
