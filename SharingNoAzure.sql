-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sharingvehicle
-- ------------------------------------------------------
-- Server version	5.6.25

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
-- Table structure for table `abastecimento`
--

DROP TABLE IF EXISTS `abastecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abastecimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `combustivel` varchar(45) NOT NULL,
  `Valor` decimal(9,0) NOT NULL,
  `Litros` decimal(9,0) NOT NULL,
  `Carro_ID` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Carro_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abastecimento`
--

LOCK TABLES `abastecimento` WRITE;
/*!40000 ALTER TABLE `abastecimento` DISABLE KEYS */;
INSERT INTO `abastecimento` VALUES (1,'2017-01-11','etanol',4,200,1);
/*!40000 ALTER TABLE `abastecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Dia` date NOT NULL,
  `horario` time(4) NOT NULL,
  `Carro_ID` int(11) NOT NULL DEFAULT '0',
  `Motorista_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`Carro_ID`,`Motorista_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (1,'2017-01-11','13:00:00.0000',1,1);
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carro` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Renavan` int(10) unsigned NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `Placa` varchar(7) NOT NULL,
  `Cor` varchar(45) NOT NULL,
  `Combustivel` varchar(45) NOT NULL,
  `Quilometragem` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (1,1234,'uno','fiat','kstu-12','vermelho','gasolina',60);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deslocamento`
--

DROP TABLE IF EXISTS `deslocamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deslocamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `QuilometragemDeslocada` int(11) NOT NULL,
  `Carro_ID` int(11) NOT NULL,
  `Motorista_ID` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Carro_ID`,`Motorista_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deslocamento`
--

LOCK TABLES `deslocamento` WRITE;
/*!40000 ALTER TABLE `deslocamento` DISABLE KEYS */;
INSERT INTO `deslocamento` VALUES (1,'2017-01-12',100,1,1);
/*!40000 ALTER TABLE `deslocamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gasto`
--

DROP TABLE IF EXISTS `gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipoGasto` varchar(45) NOT NULL,
  `NumeroParcela` int(11) NOT NULL,
  `ValorParcela` decimal(10,0) NOT NULL,
  `Carro_ID` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Carro_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasto`
--

LOCK TABLES `gasto` WRITE;
/*!40000 ALTER TABLE `gasto` DISABLE KEYS */;
INSERT INTO `gasto` VALUES (1,'Motor',1,1,1);
/*!40000 ALTER TABLE `gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Regiao` varchar(45) NOT NULL,
  `Rateio_id` int(11) NOT NULL,
  `Agenda_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Rateio_id`,`Agenda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'MCarros','sul',1,1);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `CNH` int(10) unsigned NOT NULL,
  `CPF` int(10) unsigned NOT NULL,
  `DataNascimento` date NOT NULL,
  `DataVencimentoCNH` date NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista`
--

LOCK TABLES `motorista` WRITE;
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
INSERT INTO `motorista` VALUES (1,'Nayane',123,13445,'1997-08-13','2017-01-20',1),(2,'Pedro Marcus Silva',8597684,2147483647,'0000-00-00','0000-00-00',2);
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista_has_grupo`
--

DROP TABLE IF EXISTS `motorista_has_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista_has_grupo` (
  `Motorista_ID` int(11) NOT NULL,
  `Grupo_id` int(11) NOT NULL,
  `Grupo_Rateio_id` int(11) NOT NULL,
  `Grupo_Agenda_id` int(11) NOT NULL,
  PRIMARY KEY (`Motorista_ID`,`Grupo_id`,`Grupo_Rateio_id`,`Grupo_Agenda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista_has_grupo`
--

LOCK TABLES `motorista_has_grupo` WRITE;
/*!40000 ALTER TABLE `motorista_has_grupo` DISABLE KEYS */;
INSERT INTO `motorista_has_grupo` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `motorista_has_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rateio`
--

DROP TABLE IF EXISTS `rateio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rateio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DataSaida` date NOT NULL,
  `DataRetorno` date NOT NULL,
  `QuilometragemUso` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rateio`
--

LOCK TABLES `rateio` WRITE;
/*!40000 ALTER TABLE `rateio` DISABLE KEYS */;
INSERT INTO `rateio` VALUES (1,'2017-01-13','2017-01-13',60);
/*!40000 ALTER TABLE `rateio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisao`
--

DROP TABLE IF EXISTS `revisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) NOT NULL,
  `NomeOficina` varchar(45) NOT NULL,
  `DataEntrada` date NOT NULL,
  `DataSaida` date NOT NULL,
  `HoraEntrada` time(4) NOT NULL,
  `HoraSaida` time(4) NOT NULL,
  `NomeItem` varchar(45) NOT NULL,
  `Preco` decimal(10,0) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Carro_ID` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Carro_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisao`
--

LOCK TABLES `revisao` WRITE;
/*!40000 ALTER TABLE `revisao` DISABLE KEYS */;
INSERT INTO `revisao` VALUES (1,'Geral','Efraim','2017-01-13','2017-01-14','13:00:00.0000','08:00:00.0000','Farol',10,1,1);
/*!40000 ALTER TABLE `revisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Senha` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Nayane','123'),(2,'PedroMarcus99','12345678'),(3,'Lucas','12345'),(4,'Jhony','123456'),(5,'Daniel','12345');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sharingvehicle'
--

--
-- Dumping routines for database 'sharingvehicle'
--
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarAbastecimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarAbastecimento`(IN _id int, 
IN _Data date, 
IN _combustivel varchar(45), 
IN _Valor decimal(9), 
IN _Litros decimal(9),
IN _Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Data <> "" And _combustivel <> "" And _Valor <> "" And _Litros <> "" And _Carro_ID <> "") THEN
    START TRANSACTION;
   UPDATE abastecimento SET Data=_Data, combustivel=_combustivel, Valor=_Valor, Litros=_Litros WHERE id =_id and Carro_ID=_Carro_ID;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar o abastecimento, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarAgenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarAgenda`(IN _id int, 
IN _Dia date, 
IN _Horario time(4), 
IN _Carro_ID int, 
IN _Motorista_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Dia <> "" And _Horario <> "" And _Carro_ID <> "" And _Motorista_ID <> "") THEN
    START TRANSACTION;
   UPDATE agenda SET Dia=_Dia, Horario=_Horario WHERE id =_id and Carro_ID=_Carro_ID and Motorista_ID = Motorista_ID;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar na agenda, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarCarro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarCarro`(IN _ID int, 
IN _Renavan int, 
IN _Modelo varchar(45), 
IN _Marca varchar(45), 
IN _Placa varchar(7),
IN _Cor varchar(45),
IN _Combustivel varchar(45),
IN _Quilometragem int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_ID <> "" And _Renavan <> "" And _Modelo <> "" And _Placa <> "" And _Cor <> "" And _Combustivel <> "" And _Quilometragem <> "") THEN
    START TRANSACTION;
   UPDATE carro SET Renavan=_Renavan, Modelo =_Modelo, Marca =_Marca, Placa =_Placa, Cor =_Cor, Combustivel =_Combustivel, Quilometragem =_Quilometragem WHERE ID =_ID;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar os dados do carro, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarDeslocamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarDeslocamento`(IN _id int, 
IN _Data date, 
IN _QuilometragemDeslocada int, 
IN _Carro_ID int, 
IN _Motorista_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Data <> "" And _QuilometragemDeslocada <> "" And _Carro_ID <> "" And _Motorista_ID <> "") THEN
    START TRANSACTION;
   UPDATE deslocamento SET Data =_Data, QuilometragemDeslocada =_QuilometragemDeslocada WHERE id =_id and Carro_ID =_Carro_ID and Motorista_ID =_Motorista_ID;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar os dados de deslocamento, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarGasto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarGasto`(IN _id int, 
IN _TipoGasto varchar(45), 
IN _NumeroParcela int, 
IN _ValorParcela decimal, 
IN _Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _TipoGasto <> "" And _NumeroParcela <> "" And _ValorParcela <> "" And _Carro_ID <> "") THEN
    START TRANSACTION;
   UPDATE gasto SET TipoGasto =_TipoGasto, NumeroParcela =_NumeroParcela, ValorParcela =_ValorParcela WHERE id=_id and Carro_ID=_Carro_ID;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar os gastos, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarGrupo`(IN _id int, 
IN _Nome varchar(45), 
IN _Regiao varchar(45), 
IN _Rateio_id int, 
IN _Agenda_id int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Nome <> "" And _Regiao <> "" And _Rateio_id <> "" And _Agenda_id <> "") THEN
    START TRANSACTION;
   UPDATE grupo SET Nome =_Nome, Regiao =_Regiao WHERE id=_id and Rateio_id=_Rateio_id and Agenda_id;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar os grupo, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarMotorista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarMotorista`(IN _ID int, 
IN _Nome varchar(100), 
IN _CNH int, 
IN _CPF int, 
IN _DataNascimento date,
IN _DataVencimentoCNH date,
IN _Usuario_idUsuario int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_ID <> "" And _Nome <> "" And _CNH <> "" And _CPF <> "" And _DataNascimento <> "" And _DataVencimentoCNH <> "" And _Usuario_idUsuario <> "") THEN
    START TRANSACTION;
   UPDATE motorista SET Nome =_Nome, CNH =_CNH, CPF =_CPF, DataNascimento =_DataNascimento, DataVencimentoCNH = _DataVencimentoCNH WHERE ID=_ID and Usuario_idUsuario=_Usuario_idUsuario;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar os dados de motorista, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarMotorista_Has_Grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarMotorista_Has_Grupo`(IN _Motorista_ID int, 
IN _Grupo_id int, 
IN _Grupo_Rateio_id int, 
IN _Grupo_Agenda_id int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_Motorista_ID <> "" And _Grupo_id <> "" And _Grupo_Rateio_id <> "" And _Grupo_Agenda_id <> "") THEN
    START TRANSACTION;
   UPDATE motorista_has_grupo SET Motorista_ID =_Motorista_ID, Grupo_id =_Grupo_id, Grupo_Rateio_id =_Grupo_Rateio_id WHERE Motorista_ID =_Motorista_ID and Grupo_id =_Grupo_id and Grupo_Rateio_id =_Grupo_Rateio_id and Grupo_Agenda_id =_Grupo_Agenda_id;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar os dados, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarRateio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarRateio`(IN _id int, 
IN _DataSaida date, 
IN _DataRetorno date, 
IN _QuilometragemUso int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _DataSaida <> "" And _DataRetorno <> "" And _QuilometragemUso <> "") THEN
    START TRANSACTION;
   UPDATE rateio SET DataSaida =_DataSaida, DataRetorno =_DataRetorno, QuilometragemUso =_QuilometragemUso WHERE id=_id;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar os dados de rateio, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarRevisao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarRevisao`(IN _id int, 
IN _Tipo varchar(45), 
IN _NomeOficina varchar(45), 
IN _DataEntrada date, 
IN _DataSaida date, 
IN _HoraEntrada time(4), 
IN _HoraSaida time(4),
IN _NomeItem varchar(45), 
IN _Preco decimal,
IN _Quantidade int,  
IN _Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Tipo <> "" And _NomeOficina <> "" And _DataEntrada <> "" And _DataSaida <> "" And _HoraEntrada <> "" And _HoraSaida <> "" And _NomeItem <> "" And _Preco <> "" And _Quantidade <> "" And _Carro_ID <> "") THEN
    START TRANSACTION;
   UPDATE revisao SET Tipo =_Tipo, NomeOficina =_NomeOficina, DataEntrada =_DataEntrada, DataSaida =_DataSaida, HoraEntrada =_HoraEntrada, HoraSaida =_HoraSaida, NomeItem=_NomeItem, Preco=_Preco, Quantidade=_Quantidade WHERE id=_id and Carro_ID =_Carro_ID;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar os dados de revisao, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Alteração efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAlterarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAlterarUsuario`(IN _idUsuario int, 
IN _Senha varchar(45))
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_idUsuario <> "" and _Senha <> "") THEN
    START TRANSACTION;
   UPDATE usuario SET Senha =_Senha WHERE idusuario = _idusuario;
    IF excessao = 1
    THEN
      SELECT 'Erro ao atualizar sua senha, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Senha alterada com sucesso!' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Atualize todos os dados necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaAbastecimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaAbastecimento`(IN _id int, 
IN _Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Carro_ID <> "") THEN
    START TRANSACTION;
    Delete from abastecimento WHERE id =_id and Carro_ID=_Carro_ID;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar o abastecimento, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaAgenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaAgenda`(IN _id int, 
IN _Carro_ID int, 
IN _Motorista_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Carro_ID <> "" And _Motorista_ID <> "") THEN
    START TRANSACTION;
    Delete from agenda WHERE id =_id and Carro_ID=_Carro_ID and Motorista_ID = _Motorista_ID;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar na agenda, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaCarro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaCarro`(IN _ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_ID <> "") THEN
    START TRANSACTION;
    Delete from carro WHERE ID =_ID;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os dados do carro, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaDeslocamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaDeslocamento`(IN _id int, 
IN _Carro_ID int, 
IN _Motorista_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Carro_ID <> "" And _Motorista_ID <> "") THEN
    START TRANSACTION;
    Delete from deslocamento WHERE id =_id and Carro_ID=_Carro_ID and Motorista_ID = _Motorista_ID;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os dados de deslocamento, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaGasto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaGasto`(IN _id int, 
IN _Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Carro_ID <> "") THEN
    START TRANSACTION;
    Delete from gasto WHERE id =_id and Carro_ID=_Carro_ID;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os gastos, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaGrupo`(IN _id int, 
IN _Rateio_id int, 
IN _Agenda_id int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Rateio_id <> "" And _Agenda_id <> "") THEN
    START TRANSACTION;
    DELETE FROM grupo WHERE id=_id and Rateio_id=_Rateio_id and Agenda_id=_Agenda_id;
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os dados do grupo, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaMotorista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaMotorista`(IN _ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_ID <> "") THEN
    START TRANSACTION;
    DELETE FROM motorista WHERE ID=_ID;   
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os dados do motorista, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaMotorista_Has_Grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaMotorista_Has_Grupo`(IN _Motorista_ID int, 
IN _Grupo_id int, 
IN _Grupo_Rateio_id int,
IN _Grupo_Agenda_id int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_Motorista_ID <> "" And _Grupo_id <> "" And _Grupo_Rateio_id <> "" And _Grupo_Agenda_id <> "") THEN
    START TRANSACTION;
    Delete from motorista_has_grupo WHERE Motorista_ID =_Motorista_ID and Grupo_id =_Grupo_id and Grupo_Rateio_id = _Grupo_Rateio_id and Grupo_Agenda_id = _Grupo_Agenda_id;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os dados, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaRateio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaRateio`(IN _id int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "") THEN
    START TRANSACTION;
    Delete from rateio WHERE id =_id;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os dados, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaRevisao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaRevisao`(IN _id int, 
IN _Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_id <> "" And _Carro_ID <> "") THEN
    START TRANSACTION;
    Delete from revisao WHERE id =_id and Carro_ID =_Carro_ID;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os dados da revisao, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletaUsuario`(IN _idUsuario int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (_idUsuario <> "") THEN
    START TRANSACTION;
    Delete from usuario WHERE idUsuario =_idUsuario;     
    IF excessao = 1
    THEN 
      SELECT 'Erro ao deletar os dados do usuario, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Exclusao efetuada com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Passe todos os dados de preenchimento necessarios' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereAbastecimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereAbastecimento`(IN Data date, 
IN combustivel varchar(45), 
IN Valor decimal(9), 
IN Litros decimal(9),
IN Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Data <> "" AND combustivel <> "" AND Valor <> "" AND Litros <> "" AND Carro_ID <> "") THEN
    START TRANSACTION;
    INSERT INTO abastecimento VALUES(null, Data, combustivel, Valor, Litros, Carro_ID);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir o abastecimento, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereAgenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereAgenda`(IN Dia date, 
IN Horario time(4), 
IN Carro_ID int(11),
IN Motorista_ID int(11))
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Dia <> "" AND Horario <> "" AND Carro_ID <> "" AND Motorista_ID <> "") THEN
    START TRANSACTION;
    INSERT INTO agenda VALUES(null, Dia, Horario, Carro_ID, Motorista_ID);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir na agenda, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereCarro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereCarro`(IN Renavan int, 
IN Modelo varchar(45), 
IN Marca varchar(45),
IN Placa varchar(7),
IN Cor varchar(45),
IN Combustivel varchar(45),
IN Quilometragem int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Renavan <> "" AND Modelo <> "" AND Marca <> "" AND Placa <> "" AND Cor <> "" AND Combustivel <> "" AND Quilometragem <> "") THEN
    START TRANSACTION;
    INSERT INTO carro VALUES(null, Renavan, Modelo, Marca, Placa, Cor, Combustivel, Quilometragem);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados do carro, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereDeslocamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereDeslocamento`(IN Data Date, 
IN QuilometragemDeslocada int,
IN Carro_ID int,
IN Motorista_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Data <> "" AND QuilometragemDeslocada <> "" AND Carro_ID <> "" AND Motorista_ID <> "") THEN
    START TRANSACTION;
    INSERT INTO deslocamento VALUES(null, Data, QuilometragemDeslocada, Carro_ID, Motorista_ID);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados do deslocamento, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereGasto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereGasto`(IN TipoGasto varchar(45), 
IN NumeroParcela int,
IN ValorParcela decimal,
IN Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (TipoGasto <> "" AND NumeroParcela <> "" AND ValorParcela <> "" AND Carro_ID <> "") THEN
    START TRANSACTION;
    INSERT INTO gasto VALUES(null, TipoGasto, NumeroParcela, ValorParcela, Carro_ID);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados de gasto, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereGrupo`(IN Nome varchar(45), 
IN Regiao Varchar(45),
IN Rateio_id int,
IN Agenda_id int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Nome <> "" AND Regiao <> "" AND Rateio_id <> "" AND Agenda_id <> "") THEN
    START TRANSACTION;
    INSERT INTO grupo VALUES(null, Nome, Regiao, Rateio_id, Agenda_id);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados do grupo, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereMotorista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereMotorista`(IN Nome varchar(100), 
IN CNH int,
IN CPF int,
IN DataNascimento date,
IN DataVencimentoCNH date,
IN Usuario_idUsuario int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Nome <> "" AND CNH <> "" AND CPF <> "" AND DataNascimento <> "" AND DataVencimentoCNH <> "" AND Usuario_idUsuario <> "") THEN
    START TRANSACTION;
    INSERT INTO motorista VALUES(null, Nome, CNH, CPF, DataNascimento, DataVencimentoCNH, Usuario_idUsuario);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados do motorista, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereMotorista_Has_Grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereMotorista_Has_Grupo`(IN Motorista_ID int, 
IN Grupo_id int,
IN Grupo_Rateio_id int,
IN Grupo_Agenda_id int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Motorista_ID <> "" AND Grupo_id <> "" AND Grupo_Rateio_id <> "" AND Grupo_Agenda_id <> "") THEN
    START TRANSACTION;
    INSERT INTO motorista_has_grupo VALUES(Motorista_ID, Grupo_id, Grupo_Rateio_id, Grupo_Agenda_id);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereRateio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereRateio`( 
IN DataSaida date,
IN DataRetorno date,
IN QuilometragemUso int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (DataSaida <> "" AND DataRetorno <> "" AND QuilometragemUso <> "") THEN
    START TRANSACTION;
    INSERT INTO rateio VALUES(null, DataSaida, DataRetorno, QuilometragemUso);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados de rateio, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereRevisao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereRevisao`( 
IN Tipo varchar(45),
IN NomeOficina varchar(45),
IN DataEntrada date,
IN DataSaida date,
IN HoraEntrada time(4),
IN HoraSaida time(4),
IN NomeItem varchar(45),
IN Preco decimal,
IN Quantidade int,
IN Carro_ID int)
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Tipo <> "" AND NomeOficina <> "" AND DataEntrada <> "" AND DataSaida <> "" AND HoraEntrada <> "" AND HoraSaida <> "" AND NomeItem <> "" AND Preco <> "" AND Quantidade <> "" AND Carro_ID <> "") THEN
    START TRANSACTION;
    INSERT INTO revisao VALUES(null, Tipo, NomeOficina, DataEntrada, DataSaida, HoraEntrada, HoraSaida, NomeItem, Preco, Quantidade,Carro_ID);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados de ravisao, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsereUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereUsuario`( 
IN Nome varchar(45),
IN Senha varchar(45))
BEGIN
  DECLARE excessao SMALLINT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
  IF (Nome <> "" AND Senha <> "") THEN
    START TRANSACTION;
    INSERT INTO usuario VALUES(null, Nome, Senha);
	IF excessao = 1
    THEN
         SELECT 'Erro ao inserir os dados de usuario, tente novamente mais tarde!' AS Msg;
      ROLLBACK;
        ELSE
          SELECT 'Cadastro efetuado com sucesso' AS Msg;
          COMMIT;
        END IF;
  ELSE
    SELECT 'Forneça todos os dados para preenchimento necessario' AS Msg;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spLoginEntrarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spLoginEntrarUsuario`(in _Nome varchar(45), in _Senha varchar(45))
BEGIN
	DECLARE excessao SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;
	IF (_Nome <> "" AND _Senha <> "")
	THEN		
		set @idUsuario = (select idUsuario from usuario where Nome = _Nome);
        
		set @Nome = (select Nome from usuario where idUsuario = @idUsuario);
		set @Senha = (select Senha from usuario where idUsuario = @idUsuario LIMIT 1);
		IF (_Nome = @Nome AND _Senha = @Senha)
		THEN
			SELECT 'Acesso Permitido' AS Msg;
		ELSE
			SELECT 'O usuário ou a senha estão incorretos!' AS Msg;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarAbastecimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarAbastecimento`()
BEGIN
      select * from abastecimento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarAgenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarAgenda`()
BEGIN
      select * from agenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarCarro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarCarro`()
BEGIN
      select * from carro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarDeslocamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarDeslocamento`()
BEGIN
      select * from deslocamento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarGasto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarGasto`()
BEGIN
      select * from gasto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarGrupo`()
BEGIN
      select * from grupo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdAbastecimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdAbastecimento`(IN _Carro_ID int)
BEGIN
IF(_Carro_ID IS NULL) THEN
      select * from abastecimento;
ELSE 
      select * from abastecimento where Carro_ID = _Carro_ID;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdAgenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdAgenda`(IN _Carro_ID int, in _Motorista_ID int)
BEGIN
IF(_Carro_ID and _Motorista_ID IS NULL) THEN
      select * from agenda;
ELSE 
      select * from agenda where Carro_ID = _Carro_ID and Motorista_ID = _Motorista_ID;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdCarro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdCarro`(IN _ID int)
BEGIN
IF(_ID IS NULL) THEN
      select * from carro;
ELSE 
      select * from carro where ID = _ID;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdDeslocamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdDeslocamento`(IN _Carro_ID int, IN _Motorista_ID int)
BEGIN
IF(_Carro_ID and _Motorista_ID IS NULL) THEN
      select * from deslocamento;
ELSE 
      select * from deslocamento where Carro_ID = _Carro_ID and Motorista_ID = _Motorista_ID;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdGasto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdGasto`(IN _Carro_ID int)
BEGIN
IF(_Carro_ID IS NULL) THEN
      select * from gasto;
ELSE 
      select * from gasto where Carro_ID = _Carro_ID;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdGrupo`(IN _Rateio_id int, in _Agenda_id int)
BEGIN
IF(_Rateio_id and _Agenda_id IS NULL) THEN
      select * from grupo;
ELSE 
      select * from grupo where Rateio_id = _Rateio_id and Agenda_id = _Agenda_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdMotorista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdMotorista`(IN _ID int,in _Usuario_idUsuario int)
BEGIN
IF(_ID and _Usuario_idUsuario IS NULL) THEN
      select * from motorista;
ELSE 
      select * from motorista where ID = _ID and _Usuario_idUsuario;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdMotorista_Has_Grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdMotorista_Has_Grupo`(IN _Motorista_ID int, in _Grupo_id int, in _Grupo_Rateio_id int, in _Grupo_Agenda_id int)
BEGIN
      select * from motorista_has_grupo where Motorista_ID = _Motorista_ID and Grupo_id = _Grupo_id and Grupo_Rateio_id = _Grupo_Rateio_id and Grupo_Agenda_id = _Grupo_Agenda_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdRateio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdRateio`(IN _id int)
BEGIN
      select * from rateio where id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdRevisao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdRevisao`(IN _id int,in _Carro_ID int)
BEGIN
      select * from revisao where id = _id and Carro_ID = _Carro_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarIdUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarIdUsuario`(IN _idUsuario int)
BEGIN
      select * from usuario where idUsuario = _idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarMotorista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarMotorista`()
BEGIN
      select * from motorista;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarMotorista_Has_Grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarMotorista_Has_Grupo`()
BEGIN
      select * from motorista_has_grupo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarRateio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarRateio`()
BEGIN
      select * from rateio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarRevisao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarRevisao`()
BEGIN
      select * from revisao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPesquisarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPesquisarUsuario`()
BEGIN
      select * from usuario;
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

-- Dump completed on 2017-03-27 13:53:19
