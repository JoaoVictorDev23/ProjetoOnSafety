CREATE DATABASE  IF NOT EXISTS `pessoa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pessoa`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: pessoa
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Dumping events for database 'pessoa'
--

--
-- Dumping routines for database 'pessoa'
--
/*!50003 DROP FUNCTION IF EXISTS `valida_cpf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valida_cpf`(cpf VARCHAR(11)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE cpf_num VARCHAR(11);
    DECLARE dv1 INT;
    DECLARE dv2 INT;
    DECLARE soma INT;
    DECLARE resto INT;

    IF cpf IS NULL THEN
        RETURN FALSE;
END IF;

    SET cpf_num = REPLACE(cpf, '.', '');
    SET cpf_num = REPLACE(cpf_num, '-', '');

    IF LENGTH(cpf_num) != 11 OR NOT cpf_num REGEXP '^[0-9]{11}$' THEN
        RETURN FALSE;
END IF;

    -- Calcula o primeiro dígito verificador
    SET soma = 0;
    SET dv1 = 0;
    SET resto = 0;

    SET soma = (SUBSTRING(cpf_num, 1, 1) * 10) +
               (SUBSTRING(cpf_num, 2, 1) * 9) +
               (SUBSTRING(cpf_num, 3, 1) * 8) +
               (SUBSTRING(cpf_num, 4, 1) * 7) +
               (SUBSTRING(cpf_num, 5, 1) * 6) +
               (SUBSTRING(cpf_num, 6, 1) * 5) +
               (SUBSTRING(cpf_num, 7, 1) * 4) +
               (SUBSTRING(cpf_num, 8, 1) * 3) +
               (SUBSTRING(cpf_num, 9, 1) * 2);

    SET resto = MOD(soma, 11);

    IF resto < 2 THEN
        SET dv1 = 0;
ELSE
        SET dv1 = 11 - resto;
END IF;

    -- Calcula o segundo dígito verificador
    SET soma = 0;
    SET dv2 = 0;
    SET resto = 0;

    SET soma = (SUBSTRING(cpf_num, 1, 1) * 11) +
               (SUBSTRING(cpf_num, 2, 1) * 10) +
               (SUBSTRING(cpf_num, 3, 1) * 9) +
               (SUBSTRING(cpf_num, 4, 1) * 8) +
               (SUBSTRING(cpf_num, 5, 1) * 7) +
               (SUBSTRING(cpf_num, 6, 1) * 6) +
               (SUBSTRING(cpf_num, 7, 1) * 5) +
               (SUBSTRING(cpf_num, 8, 1) * 4) +
               (SUBSTRING(cpf_num, 9, 1) * 3) +
               (dv1 * 2);

    SET resto = MOD(soma, 11);

    IF resto < 2 THEN
        SET dv2 = 0;
ELSE
        SET dv2 = 11 - resto;
END IF;

    -- Verifica se os dígitos calculados são iguais aos dígitos originais do CPF
    IF dv1 = SUBSTRING(cpf_num, 10, 1) AND dv2 = SUBSTRING(cpf_num, 11, 1) THEN
        RETURN TRUE;
ELSE
        RETURN FALSE;
END IF;
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

-- Dump completed on 2024-07-23 20:54:41
