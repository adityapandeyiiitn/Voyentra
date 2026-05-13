-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2026 at 08:12 PM
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
-- Database: `voyentra`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotel_payment`
--

CREATE TABLE `hotel_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Hotel_ID` varchar(5) NOT NULL,
  `Costumer_name` varchar(50) NOT NULL,
  `Amount_paid` int(11) NOT NULL,
  `Payment_date` date NOT NULL,
  `Payment_time` time NOT NULL,
  `Bank_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_payment`
--

INSERT INTO `hotel_payment` (`Hotel_ID`, `Costumer_name`, `Amount_paid`, `Payment_date`, `Payment_time`, `Bank_name`) VALUES
('H215', 'qwerty', 3577, '2026-04-19', '11:46:55', 'sbi'),
('H114', 'Ishaan', 9759, '2026-04-19', '15:33:41', 'sbi'),
('H105', 'prince', 14382, '2026-04-22', '10:36:37', 'icici'),
('H105', 'Tony Stank', 71910, '2026-04-22', '17:12:15', 'bob'),
('H199', 'Rick Astley', 169659, '2026-04-22', '17:35:25', 'Swiss Bank'),
('H104', 'Ishaan Gupta', 57085, '2026-04-22', '17:36:09', 'Swiss Bank');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
