CREATE DATABASE  IF NOT EXISTS `bd_gestao_faculdade` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_gestao_faculdade`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_gestao_faculdade
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
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disciplina` (
  `cod_aluno` smallint unsigned NOT NULL,
  `cod_disciplina` smallint unsigned NOT NULL,
  PRIMARY KEY (`cod_aluno`,`cod_disciplina`),
  KEY `fk_cod_discip_tbl_aluno_disciplina` (`cod_disciplina`),
  CONSTRAINT `fk_cod_aluno_tbl_aluno_disciplina` FOREIGN KEY (`cod_aluno`) REFERENCES `alunos` (`cod_aluno`),
  CONSTRAINT `fk_cod_discip_tbl_aluno_disciplina` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplinas` (`Cod_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `cod_aluno` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(20) NOT NULL,
  `sobrenome_aluno` varchar(50) NOT NULL,
  `num_bilhete` varchar(14) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `estado` char(1) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `nome_mae` varchar(80) NOT NULL,
  `nome_pai` varchar(80) DEFAULT NULL,
  `cod_turma` smallint unsigned NOT NULL,
  `cod_curso` smallint unsigned NOT NULL,
  `cod_endereco_aluno` tinyint unsigned NOT NULL,
  `cod_telefone_aluno` tinyint unsigned NOT NULL,
  PRIMARY KEY (`cod_aluno`),
  UNIQUE KEY `num_bilhete` (`num_bilhete`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_cod_turma` (`cod_turma`),
  KEY `fk_cod_curso_tbl_alunos` (`cod_curso`),
  KEY `fk_cod_endereco_aluno` (`cod_endereco_aluno`),
  KEY `fk_cod_telefone_aluno` (`cod_telefone_aluno`),
  CONSTRAINT `fk_cod_curso_tbl_alunos` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`),
  CONSTRAINT `fk_cod_endereco_aluno` FOREIGN KEY (`cod_endereco_aluno`) REFERENCES `endereco_aluno` (`cod_endereco`),
  CONSTRAINT `fk_cod_telefone_aluno` FOREIGN KEY (`cod_telefone_aluno`) REFERENCES `telefone_aluno` (`cod_telefone`),
  CONSTRAINT `fk_cod_turma` FOREIGN KEY (`cod_turma`) REFERENCES `turmas` (`cod_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_disciplina`
--

DROP TABLE IF EXISTS `curso_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_disciplina` (
  `cod_curso` smallint unsigned NOT NULL,
  `cod_disciplina` smallint unsigned NOT NULL,
  PRIMARY KEY (`cod_curso`,`cod_disciplina`),
  KEY `fk_cod_discip_tbl_curso_disciplina` (`cod_disciplina`),
  CONSTRAINT `fk_cod_curso_tbl_curso_disciplina` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`),
  CONSTRAINT `fk_cod_discip_tbl_curso_disciplina` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplinas` (`Cod_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_disciplina`
--

LOCK TABLES `curso_disciplina` WRITE;
/*!40000 ALTER TABLE `curso_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `cod_curso` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(40) NOT NULL,
  `cod_dpto` smallint unsigned NOT NULL,
  PRIMARY KEY (`cod_curso`),
  KEY `fk_cod_dpto` (`cod_dpto`),
  CONSTRAINT `fk_cod_dpto` FOREIGN KEY (`cod_dpto`) REFERENCES `departamentos` (`cod_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `cod_dpto` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nome_dpto` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disc_depende_disc`
--

DROP TABLE IF EXISTS `disc_depende_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disc_depende_disc` (
  `cod_disciplina` smallint DEFAULT NULL,
  `possui_cod_discip` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disc_depende_disc`
--

LOCK TABLES `disc_depende_disc` WRITE;
/*!40000 ALTER TABLE `disc_depende_disc` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_depende_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplinas` (
  `Cod_disciplina` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nome_disciplina` varchar(30) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `numero_alunos` smallint unsigned NOT NULL,
  `carga_horaria` smallint unsigned NOT NULL,
  `cod_dpto` smallint unsigned NOT NULL,
  PRIMARY KEY (`Cod_disciplina`),
  KEY `fk_cod_dpto_tbl_disciplinas` (`cod_dpto`),
  CONSTRAINT `fk_cod_dpto_tbl_disciplinas` FOREIGN KEY (`cod_dpto`) REFERENCES `departamentos` (`cod_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplinas`
--

LOCK TABLES `disciplinas` WRITE;
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_aluno`
--

DROP TABLE IF EXISTS `endereco_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_aluno` (
  `cod_endereco` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nome_rua` varchar(50) DEFAULT NULL,
  `numero_rua` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`cod_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_aluno`
--

LOCK TABLES `endereco_aluno` WRITE;
/*!40000 ALTER TABLE `endereco_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_disciplina`
--

DROP TABLE IF EXISTS `historico_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_disciplina` (
  `cod_historico` smallint unsigned NOT NULL,
  `cod_disciplina` smallint unsigned NOT NULL,
  `nota` decimal(4,2) unsigned NOT NULL,
  `frequencia` smallint unsigned NOT NULL,
  PRIMARY KEY (`cod_historico`,`cod_disciplina`),
  KEY `fk_cod_discip_tbl_hist_disciplina` (`cod_disciplina`),
  CONSTRAINT `fk_cod_discip_tbl_hist_disciplina` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplinas` (`Cod_disciplina`),
  CONSTRAINT `fk_cod_historico` FOREIGN KEY (`cod_historico`) REFERENCES `historicos` (`cod_historico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_disciplina`
--

LOCK TABLES `historico_disciplina` WRITE;
/*!40000 ALTER TABLE `historico_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicos`
--

DROP TABLE IF EXISTS `historicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historicos` (
  `cod_historico` smallint unsigned NOT NULL AUTO_INCREMENT,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `cod_aluno` smallint unsigned NOT NULL,
  PRIMARY KEY (`cod_historico`),
  KEY `fk_cod_aluno` (`cod_aluno`),
  CONSTRAINT `fk_cod_aluno` FOREIGN KEY (`cod_aluno`) REFERENCES `alunos` (`cod_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicos`
--

LOCK TABLES `historicos` WRITE;
/*!40000 ALTER TABLE `historicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_disciplina`
--

DROP TABLE IF EXISTS `prof_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_disciplina` (
  `cod_professor` smallint unsigned NOT NULL,
  `cod_disciplina` smallint unsigned NOT NULL,
  PRIMARY KEY (`cod_professor`,`cod_disciplina`),
  KEY `fk_cod_discip_tbl_prof_disciplina` (`cod_disciplina`),
  CONSTRAINT `fk_cod_discip_tbl_prof_disciplina` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplinas` (`Cod_disciplina`),
  CONSTRAINT `fk_cod_professor` FOREIGN KEY (`cod_professor`) REFERENCES `professores` (`cod_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_disciplina`
--

LOCK TABLES `prof_disciplina` WRITE;
/*!40000 ALTER TABLE `prof_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `prof_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professores`
--

DROP TABLE IF EXISTS `professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professores` (
  `cod_professor` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nome_professor` varchar(20) NOT NULL,
  `sobrenome_professor` varchar(50) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `cod_dpto` smallint unsigned NOT NULL,
  PRIMARY KEY (`cod_professor`),
  KEY `fk_cod_dpto_tbl_professores` (`cod_dpto`),
  CONSTRAINT `fk_cod_dpto_tbl_professores` FOREIGN KEY (`cod_dpto`) REFERENCES `departamentos` (`cod_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores`
--

LOCK TABLES `professores` WRITE;
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone_aluno`
--

DROP TABLE IF EXISTS `telefone_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_aluno` (
  `cod_telefone` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `num_telefone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`cod_telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone_aluno`
--

LOCK TABLES `telefone_aluno` WRITE;
/*!40000 ALTER TABLE `telefone_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmas`
--

DROP TABLE IF EXISTS `turmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turmas` (
  `cod_turma` smallint unsigned NOT NULL AUTO_INCREMENT,
  `periodo` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `num_alunos` smallint unsigned NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `cod_curso` smallint unsigned NOT NULL,
  PRIMARY KEY (`cod_turma`),
  KEY `fk_cod_curso` (`cod_curso`),
  CONSTRAINT `fk_cod_curso` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmas`
--

LOCK TABLES `turmas` WRITE;
/*!40000 ALTER TABLE `turmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `turmas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 11:18:00
