-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2018 at 10:16 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumni_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_id` int(11) NOT NULL,
  `Admin_name` varchar(50) NOT NULL,
  `Admin_Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_id`, `Admin_name`, `Admin_Password`) VALUES
(1, 'sakec admin', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `A_id` int(11) NOT NULL,
  `Alumni_email` varchar(50) NOT NULL,
  `Alumni_email2` varchar(50) NOT NULL,
  `Alumni_address` varchar(200) NOT NULL,
  `Alumni_name` varchar(50) NOT NULL,
  `Alumni_gender` text NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Alumni_contactNo` varchar(20) NOT NULL,
  `Alumni_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`A_id`, `Alumni_email`, `Alumni_email2`, `Alumni_address`, `Alumni_name`, `Alumni_gender`, `Department`, `Alumni_contactNo`, `Alumni_password`) VALUES
(1, 'kakondey701@gmail.com', 'tezpur', 'kakon Dey', 'Male', 'English', '123345346', '12345678'),
(10, 'Romu@gmail.com', 'wnefnerfnerfuerfreiufiu', 'Romu', 'Male', 'Computer Science', '243435435354', '343543f4g'),
(12, 'ram@gmail.com', 'sdhb', 'rambo', 'Male', 'English', '1234567890', 'sahdb');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `D_id` int(11) NOT NULL,
  `Department_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`D_id`, `Department_name`) VALUES
(1, 'Computer Engg.'),
(3, 'IT'),
(4, 'Electronics Engg.'),
(5, 'AIDS'),
(6, 'EXTC Engg.'),
(7, 'Cyber Security');

-- --------------------------------------------------------

--
-- Table structure for table `higher_studies`
--

CREATE TABLE `higher_studies` (
  `HS_id` int(11) NOT NULL,
  `A_id` int(11) NOT NULL,
  `Institute_name` varchar(50) NOT NULL,
  `course_name` varchar(30) NOT NULL,
  `yearof_admission` date NOT NULL,
  `yearof_passout` date NOT NULL,
  `other_degrees` varchar(30) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `higher_studies`
--

INSERT INTO `higher_studies` (`HS_id`, `A_id`, `Institute_name`, `course_name`, `yearof_admission`, `yearof_passout`, `other_degrees`) VALUES
(1, 7, 'IIT', 'Master of Technology'),
(2, 1, 'Cambridge', 'Masters In Zoology');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `I_id` int(11) NOT NULL,
  `alumni_name` varchar(50) NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`I_id`, `alumni_name`, `image`) VALUES
(2, 'kakon Dey', 0x89504e470d0a1a0a0000000d49484452000000860000007b08020000003e176f01000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000013549444154785eedd13101c02010c0c0a7eed00942bb20e286dc12015967df89e47b0da3259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a7259c96705ac26909a72598991f699f02863acea1b80000000049454e44ae426082);
INSERT INTO `images` (`I_id`, `alumni_name`, `image`) VALUES


-- --------------------------------------------------------

--
-- Table structure for table `studied_in_department`
--

CREATE TABLE `studied_in_department` (
  `SiD_id` int(11) NOT NULL,
  `A_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  `major` varchar(20) NOT NULL,
  `pass_course` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worksfor`
--

CREATE TABLE `worksfor` (
  `Wk_id` int(11) NOT NULL,
  `A_id` int(11) NOT NULL,
  `Company_name` varchar(50) NOT NULL,
  `Company_location` varchar(100) NOT NULL,
  `industry` varchar(50) NOT NULL,
  `package` int(11) NOT NULL,
  `working_from` date NOT NULL,
  `working_to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `worksfor`
--

INSERT INTO `worksfor` (`Wk_id`, `A_id`, `Company_name`, `Company_location`, `industry`, `package`, `working_from`, `working_to`) VALUES
(1, 7, 'TATA', 'mumbai', 'Tata Industries Limited', 120000, '2011-01-01', '2018-03-23'),
(2, 1, 'Birla', 'Lucknow', 'Birla Industries', 23932432, '2008-03-13', '2018-03-29'),
(3, 1, 'tata', 'india', 'inc.', 2147483647, '2017-01-22', '2012-12-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_id`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`A_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`D_id`);

--
-- Indexes for table `higher_studies`
--
ALTER TABLE `higher_studies`
  ADD PRIMARY KEY (`HS_id`),
  ADD KEY `A_id` (`A_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`I_id`);

--
-- Indexes for table `studied_in_department`
--
ALTER TABLE `studied_in_department`
  ADD PRIMARY KEY (`SiD_id`),
  ADD KEY `A_id` (`A_id`),
  ADD KEY `D_id` (`D_id`);

--
-- Indexes for table `worksfor`
--
ALTER TABLE `worksfor`
  ADD PRIMARY KEY (`Wk_id`),
  ADD KEY `A_id` (`A_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `alumni`
--
ALTER TABLE `alumni`
  MODIFY `A_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `D_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `higher_studies`
--
ALTER TABLE `higher_studies`
  MODIFY `HS_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `I_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `studied_in_department`
--
ALTER TABLE `studied_in_department`
  MODIFY `SiD_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worksfor`
--
ALTER TABLE `worksfor`
  MODIFY `Wk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
