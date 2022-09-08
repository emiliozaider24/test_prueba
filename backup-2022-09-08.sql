CREATE DATABASE  IF NOT EXISTS `empleados_tec` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `empleados_tec`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: empleados_tec
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empleados_tb`
--

DROP TABLE IF EXISTS `empleados_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_tb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NameE` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `M_Last_Name` varchar(45) DEFAULT NULL,
  `Born_Date` datetime DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `Emp_Status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_tb`
--

LOCK TABLES `empleados_tb` WRITE;
/*!40000 ALTER TABLE `empleados_tb` DISABLE KEYS */;
INSERT INTO `empleados_tb` VALUES (7,'Emilio','Godinez','Perez','1000-02-01 12:53:00','efp1478523690',2),(8,'JUAN','GODINEZ','PEREZ','2020-02-02 12:53:00','EFP1478523690',2),(9,'Pedro','Godinez','Perez','1989-02-05 21:00:00','efp1478523690',2),(10,'prueba','prueba','prueba','2000-08-08 12:52:02','sdfghjklertyu',2),(11,'pruebb','pruebb','prueba','0001-01-01 00:00:00','147852369963',2),(12,'EMILIO','GODINEZ','GODINEZ','2000-08-08 12:52:02','GOGE000808123',2),(13,'MARIA','CASTELLANOS','RAMIREZ','1950-08-08 11:10:02','CARM000808123',2),(14,'JUAN','SANTOS','PRADO','2000-02-02 12:51:00','SAPJ000202IOP',1),(15,'CARLA','ALVARES','HERNANDEZ','1989-02-02 14:51:00','ALHC890202IUY',1),(16,'EMILIO','GODINEZ','GODINEZ','2000-02-02 12:51:00','GOGE000202ASS',2),(17,'EMILIO','GODINEZ','GODINEZ','2000-02-02 12:51:00','GOGE000202ASS',2),(18,'EMILIO','GODINEZ','GODINEZ','2001-02-02 12:51:00','GOGE000202ASS',2),(19,'EMILIO','GONZALES','GODINEZ','2000-02-02 12:51:00','GOGE000202ASS',2),(20,'ALEJANDRO','PEREZ','HERNADEZ','1950-02-02 12:55:11','PEHA500202PQP',1),(21,'SANDRA','PATERZON','HERRERA','1989-02-02 14:51:00','PAHS890202YUU',1);
/*!40000 ALTER TABLE `empleados_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'empleados_tec'
--

--
-- Dumping routines for database 'empleados_tec'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualiza_status_empleado_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualiza_status_empleado_sp`(in eid int, in empstatus INT(1))
BEGIN
UPDATE empleados_tec.empleados_tb 
SET  Emp_Status= empstatus
WHERE id = eid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_empleado`(in eid int, in eName varchar(45), in eLastName varchar(45), 
in MLastName varchar(45), in eRFC varchar(13), eBornDate datetime)
BEGIN
if id = 0
then
insert into empleados_tb (NameE,Last_Name, M_Last_Name, RFC, Born_Date, Emp_Status)
values (eName, eLastName, MLastName, eRFC, eBornDate, 1);
else
UPDATE anaqueles_tb 
SET Name=eName, Last_Name=eLastName, M_Last_Name=MLastName, RFC=eRFC,
Born_Date=eBornDate
WHERE id = eid;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alta_empleado_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alta_empleado_sp`(in eid int, in eName varchar(45), in eLastName varchar(45), 
in MLastName varchar(45), in eRFC varchar(13), eBornDate datetime)
BEGIN
if eid = 0
then
insert into empleados_tb (NameE,Last_Name, M_Last_Name, RFC, Born_Date, Emp_Status)
values (eName, eLastName, MLastName, eRFC, eBornDate, '1');
else
UPDATE empleados_tb
SET NameE=eName, Last_Name=eLastName, M_Last_Name=MLastName, RFC=eRFC,
Born_Date=eBornDate
WHERE id = eid;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `muestra_empleadomod_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muestra_empleadomod_sp`(in eid int)
BEGIN
SELECT  id, NameE, Last_Name, M_Last_Name, Born_Date, RFC, Emp_Status
FROM empleados_tec.empleados_tb
WHERE id = eid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `muestra_empleados_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muestra_empleados_sp`()
BEGIN
SELECT id, NameE, Last_Name,M_Last_Name, RFC, Born_Date
FROM empleados_tb emp
WHERE Emp_Status= '1'
ORDER BY RFC ASC;
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

-- Dump completed on 2022-09-08 13:31:10
