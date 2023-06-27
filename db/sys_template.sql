-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 21. Jun 2023 um 09:30
-- Server-Version: 10.4.28-MariaDB-1:10.4.28+maria~ubu2004-log
-- PHP-Version: 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db`
--

--
-- Daten für Tabelle `sys_template`
--

REPLACE INTO `sys_template` VALUES (1,1,1687339479,1585576660,0,0,0,0,256,NULL,0,'Root-Template',1,3,NULL,'@import \'EXT:PREPARE_LOWERVENDOR_site/Configuration/TypoScript/constants.typoscript\'\r\n','@import \'EXT:PREPARE_LOWERVENDOR_site/Configuration/TypoScript/setup.typoscript\'\r\n','',0,0,0);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
