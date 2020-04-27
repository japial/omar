-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2020 at 11:15 PM
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
(1, 'User Login Using API', 1, '127.0.0.1', '2020-04-28 00:28:06'),
(2, 'User Login Using API', 1, '127.0.0.1', '2020-04-28 00:35:01'),
(5, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-28 00:36:49'),
(6, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-28 00:40:27'),
(7, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-28 01:35:09'),
(8, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-28 01:35:22'),
(9, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-28 01:35:39'),
(10, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-28 01:35:58'),
(11, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-28 01:37:31'),
(12, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-28 02:00:59'),
(13, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:31'),
(14, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:41'),
(15, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:47'),
(16, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:49'),
(17, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:50'),
(18, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:52'),
(19, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:53'),
(20, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:54'),
(21, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:55'),
(22, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:56'),
(23, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:04:57'),
(24, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:28:23'),
(25, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:30:14'),
(26, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:33:41'),
(27, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:35:59'),
(28, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:36:14'),
(29, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:57:46'),
(30, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:59:00'),
(31, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 22:59:21'),
(32, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 23:05:47'),
(33, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 23:09:41'),
(34, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 23:10:04'),
(35, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 23:10:45'),
(36, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 23:11:19'),
(37, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 23:13:29'),
(38, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 23:13:29'),
(39, 'Transaction List Viewed', 1, '127.0.0.1', '2020-04-27 23:13:32');

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
(19, 'D-001', 1, 1, '2020-04-27 22:35:59', 0),
(21, 'W-001', 1, 2, '2020-04-27 22:59:00', 0),
(22, 'W-002', 1, 2, '2020-04-27 23:09:41', 0),
(23, 'W-M123', 1, 1, '2020-04-27 23:10:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_d`
--

CREATE TABLE `transaction_d` (
  `tran_d_id` int(11) NOT NULL,
  `tran_id` int(11) NOT NULL,
  `tran_type` varchar(10) NOT NULL,
  `code` int(11) NOT NULL,
  `st` int(11) NOT NULL,
  `rbl` int(11) NOT NULL DEFAULT 0,
  `submission_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_d`
--

INSERT INTO `transaction_d` (`tran_d_id`, `tran_id`, `tran_type`, `code`, `st`, `rbl`, `submission_datetime`) VALUES
(17, 19, '3-digits', 435, 12, 244, '2020-04-28 02:35:59'),
(18, 19, '3-digits', 242, 122, 436, '2020-04-28 02:35:59'),
(19, 19, '3-digits', 437, 234, 790, '2020-04-28 02:35:59'),
(20, 19, '3-digits', 2134, 34, 231, '2020-04-28 02:35:59'),
(21, 19, '2-digits', 435, 12, 0, '2020-04-28 02:35:59'),
(22, 19, '2-digits', 242, 122, 0, '2020-04-28 02:35:59'),
(23, 19, '2-digits', 437, 234, 0, '2020-04-28 02:35:59'),
(24, 19, '2-digits', 2134, 34, 0, '2020-04-28 02:35:59'),
(25, 19, '1-digit', 435, 12, 0, '2020-04-28 02:35:59'),
(26, 19, '1-digit', 242, 122, 0, '2020-04-28 02:35:59'),
(27, 19, '1-digit', 437, 234, 0, '2020-04-28 02:35:59'),
(28, 19, '1-digit', 2134, 34, 0, '2020-04-28 02:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_w`
--

CREATE TABLE `transaction_w` (
  `tran_w_id` int(11) NOT NULL,
  `tran_id` int(11) NOT NULL,
  `tran_type` varchar(10) NOT NULL,
  `code` int(11) NOT NULL,
  `st` int(11) NOT NULL,
  `rbl` int(11) NOT NULL,
  `submission_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_w`
--

INSERT INTO `transaction_w` (`tran_w_id`, `tran_id`, `tran_type`, `code`, `st`, `rbl`, `submission_datetime`) VALUES
(13, 21, '3-digits', 435, 12, 244, '2020-04-28 02:59:00'),
(14, 21, '3-digits', 242, 122, 436, '2020-04-28 02:59:00'),
(15, 21, '3-digits', 437, 234, 790, '2020-04-28 02:59:00'),
(16, 21, '3-digits', 2134, 34, 231, '2020-04-28 02:59:00'),
(17, 21, '2-digits', 435, 12, 0, '2020-04-28 02:59:00'),
(18, 21, '2-digits', 242, 122, 0, '2020-04-28 02:59:00'),
(19, 21, '2-digits', 437, 234, 0, '2020-04-28 02:59:00'),
(20, 21, '2-digits', 2134, 34, 0, '2020-04-28 02:59:00'),
(21, 21, '1-digit', 435, 12, 0, '2020-04-28 02:59:00'),
(22, 21, '1-digit', 242, 122, 0, '2020-04-28 02:59:00'),
(23, 21, '1-digit', 437, 234, 0, '2020-04-28 02:59:00'),
(24, 21, '1-digit', 2134, 34, 0, '2020-04-28 02:59:00'),
(25, 22, '3-digits', 435, 12, 244, '2020-04-28 03:09:41'),
(26, 22, '3-digits', 242, 122, 436, '2020-04-28 03:09:41'),
(27, 22, '3-digits', 437, 234, 790, '2020-04-28 03:09:41'),
(28, 22, '3-digits', 2134, 34, 231, '2020-04-28 03:09:41'),
(29, 22, '2-digits', 435, 12, 0, '2020-04-28 03:09:41'),
(30, 22, '2-digits', 242, 122, 0, '2020-04-28 03:09:41'),
(31, 22, '2-digits', 437, 234, 0, '2020-04-28 03:09:41'),
(32, 22, '2-digits', 2134, 34, 0, '2020-04-28 03:09:41'),
(33, 22, '1-digit', 435, 12, 0, '2020-04-28 03:09:41'),
(34, 22, '1-digit', 242, 122, 0, '2020-04-28 03:09:41'),
(35, 22, '1-digit', 437, 234, 0, '2020-04-28 03:09:41'),
(36, 22, '1-digit', 2134, 34, 0, '2020-04-28 03:09:41'),
(37, 23, '3-digits', 435, 12, 244, '2020-04-28 03:10:45'),
(38, 23, '3-digits', 242, 122, 436, '2020-04-28 03:10:45'),
(39, 23, '3-digits', 437, 234, 790, '2020-04-28 03:10:45'),
(40, 23, '3-digits', 2134, 34, 231, '2020-04-28 03:10:45'),
(41, 23, '2-digits', 435, 12, 0, '2020-04-28 03:10:45'),
(42, 23, '2-digits', 242, 122, 0, '2020-04-28 03:10:45'),
(43, 23, '2-digits', 437, 234, 0, '2020-04-28 03:10:45'),
(44, 23, '2-digits', 2134, 34, 0, '2020-04-28 03:10:45'),
(45, 23, '1-digit', 435, 12, 0, '2020-04-28 03:10:45'),
(46, 23, '1-digit', 242, 122, 0, '2020-04-28 03:10:45'),
(47, 23, '1-digit', 437, 234, 0, '2020-04-28 03:10:45'),
(48, 23, '1-digit', 2134, 34, 0, '2020-04-28 03:10:45');

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
(2, 'pial', 'e10adc3949ba59abbe56e057f20f883e', '01736252221', '2020-04-20 22:14:39', 1, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `transaction_d`
--
ALTER TABLE `transaction_d`
  MODIFY `tran_d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `transaction_w`
--
ALTER TABLE `transaction_w`
  MODIFY `tran_w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
