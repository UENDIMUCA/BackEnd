-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2024 at 07:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `book` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `fullname`, `email`, `phone`, `book`, `description`) VALUES
(2, 'alebu', 'abushi21@epoka.edu.al', '+355696533853', 'Twilight', ' vsv sdsdcsdcfsdcsdfsdcdcadcads'),
(3, 'alebu', 'abushi21@epoka.edu.al', '+355696533853', 'Twilight', 'wdvsvrveffvgrnnytnjtyj'),
(4, 'alebu', 'abushi21@epoka.edu.al', '+355696533853', 'Twilight', 'hellooooooooooooooooooooooooooooooooooooooooooooo'),
(5, 'eraasaasdas', 'aaaaa22@epoka.edu.al', '+355696533853', 'Eclipse', 'iidaadaclax cdaxcmfodcfsdcfdsc;mfsdc;sdlcf'),
(6, 'ina', 'ina@epoka.edu.al', '+355696533853', 'Twilight', 'bcdjkacbskdcbskdcbds,jcbn,cb sd,kb sd,cds'),
(7, 'uendi', 'uendi@gmail.com', '+355696533853', 'Twilight', 'kfdgad;fggsdsgfksrg; dfewdogflew'),
(8, 'sara', 'sara@gmail.com', '+355674958672', 'Twilight', 'sGerdhfxv gserdfgvefd');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `ID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`ID`, `username`, `email`, `password`) VALUES
(12, 'UENDI', 'umuca21@epoka.edu.al', 'uendi123'),
(13, 'UENDI', 'uendi@admin.com', 'uedni123'),
(14, 'UENDI', 'mira@admin.com', 'mira123'),
(15, 'Werla', 'werla@admin.com', 'werla123'),
(16, 'uwend', 'kleo123@epoka.edu.al', 'aaaaaaaaaaaaaaaaa'),
(17, 'uendi22', 'kleo21@epoka.edu.al', 'klasu34'),
(18, 'uwend', 'abushi21@epoka.edu.al', 'dddddddddddd'),
(19, 'Sara', 'sara@admin.com', 'sara1234'),
(20, 'ssv', 'ffsfsf@epoka.edu.al', 'uendi123'),
(21, 'ana', 'ana@admin.com', 'ana1234'),
(22, 'hello', 'hello@admin.com', 'adi123'),
(23, 'Endro', 'endro@admin.com', 'endro123'),
(24, 'enkel', 'enkel@admin.com', 'enkel123'),
(25, 'STELA', 'stela@admin.com', 'stela123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
