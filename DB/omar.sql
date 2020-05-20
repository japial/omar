-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2020 at 10:51 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omar`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(255) NOT NULL,
  `action_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `action`, `user_id`, `user_ip`, `action_datetime`) VALUES
(1, 'Transaction Create', 2, '127.0.0.1', '2020-05-03 22:58:36'),
(2, 'Transaction Create', 2, '127.0.0.1', '2020-05-03 22:59:13'),
(3, 'Transaction Update', 2, '127.0.0.1', '2020-05-03 23:01:12'),
(4, 'Transaction Update', 2, '127.0.0.1', '2020-05-03 23:07:40'),
(5, 'Transaction Update', 2, '127.0.0.1', '2020-05-03 23:08:39'),
(6, 'Transaction Update', 2, '127.0.0.1', '2020-05-03 23:10:19'),
(7, 'Transaction Create', 2, '127.0.0.1', '2020-05-03 23:17:12'),
(8, 'Transaction Update', 2, '127.0.0.1', '2020-05-03 23:17:38'),
(9, 'Transaction Update', 2, '127.0.0.1', '2020-05-03 23:19:56'),
(10, 'Transaction Delete', 2, '127.0.0.1', '2020-05-03 23:20:57'),
(11, 'Transaction List View', 2, '127.0.0.1', '2020-05-03 23:23:21'),
(12, 'Transaction Update', 2, '127.0.0.1', '2020-05-03 23:23:37'),
(13, 'Transaction Update', 2, '127.0.0.1', '2020-05-03 23:23:43'),
(14, 'Transaction List View', 2, '127.0.0.1', '2020-05-03 23:23:47'),
(15, 'Transaction Create', 2, '127.0.0.1', '2020-05-04 12:43:09'),
(16, 'Transaction Create', 2, '127.0.0.1', '2020-05-04 12:44:48'),
(17, 'Transaction List View', 2, '127.0.0.1', '2020-05-04 12:45:44'),
(18, 'Transaction Create', 2, '127.0.0.1', '2020-05-04 12:50:04'),
(19, 'Transaction List View', 2, '127.0.0.1', '2020-05-04 12:50:08'),
(20, 'User Logout Using API', 2, '127.0.0.1', '2020-05-05 06:35:23'),
(21, 'User Login Using API', 2, '127.0.0.1', '2020-05-05 06:40:21'),
(22, 'Transaction List View', 2, '127.0.0.1', '2020-05-05 06:40:35'),
(23, 'User Logout Using API', 2, '127.0.0.1', '2020-05-05 06:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tran_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1- Daily, 2-Weekly',
  `submission_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `deletion_status` int(11) NOT NULL DEFAULT 0 COMMENT '0: Available 1: Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tran_id`, `token`, `user_id`, `type`, `submission_datetime`, `deletion_status`) VALUES
(1, 'W-123', 2, 1, '2020-05-04 12:43:09', 0),
(2, 'W-123', 2, 1, '2020-05-04 12:44:48', 0),
(3, 'W-123', 2, 2, '2020-05-04 12:50:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_d`
--

CREATE TABLE `transaction_d` (
  `tran_d_id` int(11) NOT NULL,
  `tran_id` int(11) NOT NULL,
  `tran_type` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `st` varchar(50) NOT NULL,
  `rbl` varchar(50) NOT NULL DEFAULT '0',
  `submission_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_w`
--

CREATE TABLE `transaction_w` (
  `tran_w_id` int(11) NOT NULL,
  `tran_id` int(11) NOT NULL,
  `tran_type` varchar(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `st` varchar(50) NOT NULL,
  `rbl` varchar(50) NOT NULL DEFAULT '0',
  `submission_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_w`
--

INSERT INTO `transaction_w` (`tran_w_id`, `tran_id`, `tran_type`, `code`, `st`, `rbl`, `submission_datetime`) VALUES
(1, 1, '3-digits', '435', '12', '244', '2020-05-04 16:43:09'),
(2, 1, '3-digits', '242', '122', '436', '2020-05-04 16:43:09'),
(3, 1, '3-digits', '437', '234', '790', '2020-05-04 16:43:09'),
(4, 1, '3-digits', '2134', '34', '231', '2020-05-04 16:43:09'),
(5, 1, '2-digits', '435', '12', '0', '2020-05-04 16:43:09'),
(6, 1, '2-digits', '242', '122', '0', '2020-05-04 16:43:09'),
(7, 1, '2-digits', '437', '234', '0', '2020-05-04 16:43:09'),
(8, 1, '2-digits', '2134', '34', '0', '2020-05-04 16:43:09'),
(9, 1, '1-digit', '435', '12', '0', '2020-05-04 16:43:09'),
(10, 1, '1-digit', '242', '122', '0', '2020-05-04 16:43:09'),
(11, 1, '1-digit', '437', '234', '0', '2020-05-04 16:43:09'),
(12, 1, '1-digit', '2134', '34', '0', '2020-05-04 16:43:09'),
(13, 2, '3-digits', '435', '12', '244', '2020-05-04 16:44:48'),
(14, 2, '3-digits', '242', '122', '436', '2020-05-04 16:44:48'),
(15, 2, '3-digits', '437', '234', '790', '2020-05-04 16:44:48'),
(16, 2, '3-digits', '2134', '34', '231', '2020-05-04 16:44:48'),
(17, 2, '2-digits', '435', '12', '0', '2020-05-04 16:44:48'),
(18, 2, '2-digits', '242', '122', '0', '2020-05-04 16:44:48'),
(19, 2, '2-digits', '437', '234', '0', '2020-05-04 16:44:48'),
(20, 2, '2-digits', '2134', '34', '0', '2020-05-04 16:44:48'),
(21, 2, '1-digit', '435', '12', '0', '2020-05-04 16:44:48'),
(22, 2, '1-digit', '242', '122', '0', '2020-05-04 16:44:48'),
(23, 2, '1-digit', '437', '234', '0', '2020-05-04 16:44:48'),
(24, 2, '1-digit', '2134', '34', '0', '2020-05-04 16:44:48'),
(25, 3, '3-digits', '435', '12', '244', '2020-05-04 16:50:04'),
(26, 3, '3-digits', '242', '122', '436', '2020-05-04 16:50:04'),
(27, 3, '3-digits', '437', '234', '790', '2020-05-04 16:50:04'),
(28, 3, '3-digits', '2134', '34', '231', '2020-05-04 16:50:04'),
(29, 3, '2-digits', '435', '12', '0', '2020-05-04 16:50:04'),
(30, 3, '2-digits', '242', '122', '0', '2020-05-04 16:50:04'),
(31, 3, '2-digits', '437', '234', '0', '2020-05-04 16:50:04'),
(32, 3, '2-digits', '2134', '34', '0', '2020-05-04 16:50:04'),
(33, 3, '1-digit', '435', '12', '0', '2020-05-04 16:50:04'),
(34, 3, '1-digit', '242', '122', '0', '2020-05-04 16:50:04'),
(35, 3, '1-digit', '437', '234', '0', '2020-05-04 16:50:04'),
(36, 3, '1-digit', '2134', '34', '0', '2020-05-04 16:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `creation_timestamp` datetime NOT NULL,
  `status` int(11) NOT NULL COMMENT '1. Active, 2. Deactive',
  `manual` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `phone`, `creation_timestamp`, `status`, `manual`) VALUES
(1, 'omar', 'e10adc3949ba59abbe56e057f20f883e', '01749771212', '2020-04-20 21:56:05', 1, 1),
(2, 'pial', 'e10adc3949ba59abbe56e057f20f883e', '01736252221', '2020-04-20 22:14:39', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 1, '9xMUOUsaXzGPJkfBTqVJ3YtjZrsznzmSc4ca4238a0b923820dcc509a6f75849b4181', '2020-04-20 21:58:54', '2020-04-20 21:58:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tran_id`);

--
-- Indexes for table `transaction_d`
--
ALTER TABLE `transaction_d`
  ADD PRIMARY KEY (`tran_d_id`);

--
-- Indexes for table `transaction_w`
--
ALTER TABLE `transaction_w`
  ADD PRIMARY KEY (`tran_w_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction_d`
--
ALTER TABLE `transaction_d`
  MODIFY `tran_d_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_w`
--
ALTER TABLE `transaction_w`
  MODIFY `tran_w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
