-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2023 at 05:47 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homework3`
--

-- --------------------------------------------------------

--
-- Table structure for table `airplanes`
--

CREATE TABLE `airplanes` (
  `tail_number` int(11) NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `model_number` varchar(100) NOT NULL,
  `seat_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airplanes`
--

INSERT INTO `airplanes` (`tail_number`, `manufacturer`, `model_number`, `seat_count`) VALUES
(321, 'AA', '3441', 100),
(322, 'BB', '3442', 100),
(324, 'BB', '3442', 100),
(325, 'BB', '3442', 100);

-- --------------------------------------------------------

--
-- Stand-in structure for view `avg_t_price`
-- (See below for the actual view)
--
CREATE TABLE `avg_t_price` (
`AVG(price)` double
);

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flight_id` int(11) NOT NULL,
  `tail_number` int(11) DEFAULT NULL,
  `flight_crew_id` int(11) DEFAULT NULL,
  `date_of_flight` date NOT NULL,
  `origin` char(3) NOT NULL,
  `departure_time` time NOT NULL,
  `destination` char(3) NOT NULL,
  `arrival_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_id`, `tail_number`, `flight_crew_id`, `date_of_flight`, `origin`, `departure_time`, `destination`, `arrival_time`) VALUES
(556, 321, 554, '2021-01-12', 'SAN', '20:51:44', 'DCA', '20:52:45'),
(1221, 325, 554, '2021-11-17', 'GGG', '20:53:37', 'SAN', '20:53:21'),
(5566, 321, 554, '2021-02-24', 'TCM', '20:52:52', 'DCA', '20:52:53');

-- --------------------------------------------------------

--
-- Table structure for table `flight_crews`
--

CREATE TABLE `flight_crews` (
  `flight_crew_id` int(11) NOT NULL,
  `flight_crew_name` varchar(100) NOT NULL,
  `crew_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_crews`
--

INSERT INTO `flight_crews` (`flight_crew_id`, `flight_crew_name`, `crew_count`) VALUES
(554, 'All-Stars', 321),
(555, 'All-Stars2', 11),
(56456, 'esgthdrshrsyhtdh', 11);

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE `mechanics` (
  `mechanic_id` int(11) NOT NULL,
  `mechanic_name` varchar(100) NOT NULL,
  `mechanic_speciality` varchar(100) DEFAULT NULL,
  `mechanice_phone_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`mechanic_id`, `mechanic_name`, `mechanic_speciality`, `mechanice_phone_number`) VALUES
(1, 'Hank Smith', 'Being Awesome', '1234567890'),
(2, 'Eric G-Man', 'stuff', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(11) NOT NULL,
  `passenger_name` varchar(100) NOT NULL,
  `passenger_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `passenger_name`, `passenger_email`) VALUES
(4444, 'John Smith', 'aaaa'),
(4445, 'Sohn Jmith', 'aaaa'),
(4447, 'John Smith', 'aaaa');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_number` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `flight_id` int(11) DEFAULT NULL,
  `price` float NOT NULL DEFAULT 200
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_number`, `passenger_id`, `flight_id`, `price`) VALUES
(1, 4445, 1221, 200),
(2, 4444, 5566, 200),
(3, 4445, 1221, 600),
(4, 4445, 5566, 400);

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `work_order_id` int(11) NOT NULL,
  `tail_number` int(11) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `work_orders`
--

INSERT INTO `work_orders` (`work_order_id`, `tail_number`, `mechanic_id`, `description`, `status`) VALUES
(1, 322, 1, 'blah blah blah', 'pending'),
(2, 322, 1, 'awdadawdawd', 'pending'),
(3, 324, 1, 'aefafdac', 'pending'),
(4, 324, 1, 'fvmfmfmvfmv', 'complete'),
(5, 322, 2, 'awdawdawdadw', 'completed');

-- --------------------------------------------------------

--
-- Structure for view `avg_t_price`
--
DROP TABLE IF EXISTS `avg_t_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `avg_t_price`  AS SELECT avg(`tickets`.`price`) AS `AVG(price)` FROM `tickets` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airplanes`
--
ALTER TABLE `airplanes`
  ADD PRIMARY KEY (`tail_number`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`),
  ADD UNIQUE KEY `departure_time` (`departure_time`),
  ADD UNIQUE KEY `arrival_time` (`arrival_time`),
  ADD KEY `tail_number` (`tail_number`),
  ADD KEY `flight_crew_id` (`flight_crew_id`);

--
-- Indexes for table `flight_crews`
--
ALTER TABLE `flight_crews`
  ADD PRIMARY KEY (`flight_crew_id`);

--
-- Indexes for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`mechanic_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_number`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`work_order_id`),
  ADD KEY `tail_number` (`tail_number`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flight_crews`
--
ALTER TABLE `flight_crews`
  MODIFY `flight_crew_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56457;

--
-- AUTO_INCREMENT for table `mechanics`
--
ALTER TABLE `mechanics`
  MODIFY `mechanic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4448;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `work_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`tail_number`) REFERENCES `airplanes` (`tail_number`) ON DELETE SET NULL,
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`flight_crew_id`) REFERENCES `flight_crews` (`flight_crew_id`) ON DELETE SET NULL;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE SET NULL;

--
-- Constraints for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD CONSTRAINT `work_orders_ibfk_1` FOREIGN KEY (`tail_number`) REFERENCES `airplanes` (`tail_number`) ON DELETE SET NULL,
  ADD CONSTRAINT `work_orders_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`mechanic_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
