-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2022 at 03:21 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wonderworks`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `stattus` varchar(50) NOT NULL,
  `iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `intitule` varchar(50) DEFAULT NULL,
  `datecreation` varchar(50) DEFAULT NULL,
  `tarif` varchar(50) DEFAULT NULL,
  `duree` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `intitule` varchar(50) DEFAULT NULL,
  `datecreation` varchar(50) DEFAULT NULL,
  `datefin` varchar(50) DEFAULT NULL,
  `nbrmax` varchar(50) DEFAULT NULL,
  `idformation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `intitule` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `datepublication` varchar(50) DEFAULT NULL,
  `contenue` varchar(50) DEFAULT NULL,
  `idadmin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payementprof`
--

CREATE TABLE `payementprof` (
  `id` int(11) NOT NULL,
  `idprof` int(11) DEFAULT NULL,
  `idadmin` int(11) DEFAULT NULL,
  `datepayement` varchar(50) DEFAULT NULL,
  `peroid` varchar(50) DEFAULT NULL,
  `montantapeyer` varchar(50) DEFAULT NULL,
  `montantpayer` varchar(50) DEFAULT NULL,
  `montantrestant` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payementstudent`
--

CREATE TABLE `payementstudent` (
  `id` int(11) NOT NULL,
  `idstudent` int(11) DEFAULT NULL,
  `idadmin` int(11) DEFAULT NULL,
  `datepayement` varchar(50) DEFAULT NULL,
  `idformation` int(11) DEFAULT NULL,
  `montantrestant` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pointageprof`
--

CREATE TABLE `pointageprof` (
  `id` int(11) NOT NULL,
  `idprof` int(11) DEFAULT NULL,
  `dateseance` varchar(50) DEFAULT NULL,
  `presences` varchar(50) DEFAULT NULL,
  `absences` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pointagestudent`
--

CREATE TABLE `pointagestudent` (
  `id` int(11) NOT NULL,
  `idstudent` int(11) DEFAULT NULL,
  `idgroup` int(11) DEFAULT NULL,
  `presences` varchar(50) DEFAULT NULL,
  `absences` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prof`
--

CREATE TABLE `prof` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `datenaissance` varchar(50) DEFAULT NULL,
  `dateintegration` varchar(50) DEFAULT NULL,
  `niveaueducation` varchar(50) DEFAULT NULL,
  `tarifheure` varchar(50) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) DEFAULT NULL,
  `rolename` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE `stage` (
  `id` int(11) DEFAULT NULL,
  `idstudent` int(11) DEFAULT NULL,
  `idformation` int(11) DEFAULT NULL,
  `datedebut` varchar(50) DEFAULT NULL,
  `datefin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `datenaissance` varchar(50) DEFAULT NULL,
  `niveauetude` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `idrole` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_admin_user` (`iduser`);

--
-- Indexes for table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_groupe_admin` (`idformation`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_news_admin` (`idadmin`);

--
-- Indexes for table `payementprof`
--
ALTER TABLE `payementprof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_payementprof_admin` (`idprof`),
  ADD KEY `FK_payementprof_admin_2` (`idadmin`);

--
-- Indexes for table `payementstudent`
--
ALTER TABLE `payementstudent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_payementstudent_admin` (`idstudent`),
  ADD KEY `FK_payementstudent_admin_2` (`idadmin`),
  ADD KEY `FK_payementstudent_admin_3` (`idformation`);

--
-- Indexes for table `pointageprof`
--
ALTER TABLE `pointageprof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_pointageprof_admin` (`idprof`);

--
-- Indexes for table `pointagestudent`
--
ALTER TABLE `pointagestudent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_pointagestudent_admin` (`idstudent`);

--
-- Indexes for table `prof`
--
ALTER TABLE `prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_prof_admin` (`iduser`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_student_admin` (`iduser`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_admin` (`idrole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payementprof`
--
ALTER TABLE `payementprof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payementstudent`
--
ALTER TABLE `payementstudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pointageprof`
--
ALTER TABLE `pointageprof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pointagestudent`
--
ALTER TABLE `pointagestudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prof`
--
ALTER TABLE `prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FK1_admin_user` FOREIGN KEY (`iduser`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `FK_groupe_admin` FOREIGN KEY (`idformation`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK_news_admin` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payementprof`
--
ALTER TABLE `payementprof`
  ADD CONSTRAINT `FK_payementprof_admin` FOREIGN KEY (`idprof`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_payementprof_admin_2` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payementstudent`
--
ALTER TABLE `payementstudent`
  ADD CONSTRAINT `FK_payementstudent_admin` FOREIGN KEY (`idstudent`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_payementstudent_admin_2` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_payementstudent_admin_3` FOREIGN KEY (`idformation`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pointageprof`
--
ALTER TABLE `pointageprof`
  ADD CONSTRAINT `FK_pointageprof_admin` FOREIGN KEY (`idprof`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pointagestudent`
--
ALTER TABLE `pointagestudent`
  ADD CONSTRAINT `FK_pointagestudent_admin` FOREIGN KEY (`idstudent`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prof`
--
ALTER TABLE `prof`
  ADD CONSTRAINT `FK_prof_admin` FOREIGN KEY (`iduser`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_student_admin` FOREIGN KEY (`iduser`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_admin` FOREIGN KEY (`idrole`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
