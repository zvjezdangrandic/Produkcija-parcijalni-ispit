-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 07, 2023 at 10:17 PM
-- Server version: 8.0.31-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportovi`
--

-- --------------------------------------------------------

--
-- Table structure for table `igrac`
--

CREATE TABLE `igrac` (
  `igracID` int UNSIGNED NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `spol` varchar(64) NOT NULL,
  `visina` int UNSIGNED NOT NULL,
  `masa` float UNSIGNED NOT NULL,
  `timID` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `igrac`
--

INSERT INTO `igrac` (`igracID`, `ime`, `prezime`, `spol`, `visina`, `masa`, `timID`) VALUES
(1, 'luka', 'modrić', 'muški', 172, 68, 0),
(2, 'dominik', 'livaković', 'muški', 186, 103.45, 0),
(3, 'tomislav', 'ladić', 'muški', 175, 78.78, 0),
(4, 'mirta', 'šurjak', 'ženski', 165, 95.01, 0),
(5, 'nives', 'drpić-celzijus', 'ženski', 175, 85, 0),
(6, 'ivana', 'knoll', 'ženski', 185, 75.9, 0),
(7, 'zlatko', 'dalić', 'muški', 188, 46, 0);

-- --------------------------------------------------------

--
-- Table structure for table `natjecanja`
--

CREATE TABLE `natjecanja` (
  `natjecanjaID` int UNSIGNED NOT NULL,
  `mjesto` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `nazivNatjecanja` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `natjecanja`
--

INSERT INTO `natjecanja` (`natjecanjaID`, `mjesto`, `datum`, `nazivNatjecanja`) VALUES
(1, 'Katar', '2022-11-20', 'Svjetsko prvenstvo 2022'),
(2, 'Rusija', '2018-06-15', 'Svjetsko prvenstvo 2018'),
(3, 'EU', '2020-06-16', 'Europsko prvenstvo 2020'),
(4, 'Jugoslavija', '1984-12-12', 'Olimpijske igre 1984'),
(5, 'Kina', '2016-06-06', 'Olimpijske igre 2016'),
(6, 'Slovenija', '2004-01-03', 'EP - rukomet 2004'),
(7, 'Švedska', '2006-01-03', 'EP - rukomet 2006'),
(8, 'Egipat', '2021-01-04', 'SP - rukomet 2021');

-- --------------------------------------------------------

--
-- Table structure for table `natjecanjaSport`
--

CREATE TABLE `natjecanjaSport` (
  `sportID` int UNSIGNED NOT NULL,
  `natjecanjaID` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

CREATE TABLE `sport` (
  `sportID` int UNSIGNED NOT NULL,
  `vrstaSporta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`sportID`, `vrstaSporta`) VALUES
(1, 'nogomet'),
(2, 'vaterpolo'),
(3, 'rukomet'),
(4, 'ritmična gimnastika');

-- --------------------------------------------------------

--
-- Table structure for table `sportovi`
--

CREATE TABLE `sportovi` (
  `sportid` int NOT NULL,
  `nogomet` int NOT NULL,
  `rukomet` int NOT NULL,
  `košarka` int NOT NULL,
  `odbojka` int NOT NULL,
  `tenis` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tim`
--

CREATE TABLE `tim` (
  `timID` int UNSIGNED NOT NULL,
  `nazivTima` varchar(255) NOT NULL,
  `sjedisteTima` varchar(255) NOT NULL,
  `brojTrofeja` int UNSIGNED NOT NULL,
  `sportID` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tim`
--

INSERT INTO `tim` (`timID`, `nazivTima`, `sjedisteTima`, `brojTrofeja`, `sportID`) VALUES
(1, 'vatreni', 'Hrvatska', 10, 0),
(2, 'orlovi', 'Srbija', 0, 0),
(3, 'trikolori', 'Francuska', 2, 0),
(4, 'kauboji', 'Hrvatska', 4, 0),
(5, 'barakude', 'Hrvatska', 12, 0),
(6, 'koke s čoška', 'bračni krevet', 999, 0);

-- --------------------------------------------------------

--
-- Table structure for table `timNatjecanja`
--

CREATE TABLE `timNatjecanja` (
  `natjecanjaID` int UNSIGNED NOT NULL,
  `timID` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `igrac`
--
ALTER TABLE `igrac`
  ADD PRIMARY KEY (`igracID`),
  ADD KEY `fk_timID` (`timID`);

--
-- Indexes for table `natjecanja`
--
ALTER TABLE `natjecanja`
  ADD PRIMARY KEY (`natjecanjaID`);

--
-- Indexes for table `natjecanjaSport`
--
ALTER TABLE `natjecanjaSport`
  ADD PRIMARY KEY (`sportID`,`natjecanjaID`),
  ADD KEY `natjecanjaID` (`natjecanjaID`);

--
-- Indexes for table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`sportID`);

--
-- Indexes for table `sportovi`
--
ALTER TABLE `sportovi`
  ADD PRIMARY KEY (`sportid`);

--
-- Indexes for table `tim`
--
ALTER TABLE `tim`
  ADD PRIMARY KEY (`timID`),
  ADD KEY `fk_sportID` (`sportID`);

--
-- Indexes for table `timNatjecanja`
--
ALTER TABLE `timNatjecanja`
  ADD PRIMARY KEY (`natjecanjaID`,`timID`),
  ADD KEY `timID` (`timID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `igrac`
--
ALTER TABLE `igrac`
  MODIFY `igracID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `natjecanja`
--
ALTER TABLE `natjecanja`
  MODIFY `natjecanjaID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sport`
--
ALTER TABLE `sport`
  MODIFY `sportID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tim`
--
ALTER TABLE `tim`
  MODIFY `timID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
