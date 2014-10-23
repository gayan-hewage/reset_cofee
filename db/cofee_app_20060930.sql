-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 20, 2014 at 05:02 AM
-- Server version: 5.5.37
-- PHP Version: 5.5.12-2+deb.sury.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cofee_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `m00_01_member_subscription`
--

CREATE TABLE IF NOT EXISTS `m00_01_member_subscription` (
  `subscription_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `subscription` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `usage` int(11) DEFAULT NULL,
  `subscribed_date` date NOT NULL,
  `revoked_date` date NOT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='m00_01_member_subscription';

-- --------------------------------------------------------

--
-- Table structure for table `m00_03_images`
--

CREATE TABLE IF NOT EXISTS `m00_03_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(50) COLLATE utf8_bin NOT NULL,
  `record_id` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `image` text COLLATE utf8_bin,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='App Images' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `m00_03_images`
--

INSERT INTO `m00_03_images` (`id`, `table`, `record_id`, `image`, `display_order`) VALUES
(1, 's00_02_locations ', 'SHOP001', 'Image 01', 0),
(2, 's00_02_locations ', 'SHOP001', 'Image 02', 2),
(3, 's00_02_locations ', 'SHOP002', 'Image 01', 0),
(4, 's00_02_locations ', 'SHOP003', 'Image 01', 0),
(5, 's00_02_locations ', 'SHOP002', 'Image 02', 0),
(6, 's00_02_locations ', 'SHOP003', 'Image 02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `s00_01_member`
--

CREATE TABLE IF NOT EXISTS `s00_01_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `picture` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `api_key` varchar(32) COLLATE utf8_bin NOT NULL,
  `activation_code` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Member Master Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `s00_01_member`
--

INSERT INTO `s00_01_member` (`id`, `first_name`, `last_name`, `email`, `password`, `contact_no`, `picture`, `api_key`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `status`, `created_at`, `last_login`) VALUES
(1, 'Gayan Chathuranga', NULL, 'chathurangagc@gmail.com', '$2a$10$b828207f5882fae6e3352Oo3jBGUIJs/8O5peoa4589jkhJWDpMKO', 770190352, NULL, '26ffd8855f569db7c60cab2c71ae1be6', '', NULL, NULL, NULL, 1, '2014-06-18 06:47:04', '2014-06-18 06:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `s00_02_locations`
--

CREATE TABLE IF NOT EXISTS `s00_02_locations` (
  `shop_code` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `longit` decimal(20,12) DEFAULT NULL,
  `latit` decimal(20,12) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `open_hours` decimal(20,6) DEFAULT NULL,
  `closed_hours` decimal(20,6) DEFAULT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shop_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Master Locations(Shops)';

--
-- Dumping data for table `s00_02_locations`
--

INSERT INTO `s00_02_locations` (`shop_code`, `name`, `longit`, `latit`, `contact_no`, `open_hours`, `closed_hours`, `availability`, `created_at`) VALUES
('SHOP001', 'Shop One', 7.073033000000, 79.996028000000, 770190352, 8.300000, 5.000000, 1, '2014-06-19 16:23:43'),
('SHOP002', 'Shop Two', 79.542311198568, 6.622764020291, 770190352, 8.300000, 5.000000, 1, '2014-06-19 16:28:31'),
('SHOP003', 'Shop Three', 79.542311198567, 6.622764020292, 770190352, 8.300000, 5.000000, 1, '2014-06-19 16:28:57'),
('SHOP004', 'Shop Four', 79.542311198566, 6.622764020293, 770190352, 8.300000, 5.000000, 1, '2014-06-19 16:29:17'),
('SHOP005', 'Shop Five', 79.542311198565, 6.622764020294, 770190352, 8.300000, 5.000000, 1, '2014-06-19 16:29:35'),
('SHOP006', 'Shop Six', 79.542311198564, 6.622764020295, 770190352, 8.300000, 5.000000, 1, '2014-06-19 16:29:56');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
