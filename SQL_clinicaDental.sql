-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clinicaDental
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('01-role-migrations.js'),('02-usuario-migrations.js'),('03-odontologo-migrations.js'),('04-paciente-migrations.js'),('05-cita-migrations.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_odontologo` int NOT NULL,
  `id_paciente` int NOT NULL,
  `fecha` date NOT NULL,
  `horario` time NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_odontologo` (`id_odontologo`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_odontologo`) REFERENCES `odontologos` (`id`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,1,1,'2023-04-08','15:00:00','2023-04-25 11:59:02','2023-04-25 11:59:02'),(2,2,2,'2023-04-15','14:00:00','2023-04-25 11:59:02','2023-04-25 11:59:02'),(3,3,3,'2023-04-10','13:00:00','2023-04-25 11:59:02','2023-04-25 11:59:02'),(4,1,4,'2023-06-20','17:00:00','2023-04-25 11:59:02','2023-04-25 11:59:02'),(5,2,5,'2023-04-20','18:00:00','2023-04-25 11:59:02','2023-04-25 11:59:02'),(6,3,2,'2023-05-20','19:00:00','2023-04-25 11:59:02','2023-04-25 11:59:02');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odontologos`
--

DROP TABLE IF EXISTS `odontologos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odontologos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `matriculaOdontologo` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `odontologos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odontologos`
--

LOCK TABLES `odontologos` WRITE;
/*!40000 ALTER TABLE `odontologos` DISABLE KEYS */;
INSERT INTO `odontologos` VALUES (1,7,1234566668,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(2,8,1234774568,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(3,9,1234114568,'2023-04-25 11:59:02','2023-04-25 11:59:02');
/*!40000 ALTER TABLE `odontologos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(2,2,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(3,3,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(4,4,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(5,5,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(6,6,'2023-04-25 11:59:02','2023-04-25 11:59:02');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rolUsuario` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user','2023-04-25 11:59:02','2023-04-25 11:59:02'),(2,'admin','2023-04-25 11:59:02','2023-04-25 11:59:02');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Jose','1996-05-01','Palacios','jose@correo.com',1233456789,'$2b$10$dr6fv8GwiRlVO.uZ/JxctOVi5VWWQwFdElvBv3zlb0RLNF2FHj6.y',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(2,'Marta','2002-09-10','Garcia','marta@correo.com',1233456789,'$2b$10$IawxeyVAhCmjsxnu8NnLbe66KG0CMBLxjyHEaXM/BG01mOM.QW5A6',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(3,'Pepita','1966-07-23','Rodriguez','pepita@correo.com',1233456789,'$2b$10$jYLo8t6e2mzVaozbCA/Bkut2uBUdUc9aHG7yJ59MPQG4WPewPkPxa',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(4,'Pepa','1966-07-23','Pérez','pepa@correo.com',1233456789,'$2b$10$MxMwnK0ketSlUYa/YchgJe0QgW4ur4bK6sjTZkv5vh1NdZigg/UEq',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(5,'Carlos','1966-07-23','Cabrera','carlos@correo.com',1233456789,'$2b$10$9pUeBTO/5/HGXul9GWwWWeavXzPpYmN.qaGTR5VuWvuRIkrUOXK7K',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(6,'Liz','1966-07-23','Pastran','liz@correo.com',1233456789,'$2b$10$OBN8PVQHIm7DoG6dhvkBJu.wsnu2GdMyAQTA/JxG1oYwyzdfSdO5q',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(7,'Odontologo Miguel','1966-07-23','Messeger','miguel@correo.com',1233456789,'$2b$10$sx1vtHXPVUnB.csnFFPTLO876rilCIr0MrACeYyW/TNm6g3QevX/.',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(8,'Odontologo Ernesto','1966-07-23','Pérez','enersto@corrreo.com',1233456789,'$2b$10$4jpc1J0o/JjnjCEijJYk6eKRnMz3baxki.pkytEhLcceKQqF4KiLu',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(9,'Odontologo juan','1966-07-23','Pérez','juan@correo.com',1233456789,'$2b$10$k11BaafTtY8X1HHnTSz3.eJoU8gDbWJ.Mgo0EKtyRuDiLmUU7zgS2',1,'2023-04-25 11:59:02','2023-04-25 11:59:02'),(10,'Admin. Pepe','1966-07-23','Pérez','pepe@correo.com',1233456789,'$2b$10$FBPv6xHLXOTBKhT.VHy1NubhI1rvfLzjhXj6EiBlC708zPCSrfk.q',2,'2023-04-25 11:59:02','2023-04-25 11:59:02');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-25 14:01:02
