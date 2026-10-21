/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nexo_salud
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-5ubuntu0.1 from Ubuntu

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `acompanamientos`
--

DROP TABLE IF EXISTS `acompanamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `acompanamientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `profesional_id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `profesional_id` (`profesional_id`),
  CONSTRAINT `acompanamientos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `acompanamientos_ibfk_2` FOREIGN KEY (`profesional_id`) REFERENCES `profesionales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acompanamientos`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `acompanamientos` WRITE;
/*!40000 ALTER TABLE `acompanamientos` DISABLE KEYS */;
INSERT INTO `acompanamientos` VALUES
(1,1,1,'2026-10-18',NULL,'activo');
/*!40000 ALTER TABLE `acompanamientos` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES
(1,1,'ana@nexo.com','hash_ficticio_ana','activo'),
(3,2,'carlos@nexo.com','hash_ficticio_carlos','activo');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES
(1,'Ana','Garcia Lopez','2026-10-18'),
(2,'Carlos','Martinez Ruiz','2026-10-18'),
(3,'Sofia','Fernandez Torres','2026-10-18');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `profesionales`
--

DROP TABLE IF EXISTS `profesionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesionales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  CONSTRAINT `profesionales_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesionales`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `profesionales` WRITE;
/*!40000 ALTER TABLE `profesionales` DISABLE KEYS */;
INSERT INTO `profesionales` VALUES
(1,3,'Psiquiatria','activo');
/*!40000 ALTER TABLE `profesionales` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `registros_bienestar`
--

DROP TABLE IF EXISTS `registros_bienestar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_bienestar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `profesional_id` int(11) NOT NULL,
  `sesion_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `estado_emocional` varchar(50) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profesional_id` (`profesional_id`),
  KEY `sesion_id` (`sesion_id`),
  KEY `idx_registros_usuario` (`usuario_id`),
  CONSTRAINT `registros_bienestar_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `registros_bienestar_ibfk_2` FOREIGN KEY (`profesional_id`) REFERENCES `profesionales` (`id`),
  CONSTRAINT `registros_bienestar_ibfk_3` FOREIGN KEY (`sesion_id`) REFERENCES `sesiones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_bienestar`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `registros_bienestar` WRITE;
/*!40000 ALTER TABLE `registros_bienestar` DISABLE KEYS */;
INSERT INTO `registros_bienestar` VALUES
(1,1,1,1,'2026-10-19 10:45:00','profesional','serena','Registro ficticio de seguimiento emocional');
/*!40000 ALTER TABLE `registros_bienestar` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acompanamiento_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `duracion_minutos` int(11) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acompanamiento_id` (`acompanamiento_id`),
  CONSTRAINT `sesiones_ibfk_1` FOREIGN KEY (`acompanamiento_id`) REFERENCES `acompanamientos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES
(1,1,'2026-10-19 10:00:00',45,'Primera sesión de seguimiento');
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,1,'activo'),
(2,2,'activo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-18 13:05:43
