-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 12:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bigohtech`
--

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `uniqueId` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `isGraduate` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `uniqueId`, `title`, `name`, `email`, `phonenumber`, `isGraduate`, `created_at`, `updated_at`) VALUES
(1, 'f09cc0a0-1f2c-4931-8a0f-9c147f7ca9dc', 'user', 'Pankaj', 'pankaj2211@gmail.com', '91358568585', 1, '2024-05-27 09:42:16', '2024-05-27 09:42:16'),
(2, 'c07b7261-bed1-468b-b121-018abbc19acc', 'user', 'Pankaj', 'pankaj2211@gmail.com', '91358568585', 1, '2024-05-27 09:42:16', '2024-05-27 09:59:10'),
(3, '1a7ccc57-2fc3-45ff-bd5e-d627e88754a7', 'user2', 'Rahul', 'rahul123@gmail.com', '9568525485', 0, '2024-05-27 09:48:52', '2024-05-27 09:59:18'),
(5, '2d392110-e6dd-453a-a9e7-33f3682b7da5', 'user', 'Pankaj', 'pankaj2211@gmail.com', '91358568585', 1, '2024-05-27 10:04:07', '2024-05-27 10:04:07'),
(8, 'bb4c88fa-286e-4e3d-b40f-ea466558bad6', 'user', 'Pankaj', 'pankaj2222@gmail.com', '91358568585', 1, '2024-05-27 10:05:06', '2024-05-27 10:08:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_uniqueId` (`uniqueId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
