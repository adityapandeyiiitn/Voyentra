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
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `Hotel_ID` varchar(10) NOT NULL,
  `Hotel_name` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Rating` decimal(2,1) NOT NULL,
  `Price_per_night` int(11) NOT NULL,
  `Rooms_available` int(11) NOT NULL,
  `Room_type` varchar(30) NOT NULL,
  `Amenities` text NOT NULL,
  `Checkin_time` time NOT NULL,
  `Checkout_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`Hotel_ID`, `Hotel_name`, `City`, `Rating`, `Price_per_night`, `Rooms_available`, `Room_type`, `Amenities`, `Checkin_time`, `Checkout_time`) VALUES
('H100', 'Elite Residency Goa', 'Goa', 4.1, 9390, 99, 'Double', 'Restaurant,Parking,Pool,WiFi,Breakfast', '12:00:00', '12:00:00'),
('H101', 'Elite Residency Delhi', 'Delhi', 4.9, 10455, 78, 'Double', 'WiFi,Restaurant,Bar,Gym,Pool,Spa', '12:00:00', '11:00:00'),
('H102', 'Urban Nest Chennai', 'Chennai', 4.5, 24286, 10, 'Single', 'Pool,Parking,Airport Shuttle', '14:00:00', '12:00:00'),
('H103', 'Sunrise Hotel Chennai', 'Chennai', 4.7, 8778, 98, 'Deluxe', 'WiFi,Parking,Airport Shuttle,Gym,Bar,Restaurant', '13:00:00', '10:00:00'),
('H104', 'Grand Palace New York', 'New York', 3.5, 8155, 42, 'Double', 'Gym,Restaurant,Parking', '15:00:00', '12:00:00'),
('H105', 'Urban Nest Dubai', 'Dubai', 4.9, 14382, 100, 'Double', 'Gym,Bar,Breakfast', '14:00:00', '12:00:00'),
('H106', 'Urban Nest Kolkata', 'Kolkata', 4.8, 18932, 97, 'Suite', 'Spa,WiFi,Breakfast,Airport Shuttle', '12:00:00', '11:00:00'),
('H107', 'Ocean View Bangkok', 'Bangkok', 4.5, 19174, 9, 'Suite', 'Spa,Airport Shuttle,Restaurant,Parking', '15:00:00', '12:00:00'),
('H108', 'Elite Residency Jaipur', 'Jaipur', 4.5, 23676, 52, 'Double', 'Spa,WiFi,Restaurant,Airport Shuttle,Parking,Pool', '12:00:00', '10:00:00'),
('H109', 'Comfort Suites New York', 'New York', 5.0, 2681, 23, 'Double', 'Restaurant,Gym,Bar,Breakfast,Spa,Pool', '12:00:00', '11:00:00'),
('H110', 'Sunrise Hotel Kolkata', 'Kolkata', 4.5, 18803, 44, 'Deluxe', 'Bar,Restaurant,Pool,Parking,Airport Shuttle', '13:00:00', '12:00:00'),
('H111', 'Ocean View Bangalore', 'Bangalore', 4.2, 16275, 59, 'Suite', 'Restaurant,Breakfast,Pool,Airport Shuttle', '14:00:00', '12:00:00'),
('H112', 'Elite Residency New York', 'New York', 4.0, 12729, 41, 'Suite', 'Gym,WiFi,Breakfast,Pool,Restaurant', '14:00:00', '11:00:00'),
('H113', 'Ocean View Delhi', 'Delhi', 4.8, 3267, 83, 'Suite', 'Bar,Pool,Airport Shuttle', '12:00:00', '10:00:00'),
('H114', 'Urban Nest Paris', 'Paris', 4.8, 9759, 5, 'Single', 'Breakfast,Spa,Restaurant,Bar,Parking,WiFi', '15:00:00', '11:00:00'),
('H115', 'Grand Palace Hyderabad', 'Hyderabad', 3.0, 6937, 20, 'Single', 'Parking,WiFi,Gym,Pool', '12:00:00', '10:00:00'),
('H116', 'Grand Palace Goa', 'Goa', 4.7, 5247, 62, 'Suite', 'Gym,Restaurant,Parking,WiFi,Spa', '13:00:00', '11:00:00'),
('H117', 'Grand Palace Sydney', 'Sydney', 4.3, 6673, 64, 'Deluxe', 'Restaurant,Bar,Gym', '13:00:00', '12:00:00'),
('H118', 'Ocean View Hyderabad', 'Hyderabad', 4.2, 5520, 20, 'Double', 'WiFi,Gym,Spa,Restaurant,Pool,Parking', '14:00:00', '12:00:00'),
('H119', 'Skyline Hotel Bangkok', 'Bangkok', 4.3, 15683, 87, 'Suite', 'WiFi,Bar,Gym,Spa', '14:00:00', '11:00:00'),
('H120', 'Elite Residency Dubai', 'Dubai', 3.7, 24201, 76, 'Double', 'Bar,Pool,Airport Shuttle,Restaurant,Gym', '13:00:00', '10:00:00'),
('H121', 'Comfort Suites Dubai', 'Dubai', 4.2, 17222, 40, 'Double', 'Spa,Bar,Airport Shuttle', '14:00:00', '12:00:00'),
('H122', 'Comfort Suites Hyderabad', 'Hyderabad', 3.7, 7485, 10, 'Single', 'Pool,Breakfast,WiFi', '12:00:00', '10:00:00'),
('H123', 'Luxury Haven Jaipur', 'Jaipur', 4.1, 17453, 36, 'Single', 'Spa,Gym,Breakfast,Parking,Restaurant,Airport Shuttle', '14:00:00', '11:00:00'),
('H124', 'Elite Residency Sydney', 'Sydney', 3.1, 6366, 88, 'Single', 'Restaurant,Gym,Spa,Breakfast', '15:00:00', '12:00:00'),
('H125', 'Urban Nest Singapore', 'Singapore', 5.0, 5755, 24, 'Double', 'Pool,WiFi,Breakfast', '13:00:00', '11:00:00'),
('H126', 'City Inn Dubai', 'Dubai', 4.1, 11092, 14, 'Double', 'Pool,WiFi,Breakfast,Restaurant', '14:00:00', '12:00:00'),
('H127', 'Luxury Haven Hyderabad', 'Hyderabad', 3.0, 21151, 11, 'Deluxe', 'Parking,Airport Shuttle,Pool', '12:00:00', '12:00:00'),
('H128', 'Grand Palace Kolkata', 'Kolkata', 3.3, 17387, 76, 'Deluxe', 'Airport Shuttle,Pool,Gym,Restaurant', '13:00:00', '12:00:00'),
('H129', 'Skyline Hotel Bangalore', 'Bangalore', 4.9, 16806, 84, 'Single', 'Bar,Breakfast,Spa,Gym,Airport Shuttle', '12:00:00', '12:00:00'),
('H130', 'Luxury Haven Jaipur', 'Jaipur', 4.8, 12936, 63, 'Deluxe', 'Spa,Bar,Pool,Gym,Breakfast,Parking', '12:00:00', '12:00:00'),
('H131', 'Sunrise Hotel Delhi', 'Delhi', 4.5, 4507, 60, 'Double', 'Airport Shuttle,Bar,Pool,Parking', '12:00:00', '10:00:00'),
('H132', 'Luxury Haven Mumbai', 'Mumbai', 4.1, 5077, 60, 'Double', 'Parking,Airport Shuttle,Restaurant', '14:00:00', '12:00:00'),
('H133', 'Royal Stay Delhi', 'Delhi', 5.0, 9981, 54, 'Double', 'Gym,WiFi,Spa,Airport Shuttle,Bar,Breakfast', '14:00:00', '11:00:00'),
('H134', 'Elite Residency New York', 'New York', 4.5, 16084, 68, 'Single', 'Pool,Restaurant,Spa,Airport Shuttle', '12:00:00', '12:00:00'),
('H135', 'Royal Stay Sydney', 'Sydney', 3.4, 4095, 66, 'Suite', 'WiFi,Gym,Spa,Airport Shuttle,Pool,Bar', '14:00:00', '11:00:00'),
('H136', 'Royal Stay Sydney', 'Sydney', 3.7, 18777, 97, 'Double', 'WiFi,Restaurant,Gym,Bar,Parking,Airport Shuttle', '14:00:00', '11:00:00'),
('H137', 'Comfort Suites Mumbai', 'Mumbai', 3.7, 24906, 60, 'Double', 'Breakfast,Airport Shuttle,Bar,Restaurant,WiFi', '12:00:00', '11:00:00'),
('H138', 'Elite Residency London', 'London', 3.4, 12260, 27, 'Suite', 'Gym,Breakfast,Pool,Bar', '14:00:00', '12:00:00'),
('H139', 'Royal Stay Sydney', 'Sydney', 4.3, 3439, 53, 'Suite', 'Bar,Breakfast,Gym,Pool,Restaurant', '13:00:00', '11:00:00'),
('H140', 'Skyline Hotel Jaipur', 'Jaipur', 4.3, 2241, 62, 'Double', 'Spa,Restaurant,WiFi,Bar,Parking,Gym', '14:00:00', '10:00:00'),
('H141', 'Elite Residency Bangkok', 'Bangkok', 3.3, 9386, 36, 'Suite', 'Spa,WiFi,Restaurant,Pool,Breakfast', '12:00:00', '10:00:00'),
('H142', 'Skyline Hotel London', 'London', 4.3, 10769, 91, 'Deluxe', 'Breakfast,Restaurant,Spa', '12:00:00', '12:00:00'),
('H143', 'City Inn Sydney', 'Sydney', 3.5, 23649, 25, 'Suite', 'Restaurant,Bar,Pool,Gym', '12:00:00', '10:00:00'),
('H144', 'City Inn London', 'London', 4.6, 3597, 58, 'Double', 'Gym,Pool,Airport Shuttle', '14:00:00', '12:00:00'),
('H145', 'City Inn Bangalore', 'Bangalore', 4.7, 24646, 58, 'Single', 'Restaurant,Airport Shuttle,Gym,Breakfast,Parking', '12:00:00', '12:00:00'),
('H146', 'Sunrise Hotel Mumbai', 'Mumbai', 3.2, 19164, 50, 'Deluxe', 'Parking,Gym,Breakfast,Airport Shuttle', '13:00:00', '11:00:00'),
('H147', 'City Inn Mumbai', 'Mumbai', 4.4, 3213, 86, 'Deluxe', 'Pool,Breakfast,Spa,Bar', '13:00:00', '12:00:00'),
('H148', 'Skyline Hotel Bangkok', 'Bangkok', 4.6, 18903, 52, 'Suite', 'Airport Shuttle,Spa,Breakfast,Parking,Pool,Restaurant', '13:00:00', '10:00:00'),
('H149', 'Elite Residency Sydney', 'Sydney', 4.6, 12653, 97, 'Deluxe', 'Restaurant,Gym,Pool,Breakfast,Parking', '14:00:00', '12:00:00'),
('H150', 'Ocean View New York', 'New York', 3.8, 24479, 39, 'Single', 'Gym,Airport Shuttle,Bar', '13:00:00', '12:00:00'),
('H151', 'Urban Nest Paris', 'Paris', 4.8, 14374, 76, 'Suite', 'Spa,WiFi,Breakfast,Airport Shuttle,Restaurant,Gym', '13:00:00', '12:00:00'),
('H152', 'Ocean View Kolkata', 'Kolkata', 4.8, 12272, 46, 'Suite', 'Gym,WiFi,Bar,Airport Shuttle,Pool', '12:00:00', '12:00:00'),
('H153', 'Elite Residency Delhi', 'Delhi', 4.5, 21323, 7, 'Single', 'Pool,Spa,WiFi', '13:00:00', '10:00:00'),
('H154', 'Royal Stay Hyderabad', 'Hyderabad', 4.7, 22645, 29, 'Deluxe', 'Gym,Parking,Spa,WiFi,Bar', '12:00:00', '11:00:00'),
('H155', 'Luxury Haven Hyderabad', 'Hyderabad', 3.5, 8473, 21, 'Suite', 'Breakfast,Spa,Pool,WiFi', '13:00:00', '11:00:00'),
('H156', 'Royal Stay London', 'London', 3.4, 16421, 24, 'Single', 'Bar,Gym,Breakfast,Pool,Parking,Airport Shuttle', '15:00:00', '10:00:00'),
('H157', 'Comfort Suites Singapore', 'Singapore', 4.6, 8103, 21, 'Suite', 'WiFi,Airport Shuttle,Parking,Breakfast,Pool,Gym', '14:00:00', '10:00:00'),
('H158', 'Comfort Suites Singapore', 'Singapore', 4.2, 15576, 39, 'Double', 'Bar,WiFi,Breakfast', '13:00:00', '12:00:00'),
('H159', 'Grand Palace Goa', 'Goa', 4.2, 10225, 75, 'Single', 'WiFi,Breakfast,Parking', '14:00:00', '10:00:00'),
('H160', 'City Inn Delhi', 'Delhi', 3.1, 20103, 79, 'Suite', 'Pool,Restaurant,Airport Shuttle,WiFi,Parking,Spa', '15:00:00', '12:00:00'),
('H161', 'Skyline Hotel Singapore', 'Singapore', 3.8, 21638, 80, 'Deluxe', 'WiFi,Restaurant,Spa,Bar,Breakfast,Gym', '15:00:00', '11:00:00'),
('H162', 'Skyline Hotel Goa', 'Goa', 4.2, 18880, 93, 'Deluxe', 'Breakfast,Airport Shuttle,Restaurant,Gym,Parking', '14:00:00', '10:00:00'),
('H163', 'Luxury Haven London', 'London', 3.2, 5007, 68, 'Deluxe', 'Parking,Airport Shuttle,Breakfast', '14:00:00', '12:00:00'),
('H164', 'Royal Stay Paris', 'Paris', 3.6, 16859, 91, 'Double', 'WiFi,Restaurant,Spa,Gym', '14:00:00', '12:00:00'),
('H165', 'Urban Nest Hyderabad', 'Hyderabad', 3.4, 9939, 54, 'Double', 'Parking,Spa,Airport Shuttle,Breakfast,WiFi', '12:00:00', '11:00:00'),
('H166', 'City Inn Sydney', 'Sydney', 3.9, 14649, 42, 'Single', 'Pool,Bar,Gym,Spa,Parking', '14:00:00', '11:00:00'),
('H167', 'Ocean View Hyderabad', 'Hyderabad', 5.0, 9514, 45, 'Single', 'Pool,Restaurant,Breakfast', '13:00:00', '12:00:00'),
('H168', 'Urban Nest Goa', 'Goa', 4.2, 9846, 82, 'Double', 'WiFi,Pool,Gym', '13:00:00', '10:00:00'),
('H169', 'Urban Nest London', 'London', 3.9, 8191, 93, 'Single', 'WiFi,Parking,Pool,Breakfast,Bar,Spa', '13:00:00', '10:00:00'),
('H170', 'Sunrise Hotel Dubai', 'Dubai', 4.5, 16962, 96, 'Suite', 'Spa,Breakfast,Gym,WiFi,Pool', '14:00:00', '10:00:00'),
('H171', 'City Inn Delhi', 'Delhi', 4.5, 5370, 56, 'Suite', 'Gym,Pool,Restaurant,WiFi', '12:00:00', '12:00:00'),
('H172', 'Ocean View Mumbai', 'Mumbai', 4.1, 7204, 9, 'Suite', 'Parking,Gym,WiFi', '12:00:00', '12:00:00'),
('H173', 'Luxury Haven Chennai', 'Chennai', 4.2, 5621, 72, 'Double', 'Parking,Airport Shuttle,Breakfast,Restaurant,Spa', '13:00:00', '11:00:00'),
('H174', 'Skyline Hotel Chennai', 'Chennai', 4.1, 23734, 60, 'Deluxe', 'WiFi,Restaurant,Gym,Airport Shuttle', '13:00:00', '10:00:00'),
('H175', 'Ocean View Paris', 'Paris', 4.3, 21234, 65, 'Suite', 'WiFi,Gym,Restaurant', '13:00:00', '12:00:00'),
('H176', 'City Inn Dubai', 'Dubai', 3.4, 20684, 91, 'Single', 'Breakfast,WiFi,Spa,Restaurant,Gym', '12:00:00', '10:00:00'),
('H177', 'Elite Residency London', 'London', 4.1, 13793, 14, 'Single', 'Restaurant,Breakfast,WiFi,Parking', '12:00:00', '11:00:00'),
('H178', 'Grand Palace Singapore', 'Singapore', 3.0, 23857, 94, 'Suite', 'Parking,Bar,Airport Shuttle', '14:00:00', '12:00:00'),
('H179', 'Royal Stay Kolkata', 'Kolkata', 3.0, 4051, 11, 'Single', 'Restaurant,Airport Shuttle,Breakfast', '13:00:00', '12:00:00'),
('H180', 'Comfort Suites Goa', 'Goa', 4.8, 8537, 66, 'Suite', 'WiFi,Breakfast,Restaurant', '14:00:00', '10:00:00'),
('H181', 'Grand Palace Bangalore', 'Bangalore', 4.2, 20804, 98, 'Deluxe', 'Pool,Breakfast,Gym', '15:00:00', '10:00:00'),
('H182', 'Elite Residency Paris', 'Paris', 4.0, 16904, 31, 'Deluxe', 'Pool,WiFi,Airport Shuttle', '15:00:00', '12:00:00'),
('H183', 'Luxury Haven Dubai', 'Dubai', 4.5, 6466, 49, 'Suite', 'Bar,Restaurant,Gym,Breakfast,Spa', '14:00:00', '12:00:00'),
('H184', 'Comfort Suites Singapore', 'Singapore', 4.2, 4304, 85, 'Suite', 'Gym,Parking,Restaurant,WiFi,Bar,Airport Shuttle', '12:00:00', '11:00:00'),
('H185', 'Luxury Haven Jaipur', 'Jaipur', 4.9, 6668, 6, 'Single', 'Spa,Airport Shuttle,Pool', '15:00:00', '11:00:00'),
('H186', 'Grand Palace Chennai', 'Chennai', 4.1, 20880, 84, 'Deluxe', 'Restaurant,Airport Shuttle,Spa,Pool,Bar,WiFi', '15:00:00', '10:00:00'),
('H187', 'City Inn Bangalore', 'Bangalore', 3.8, 13016, 68, 'Single', 'Restaurant,Pool,WiFi', '13:00:00', '10:00:00'),
('H188', 'Ocean View Chennai', 'Chennai', 4.2, 7973, 49, 'Single', 'Bar,Spa,Gym,Pool,Parking', '14:00:00', '12:00:00'),
('H189', 'City Inn Bangkok', 'Bangkok', 3.6, 23235, 100, 'Suite', 'Pool,Parking,Gym,Restaurant,Spa', '12:00:00', '12:00:00'),
('H190', 'Elite Residency Mumbai', 'Mumbai', 4.5, 13792, 17, 'Deluxe', 'Parking,Pool,Restaurant,Airport Shuttle,Bar,Gym', '13:00:00', '12:00:00'),
('H191', 'Urban Nest Bangalore', 'Bangalore', 4.0, 4881, 73, 'Suite', 'Gym,Pool,Breakfast,Parking,Restaurant', '15:00:00', '11:00:00'),
('H192', 'Sunrise Hotel Delhi', 'Delhi', 3.2, 17250, 84, 'Suite', 'Restaurant,Bar,Parking,WiFi', '14:00:00', '11:00:00'),
('H193', 'Urban Nest London', 'London', 4.3, 20291, 11, 'Deluxe', 'Breakfast,Spa,Gym,Restaurant,Bar', '13:00:00', '10:00:00'),
('H194', 'Sunrise Hotel Bangalore', 'Bangalore', 3.4, 17627, 74, 'Deluxe', 'Pool,Airport Shuttle,Restaurant,Breakfast', '14:00:00', '10:00:00'),
('H195', 'Skyline Hotel Kolkata', 'Kolkata', 4.7, 9492, 41, 'Single', 'WiFi,Airport Shuttle,Spa,Restaurant,Pool,Bar', '12:00:00', '11:00:00'),
('H196', 'Urban Nest Bangalore', 'Bangalore', 3.2, 14324, 96, 'Double', 'Airport Shuttle,Breakfast,Pool,Gym', '14:00:00', '10:00:00'),
('H197', 'Comfort Suites Bangalore', 'Bangalore', 3.9, 18804, 5, 'Deluxe', 'Spa,WiFi,Parking,Airport Shuttle', '14:00:00', '12:00:00'),
('H198', 'Elite Residency Dubai', 'Dubai', 4.7, 4629, 91, 'Double', 'Parking,Spa,Pool,Gym,Airport Shuttle', '13:00:00', '12:00:00'),
('H199', 'Urban Nest New York', 'New York', 4.8, 24237, 80, 'Double', 'Bar,Gym,WiFi', '13:00:00', '11:00:00'),
('H200', 'Sunrise Hotel Dubai', 'Dubai', 3.3, 20314, 29, 'Suite', 'Gym,Restaurant,Pool,Bar,WiFi', '14:00:00', '11:00:00'),
('H201', 'Comfort Suites Kolkata', 'Kolkata', 4.1, 12447, 58, 'Deluxe', 'WiFi,Airport Shuttle,Parking,Breakfast,Restaurant', '15:00:00', '12:00:00'),
('H202', 'Royal Stay Bangkok', 'Bangkok', 3.6, 3274, 89, 'Single', 'Breakfast,Restaurant,Airport Shuttle,Parking', '15:00:00', '11:00:00'),
('H203', 'City Inn Bangalore', 'Bangalore', 4.0, 15482, 44, 'Double', 'Gym,Restaurant,Pool', '14:00:00', '12:00:00'),
('H204', 'Sunrise Hotel Dubai', 'Dubai', 4.3, 18528, 12, 'Deluxe', 'Spa,Airport Shuttle,Parking', '14:00:00', '10:00:00'),
('H205', 'Sunrise Hotel Sydney', 'Sydney', 3.3, 9088, 46, 'Deluxe', 'Parking,Spa,Bar,Airport Shuttle,WiFi', '12:00:00', '11:00:00'),
('H206', 'Comfort Suites Bangalore', 'Bangalore', 3.7, 6149, 8, 'Single', 'Bar,Breakfast,Gym,Spa', '15:00:00', '12:00:00'),
('H207', 'Urban Nest Dubai', 'Dubai', 3.2, 15778, 76, 'Single', 'WiFi,Gym,Pool,Restaurant,Breakfast', '14:00:00', '10:00:00'),
('H208', 'City Inn Delhi', 'Delhi', 4.2, 10921, 50, 'Suite', 'Breakfast,Gym,Bar,Restaurant,Parking', '13:00:00', '10:00:00'),
('H209', 'Luxury Haven Jaipur', 'Jaipur', 3.5, 7897, 29, 'Suite', 'Breakfast,Gym,Bar,Airport Shuttle,Parking', '12:00:00', '10:00:00'),
('H210', 'Luxury Haven Mumbai', 'Mumbai', 4.1, 9952, 29, 'Suite', 'Pool,WiFi,Gym,Bar', '15:00:00', '12:00:00'),
('H211', 'City Inn London', 'London', 3.2, 20408, 40, 'Deluxe', 'Bar,Spa,Pool,Breakfast', '12:00:00', '12:00:00'),
('H212', 'Urban Nest Dubai', 'Dubai', 4.7, 3938, 20, 'Deluxe', 'Bar,Airport Shuttle,Spa,Gym,Breakfast', '14:00:00', '10:00:00'),
('H213', 'Sunrise Hotel Bangkok', 'Bangkok', 3.2, 8166, 89, 'Suite', 'WiFi,Breakfast,Parking,Airport Shuttle,Gym,Spa', '15:00:00', '10:00:00'),
('H214', 'City Inn Dubai', 'Dubai', 3.8, 8917, 42, 'Single', 'Airport Shuttle,Bar,WiFi,Parking,Restaurant,Gym', '12:00:00', '12:00:00'),
('H215', 'Urban Nest Paris', 'Paris', 3.2, 13577, 40, 'Suite', 'Parking,Bar,Gym', '13:00:00', '10:00:00'),
('H216', 'Urban Nest Hyderabad', 'Hyderabad', 4.2, 15780, 95, 'Single', 'Pool,Restaurant,Parking,Bar', '12:00:00', '12:00:00'),
('H217', 'Luxury Haven Bangalore', 'Bangalore', 3.0, 12951, 95, 'Single', 'Pool,Spa,Airport Shuttle,Breakfast,Restaurant', '15:00:00', '11:00:00'),
('H218', 'Grand Palace Delhi', 'Delhi', 4.0, 10587, 93, 'Double', 'Airport Shuttle,Restaurant,Pool', '15:00:00', '11:00:00'),
('H219', 'Elite Residency Paris', 'Paris', 3.1, 9055, 91, 'Deluxe', 'Restaurant,Parking,Breakfast,Pool,Bar,Spa', '14:00:00', '12:00:00'),
('H301', 'Grand Palace Tokyo', 'Tokyo', 4.6, 18000, 35, 'Deluxe', 'WiFi,Pool,Gym,Spa,Breakfast', '14:00:00', '11:00:00'),
('H302', 'City Inn Tokyo', 'Tokyo', 4.2, 9500, 50, 'Single', 'WiFi,Breakfast,Parking', '13:00:00', '10:00:00'),
('H303', 'Sunrise Hotel Tokyo', 'Tokyo', 4.4, 12000, 28, 'Suite', 'WiFi,Gym,Restaurant,Airport Shuttle', '15:00:00', '11:00:00'),
('H304', 'Elite Residency Tokyo', 'Tokyo', 4.8, 22000, 20, 'Suite', 'WiFi,Pool,Spa,Bar,Restaurant', '14:00:00', '12:00:00'),
('H305', 'Urban Nest Tokyo', 'Tokyo', 4.1, 8000, 60, 'Double', 'WiFi,Parking,Breakfast', '12:00:00', '10:00:00'),
('H306', 'Ocean View Bali', 'Bali', 4.7, 15000, 40, 'Deluxe', 'WiFi,Pool,Spa,Bar,Beach Access', '14:00:00', '11:00:00'),
('H307', 'Luxury Haven Bali', 'Bali', 4.9, 25000, 15, 'Villa', 'WiFi,Private Pool,Spa,Butler Service', '15:00:00', '12:00:00'),
('H308', 'Comfort Suites Bali', 'Bali', 4.3, 9000, 55, 'Double', 'WiFi,Breakfast,Parking,Gym', '13:00:00', '11:00:00'),
('H309', 'Sunrise Hotel Bali', 'Bali', 4.5, 11000, 30, 'Suite', 'WiFi,Pool,Restaurant,Airport Shuttle', '14:00:00', '11:00:00'),
('H310', 'Royal Stay Bali', 'Bali', 4.2, 8500, 45, 'Single', 'WiFi,Breakfast,Parking', '12:00:00', '10:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`Hotel_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
