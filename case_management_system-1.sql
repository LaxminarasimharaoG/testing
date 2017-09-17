-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2017 at 11:54 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `case_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_admin`
--

CREATE TABLE `m_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_first_name` varchar(50) NOT NULL,
  `admin_last_name` varchar(50) NOT NULL,
  `admin_company_id` varchar(50) NOT NULL,
  `admin_dateofbirth` date NOT NULL,
  `admin_address` varchar(100) NOT NULL,
  `admin_street` varchar(100) NOT NULL,
  `admin_city` varchar(100) NOT NULL,
  `admin_state` varchar(100) NOT NULL,
  `admin_postal_code` int(11) NOT NULL,
  `admin_sec_que` varchar(100) NOT NULL,
  `admin_secque_answer` varchar(100) NOT NULL,
  `admin_contact_no` varchar(100) NOT NULL,
  `admin_email_id` varchar(100) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  `admin_secondary_password` varchar(50) NOT NULL,
  `admin_status` varchar(50) NOT NULL,
  `lastupdated_by` varchar(50) NOT NULL,
  `lastupdate_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_admin`
--

INSERT INTO `m_admin` (`admin_id`, `admin_first_name`, `admin_last_name`, `admin_company_id`, `admin_dateofbirth`, `admin_address`, `admin_street`, `admin_city`, `admin_state`, `admin_postal_code`, `admin_sec_que`, `admin_secque_answer`, `admin_contact_no`, `admin_email_id`, `admin_password`, `admin_secondary_password`, `admin_status`, `lastupdated_by`, `lastupdate_datetime`) VALUES
(1, 'Ram', 'G', '12345', '2017-03-10', 'Hall Road', 'church street', 'New York', 'Texas', 12345, 'What is your favourite color?', 'black', '9003723281', 'Rag93.g@gmail', '123', '1234', 'Active', 'Admin', '2017-03-09 12:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `m_attorney`
--

CREATE TABLE `m_attorney` (
  `attorney_id` int(11) NOT NULL,
  `attorney_first_name` varchar(50) NOT NULL,
  `attorney_last_name` varchar(50) NOT NULL,
  `attorney_yoe` varchar(50) NOT NULL,
  `attorney_dateofbirth` date NOT NULL,
  `attorney_address` varchar(100) NOT NULL,
  `attorney_street` varchar(100) NOT NULL,
  `attorney_city` varchar(100) NOT NULL,
  `attorney_state` varchar(100) NOT NULL,
  `attorney_postal_code` int(11) NOT NULL,
  `attorney_sec_que` varchar(100) NOT NULL,
  `attorney_secque_answer` varchar(100) NOT NULL,
  `attorney_contact_no` varchar(100) NOT NULL,
  `attorney_email_id` varchar(50) NOT NULL,
  `attorney_password` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `lastupdated_by` varchar(50) NOT NULL,
  `lastupdate_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_attorney`
--

INSERT INTO `m_attorney` (`attorney_id`, `attorney_first_name`, `attorney_last_name`, `attorney_yoe`, `attorney_dateofbirth`, `attorney_address`, `attorney_street`, `attorney_city`, `attorney_state`, `attorney_postal_code`, `attorney_sec_que`, `attorney_secque_answer`, `attorney_contact_no`, `attorney_email_id`, `attorney_password`, `status`, `lastupdated_by`, `lastupdate_datetime`) VALUES
(1, 'Sailesh', 'Chittoor Neelakantan', '5', '1989-03-16', 'SUITE', '5A-1204', 'SEATTLE', 'Washington', 23789, 'What is your favourite color?', 'orange', '1234537876', 'chittoorneelakantans@mail.sacredheart.edu', '12345', 'Active', 'Attorney', '2017-03-07 17:43:19'),
(2, 'Laxmi', 'Narasimha', '2', '2017-03-15', '7123', 'Athens Place', 'Washington', 'Dc-5', 76578, 'What is your pet name?', 'laxmi', '2052177100', 'guttikondal@mail.sacredheart.edu', '12345', 'Active', 'Attorney', '2017-03-07 17:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `m_casetype`
--

CREATE TABLE `m_casetype` (
  `casetype_id` int(11) NOT NULL,
  `case_type` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `lastupdated_by` varchar(20) NOT NULL,
  `lastupdate_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_casetype`
--

INSERT INTO `m_casetype` (`casetype_id`, `case_type`, `description`, `lastupdated_by`, `lastupdate_datetime`) VALUES
(1, 'CIVIL REVISION', 'CIVIL REVISION', '7', '2017-03-14 09:55:10'),
(2, 'CENTRAL EXCISE CASE ', 'sadfasfasfsa', '7', '2017-03-14 10:20:29'),
(3, 'parking ticket', 'parking done in wrong spot', '7', '2017-03-16 08:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `m_case_details`
--

CREATE TABLE `m_case_details` (
  `case_id` int(11) NOT NULL,
  `case_name` varchar(50) NOT NULL,
  `case_type_id` varchar(50) NOT NULL,
  `client_id` varchar(50) NOT NULL,
  `case_status` varchar(50) NOT NULL,
  `case_start_date` date NOT NULL,
  `court_hearing` date NOT NULL,
  `mediator` varchar(50) NOT NULL,
  `party1` varchar(50) NOT NULL,
  `party2` varchar(50) NOT NULL,
  `case_notes` varchar(150) NOT NULL,
  `action_took` varchar(150) NOT NULL,
  `action_need_to_take` varchar(150) NOT NULL,
  `lastupdated_by` varchar(20) NOT NULL,
  `lastupdate_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_case_details`
--

INSERT INTO `m_case_details` (`case_id`, `case_name`, `case_type_id`, `client_id`, `case_status`, `case_start_date`, `court_hearing`, `mediator`, `party1`, `party2`, `case_notes`, `action_took`, `action_need_to_take`, `lastupdated_by`, `lastupdate_datetime`) VALUES
(1, 'Laxmi', '1', '1', 'Nil', '2017-03-15', '2017-03-24', 'KM', 'krish', 'Naren', 'Note-Case', 'Acsdfs', 'sdsdds\r\ndsgsd\r\n', '3', '2017-03-15 06:33:13'),
(2, 'sai-case', '1', '6', 'hjhjhhjhj', '2017-03-16', '2017-03-17', 'hhhh', 'jjjjjj', 'jkhhjkjhjh', 'jhhjhhjg', 'jhjhghj', 'jjhhgjhghj', '3', '2017-03-16 05:29:43'),
(3, 'Pra', '1', '2', 'safas', '2017-03-09', '2017-03-22', 'asfsa', 'asfa', 'asfa', 'asfa', 'sfa', 'asfa', '2', '2017-03-15 10:47:21');


-- --------------------------------------------------------

--
-- Table structure for table `m_client`
--

CREATE TABLE `m_client` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_email_id` varchar(50) NOT NULL,
  `client_contact_no` varchar(50) NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `lastupdated_by` varchar(20) NOT NULL,
  `lastupdate_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_client`
--

INSERT INTO `m_client` (`client_id`, `client_name`, `client_email_id`, `client_contact_no`, `client_address`, `lastupdated_by`, `lastupdate_datetime`) VALUES
(1, 'ramu', 'ramu@gmail.com', '1809087654', 'ssfa', '2', '2017-03-14 12:43:53'),
(2, 'Pra', 'pra@gmail.com', '147009876', 'xzsvsdf\r\n\r\n', '2', '2017-03-14 12:49:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_admin`
--
ALTER TABLE `m_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `m_attorney`
--
ALTER TABLE `m_attorney`
  ADD PRIMARY KEY (`attorney_id`);

--
-- Indexes for table `m_casetype`
--
ALTER TABLE `m_casetype`
  ADD PRIMARY KEY (`casetype_id`);

--
-- Indexes for table `m_case_details`
--
ALTER TABLE `m_case_details`
  ADD PRIMARY KEY (`case_id`);

--
-- Indexes for table `m_client`
--
ALTER TABLE `m_client`
  ADD PRIMARY KEY (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_admin`
--
ALTER TABLE `m_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `m_attorney`
--
ALTER TABLE `m_attorney`
  MODIFY `attorney_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_casetype`
--
ALTER TABLE `m_casetype`
  MODIFY `casetype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `m_case_details`
--
ALTER TABLE `m_case_details`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `m_client`
--
ALTER TABLE `m_client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
