-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 17, 2018 at 08:02 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestionufr`
--

-- --------------------------------------------------------

--
-- Table structure for table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `id_dom` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) NOT NULL,
  PRIMARY KEY (`id_dom`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domaine`
--

INSERT INTO `domaine` (`id_dom`, `intitule`) VALUES
(1, 'Sciences et Technologies');

-- --------------------------------------------------------

--
-- Table structure for table `ecue`
--

DROP TABLE IF EXISTS `ecue`;
CREATE TABLE IF NOT EXISTS `ecue` (
  `id_ecu` int(11) NOT NULL AUTO_INCREMENT,
  `num_ecu` int(11) NOT NULL,
  `ue` int(11) NOT NULL,
  PRIMARY KEY (`id_ecu`),
  KEY `ue` (`ue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_et` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenoms` varchar(255) NOT NULL,
  `dateNaissance` date NOT NULL,
  `nce` varchar(255) NOT NULL,
  PRIMARY KEY (`id_et`),
  UNIQUE KEY `nom` (`nom`,`prenoms`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id_et`, `nom`, `prenoms`, `dateNaissance`, `nce`) VALUES
(1, 'Koné', 'Sidy Mohamed Aziz', '1996-09-10', 'ci0215042116'),
(2, 'Tanoh', 'Cedrick ahoussan', '2018-03-14', 'ci02154447'),
(3, 'Agni', 'Mea', '1995-05-05', 'ci0215032245'),
(4, 'toto', 'tata tutu', '2018-05-04', 'ci02144445'),
(5, 'qsdqsd', 'azeae', '1997-10-10', 'arar');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id_eva` int(11) NOT NULL AUTO_INCREMENT,
  `date_eva` date NOT NULL,
  `libelle_eva` varchar(255) NOT NULL,
  `session_eva` int(11) NOT NULL,
  `coeff_eva` int(11) NOT NULL,
  `ecu` int(11) NOT NULL,
  PRIMARY KEY (`id_eva`),
  KEY `ecu` (`ecu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evaluation`
--

INSERT INTO `evaluation` (`id_eva`, `date_eva`, `libelle_eva`, `session_eva`, `coeff_eva`, `ecu`) VALUES
(1, '2018-03-18', 'analyse 1', 1, 3, 2),
(2, '2018-01-01', 'algebre', 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `id_gra` int(11) NOT NULL AUTO_INCREMENT,
  `intitule_gra` varchar(255) NOT NULL,
  PRIMARY KEY (`id_gra`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id_gra`, `intitule_gra`) VALUES
(1, 'Licence'),
(2, 'Master'),
(3, 'Doctorat');

-- --------------------------------------------------------

--
-- Table structure for table `inscrire`
--

DROP TABLE IF EXISTS `inscrire`;
CREATE TABLE IF NOT EXISTS `inscrire` (
  `id_ins` int(11) NOT NULL AUTO_INCREMENT,
  `etu` varchar(255) NOT NULL,
  `dom` varchar(255) NOT NULL,
  `mentio` varchar(255) NOT NULL,
  `grad` varchar(255) NOT NULL,
  `specialit` varchar(255) NOT NULL,
  `nive` varchar(255) NOT NULL,
  `annee` varchar(255) NOT NULL,
  PRIMARY KEY (`id_ins`),
  UNIQUE KEY `etu` (`etu`) USING BTREE,
  KEY `etu_2` (`etu`,`dom`),
  KEY `dom` (`dom`),
  KEY `etu_3` (`etu`,`dom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inscrire`
--

INSERT INTO `inscrire` (`id_ins`, `etu`, `dom`, `mentio`, `grad`, `specialit`, `nive`, `annee`) VALUES
(1, 'Koné', 'Sciences et Technologies', 'Mathématique-Informatique', 'Licence', 'Informatique', 'Licence 3', '2016-2017'),
(2, 'Tanoh', 'Sciences et Technologies', 'Mathématique-Informatique', 'Licence', 'Informatique', 'Licence 3', '2016-2017'),
(3, 'Agni', 'Sciences et Technologies', 'Mathématique-Informatique', 'Master', 'Informatique', 'Master 1', '2016-2017'),
(4, 'toto', 'Sciences et Technologies', 'Mathématique-Informatique', 'Master', 'Mathématique', 'Master 1', '2017-2018');

-- --------------------------------------------------------

--
-- Table structure for table `mention`
--

DROP TABLE IF EXISTS `mention`;
CREATE TABLE IF NOT EXISTS `mention` (
  `id_men` int(11) NOT NULL AUTO_INCREMENT,
  `intitule_men` varchar(255) NOT NULL,
  PRIMARY KEY (`id_men`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mention`
--

INSERT INTO `mention` (`id_men`, `intitule_men`) VALUES
(1, 'Mathématique-Informatique'),
(2, 'Physique-Chimie');

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id_niv` int(11) NOT NULL AUTO_INCREMENT,
  `intitule_niv` varchar(255) NOT NULL,
  PRIMARY KEY (`id_niv`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `niveau`
--

INSERT INTO `niveau` (`id_niv`, `intitule_niv`) VALUES
(1, 'Licence 1'),
(2, 'Licence 2'),
(3, 'Licence 3'),
(4, 'Master 1'),
(5, 'Master 2'),
(6, 'Thèse');

-- --------------------------------------------------------

--
-- Table structure for table `noter`
--

DROP TABLE IF EXISTS `noter`;
CREATE TABLE IF NOT EXISTS `noter` (
  `id_not` int(11) NOT NULL AUTO_INCREMENT,
  `note` int(11) NOT NULL,
  `mention_not` varchar(255) NOT NULL,
  `etu` int(11) NOT NULL,
  `eva` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `session` int(11) NOT NULL,
  PRIMARY KEY (`id_not`),
  KEY `etu` (`etu`,`eva`),
  KEY `eva` (`eva`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `noter`
--

INSERT INTO `noter` (`id_not`, `note`, `mention_not`, `etu`, `eva`, `date`, `session`) VALUES
(1, 18, 'Excéllent', 1, 'analyse 1', '18/03/2018 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `id_spe` int(11) NOT NULL AUTO_INCREMENT,
  `intitule_spe` varchar(255) NOT NULL,
  PRIMARY KEY (`id_spe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`id_spe`, `intitule_spe`) VALUES
(1, 'Informatique'),
(2, 'Mathématique'),
(3, 'Physique'),
(4, 'Chimie'),
(5, 'Génie Informatique'),
(6, 'Miage');

-- --------------------------------------------------------

--
-- Table structure for table `ue`
--

DROP TABLE IF EXISTS `ue`;
CREATE TABLE IF NOT EXISTS `ue` (
  `id_ue` int(11) NOT NULL AUTO_INCREMENT,
  `code_ue` varchar(100) NOT NULL,
  `libelle_ue` varchar(255) NOT NULL,
  `semestre` int(11) NOT NULL,
  `dom` int(11) NOT NULL,
  `men` int(11) NOT NULL,
  `spe` int(11) NOT NULL,
  `gra` int(11) NOT NULL,
  `niv` int(11) NOT NULL,
  PRIMARY KEY (`id_ue`),
  UNIQUE KEY `libelle_ue` (`libelle_ue`),
  KEY `dom` (`dom`,`men`,`spe`,`gra`,`niv`),
  KEY `men` (`men`),
  KEY `niv` (`niv`),
  KEY `spe` (`spe`),
  KEY `gra` (`gra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ue`
--

INSERT INTO `ue` (`id_ue`, `code_ue`, `libelle_ue`, `semestre`, `dom`, `men`, `spe`, `gra`, `niv`) VALUES
(1, '001', 'Analyse 1', 1, 1, 1, 2, 1, 1),
(2, '002', 'Algèbre 1', 1, 1, 1, 2, 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ecue`
--
ALTER TABLE `ecue`
  ADD CONSTRAINT `ecue_ibfk_1` FOREIGN KEY (`ue`) REFERENCES `ue` (`id_ue`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ue`
--
ALTER TABLE `ue`
  ADD CONSTRAINT `ue_ibfk_1` FOREIGN KEY (`dom`) REFERENCES `domaine` (`id_dom`),
  ADD CONSTRAINT `ue_ibfk_2` FOREIGN KEY (`men`) REFERENCES `mention` (`id_men`),
  ADD CONSTRAINT `ue_ibfk_3` FOREIGN KEY (`niv`) REFERENCES `niveau` (`id_niv`),
  ADD CONSTRAINT `ue_ibfk_4` FOREIGN KEY (`spe`) REFERENCES `specialite` (`id_spe`),
  ADD CONSTRAINT `ue_ibfk_5` FOREIGN KEY (`gra`) REFERENCES `grade` (`id_gra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
