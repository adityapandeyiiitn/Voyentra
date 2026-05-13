-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2026 at 08:11 PM
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
-- Table structure for table `flight_payment`
--

CREATE TABLE `flight_payment` (
  `Flight_id` varchar(5) NOT NULL,
  `Costumer_name` varchar(50) NOT NULL,
  `Amount_paid` int(11) NOT NULL,
  `Payment_date` date NOT NULL,
  `Payment_time` int(11) NOT NULL,
  `Bank_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight_payment`
--

INSERT INTO `flight_payment` (`Flight_id`, `Costumer_name`, `Amount_paid`, `Payment_date`, `Payment_time`, `Bank_name`) VALUES
('F218', 'qwerty', 15135, '2026-04-19', 11, 'sbi'),
('F215', 'aaditya', 66172, '2026-04-19', 12, 'sbi'),
('F303', 'rajnish', 10737, '2026-04-19', 12, 'hdfc'),
('F359', 'poiuyt', 19228, '2026-04-19', 15, 'icici'),
('F642', 'gaurav', 22976, '2026-04-22', 16, 'pnb'),
('F513', 'Pavitra Prabhakar', 41033, '2026-04-22', 17, 'SBI'),
('F635', 'RIck Astley', 32970, '2026-04-22', 17, 'Swiss Bank');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
