-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 04:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waterbillingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `addbill`
--

CREATE TABLE `addbill` (
  `bill_id` int(11) NOT NULL,
  `client_id` int(255) NOT NULL,
  `prev_reading` int(255) NOT NULL,
  `present_reading` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `current_dateTime` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addbill`
--

INSERT INTO `addbill` (`bill_id`, `client_id`, `prev_reading`, `present_reading`, `price`, `current_dateTime`) VALUES
(4, 5, 90, 500, 41820, '2023-04-02 11:56:35.000000'),
(6, 1, 700, 800, 1000, '2023-04-02 12:43:59.000000'),
(7, 10, 150, 500, 35000, '2023-04-02 12:55:55.000000'),
(8, 10, 150, 50, -1000, '2023-04-02 12:57:02.000000'),
(13, 1, 700, 500, -2000, '2023-04-02 23:10:48.000000');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `image` text DEFAULT NULL,
  `last login` datetime NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `fullName`, `password`, `username`, `image`, `last login`, `email`) VALUES
(1, 'Bibek Bharati', 'admin', 'admin', NULL, '2023-03-19 13:11:35', 'bb22@gmai.com'),
(6, 'Ayush Kushma', 'ayush', 'kusma', 'image-kju2MgTZix.png', '0000-00-00 00:00:00', 'ayush@gmail.com'),
(7, 'Suman khatri', 'suman', 'suman', 'image-2Kl5YRH2m3.png', '0000-00-00 00:00:00', 'suman123@gmail.com'),
(9, 'Karuna Gurung', 'karuna', 'karuna', 'image-1FH91MYGKg.png', '0000-00-00 00:00:00', 'k123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `billing_details`
--

CREATE TABLE `billing_details` (
  `billing_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `billing_date` date NOT NULL,
  `billing_amount` decimal(10,2) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `fine_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `meter_code` int(11) NOT NULL,
  `meter_type` varchar(50) NOT NULL,
  `payment_status` tinyint(1) DEFAULT NULL COMMENT '1 paid \r\n0 not paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `firstname`, `lastname`, `address`, `contact`, `meter_code`, `meter_type`, `payment_status`) VALUES
(1, 'rama', 'Singh', '\"nagarkot,Bhaktapur\"', '9884059465', 9884, 'sandard', NULL),
(5, 'harilal', 'Bansa', '\"simala,nepal\"', '988405946', 12224, 'sandard', NULL),
(10, 'BIbek', 'Bharati', 'Bhaktapur', '9884059465', 96632, 'sandard', NULL),
(12, 'Kaaji', 'Bharati', 'Bhaktapur', '98562314569', 12345, 'classic', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addbill`
--
ALTER TABLE `addbill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `billing_details`
--
ALTER TABLE `billing_details`
  ADD PRIMARY KEY (`billing_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addbill`
--
ALTER TABLE `addbill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `billing_details`
--
ALTER TABLE `billing_details`
  MODIFY `billing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addbill`
--
ALTER TABLE `addbill`
  ADD CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `billing_details`
--
ALTER TABLE `billing_details`
  ADD CONSTRAINT `billing_details_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
