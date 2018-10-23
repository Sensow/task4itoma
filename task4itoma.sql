-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018 m. Spa 23 d. 22:02
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task4itoma`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `number` varchar(20) NOT NULL,
  `year_made` date NOT NULL,
  `model` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `cars`
--

INSERT INTO `cars` (`id`, `number`, `year_made`, `model`) VALUES
(1, 'ARP 567', '1996-10-18', 'Alfa Romeo 158'),
(2, 'CSV 324', '2000-10-16', 'BMW 328'),
(3, 'FFF 432', '2001-10-26', 'Honda Civic'),
(4, 'SBC 965', '2005-10-19', 'BMW i3'),
(5, 'LMF 343', '1998-10-25', 'Suzuki Cappuccino'),
(6, 'FAF 434', '2002-10-16', 'Fiat 502'),
(7, 'KSA 543', '1999-10-25', 'Fiat Brevetti'),
(8, 'GLC 234', '1994-10-25', 'Ford Escort'),
(9, 'VVV 375', '1997-10-25', 'Ford Focus'),
(10, 'HJJ 953', '2003-10-16', 'Toyota 2000GT'),
(11, 'LKL 329', '2005-10-16', ' Toyota Celica');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `car_management`
--

CREATE TABLE `car_management` (
  `id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `segments_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `car_management`
--

INSERT INTO `car_management` (`id`, `cars_id`, `segments_id`, `user_id`, `date_from`, `date_to`) VALUES
(1, 1, NULL, 1, '2018-10-23', '2019-09-09'),
(2, 2, 1, NULL, '2018-10-01', '2019-09-09'),
(3, 8, 3, NULL, '2018-10-18', '2019-09-09'),
(4, 6, NULL, 4, '2018-10-09', '2019-09-09'),
(5, 3, 2, NULL, '2018-10-17', '2019-09-09'),
(6, 8, 1, NULL, '2018-10-01', '2019-09-09'),
(7, 10, 1, NULL, '2018-09-01', '2019-09-09'),
(8, 7, NULL, 2, '2018-10-01', '2019-09-09'),
(9, 11, NULL, 5, '2018-10-23', '2019-09-09'),
(10, 5, 1, NULL, '2018-10-18', '2019-09-09'),
(11, 4, NULL, 6, '2018-10-09', '2019-09-09'),
(12, 9, NULL, 2, '2018-10-10', '2019-09-09'),
(13, 1, NULL, 5, '2009-08-01', '2019-09-09'),
(14, 4, 2, NULL, '2018-10-01', '2018-10-02'),
(15, 3, NULL, 4, '2018-10-01', '2018-10-03'),
(16, 3, NULL, 1, '2018-09-02', '2018-09-12'),
(18, 10, NULL, 1, '2016-10-18', '2017-10-18');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `car_status`
--

CREATE TABLE `car_status` (
  `id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `car_status`
--

INSERT INTO `car_status` (`id`, `cars_id`, `status_id`, `date_from`, `date_to`) VALUES
(1, 1, 3, '2018-09-03', '2019-09-09'),
(2, 2, 5, '2009-08-01', '2019-09-09'),
(3, 6, 4, '2009-08-01', '2019-09-09'),
(4, 3, 2, '2009-08-01', '2019-09-09'),
(5, 8, 3, '2009-08-01', '2019-09-09'),
(6, 10, 1, '2009-08-01', '2019-09-09'),
(7, 7, 5, '2009-08-01', '2019-09-09'),
(8, 11, 2, '2009-08-01', '2019-09-09'),
(9, 5, 2, '2009-08-01', '2019-09-09'),
(10, 4, 4, '2009-08-01', '2019-09-09'),
(11, 9, 1, '2009-08-01', '2019-09-09');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `segments`
--

CREATE TABLE `segments` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `segments`
--

INSERT INTO `segments` (`id`, `name`) VALUES
(1, 'Alpha'),
(2, 'Beta'),
(3, 'Gama');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `parent_id`) VALUES
(1, 'Gera', 0),
(2, 'Vidutine', 0),
(3, 'Nauja', 0),
(4, 'Sugedus', 0),
(5, 'Labai gera', 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `segment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `users`
--

INSERT INTO `users` (`id`, `name`, `segment_id`) VALUES
(1, 'Edvinas Guzulaitis', 1),
(2, 'Petras Petraitis', 1),
(3, 'Jonas Jonaitis', 3),
(4, 'Linas Linaitis', 2),
(5, 'Jurgis Jurgaitis', 2),
(6, 'Lukas Lukaitis', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_management`
--
ALTER TABLE `car_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_id` (`cars_id`),
  ADD KEY `segments_id` (`segments_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `car_status`
--
ALTER TABLE `car_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_id` (`cars_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segment_id` (`segment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `car_management`
--
ALTER TABLE `car_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `car_status`
--
ALTER TABLE `car_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `car_management`
--
ALTER TABLE `car_management`
  ADD CONSTRAINT `car_management_ibfk_1` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `car_management_ibfk_2` FOREIGN KEY (`segments_id`) REFERENCES `segments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `car_management_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Apribojimai lentelei `car_status`
--
ALTER TABLE `car_status`
  ADD CONSTRAINT `car_status_ibfk_1` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `car_status_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE;

--
-- Apribojimai lentelei `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `segments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
