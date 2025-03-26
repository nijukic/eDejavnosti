-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 21, 2021 at 10:44 PM
-- Server version: 5.6.34
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dejavnost`
--

CREATE TABLE `dejavnost` (
  `idDejavnost` int(11) NOT NULL,
  `moznaMesta` int(11) DEFAULT NULL,
  `opis` varchar(500) DEFAULT NULL,
  `malica` tinyint(1) DEFAULT NULL,
  `naziv` varchar(45) DEFAULT NULL,
  `datumZacetek` date DEFAULT NULL,
  `mozneSole` varchar(300) DEFAULT NULL,
  `mozniProgrami` varchar(300) DEFAULT NULL,
  `mozniLetniki` varchar(300) DEFAULT NULL,
  `mozniOddelki` varchar(300) DEFAULT NULL,
  `datumKonec` date DEFAULT NULL,
  `stanje` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dejavnost`
--

INSERT INTO `dejavnost` (`idDejavnost`, `moznaMesta`, `opis`, `malica`, `naziv`, `datumZacetek`, `mozneSole`, `mozniProgrami`, `mozniLetniki`, `mozniOddelki`, `datumKonec`, `stanje`) VALUES
(2, 47, 'Uvodna ura pred začetkom razvoja.', 0, 'Uvod v robotiko', '2021-04-21', '1;', '2;', '5;6;', '9;11;', '2021-04-21', 2),
(9, 15, 'Zberemo se ob 7.00 na železniški postaji.', 1, 'Pohod na Kum', '2021-04-21', '2;', '4;', '10;11;', '19;20;21;', '2021-04-22', 1),
(10, 20, 'Reševali bomo naloge iz preteklih let.', 0, 'Vaje za ACM tekmovanje', '2021-04-21', '1;', '1;', '1;', '2;', '2021-04-23', 1),
(11, 3, 'Igrali bomo odbojko na mivki 3 na 3.', 0, 'Odbojka', '2021-04-22', '1;', '1;', '1;', '2;', '2021-04-23', 1),
(12, 21, 'Spoznali bomo Adobe paket za grafično oblikovanje.', 0, 'Grafično oblikovanje', '2021-04-21', '1;', '1;2;', '1;5;', '1;2;9;10;', '2021-05-30', 1),
(13, 7, 'Vaje za spis.', 1, 'Pisanje spisov', '2021-04-21', '1;', '1;2;', '1;2;3;4;5;6;7;8;', '1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;', '2021-04-23', 1),
(14, 10, 'Pogledali si bomo nekaj videoposnetkov o delovanju določenih komponent in o njih nekaj komentirali.', 0, 'Osnove strojne opreme', '2021-04-21', '1;', '1;', '1;', '2;', '2021-04-22', 2),
(15, 3, 'Reševali bomo zanimive, a zapletene logične naloge.', 1, 'Naloge iz logike', '2021-04-21', '1;', '1;2;', '4;8;', '7;15;', '2021-04-21', 2);

-- --------------------------------------------------------

--
-- Table structure for table `letnik`
--

CREATE TABLE `letnik` (
  `idLetnik` int(11) NOT NULL,
  `stevilka` int(11) DEFAULT NULL,
  `kraticaProgram` varchar(10) NOT NULL,
  `Program_idProgram` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `letnik`
--

INSERT INTO `letnik` (`idLetnik`, `stevilka`, `kraticaProgram`, `Program_idProgram`) VALUES
(1, 1, 'tr', 1),
(2, 2, 'tr', 1),
(3, 3, 'tr', 1),
(4, 4, 'tr', 1),
(5, 1, 'et', 2),
(6, 2, 'et', 2),
(7, 3, 'et', 2),
(8, 4, 'et', 2),
(9, 1, 'eko', 4),
(10, 2, 'eko', 4),
(11, 3, 'eko', 4),
(12, 4, 'eko', 4),
(13, 1, 'gim', 5),
(14, 2, 'gim', 5),
(15, 3, 'gim', 5),
(16, 4, 'gim', 5),
(17, 1, 'st', 3),
(18, 2, 'st', 3),
(19, 3, 'st', 3),
(20, 4, 'st', 3),
(21, 1, 'gim', 6),
(22, 2, 'gim', 6),
(23, 3, 'gim', 6),
(24, 4, 'gim', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oddelek`
--

CREATE TABLE `oddelek` (
  `idOddelek` int(11) NOT NULL,
  `crka` varchar(2) DEFAULT NULL,
  `Letnik_idLetnik` int(11) NOT NULL,
  `idRazrednik` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oddelek`
--

INSERT INTO `oddelek` (`idOddelek`, `crka`, `Letnik_idLetnik`, `idRazrednik`) VALUES
(1, 'a', 1, 1000),
(2, 'b', 1, 957),
(3, 'a', 2, 958),
(4, 'b', 2, 959),
(5, 'a', 3, 960),
(6, 'b', 3, 961),
(7, 'a', 4, 962),
(8, 'b', 4, 963),
(9, 'a', 5, 9),
(10, 'b', 5, 10),
(11, 'a', 6, 11),
(12, 'b', 6, 12),
(13, 'a', 7, 13),
(14, 'b', 7, 14),
(15, 'a', 8, 15),
(16, 'b', 8, 16),
(17, 'a', 9, 974),
(18, 'b', 9, 18),
(19, 'a', 10, 19),
(20, 'b', 10, 20),
(21, 'a', 11, 21),
(22, 'b', 11, 22),
(23, 'a', 12, 23),
(24, 'b', 12, 24),
(25, 'a', 13, 25),
(26, 'b', 13, 26),
(27, 'a', 14, 975),
(28, 'b', 14, 28),
(29, 'a', 15, 29),
(30, 'b', 15, 976),
(31, 'a', 16, 31),
(32, 'b', 16, 32),
(33, 'a', 17, 33),
(34, 'b', 17, 34),
(35, 'a', 18, 35),
(36, 'b', 18, 36),
(37, 'a', 19, 37),
(38, 'b', 19, 38),
(39, 'a', 20, 39),
(40, 'b', 20, 2),
(41, 'a', 21, NULL),
(42, 'b', 21, NULL),
(43, 'a', 22, 639),
(44, 'b', 22, NULL),
(45, 'a', 23, NULL),
(46, 'b', 23, 531),
(47, 'a', 24, NULL),
(48, 'b', 24, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oseba`
--

CREATE TABLE `oseba` (
  `idOseba` int(11) NOT NULL,
  `ime` varchar(30) DEFAULT NULL,
  `priimek` varchar(30) DEFAULT NULL,
  `datumRojstva` date DEFAULT NULL,
  `spol` set('m','f') DEFAULT NULL,
  `eNaslov` varchar(80) DEFAULT NULL,
  `vloga` varchar(20) DEFAULT NULL,
  `geslo` varchar(255) DEFAULT NULL,
  `zacasnoGeslo` varchar(255) DEFAULT NULL,
  `Oddelek_idOddelek` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oseba`
--

INSERT INTO `oseba` (`idOseba`, `ime`, `priimek`, `datumRojstva`, `spol`, `eNaslov`, `vloga`, `geslo`, `zacasnoGeslo`, `Oddelek_idOddelek`) VALUES
(1, 'admin', 'admin', '2021-04-01', NULL, 'admin@mail.com', 'admin', '37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578', NULL, NULL),
(870, 'Franc', 'Horvat', '2002-04-01', 'm', 'franc.horvat@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(871, 'Janez', 'Kovačič', '2002-04-02', 'm', 'janez.kovacic@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(872, 'Marko', 'Krajnc', '2002-04-03', 'm', 'marko.krajnc@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(873, 'Andrej', 'Zupančič', '2002-04-04', 'm', 'andrej.zupancic@dijak-stps.si', 'dijak', NULL, 'geslo', 2),
(874, 'Ivan', 'Potočnik', '2002-04-05', 'm', 'ivan.potocnik@dijak-stps.si', 'dijak', NULL, 'geslo', 2),
(875, 'Anton', 'Kovač', '2002-04-06', 'm', 'anton.kovac@dijak-stps.si', 'dijak', NULL, 'geslo', 2),
(876, 'Jožef', 'Mlakar', '2002-04-07', 'm', 'jozef.mlakar@dijak-stps.si', 'dijak', NULL, 'geslo', 2),
(877, 'Jože', 'Vidmar', '2002-04-08', 'm', 'joze.vidmar@dijak-stps.si', 'dijak', NULL, 'geslo', 3),
(878, 'Luka', 'Kos', '2002-04-09', 'm', 'luka.kos@dijak-stps.si', 'dijak', NULL, 'geslo', 3),
(879, 'Peter', 'Golob', '2002-04-10', 'm', 'peter.golob@dijak-stps.si', 'dijak', NULL, 'geslo', 3),
(880, 'Matej', 'Turk', '2002-04-11', 'm', 'matej.turk@dijak-stps.si', 'dijak', NULL, 'geslo', 4),
(881, 'Marjan', 'Kralj', '2002-04-12', 'm', 'marjan.kralj@dijak-stps.si', 'dijak', NULL, 'geslo', 4),
(882, 'Tomaž', 'Božič', '2002-04-13', 'm', 'tomaz.bozic@dijak-stps.si', 'dijak', NULL, 'geslo', 4),
(883, 'Milan', 'Korošec', '2002-04-14', 'm', 'milan.korosec@dijak-stps.si', 'dijak', NULL, 'geslo', 4),
(884, 'Aleš', 'Bizjak', '2002-04-15', 'm', 'ales.bizjak@dijak-stps.si', 'dijak', NULL, 'geslo', 5),
(885, 'Bojan', 'Zupan', '2002-04-16', 'm', 'bojan.zupan@dijak-stps.si', 'dijak', NULL, 'geslo', 5),
(886, 'Branko', 'Hribar', '2002-04-17', 'm', 'branko.hribar@dijak-stps.si', 'dijak', NULL, 'geslo', 5),
(887, 'Rok', 'Kotnik', '2002-04-18', 'm', 'rok.kotnik@dijak-stps.si', 'dijak', NULL, 'geslo', 6),
(888, 'Robert', 'Rozman', '2002-04-19', 'm', 'robert.rozman@dijak-stps.si', 'dijak', NULL, 'geslo', 6),
(889, 'Boštjan', 'Kavčič', '2002-04-20', 'm', 'bostjan.kavcic@dijak-stps.si', 'dijak', NULL, 'geslo', 6),
(890, 'Matjaž', 'Kastelic', '2002-04-21', 'm', 'matjaz.kastelic@dijak-stps.si', 'dijak', NULL, 'geslo', 7),
(891, 'Gregor', 'Oblak', '2002-04-22', 'm', 'gregor.oblak@dijak-stps.si', 'dijak', NULL, 'geslo', 7),
(892, 'Miha', 'Hočevar', '2002-04-23', 'm', 'miha.hocevar@dijak-stps.si', 'dijak', NULL, 'geslo', 8),
(893, 'David', 'Petek', '2002-04-24', 'm', 'david.petek@dijak-stps.si', 'dijak', NULL, 'geslo', 9),
(894, 'Martin', 'Kolar', '2002-04-25', 'm', 'martin.kolar@dijak-stps.si', 'dijak', NULL, 'geslo', 9),
(895, 'Stanislav', 'Žagar', '2002-04-26', 'm', 'stanislav.zagar@dijak-stps.si', 'dijak', NULL, 'geslo', 10),
(896, 'Jan', 'Košir', '2002-04-27', 'm', 'jan.kosir@dijak-stps.si', 'dijak', NULL, 'geslo', 11),
(897, 'Igor', 'Koren', '2002-04-28', 'm', 'igor.koren@dijak-stps.si', 'dijak', NULL, 'geslo', 12),
(898, 'Dejan', 'Klemenčič', '2002-04-29', 'm', 'dejan.klemencic@dijak-stps.si', 'dijak', NULL, 'geslo', 12),
(899, 'Boris', 'Zajc', '2002-04-30', 'm', 'boris.zajc@dijak-stps.si', 'dijak', NULL, 'geslo', 13),
(900, 'Dušan', 'Knez', '2002-05-01', 'm', 'dusan.knez@dijak-stps.si', 'dijak', NULL, 'geslo', 14),
(901, 'Nejc', 'Medved', '2002-05-02', 'm', 'nejc.medved@dijak-stps.si', 'dijak', NULL, 'geslo', 15),
(902, 'Žiga', 'Petrič', '2002-05-03', 'm', 'ziga.petric@dijak-stps.si', 'dijak', NULL, 'geslo', 34),
(903, 'Jure', 'Zupanc', '2002-05-04', 'm', 'jure.zupanc@dijak-stps.si', 'dijak', NULL, 'geslo', 34),
(904, 'Uroš', 'Pirc', '2002-05-05', 'm', 'uros.pirc@dijak-stps.si', 'dijak', NULL, 'geslo', 33),
(905, 'Žan', 'Hrovat', '2002-05-06', 'm', 'zan.hrovat@dijak-stps.si', 'dijak', NULL, 'geslo', 35),
(906, 'Blaž', 'Pavlič', '2002-05-07', 'm', 'blaz.pavlic@dijak-stps.si', 'dijak', NULL, 'geslo', 35),
(907, 'Alojz', 'Kuhar', '2002-05-08', 'm', 'alojz.kuhar@dijak-stps.si', 'dijak', NULL, 'geslo', 35),
(908, 'Mitja', 'Lah', '2002-05-09', 'm', 'mitja.lah@dijak-stps.si', 'dijak', NULL, 'geslo', 38),
(909, 'Simon', 'Zorko', '2002-05-10', 'm', 'simon.zorko@dijak-stps.si', 'dijak', NULL, 'geslo', 40),
(910, 'Matic', 'Tomažič', '2002-05-11', 'm', 'matic.tomazic@dijak-stps.si', 'dijak', NULL, 'geslo', 40),
(911, 'Darko', 'Uršič', '2002-05-12', 'm', 'darko.ursic@dijak-stps.si', 'dijak', NULL, 'geslo', 40),
(912, 'Klemen', 'Erjavec', '2002-05-13', 'm', 'klemen.erjavec@dijak-gess.si', 'dijak', NULL, 'geslo', 18),
(913, 'Primož', 'Babič', '2002-05-14', 'm', 'primoz.babic@dijak-gess.si', 'dijak', NULL, 'geslo', 18),
(914, 'Anže', 'Sever', '2002-05-15', 'm', 'anze.sever@dijak-gess.si', 'dijak', NULL, 'geslo', 17),
(915, 'Jernej', 'Jerman', '2002-05-16', 'm', 'jernej.jerman@dijak-gess.si', 'dijak', NULL, 'geslo', 17),
(916, 'Marjeta', 'Jereb', '2002-05-17', 'f', 'marjeta.jereb@dijak-gess.si', 'dijak', NULL, 'geslo', 17),
(917, 'Zdenka', 'Kovačević', '2002-05-18', 'f', 'zdenka.kovacevic@dijak-gess.si', 'dijak', NULL, 'geslo', 17),
(918, 'Olga', 'Kranjc', '2002-05-19', 'f', 'olga.kranjc@dijak-gess.si', 'dijak', NULL, 'geslo', 17),
(919, 'Lidija', 'Majcen', '2002-05-20', 'f', 'lidija.majcen@dijak-gess.si', 'dijak', NULL, 'geslo', 19),
(920, 'Sabina', 'Rupnik', '2002-05-21', 'f', 'sabina.rupnik@dijak-gess.si', 'dijak', NULL, 'geslo', 19),
(921, 'Janja', 'Pušnik', '2002-05-22', 'f', 'janja.pusnik@dijak-gess.si', 'dijak', NULL, 'geslo', 19),
(922, 'Maša', 'Breznik', '2002-05-23', 'f', 'masa.breznik@dijak-gess.si', 'dijak', NULL, 'geslo', 22),
(923, 'Marta', 'Lesjak', '2002-05-24', 'f', 'marta.lesjak@dijak-gess.si', 'dijak', NULL, 'geslo', 22),
(924, 'Vida', 'Perko', '2002-05-25', 'f', 'vida.perko@dijak-gess.si', 'dijak', NULL, 'geslo', 22),
(925, 'Zala', 'Dolenc', '2002-05-26', 'f', 'zala.dolenc@dijak-gess.si', 'dijak', NULL, 'geslo', 24),
(926, 'Antonija', 'Močnik', '2002-05-27', 'f', 'antonija.mocnik@dijak-gess.si', 'dijak', NULL, 'geslo', 24),
(927, 'Ivanka', 'Furlan', '2002-05-28', 'f', 'ivanka.furlan@dijak-gess.si', 'dijak', NULL, 'geslo', 24),
(928, 'Angela', 'Pečnik', '2002-05-29', 'f', 'angela.pecnik@dijak-gess.si', 'dijak', NULL, 'geslo', 24),
(929, 'Silva', 'Pavlin', '2002-05-30', 'f', 'silva.pavlin@dijak-gess.si', 'dijak', NULL, 'geslo', 26),
(930, 'Karmen', 'Vidic', '2002-05-31', 'f', 'karmen.vidic@dijak-gess.si', 'dijak', NULL, 'geslo', 26),
(931, 'Veronika', 'Logar', '2002-06-01', 'f', 'veronika.logar@dijak-gess.si', 'dijak', NULL, 'geslo', 26),
(932, 'Darinka', 'Jenko', '2002-06-02', 'f', 'darinka.jenko@dijak-gess.si', 'dijak', NULL, 'geslo', 26),
(933, 'Lana', 'Petrović', '2002-06-03', 'f', 'lana.petrovic@dijak-gess.si', 'dijak', NULL, 'geslo', 28),
(934, 'Aleksandra', 'Ribič', '2002-06-04', 'f', 'aleksandra.ribic@dijak-gess.si', 'dijak', NULL, 'geslo', 27),
(935, 'Anita', 'Žnidaršič', '2002-06-05', 'f', 'anita.znidarsic@dijak-gess.si', 'dijak', NULL, 'geslo', 27),
(936, 'Klara', 'Janežič', '2002-06-06', 'f', 'klara.janezic@dijak-gess.si', 'dijak', NULL, 'geslo', 27),
(937, 'Kaja', 'Tomšič', '2002-06-07', 'f', 'kaja.tomsic@dijak-gess.si', 'dijak', NULL, 'geslo', 29),
(938, 'Brigita', 'Marolt', '2002-06-08', 'f', 'brigita.marolt@dijak-gess.si', 'dijak', NULL, 'geslo', 29),
(939, 'Ljudmila', 'Jelen', '2002-06-09', 'f', 'ljudmila.jelen@dijak-gess.si', 'dijak', NULL, 'geslo', 29),
(940, 'Lucija', 'Pintar', '2002-06-10', 'f', 'lucija.pintar@dijak-gess.si', 'dijak', NULL, 'geslo', 29),
(941, 'Jana', 'Blatnik', '2002-06-11', 'f', 'jana.blatnik@dijak-gess.si', 'dijak', NULL, 'geslo', 31),
(942, 'Metka', 'Maček', '2002-06-12', 'f', 'metka.macek@dijak-gess.si', 'dijak', NULL, 'geslo', 31),
(943, 'Lea', 'Dolinar', '2002-06-13', 'f', 'lea.dolinar@dijak-gess.si', 'dijak', NULL, 'geslo', 31),
(944, 'Monika', 'Černe', '2002-06-14', 'f', 'monika.cerne@dijak-vgl.si', 'dijak', NULL, 'geslo', 41),
(945, 'Alojzija', 'Gregorič', '2002-06-15', 'f', 'alojzija.gregoric@dijak-vgl.si', 'dijak', NULL, 'geslo', 41),
(946, 'Natalija', 'Hren', '2002-06-16', 'f', 'natalija.hren@dijak-vgl.si', 'dijak', NULL, 'geslo', 41),
(947, 'Cvetka', 'Mihelič', '2002-06-17', 'f', 'cvetka.mihelic@dijak-vgl.si', 'dijak', NULL, 'geslo', 43),
(948, 'Stanislava', 'Cerar', '2002-06-18', 'f', 'stanislava.cerar@dijak-vgl.si', 'dijak', NULL, 'geslo', 43),
(949, 'Jasmina', 'Zadravec', '2002-06-19', 'f', 'jasmina.zadravec@dijak-vgl.si', 'dijak', NULL, 'geslo', 43),
(950, 'Nevenka', 'Fras', '2002-06-20', 'f', 'nevenka.fras@dijak-vgl.si', 'dijak', NULL, 'geslo', 43),
(951, 'Julija', 'Kokalj', '2002-06-21', 'f', 'julija.kokalj@dijak-vgl.si', 'dijak', NULL, 'geslo', 45),
(952, 'Hana', 'Lešnik', '2002-06-22', 'f', 'hana.lesnik@dijak-vgl.si', 'dijak', NULL, 'geslo', 45),
(953, 'Tamara', 'Bezjak', '2002-06-23', 'f', 'tamara.bezjak@dijak-vgl.si', 'dijak', NULL, 'geslo', 45),
(954, 'Renata', 'Hodžić', '2002-06-24', 'f', 'renata.hodzic@dijak-vgl.si', 'dijak', NULL, 'geslo', 47),
(955, 'Marjana', 'Leban', '2002-06-25', 'f', 'marjana.leban@dijak-vgl.si', 'dijak', NULL, 'geslo', 47),
(956, 'Franc', 'Koren', '2002-05-20', 'm', 'franc.koren@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(957, 'Janez', 'Klemenčič', '2002-05-21', 'm', 'janez.klemencic@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(958, 'Marko', 'Zajc', '2002-05-22', 'm', 'marko.zajc@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(959, 'Andrej', 'Knez', '2002-05-23', 'm', 'andrej.knez@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(960, 'Ivan', 'Medved', '2002-05-24', 'm', 'ivan.medved@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(961, 'Anton', 'Petrič', '2002-05-25', 'm', 'anton.petric@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(962, 'Jožef', 'Zupanc', '2002-05-26', 'm', 'jozef.zupanc@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(963, 'Jože', 'Pirc', '2002-05-27', 'm', 'joze.pirc@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(964, 'Luka', 'Hrovat', '1970-01-01', 'm', 'luka.hrovat@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(965, 'Peter', 'Pavlič', '1970-01-01', 'm', 'peter.pavlic@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(966, 'Matej', 'Kuhar', '1970-01-01', 'm', 'matej.kuhar@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(967, 'Marjan', 'Lah', '1970-01-01', 'm', 'marjan.lah@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(968, 'Tomaž', 'Zorko', '2002-01-06', 'm', 'tomaz.zorko@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(969, 'Milan', 'Tomažič', '2002-02-06', 'm', 'milan.tomazic@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(970, 'Metka', 'Uršič', '2002-03-06', 'f', 'metka.ursic@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(971, 'Lea', 'Breznik', '2002-04-06', 'f', 'lea.breznik@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(972, 'Monika', 'Lesjak', '2002-05-06', 'f', 'monika.lesjak@profesor-stps.si', 'profesor', NULL, 'geslo', NULL),
(973, 'Alojzija', 'Perko', '2002-06-06', 'f', 'alojzija.perko@profesor-gess.si', 'profesor', NULL, 'geslo', NULL),
(974, 'Natalija', 'Dolenc', '2002-06-07', 'f', 'natalija.dolenc@profesor-gess.si', 'profesor', NULL, 'geslo', NULL),
(975, 'Cvetka', 'Močnik', '2002-06-08', 'f', 'cvetka.mocnik@profesor-gess.si', 'profesor', NULL, 'geslo', NULL),
(976, 'Stanislava', 'Furlan', '2002-06-09', 'f', 'stanislava.furlan@profesor-gess.si', 'profesor', NULL, 'geslo', NULL),
(977, 'Franc', 'Horvat', '2002-04-01', 'm', 'franc.horvat@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(978, 'Janez', 'Kovačič', '2002-04-02', 'm', 'janez.kovacic@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(979, 'Marko', 'Krajnc', '2002-04-03', 'm', 'marko.krajnc@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(980, 'Andrej', 'Zupančič', '2002-04-04', 'm', 'andrej.zupancic@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(981, 'Ivan', 'Potočnik', '2002-04-05', 'm', 'ivan.potocnik@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(982, 'Anton', 'Kovač', '2002-04-06', 'm', 'anton.kovac@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(983, 'Jožef', 'Mlakar', '2002-04-07', 'm', 'jozef.mlakar@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(984, 'Jože', 'Vidmar', '2002-04-08', 'm', 'joze.vidmar@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(985, 'Luka', 'Kos', '2002-04-09', 'm', 'luka.kos@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(986, 'Peter', 'Golob', '2002-04-10', 'm', 'peter.golob@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(987, 'Matej', 'Turk', '2002-04-11', 'm', 'matej.turk@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(988, 'Marjan', 'Kralj', '2002-04-12', 'm', 'marjan.kralj@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(989, 'Tomaž', 'Božič', '2002-04-13', 'm', 'tomaz.bozic@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(990, 'Milan', 'Korošec', '2002-04-14', 'm', 'milan.korosec@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(991, 'Aleš', 'Bizjak', '2002-04-15', 'm', 'ales.bizjak@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(992, 'Bojan', 'Zupan', '2002-04-16', 'm', 'bojan.zupan@dijak-stps.si', 'dijak', NULL, 'geslo', 1),
(1000, 'Janez', 'Novak', '2001-02-20', 'm', 'janez.novak@profesor-stps.si', 'profesor', NULL, 'geslo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oseba_has_dejavnost`
--

CREATE TABLE `oseba_has_dejavnost` (
  `Oseba_idOseba` int(11) NOT NULL,
  `Dejavnost_idDejavnost` int(11) NOT NULL,
  `avtor` tinyint(1) DEFAULT NULL,
  `odobreno` tinyint(1) DEFAULT NULL,
  `casVnosa` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oseba_has_dejavnost`
--

INSERT INTO `oseba_has_dejavnost` (`Oseba_idOseba`, `Dejavnost_idDejavnost`, `avtor`, `odobreno`, `casVnosa`) VALUES
(1, 9, 1, NULL, '2021-04-21 22:04:11'),
(870, 12, 0, 1, '2021-04-21 23:36:43'),
(873, 10, 0, 1, '2021-04-21 22:10:36'),
(873, 11, 0, 1, '2021-04-21 22:10:32'),
(873, 14, 0, 1, '2021-04-21 22:39:46'),
(874, 10, 0, 1, '2021-04-21 22:10:36'),
(874, 11, 0, 1, '2021-04-21 22:10:32'),
(874, 14, 0, 1, '2021-04-21 22:39:46'),
(875, 10, 0, 1, '2021-04-21 22:10:36'),
(875, 11, 0, 1, '2021-04-21 22:10:32'),
(875, 12, 0, 1, '2021-04-21 23:34:18'),
(875, 13, 0, 1, '2021-04-21 23:36:57'),
(875, 14, 0, 1, '2021-04-21 22:39:46'),
(876, 10, 0, 1, '2021-04-21 22:10:36'),
(876, 14, 0, 1, '2021-04-21 22:39:46'),
(884, 13, 0, 2, '2021-04-21 22:50:03'),
(887, 13, 0, 3, '2021-04-21 23:38:25'),
(889, 13, 0, 2, '2021-04-21 22:50:04'),
(890, 15, 0, 1, '2021-04-21 22:42:13'),
(891, 15, 0, 1, '2021-04-21 22:42:13'),
(893, 2, 0, 1, '2021-04-21 12:47:54'),
(894, 2, 0, 1, '2021-04-21 12:47:54'),
(896, 2, 0, 1, '2021-04-21 12:47:54'),
(901, 15, 0, 1, '2021-04-21 22:42:13'),
(956, 2, 1, NULL, '2021-04-21 12:41:15'),
(957, 10, 1, NULL, '2021-04-21 22:07:13'),
(957, 11, 1, NULL, '2021-04-21 22:08:24'),
(957, 12, 1, NULL, '2021-04-21 22:09:57'),
(957, 14, 1, NULL, '2021-04-21 22:39:38'),
(957, 15, 1, NULL, '2021-04-21 22:42:05'),
(977, 12, 0, 1, '2021-04-21 22:10:20'),
(979, 12, 0, 1, '2021-04-21 22:10:20'),
(980, 12, 0, 1, '2021-04-21 22:10:20'),
(981, 12, 0, 1, '2021-04-21 22:10:20'),
(981, 13, 0, 1, '2021-04-21 22:30:32'),
(983, 12, 0, 1, '2021-04-21 22:10:20'),
(984, 13, 0, 1, '2021-04-21 22:30:32'),
(985, 12, 0, 1, '2021-04-21 22:10:20'),
(985, 13, 0, 1, '2021-04-21 22:30:32'),
(986, 12, 0, 1, '2021-04-21 22:10:20'),
(986, 13, 0, 1, '2021-04-21 22:30:33'),
(1000, 13, 1, NULL, '2021-04-21 22:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `prisotnost`
--

CREATE TABLE `prisotnost` (
  `idPrisotnost_dan` int(11) NOT NULL,
  `idOseba` int(11) NOT NULL,
  `idDejavnost` int(11) NOT NULL,
  `prisoten` tinyint(1) DEFAULT '0',
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prisotnost`
--

INSERT INTO `prisotnost` (`idPrisotnost_dan`, `idOseba`, `idDejavnost`, `prisoten`, `datum`) VALUES
(37, 893, 2, 1, '2021-04-21'),
(38, 894, 2, 1, '2021-04-21'),
(39, 896, 2, 0, '2021-04-21'),
(162, 977, 12, 0, '2021-04-21'),
(163, 977, 12, 0, '2021-04-22'),
(164, 977, 12, 0, '2021-04-23'),
(165, 977, 12, 0, '2021-04-24'),
(166, 977, 12, 0, '2021-04-25'),
(167, 977, 12, 0, '2021-04-26'),
(168, 977, 12, 0, '2021-04-27'),
(169, 977, 12, 0, '2021-04-28'),
(170, 977, 12, 0, '2021-04-29'),
(171, 977, 12, 0, '2021-04-30'),
(172, 977, 12, 0, '2021-05-01'),
(173, 977, 12, 0, '2021-05-02'),
(174, 977, 12, 0, '2021-05-03'),
(175, 977, 12, 0, '2021-05-04'),
(176, 977, 12, 0, '2021-05-05'),
(177, 977, 12, 0, '2021-05-06'),
(178, 977, 12, 0, '2021-05-07'),
(179, 977, 12, 0, '2021-05-08'),
(180, 977, 12, 0, '2021-05-09'),
(181, 977, 12, 0, '2021-05-10'),
(182, 977, 12, 0, '2021-05-11'),
(183, 977, 12, 0, '2021-05-12'),
(184, 977, 12, 0, '2021-05-13'),
(185, 977, 12, 0, '2021-05-14'),
(186, 977, 12, 0, '2021-05-15'),
(187, 977, 12, 0, '2021-05-16'),
(188, 977, 12, 0, '2021-05-17'),
(189, 977, 12, 0, '2021-05-18'),
(190, 977, 12, 0, '2021-05-19'),
(191, 977, 12, 0, '2021-05-20'),
(192, 977, 12, 0, '2021-05-21'),
(193, 977, 12, 0, '2021-05-22'),
(194, 977, 12, 0, '2021-05-23'),
(195, 977, 12, 0, '2021-05-24'),
(196, 977, 12, 0, '2021-05-25'),
(197, 977, 12, 0, '2021-05-26'),
(198, 977, 12, 0, '2021-05-27'),
(199, 977, 12, 0, '2021-05-28'),
(200, 977, 12, 0, '2021-05-29'),
(201, 977, 12, 0, '2021-05-30'),
(202, 979, 12, 1, '2021-04-21'),
(203, 979, 12, 0, '2021-04-22'),
(204, 979, 12, 0, '2021-04-23'),
(205, 979, 12, 0, '2021-04-24'),
(206, 979, 12, 0, '2021-04-25'),
(207, 979, 12, 0, '2021-04-26'),
(208, 979, 12, 0, '2021-04-27'),
(209, 979, 12, 0, '2021-04-28'),
(210, 979, 12, 0, '2021-04-29'),
(211, 979, 12, 0, '2021-04-30'),
(212, 979, 12, 0, '2021-05-01'),
(213, 979, 12, 0, '2021-05-02'),
(214, 979, 12, 0, '2021-05-03'),
(215, 979, 12, 0, '2021-05-04'),
(216, 979, 12, 0, '2021-05-05'),
(217, 979, 12, 0, '2021-05-06'),
(218, 979, 12, 0, '2021-05-07'),
(219, 979, 12, 0, '2021-05-08'),
(220, 979, 12, 0, '2021-05-09'),
(221, 979, 12, 0, '2021-05-10'),
(222, 979, 12, 0, '2021-05-11'),
(223, 979, 12, 0, '2021-05-12'),
(224, 979, 12, 0, '2021-05-13'),
(225, 979, 12, 0, '2021-05-14'),
(226, 979, 12, 0, '2021-05-15'),
(227, 979, 12, 0, '2021-05-16'),
(228, 979, 12, 0, '2021-05-17'),
(229, 979, 12, 0, '2021-05-18'),
(230, 979, 12, 0, '2021-05-19'),
(231, 979, 12, 0, '2021-05-20'),
(232, 979, 12, 0, '2021-05-21'),
(233, 979, 12, 0, '2021-05-22'),
(234, 979, 12, 0, '2021-05-23'),
(235, 979, 12, 0, '2021-05-24'),
(236, 979, 12, 0, '2021-05-25'),
(237, 979, 12, 0, '2021-05-26'),
(238, 979, 12, 0, '2021-05-27'),
(239, 979, 12, 0, '2021-05-28'),
(240, 979, 12, 0, '2021-05-29'),
(241, 979, 12, 0, '2021-05-30'),
(242, 980, 12, 0, '2021-04-21'),
(243, 980, 12, 0, '2021-04-22'),
(244, 980, 12, 0, '2021-04-23'),
(245, 980, 12, 0, '2021-04-24'),
(246, 980, 12, 0, '2021-04-25'),
(247, 980, 12, 0, '2021-04-26'),
(248, 980, 12, 0, '2021-04-27'),
(249, 980, 12, 0, '2021-04-28'),
(250, 980, 12, 0, '2021-04-29'),
(251, 980, 12, 0, '2021-04-30'),
(252, 980, 12, 0, '2021-05-01'),
(253, 980, 12, 0, '2021-05-02'),
(254, 980, 12, 0, '2021-05-03'),
(255, 980, 12, 0, '2021-05-04'),
(256, 980, 12, 0, '2021-05-05'),
(257, 980, 12, 0, '2021-05-06'),
(258, 980, 12, 0, '2021-05-07'),
(259, 980, 12, 0, '2021-05-08'),
(260, 980, 12, 0, '2021-05-09'),
(261, 980, 12, 0, '2021-05-10'),
(262, 980, 12, 0, '2021-05-11'),
(263, 980, 12, 0, '2021-05-12'),
(264, 980, 12, 0, '2021-05-13'),
(265, 980, 12, 0, '2021-05-14'),
(266, 980, 12, 0, '2021-05-15'),
(267, 980, 12, 0, '2021-05-16'),
(268, 980, 12, 0, '2021-05-17'),
(269, 980, 12, 0, '2021-05-18'),
(270, 980, 12, 0, '2021-05-19'),
(271, 980, 12, 0, '2021-05-20'),
(272, 980, 12, 0, '2021-05-21'),
(273, 980, 12, 0, '2021-05-22'),
(274, 980, 12, 0, '2021-05-23'),
(275, 980, 12, 0, '2021-05-24'),
(276, 980, 12, 0, '2021-05-25'),
(277, 980, 12, 0, '2021-05-26'),
(278, 980, 12, 0, '2021-05-27'),
(279, 980, 12, 0, '2021-05-28'),
(280, 980, 12, 0, '2021-05-29'),
(281, 980, 12, 0, '2021-05-30'),
(282, 981, 12, 1, '2021-04-21'),
(283, 981, 12, 0, '2021-04-22'),
(284, 981, 12, 0, '2021-04-23'),
(285, 981, 12, 0, '2021-04-24'),
(286, 981, 12, 0, '2021-04-25'),
(287, 981, 12, 0, '2021-04-26'),
(288, 981, 12, 0, '2021-04-27'),
(289, 981, 12, 0, '2021-04-28'),
(290, 981, 12, 0, '2021-04-29'),
(291, 981, 12, 0, '2021-04-30'),
(292, 981, 12, 0, '2021-05-01'),
(293, 981, 12, 0, '2021-05-02'),
(294, 981, 12, 0, '2021-05-03'),
(295, 981, 12, 0, '2021-05-04'),
(296, 981, 12, 0, '2021-05-05'),
(297, 981, 12, 0, '2021-05-06'),
(298, 981, 12, 0, '2021-05-07'),
(299, 981, 12, 0, '2021-05-08'),
(300, 981, 12, 0, '2021-05-09'),
(301, 981, 12, 0, '2021-05-10'),
(302, 981, 12, 0, '2021-05-11'),
(303, 981, 12, 0, '2021-05-12'),
(304, 981, 12, 0, '2021-05-13'),
(305, 981, 12, 0, '2021-05-14'),
(306, 981, 12, 0, '2021-05-15'),
(307, 981, 12, 0, '2021-05-16'),
(308, 981, 12, 0, '2021-05-17'),
(309, 981, 12, 0, '2021-05-18'),
(310, 981, 12, 0, '2021-05-19'),
(311, 981, 12, 0, '2021-05-20'),
(312, 981, 12, 0, '2021-05-21'),
(313, 981, 12, 0, '2021-05-22'),
(314, 981, 12, 0, '2021-05-23'),
(315, 981, 12, 0, '2021-05-24'),
(316, 981, 12, 0, '2021-05-25'),
(317, 981, 12, 0, '2021-05-26'),
(318, 981, 12, 0, '2021-05-27'),
(319, 981, 12, 0, '2021-05-28'),
(320, 981, 12, 0, '2021-05-29'),
(321, 981, 12, 0, '2021-05-30'),
(322, 983, 12, 0, '2021-04-21'),
(323, 983, 12, 0, '2021-04-22'),
(324, 983, 12, 0, '2021-04-23'),
(325, 983, 12, 0, '2021-04-24'),
(326, 983, 12, 0, '2021-04-25'),
(327, 983, 12, 0, '2021-04-26'),
(328, 983, 12, 0, '2021-04-27'),
(329, 983, 12, 0, '2021-04-28'),
(330, 983, 12, 0, '2021-04-29'),
(331, 983, 12, 0, '2021-04-30'),
(332, 983, 12, 0, '2021-05-01'),
(333, 983, 12, 0, '2021-05-02'),
(334, 983, 12, 0, '2021-05-03'),
(335, 983, 12, 0, '2021-05-04'),
(336, 983, 12, 0, '2021-05-05'),
(337, 983, 12, 0, '2021-05-06'),
(338, 983, 12, 0, '2021-05-07'),
(339, 983, 12, 0, '2021-05-08'),
(340, 983, 12, 0, '2021-05-09'),
(341, 983, 12, 0, '2021-05-10'),
(342, 983, 12, 0, '2021-05-11'),
(343, 983, 12, 0, '2021-05-12'),
(344, 983, 12, 0, '2021-05-13'),
(345, 983, 12, 0, '2021-05-14'),
(346, 983, 12, 0, '2021-05-15'),
(347, 983, 12, 0, '2021-05-16'),
(348, 983, 12, 0, '2021-05-17'),
(349, 983, 12, 0, '2021-05-18'),
(350, 983, 12, 0, '2021-05-19'),
(351, 983, 12, 0, '2021-05-20'),
(352, 983, 12, 0, '2021-05-21'),
(353, 983, 12, 0, '2021-05-22'),
(354, 983, 12, 0, '2021-05-23'),
(355, 983, 12, 0, '2021-05-24'),
(356, 983, 12, 0, '2021-05-25'),
(357, 983, 12, 0, '2021-05-26'),
(358, 983, 12, 0, '2021-05-27'),
(359, 983, 12, 0, '2021-05-28'),
(360, 983, 12, 0, '2021-05-29'),
(361, 983, 12, 0, '2021-05-30'),
(362, 985, 12, 1, '2021-04-21'),
(363, 985, 12, 0, '2021-04-22'),
(364, 985, 12, 0, '2021-04-23'),
(365, 985, 12, 0, '2021-04-24'),
(366, 985, 12, 0, '2021-04-25'),
(367, 985, 12, 0, '2021-04-26'),
(368, 985, 12, 0, '2021-04-27'),
(369, 985, 12, 0, '2021-04-28'),
(370, 985, 12, 0, '2021-04-29'),
(371, 985, 12, 0, '2021-04-30'),
(372, 985, 12, 0, '2021-05-01'),
(373, 985, 12, 0, '2021-05-02'),
(374, 985, 12, 0, '2021-05-03'),
(375, 985, 12, 0, '2021-05-04'),
(376, 985, 12, 0, '2021-05-05'),
(377, 985, 12, 0, '2021-05-06'),
(378, 985, 12, 0, '2021-05-07'),
(379, 985, 12, 0, '2021-05-08'),
(380, 985, 12, 0, '2021-05-09'),
(381, 985, 12, 0, '2021-05-10'),
(382, 985, 12, 0, '2021-05-11'),
(383, 985, 12, 0, '2021-05-12'),
(384, 985, 12, 0, '2021-05-13'),
(385, 985, 12, 0, '2021-05-14'),
(386, 985, 12, 0, '2021-05-15'),
(387, 985, 12, 0, '2021-05-16'),
(388, 985, 12, 0, '2021-05-17'),
(389, 985, 12, 0, '2021-05-18'),
(390, 985, 12, 0, '2021-05-19'),
(391, 985, 12, 0, '2021-05-20'),
(392, 985, 12, 0, '2021-05-21'),
(393, 985, 12, 0, '2021-05-22'),
(394, 985, 12, 0, '2021-05-23'),
(395, 985, 12, 0, '2021-05-24'),
(396, 985, 12, 0, '2021-05-25'),
(397, 985, 12, 0, '2021-05-26'),
(398, 985, 12, 0, '2021-05-27'),
(399, 985, 12, 0, '2021-05-28'),
(400, 985, 12, 0, '2021-05-29'),
(401, 985, 12, 0, '2021-05-30'),
(402, 986, 12, 1, '2021-04-21'),
(403, 986, 12, 0, '2021-04-22'),
(404, 986, 12, 0, '2021-04-23'),
(405, 986, 12, 0, '2021-04-24'),
(406, 986, 12, 0, '2021-04-25'),
(407, 986, 12, 0, '2021-04-26'),
(408, 986, 12, 0, '2021-04-27'),
(409, 986, 12, 0, '2021-04-28'),
(410, 986, 12, 0, '2021-04-29'),
(411, 986, 12, 0, '2021-04-30'),
(412, 986, 12, 0, '2021-05-01'),
(413, 986, 12, 0, '2021-05-02'),
(414, 986, 12, 0, '2021-05-03'),
(415, 986, 12, 0, '2021-05-04'),
(416, 986, 12, 0, '2021-05-05'),
(417, 986, 12, 0, '2021-05-06'),
(418, 986, 12, 0, '2021-05-07'),
(419, 986, 12, 0, '2021-05-08'),
(420, 986, 12, 0, '2021-05-09'),
(421, 986, 12, 0, '2021-05-10'),
(422, 986, 12, 0, '2021-05-11'),
(423, 986, 12, 0, '2021-05-12'),
(424, 986, 12, 0, '2021-05-13'),
(425, 986, 12, 0, '2021-05-14'),
(426, 986, 12, 0, '2021-05-15'),
(427, 986, 12, 0, '2021-05-16'),
(428, 986, 12, 0, '2021-05-17'),
(429, 986, 12, 0, '2021-05-18'),
(430, 986, 12, 0, '2021-05-19'),
(431, 986, 12, 0, '2021-05-20'),
(432, 986, 12, 0, '2021-05-21'),
(433, 986, 12, 0, '2021-05-22'),
(434, 986, 12, 0, '2021-05-23'),
(435, 986, 12, 0, '2021-05-24'),
(436, 986, 12, 0, '2021-05-25'),
(437, 986, 12, 0, '2021-05-26'),
(438, 986, 12, 0, '2021-05-27'),
(439, 986, 12, 0, '2021-05-28'),
(440, 986, 12, 0, '2021-05-29'),
(441, 986, 12, 0, '2021-05-30'),
(442, 873, 11, 0, '2021-04-22'),
(443, 873, 11, 0, '2021-04-23'),
(444, 874, 11, 0, '2021-04-22'),
(445, 874, 11, 0, '2021-04-23'),
(446, 875, 11, 0, '2021-04-22'),
(447, 875, 11, 0, '2021-04-23'),
(448, 873, 10, 0, '2021-04-21'),
(449, 873, 10, 0, '2021-04-22'),
(450, 873, 10, 0, '2021-04-23'),
(451, 874, 10, 1, '2021-04-21'),
(452, 874, 10, 0, '2021-04-22'),
(453, 874, 10, 0, '2021-04-23'),
(454, 875, 10, 0, '2021-04-21'),
(455, 875, 10, 0, '2021-04-22'),
(456, 875, 10, 0, '2021-04-23'),
(457, 876, 10, 1, '2021-04-21'),
(458, 876, 10, 0, '2021-04-22'),
(459, 876, 10, 0, '2021-04-23'),
(490, 873, 14, 1, '2021-04-21'),
(491, 873, 14, 0, '2021-04-22'),
(492, 874, 14, 1, '2021-04-21'),
(493, 874, 14, 0, '2021-04-22'),
(494, 875, 14, 1, '2021-04-21'),
(495, 875, 14, 0, '2021-04-22'),
(496, 876, 14, 1, '2021-04-21'),
(497, 876, 14, 0, '2021-04-22'),
(498, 890, 15, 0, '2021-04-21'),
(499, 891, 15, 1, '2021-04-21'),
(500, 901, 15, 1, '2021-04-21'),
(507, 981, 13, 1, '2021-04-21'),
(508, 981, 13, 0, '2021-04-22'),
(509, 981, 13, 0, '2021-04-23'),
(513, 984, 13, 0, '2021-04-21'),
(514, 984, 13, 0, '2021-04-22'),
(515, 984, 13, 0, '2021-04-23'),
(516, 985, 13, 1, '2021-04-21'),
(517, 985, 13, 0, '2021-04-22'),
(518, 985, 13, 0, '2021-04-23'),
(519, 986, 13, 0, '2021-04-21'),
(520, 986, 13, 0, '2021-04-22'),
(521, 986, 13, 0, '2021-04-23'),
(525, 875, 12, 0, '2021-04-21'),
(526, 875, 12, 0, '2021-04-22'),
(527, 875, 12, 0, '2021-04-23'),
(528, 875, 12, 0, '2021-04-24'),
(529, 875, 12, 0, '2021-04-25'),
(530, 875, 12, 0, '2021-04-26'),
(531, 875, 12, 0, '2021-04-27'),
(532, 875, 12, 0, '2021-04-28'),
(533, 875, 12, 0, '2021-04-29'),
(534, 875, 12, 0, '2021-04-30'),
(535, 875, 12, 0, '2021-05-01'),
(536, 875, 12, 0, '2021-05-02'),
(537, 875, 12, 0, '2021-05-03'),
(538, 875, 12, 0, '2021-05-04'),
(539, 875, 12, 0, '2021-05-05'),
(540, 875, 12, 0, '2021-05-06'),
(541, 875, 12, 0, '2021-05-07'),
(542, 875, 12, 0, '2021-05-08'),
(543, 875, 12, 0, '2021-05-09'),
(544, 875, 12, 0, '2021-05-10'),
(545, 875, 12, 0, '2021-05-11'),
(546, 875, 12, 0, '2021-05-12'),
(547, 875, 12, 0, '2021-05-13'),
(548, 875, 12, 0, '2021-05-14'),
(549, 875, 12, 0, '2021-05-15'),
(550, 875, 12, 0, '2021-05-16'),
(551, 875, 12, 0, '2021-05-17'),
(552, 875, 12, 0, '2021-05-18'),
(553, 875, 12, 0, '2021-05-19'),
(554, 875, 12, 0, '2021-05-20'),
(555, 875, 12, 0, '2021-05-21'),
(556, 875, 12, 0, '2021-05-22'),
(557, 875, 12, 0, '2021-05-23'),
(558, 875, 12, 0, '2021-05-24'),
(559, 875, 12, 0, '2021-05-25'),
(560, 875, 12, 0, '2021-05-26'),
(561, 875, 12, 0, '2021-05-27'),
(562, 875, 12, 0, '2021-05-28'),
(563, 875, 12, 0, '2021-05-29'),
(564, 875, 12, 0, '2021-05-30'),
(565, 870, 12, 0, '2021-04-21'),
(566, 870, 12, 0, '2021-04-22'),
(567, 870, 12, 0, '2021-04-23'),
(568, 870, 12, 0, '2021-04-24'),
(569, 870, 12, 0, '2021-04-25'),
(570, 870, 12, 0, '2021-04-26'),
(571, 870, 12, 0, '2021-04-27'),
(572, 870, 12, 0, '2021-04-28'),
(573, 870, 12, 0, '2021-04-29'),
(574, 870, 12, 0, '2021-04-30'),
(575, 870, 12, 0, '2021-05-01'),
(576, 870, 12, 0, '2021-05-02'),
(577, 870, 12, 0, '2021-05-03'),
(578, 870, 12, 0, '2021-05-04'),
(579, 870, 12, 0, '2021-05-05'),
(580, 870, 12, 0, '2021-05-06'),
(581, 870, 12, 0, '2021-05-07'),
(582, 870, 12, 0, '2021-05-08'),
(583, 870, 12, 0, '2021-05-09'),
(584, 870, 12, 0, '2021-05-10'),
(585, 870, 12, 0, '2021-05-11'),
(586, 870, 12, 0, '2021-05-12'),
(587, 870, 12, 0, '2021-05-13'),
(588, 870, 12, 0, '2021-05-14'),
(589, 870, 12, 0, '2021-05-15'),
(590, 870, 12, 0, '2021-05-16'),
(591, 870, 12, 0, '2021-05-17'),
(592, 870, 12, 0, '2021-05-18'),
(593, 870, 12, 0, '2021-05-19'),
(594, 870, 12, 0, '2021-05-20'),
(595, 870, 12, 0, '2021-05-21'),
(596, 870, 12, 0, '2021-05-22'),
(597, 870, 12, 0, '2021-05-23'),
(598, 870, 12, 0, '2021-05-24'),
(599, 870, 12, 0, '2021-05-25'),
(600, 870, 12, 0, '2021-05-26'),
(601, 870, 12, 0, '2021-05-27'),
(602, 870, 12, 0, '2021-05-28'),
(603, 870, 12, 0, '2021-05-29'),
(604, 870, 12, 0, '2021-05-30'),
(605, 875, 13, 1, '2021-04-21'),
(606, 875, 13, 0, '2021-04-22'),
(607, 875, 13, 0, '2021-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `idProgram` int(11) NOT NULL,
  `nazivPrograma` varchar(45) DEFAULT NULL,
  `Sola_idSola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`idProgram`, `nazivPrograma`, `Sola_idSola`) VALUES
(1, 'tehnik računalništva', 1),
(2, 'elektrotehnik', 1),
(3, 'strojni tehnik', 1),
(4, 'ekonomist', 2),
(5, 'gimnazijec', 2),
(6, 'gimnazijec', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sola`
--

CREATE TABLE `sola` (
  `idSola` int(11) NOT NULL,
  `naslov` varchar(100) DEFAULT NULL,
  `nazivSole` varchar(100) DEFAULT NULL,
  `kratica` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sola`
--

INSERT INTO `sola` (`idSola`, `naslov`, `nazivSole`, `kratica`) VALUES
(1, 'Šuštarjeva kol. 7a', 'Srednja tehniška in poklicna šola Trbovlje', 'stps'),
(2, 'Gimnazijska cesta 11', 'Gimnazija in ekonomska srednja šola Trbovlje', 'gess'),
(3, 'Vegova ulica 4', 'Elektrotehniško-računalniška strokovna šola in gimnazija Ljubljana', 'vgl');

-- --------------------------------------------------------

--
-- Table structure for table `sola_has_oseba`
--

CREATE TABLE `sola_has_oseba` (
  `Sola_idSola` int(11) NOT NULL,
  `Oseba_idOseba` int(11) NOT NULL,
  `razrednik` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sola_has_oseba`
--

INSERT INTO `sola_has_oseba` (`Sola_idSola`, `Oseba_idOseba`, `razrednik`) VALUES
(1, 870, NULL),
(1, 871, NULL),
(1, 872, NULL),
(1, 873, NULL),
(1, 874, NULL),
(1, 875, NULL),
(1, 876, NULL),
(1, 877, NULL),
(1, 878, NULL),
(1, 879, NULL),
(1, 880, NULL),
(1, 881, NULL),
(1, 882, NULL),
(1, 883, NULL),
(1, 884, NULL),
(1, 885, NULL),
(1, 886, NULL),
(1, 887, NULL),
(1, 888, NULL),
(1, 889, NULL),
(1, 890, NULL),
(1, 891, NULL),
(1, 892, NULL),
(1, 893, NULL),
(1, 894, NULL),
(1, 895, NULL),
(1, 896, NULL),
(1, 897, NULL),
(1, 898, NULL),
(1, 899, NULL),
(1, 900, NULL),
(1, 901, NULL),
(1, 902, NULL),
(1, 903, NULL),
(1, 904, NULL),
(1, 905, NULL),
(1, 906, NULL),
(1, 907, NULL),
(1, 908, NULL),
(1, 909, NULL),
(1, 910, NULL),
(1, 911, NULL),
(1, 956, 0),
(1, 957, 2),
(1, 958, 3),
(1, 959, 4),
(1, 960, 5),
(1, 961, 6),
(1, 962, 7),
(1, 963, 8),
(1, 964, NULL),
(1, 965, NULL),
(1, 966, NULL),
(1, 967, NULL),
(1, 968, NULL),
(1, 969, NULL),
(1, 970, NULL),
(1, 971, NULL),
(1, 972, NULL),
(1, 977, NULL),
(1, 978, NULL),
(1, 979, NULL),
(1, 980, NULL),
(1, 981, NULL),
(1, 982, NULL),
(1, 983, NULL),
(1, 984, NULL),
(1, 985, NULL),
(1, 986, NULL),
(1, 987, NULL),
(1, 988, NULL),
(1, 989, NULL),
(1, 990, NULL),
(1, 991, NULL),
(1, 992, NULL),
(1, 1000, 1),
(2, 912, NULL),
(2, 913, NULL),
(2, 914, NULL),
(2, 915, NULL),
(2, 916, NULL),
(2, 917, NULL),
(2, 918, NULL),
(2, 919, NULL),
(2, 920, NULL),
(2, 921, NULL),
(2, 922, NULL),
(2, 923, NULL),
(2, 924, NULL),
(2, 925, NULL),
(2, 926, NULL),
(2, 927, NULL),
(2, 928, NULL),
(2, 929, NULL),
(2, 930, NULL),
(2, 931, NULL),
(2, 932, NULL),
(2, 933, NULL),
(2, 934, NULL),
(2, 935, NULL),
(2, 936, NULL),
(2, 937, NULL),
(2, 938, NULL),
(2, 939, NULL),
(2, 940, NULL),
(2, 941, NULL),
(2, 942, NULL),
(2, 943, NULL),
(2, 973, NULL),
(2, 974, 17),
(2, 975, 27),
(2, 976, 30),
(3, 944, NULL),
(3, 945, NULL),
(3, 946, NULL),
(3, 947, NULL),
(3, 948, NULL),
(3, 949, NULL),
(3, 950, NULL),
(3, 951, NULL),
(3, 952, NULL),
(3, 953, NULL),
(3, 954, NULL),
(3, 955, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dejavnost`
--
ALTER TABLE `dejavnost`
  ADD PRIMARY KEY (`idDejavnost`);

--
-- Indexes for table `letnik`
--
ALTER TABLE `letnik`
  ADD PRIMARY KEY (`idLetnik`),
  ADD KEY `fk_Letnik_Program1_idx` (`Program_idProgram`);

--
-- Indexes for table `oddelek`
--
ALTER TABLE `oddelek`
  ADD PRIMARY KEY (`idOddelek`),
  ADD KEY `fk_Oddelek_Letnik1_idx` (`Letnik_idLetnik`);

--
-- Indexes for table `oseba`
--
ALTER TABLE `oseba`
  ADD PRIMARY KEY (`idOseba`),
  ADD KEY `fk_Oseba_Oddelek1_idx` (`Oddelek_idOddelek`);

--
-- Indexes for table `oseba_has_dejavnost`
--
ALTER TABLE `oseba_has_dejavnost`
  ADD PRIMARY KEY (`Oseba_idOseba`,`Dejavnost_idDejavnost`),
  ADD KEY `fk_Oseba_has_Dejavnost_Dejavnost1_idx` (`Dejavnost_idDejavnost`),
  ADD KEY `fk_Oseba_has_Dejavnost_Oseba1_idx` (`Oseba_idOseba`);

--
-- Indexes for table `prisotnost`
--
ALTER TABLE `prisotnost`
  ADD PRIMARY KEY (`idPrisotnost_dan`),
  ADD KEY `fk_Prisotnost_Oseba_has_Dejavnost1_idx` (`idOseba`,`idDejavnost`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`idProgram`),
  ADD KEY `fk_Program_Sola1_idx` (`Sola_idSola`);

--
-- Indexes for table `sola`
--
ALTER TABLE `sola`
  ADD PRIMARY KEY (`idSola`);

--
-- Indexes for table `sola_has_oseba`
--
ALTER TABLE `sola_has_oseba`
  ADD PRIMARY KEY (`Sola_idSola`,`Oseba_idOseba`),
  ADD KEY `fk_Sola_has_Oseba_Oseba1_idx` (`Oseba_idOseba`),
  ADD KEY `fk_Sola_has_Oseba_Sola1_idx` (`Sola_idSola`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dejavnost`
--
ALTER TABLE `dejavnost`
  MODIFY `idDejavnost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `letnik`
--
ALTER TABLE `letnik`
  MODIFY `idLetnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `oddelek`
--
ALTER TABLE `oddelek`
  MODIFY `idOddelek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `oseba`
--
ALTER TABLE `oseba`
  MODIFY `idOseba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `prisotnost`
--
ALTER TABLE `prisotnost`
  MODIFY `idPrisotnost_dan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=608;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `idProgram` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sola`
--
ALTER TABLE `sola`
  MODIFY `idSola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `letnik`
--
ALTER TABLE `letnik`
  ADD CONSTRAINT `fk_Letnik_Program1` FOREIGN KEY (`Program_idProgram`) REFERENCES `program` (`idProgram`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oddelek`
--
ALTER TABLE `oddelek`
  ADD CONSTRAINT `fk_Oddelek_Letnik1` FOREIGN KEY (`Letnik_idLetnik`) REFERENCES `letnik` (`idLetnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oseba`
--
ALTER TABLE `oseba`
  ADD CONSTRAINT `fk_Oseba_Oddelek1` FOREIGN KEY (`Oddelek_idOddelek`) REFERENCES `oddelek` (`idOddelek`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oseba_has_dejavnost`
--
ALTER TABLE `oseba_has_dejavnost`
  ADD CONSTRAINT `fk_Oseba_has_Dejavnost_Dejavnost1` FOREIGN KEY (`Dejavnost_idDejavnost`) REFERENCES `dejavnost` (`idDejavnost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Oseba_has_Dejavnost_Oseba1` FOREIGN KEY (`Oseba_idOseba`) REFERENCES `oseba` (`idOseba`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prisotnost`
--
ALTER TABLE `prisotnost`
  ADD CONSTRAINT `fk_Prisotnost_Oseba_has_Dejavnost1` FOREIGN KEY (`idOseba`,`idDejavnost`) REFERENCES `oseba_has_dejavnost` (`Oseba_idOseba`, `Dejavnost_idDejavnost`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `fk_Program_Sola1` FOREIGN KEY (`Sola_idSola`) REFERENCES `sola` (`idSola`) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `zakljucitevDejavnosti` ON SCHEDULE EVERY 1 DAY STARTS '2021-04-19 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE dejavnost SET stanje=2
    WHERE datumKonec < CURDATE()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
