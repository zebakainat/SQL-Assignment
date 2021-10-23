-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Oct 20, 2021 at 09:59 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edyoda`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Cnum` int(11) NOT NULL,
  `Cname` varchar(60) DEFAULT NULL,
  `City` varchar(60) NOT NULL,
  `Snum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Cnum`, `Cname`, `City`, `Snum`) VALUES
(2001, 'Hoffman', 'London', 1001),
(2002, 'Giovanni', 'Rome', 1003),
(2003, 'Liu', 'Sanjose', 1002),
(2004, 'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2007, 'Pereira', 'Rome', 1004),
(2008, 'Cisneros', 'Sanjose', 1007);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Onum` int(11) NOT NULL,
  `Amt` float DEFAULT NULL,
  `Odate` date DEFAULT NULL,
  `Cnum` int(11) DEFAULT NULL,
  `Snum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Onum`, `Amt`, `Odate`, `Cnum`, `Snum`) VALUES
(3001, 18.69, '1990-10-03', 2008, 1007),
(3002, 1900.1, '1990-10-03', 2007, 1004),
(3003, 767.19, '1990-10-03', 2001, 1001),
(3005, 5160.45, '1990-10-03', 2003, 1002),
(3006, 1098.16, '1990-10-03', 2008, 1007),
(3007, 75.75, '1990-10-04', 2004, 1002),
(3008, 4273, '1990-10-05', 2006, 1001),
(3009, 1713.23, '1990-10-04', 2002, 1003),
(3010, 1309.95, '1990-10-06', 2004, 1002),
(3011, 9891.88, '1990-10-06', 2006, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `salespeople`
--

CREATE TABLE `salespeople` (
  `Snum` int(11) NOT NULL,
  `Sname` varchar(60) NOT NULL,
  `City` varchar(60) NOT NULL,
  `Comm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salespeople`
--

INSERT INTO `salespeople` (`Snum`, `Sname`, `City`, `Comm`) VALUES
(1001, 'Peel', 'London', 12),
(1002, 'Serres', 'Sanjose', 13),
(1003, 'Axelrod', 'Newyork', 10),
(1004, 'Motika', 'London', 11),
(1007, 'Rifkin', 'Barcelona', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Cnum`),
  ADD KEY `Snum` (`Snum`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Onum`),
  ADD KEY `Cnum` (`Cnum`),
  ADD KEY `Snum` (`Snum`);

--
-- Indexes for table `salespeople`
--
ALTER TABLE `salespeople`
  ADD PRIMARY KEY (`Snum`),
  ADD UNIQUE KEY `Sname` (`Sname`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`Snum`) REFERENCES `salespeople` (`Snum`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Cnum`) REFERENCES `customers` (`Cnum`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Snum`) REFERENCES `salespeople` (`Snum`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
