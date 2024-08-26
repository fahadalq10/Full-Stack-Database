-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2024 at 05:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `precinct`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCriminalHistory` (IN `criminalID` INT)   BEGIN
    SELECT c.crime_id, c.crime_class, c.charge_status
    FROM Crime c
    JOIN Involvement i ON c.crime_id = i.crime_id
    WHERE i.C_id = criminalID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appeal`
--

CREATE TABLE `appeal` (
  `crime_id` int(11) DEFAULT NULL,
  `file_date` date DEFAULT NULL,
  `hearing_date` date DEFAULT NULL,
  `appeal_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appeal`
--

INSERT INTO `appeal` (`crime_id`, `file_date`, `hearing_date`, `appeal_status`) VALUES
(3, '2023-07-03', '2023-08-03', 'Denied'),
(4, '2023-07-04', '2023-08-04', 'Pending'),
(5, '2023-07-05', '2023-08-05', 'Approved'),
(6, '2023-07-06', '2023-08-06', 'Denied'),
(7, '2023-07-07', '2023-08-07', 'Pending'),
(8, '2023-07-08', '2023-08-08', 'Approved'),
(10, '2023-07-10', '2023-08-10', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `crime_id` int(11) DEFAULT NULL,
  `case_type` varchar(50) DEFAULT NULL,
  `case_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`crime_id`, `case_type`, `case_code`) VALUES
(3, 'Type C', 'C1'),
(4, 'Type D', 'D1'),
(5, 'Type E', 'E1'),
(6, 'Type F', 'F1'),
(7, 'Type G', 'G1'),
(8, 'Type H', 'H1'),
(10, 'Type J', 'J1');

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE `charge` (
  `crime_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `charge_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `charge`
--

INSERT INTO `charge` (`crime_id`, `offense`, `charge_code`) VALUES
(3, 'Offense C', 'O3'),
(4, 'Offense D', 'O4'),
(5, 'Offense E', 'O5'),
(6, 'Offense F', 'O6'),
(7, 'Offense G', 'O7'),
(8, 'Offense H', 'O8'),
(10, 'Offense J', 'O10');

-- --------------------------------------------------------

--
-- Table structure for table `crime`
--

CREATE TABLE `crime` (
  `crime_id` int(11) NOT NULL,
  `crime_class` varchar(50) DEFAULT NULL,
  `date_ch` date DEFAULT NULL,
  `appeal_start` date DEFAULT NULL,
  `hearing_date` date DEFAULT NULL,
  `appeal_cutoff` date DEFAULT NULL,
  `arresting_officer` varchar(255) DEFAULT NULL,
  `crime_code` varchar(50) DEFAULT NULL,
  `fine` decimal(10,2) DEFAULT NULL,
  `court_fee` decimal(10,2) DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `payment_due` date DEFAULT NULL,
  `charge_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crime`
--

INSERT INTO `crime` (`crime_id`, `crime_class`, `date_ch`, `appeal_start`, `hearing_date`, `appeal_cutoff`, `arresting_officer`, `crime_code`, `fine`, `court_fee`, `paid`, `payment_due`, `charge_status`) VALUES
(0, 'Felony', '2024-04-23', '2024-04-23', '2024-04-23', '2024-04-23', 'Officer AZT', '037K9', 350.00, 125.00, 0.00, '2024-04-23', 'PENDING'),
(3, 'Misdemeanor', '2023-01-03', '2023-02-03', '2023-03-03', '2023-04-03', 'Officer C', 'GHI789', 300.00, 30.00, 0.00, '2023-05-03', 'Pending'),
(4, 'Misdemeanor', '2023-01-04', NULL, '2023-03-04', NULL, 'Officer D', 'JKL012', 150.00, 15.00, 165.00, '2023-04-04', 'Complete'),
(5, 'Misdemeanor', '2023-01-05', '2023-02-05', '2023-03-05', '2023-04-05', 'Officer E', 'MNO345', 250.00, 25.00, 275.00, '2023-05-05', 'Complete'),
(6, 'Misdemeanor', '2023-01-06', NULL, '2023-03-06', NULL, 'Officer F', 'PQR678', 120.00, 12.00, 132.00, '2023-04-06', 'Complete'),
(7, 'Felony', '2023-01-07', '2024-04-23', '2024-04-23', '2024-04-23', NULL, '8947', 99999999.99, 0.00, 5.00, '0000-00-00', ''),
(8, 'Misdemeanor', '2023-01-08', NULL, '2023-03-08', NULL, 'Officer H', 'VWX234', 130.00, 13.00, 143.00, '2023-04-08', 'Complete'),
(10, 'Misdemeanor', '2023-01-10', NULL, '2023-03-10', NULL, 'Officer J', 'BCD890', 110.00, 11.00, 121.00, '2023-04-10', 'Complete');

--
-- Triggers `crime`
--
DELIMITER $$
CREATE TRIGGER `AfterPaymentUpdate` BEFORE UPDATE ON `crime` FOR EACH ROW BEGIN
    IF NEW.paid >= (NEW.fine + NEW.court_fee) THEN
        SET NEW.charge_status = 'Complete';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_crime` BEFORE DELETE ON `crime` FOR EACH ROW BEGIN
    DELETE FROM Cases WHERE crime_id = OLD.crime_id;
    DELETE FROM Charge WHERE crime_id = OLD.crime_id;
    DELETE FROM Sentence WHERE crime_id = OLD.crime_id;
    DELETE FROM Appeal WHERE crime_id = OLD.crime_id;
    DELETE FROM Police_assign WHERE crime_id = OLD.crime_id;
    DELETE FROM Involvement WHERE crime_id = OLD.crime_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `criminal`
--

CREATE TABLE `criminal` (
  `C_id` int(11) NOT NULL,
  `criminal_name` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city_address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `vio_of_status` varchar(100) DEFAULT NULL,
  `probation_status` varchar(100) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criminal`
--

INSERT INTO `criminal` (`C_id`, `criminal_name`, `street_address`, `city_address`, `zipcode`, `vio_of_status`, `probation_status`, `alias`) VALUES
(1, 'John Doe', '123 Maple St', 'Anytown', '12345', 'Low', 'Yes', 'Johnny'),
(2, 'Jane Smith', '456 Pine St', 'Anytown', '23456', 'Medium', 'No', 'Janey'),
(3, 'Alice Johnson', '789 Oak St', 'Anytown', '34567', 'High', 'Yes', 'Ally'),
(4, 'Bob Brown', '101 Maple Ave', 'Anytown', '45678', 'Low', 'No', 'Bobby'),
(5, 'Carol White', '202 Pine Ave', 'Anytown', '56789', 'Medium', 'Yes', 'Carrie'),
(6, 'David Green', '303 Oak Ave', 'Anytown', '67890', 'High', 'No', 'Davey'),
(7, 'Eva Black', '404 Birch St', 'Anytown', '78901', 'Low', 'Yes', 'Evie'),
(8, 'Frank Grey', '505 Cedar St', 'Anytown', '89012', 'Medium', 'No', 'Frankie'),
(9, 'Grace Silver', '606 Elm St', 'Anytown', '90123', 'High', 'Yes', 'Gracie'),
(10, 'Henry Gold', '707 Palm St', 'Anytown', '01234', 'Low', 'No', 'Hank');

-- --------------------------------------------------------

--
-- Table structure for table `involvement`
--

CREATE TABLE `involvement` (
  `C_id` int(11) DEFAULT NULL,
  `crime_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `involvement`
--

INSERT INTO `involvement` (`C_id`, `crime_id`) VALUES
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `phone_no`
--

CREATE TABLE `phone_no` (
  `C_id` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phone_no`
--

INSERT INTO `phone_no` (`C_id`, `phone_number`) VALUES
(1, '555-0001'),
(2, '555-0002'),
(3, '555-0003'),
(4, '555-0004'),
(5, '555-0005'),
(6, '555-0006'),
(7, '555-0007'),
(8, '555-0008'),
(9, '555-0009'),
(10, '555-0010');

-- --------------------------------------------------------

--
-- Table structure for table `police_assign`
--

CREATE TABLE `police_assign` (
  `crime_id` int(11) DEFAULT NULL,
  `badge_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `police_assign`
--

INSERT INTO `police_assign` (`crime_id`, `badge_no`) VALUES
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `police_officer`
--

CREATE TABLE `police_officer` (
  `badge_no` int(11) NOT NULL,
  `officer_name` varchar(255) DEFAULT NULL,
  `precinct` varchar(50) DEFAULT NULL,
  `phone_num` varchar(20) DEFAULT NULL,
  `officer_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `police_officer`
--

INSERT INTO `police_officer` (`badge_no`, `officer_name`, `precinct`, `phone_num`, `officer_status`) VALUES
(1, 'Officer A', 'Precinct 1', '555-0101', 'Active'),
(2, 'Officer B', 'Precinct 2', '555-0202', 'Active'),
(3, 'Officer C', 'Precinct 3', '555-0303', 'Inactive'),
(4, 'Officer D', 'Precinct 4', '555-0404', 'Active'),
(5, 'Officer E', 'Precinct 5', '555-0505', 'Inactive'),
(6, 'Officer F', 'Precinct 6', '555-0606', 'Active'),
(7, 'Officer G', 'Precinct 7', '555-0707', 'Inactive'),
(8, 'Officer H', 'Precinct 8', '555-0808', 'Active'),
(9, 'Officer I', 'Precinct 9', '555-0909', 'Inactive'),
(10, 'Officer J', 'Precinct 10', '555-1010', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sentence`
--

CREATE TABLE `sentence` (
  `crime_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `num_violations` int(11) DEFAULT NULL,
  `sentence_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sentence`
--

INSERT INTO `sentence` (`crime_id`, `start_date`, `end_date`, `num_violations`, `sentence_type`) VALUES
(3, '2023-06-03', '2024-06-03', 0, 'Incarceration'),
(4, '2023-06-04', '2023-12-04', 2, 'Probation'),
(5, '2023-06-05', '2024-06-05', 0, 'Incarceration'),
(6, '2023-06-06', '2023-12-06', 1, 'Probation'),
(7, '2023-06-07', '2024-06-07', 0, 'Incarceration'),
(8, '2023-06-08', '2023-12-08', 2, 'Probation'),
(10, '2023-06-10', '2023-12-10', 1, 'Probation');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(123456, 'user', '12345', '0000-00-00 00:00:00'),
(123459, 'usertat', '$2y$10$JrEdo16Kd3Wni.udcRfon.cClaHoDvw3FycC4MhyxVSNgOPrYjQ7e', '2024-04-23 18:06:12'),
(123460, 'sabensalim', '$2y$10$LgBJW4MRiaE/iEMmu7wo9eUrdUjG.9jcir3j5.xjL3vaqNoHq4t8W', '2024-04-23 19:04:09'),
(123462, 'sabesnsalim', '$2y$10$vyfPCzQVTGuJQLispdY7tOO0CziQYKagBIox4zb6ScAof7z9vR.o6', '2024-04-23 19:05:03'),
(123464, 'inter', '$2y$10$3spsTome9W4z9RXJkrItSubeqI5/n680vww2eMtrES.E9MitB2qYy', '2024-04-23 19:07:31'),
(123465, 'saadat', '$2y$10$2xosICdDR7lcP6GOta/AWeHLrSpJ4ELsbvFc6UrlY7KD5UdxaDtse', '2024-04-23 19:07:59'),
(123466, 'pritam', '$2y$10$MBts/A9twycwVVpSvDGnGumq6fbycvyGxaq75hvaDMdVZKDWujOGe', '2024-04-23 19:33:49'),
(123467, 'srafin', '$2y$10$IkaUCgoFrO1Q5tMhn/La3e.OUZdsEbtJHcsAWd4rhHwHIrgHlhGZK', '2024-04-23 20:26:08'),
(123468, 'gang', '$2y$10$CxP/6jII88AfE5C53ilkHuo21E9JqDai3ckxl4zXOZKNP05rdd1R.', '2024-04-23 20:26:42'),
(123469, 'ivan', '$2y$10$Wj6p/atHxaVO6RgSMJqjE.pHQFxf2PQG9Vzv7U8y0ih2LA.yI23l.', '2024-04-23 21:59:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appeal`
--
ALTER TABLE `appeal`
  ADD KEY `crime_id` (`crime_id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD KEY `crime_id` (`crime_id`);

--
-- Indexes for table `charge`
--
ALTER TABLE `charge`
  ADD KEY `crime_id` (`crime_id`);

--
-- Indexes for table `crime`
--
ALTER TABLE `crime`
  ADD PRIMARY KEY (`crime_id`);

--
-- Indexes for table `criminal`
--
ALTER TABLE `criminal`
  ADD PRIMARY KEY (`C_id`);

--
-- Indexes for table `involvement`
--
ALTER TABLE `involvement`
  ADD KEY `C_id` (`C_id`),
  ADD KEY `crime_id` (`crime_id`);

--
-- Indexes for table `phone_no`
--
ALTER TABLE `phone_no`
  ADD KEY `C_id` (`C_id`);

--
-- Indexes for table `police_assign`
--
ALTER TABLE `police_assign`
  ADD KEY `crime_id` (`crime_id`),
  ADD KEY `badge_no` (`badge_no`);

--
-- Indexes for table `police_officer`
--
ALTER TABLE `police_officer`
  ADD PRIMARY KEY (`badge_no`);

--
-- Indexes for table `sentence`
--
ALTER TABLE `sentence`
  ADD KEY `crime_id` (`crime_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123470;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appeal`
--
ALTER TABLE `appeal`
  ADD CONSTRAINT `appeal_ibfk_1` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`);

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`);

--
-- Constraints for table `charge`
--
ALTER TABLE `charge`
  ADD CONSTRAINT `charge_ibfk_1` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`);

--
-- Constraints for table `involvement`
--
ALTER TABLE `involvement`
  ADD CONSTRAINT `involvement_ibfk_1` FOREIGN KEY (`C_id`) REFERENCES `criminal` (`C_id`),
  ADD CONSTRAINT `involvement_ibfk_2` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`);

--
-- Constraints for table `phone_no`
--
ALTER TABLE `phone_no`
  ADD CONSTRAINT `phone_no_ibfk_1` FOREIGN KEY (`C_id`) REFERENCES `criminal` (`C_id`);

--
-- Constraints for table `police_assign`
--
ALTER TABLE `police_assign`
  ADD CONSTRAINT `police_assign_ibfk_1` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`),
  ADD CONSTRAINT `police_assign_ibfk_2` FOREIGN KEY (`badge_no`) REFERENCES `police_officer` (`badge_no`);

--
-- Constraints for table `sentence`
--
ALTER TABLE `sentence`
  ADD CONSTRAINT `sentence_ibfk_1` FOREIGN KEY (`crime_id`) REFERENCES `crime` (`crime_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
