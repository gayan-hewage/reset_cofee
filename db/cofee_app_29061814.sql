-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 29, 2014 at 06:14 PM
-- Server version: 5.5.37
-- PHP Version: 5.5.13-2+deb.sury.org~precise+1

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
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `m00_01_member_subscription`
--

CREATE TABLE IF NOT EXISTS `m00_01_member_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `item_code` varchar(15) COLLATE utf8_bin NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `subscription` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `usage` int(11) DEFAULT NULL,
  `subscribed_date` date NOT NULL,
  `revoked_date` date NOT NULL,
  `active` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `plan_id` (`plan_id`),
  KEY `member_id` (`member_id`),
  KEY `item_code` (`item_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='m00_01_member_subscription' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m00_01_member_subscription`
--

INSERT INTO `m00_01_member_subscription` (`subscription_id`, `plan_id`, `item_code`, `member_id`, `subscription`, `usage`, `subscribed_date`, `revoked_date`, `active`) VALUES
(1, 'PLN01', 'ITM001', 1, 'Coffee Light', 24, '2014-06-29', '0000-00-00', '1'),
(2, 'PLN01', 'ITM002', 1, 'Coffee Light Green', 30, '2014-06-29', '0000-00-00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `m00_02_item`
--

CREATE TABLE IF NOT EXISTS `m00_02_item` (
  `item_code` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `category_id` int(11) NOT NULL,
  `location` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`item_code`),
  KEY `location` (`location`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Item Master Table';

--
-- Dumping data for table `m00_02_item`
--

INSERT INTO `m00_02_item` (`item_code`, `name`, `description`, `quantity`, `reorder_level`, `price`, `category`, `category_id`, `location`) VALUES
('ITM001', 'Coffee Light', 'Coffee Light', 20, 5, 12.00, 'Coppuchino', 2, 'SHOP001'),
('ITM002', 'Coffee Light Green', 'Coffee Light Green', 15, 2, 15.00, 'Coppuchino', 2, 'SHOP001'),
('ITM003', 'Coffee Dark', 'Coffee Dark', 20, 5, 12.00, 'Coppuchino', 2, 'SHOP002'),
('ITM004', 'Cofee Dark Absalute', 'Cofee Dark Absalute', 20, 5, 12.00, 'Black Coppuchino', 3, 'SHOP002'),
('ITM005', 'Green Tea', 'Green Tea', 20, 5, 12.00, 'Black Coppuchino', 3, 'SHOP003'),
('ITM006', 'Green Tea', 'Green Tea', 20, 5, 12.00, 'Coppuchino', 2, 'SHOP001'),
('ITM007', 'Cofee Dark Absalute', 'Cofee Dark Absalute', 20, 5, 12.00, 'Coppuchino', 2, 'SHOP004'),
('ITM008', 'Coffee Light', 'Coffee Light', 20, 5, 12.00, 'Black Coppuchino', 2, 'SHOP006'),
('ITM009', 'Coffee Light Green', 'Coffee Light Green', 15, 2, 15.00, 'Coppuchino', 2, 'SHOP006');

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
-- Table structure for table `m00_05_plan`
--

CREATE TABLE IF NOT EXISTS `m00_05_plan` (
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `frequency` enum('Annual','Quarter') COLLATE utf8_bin NOT NULL DEFAULT 'Quarter',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `location` varchar(15) COLLATE utf8_bin NOT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `location` (`location`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Subscription Plan Master Data';

--
-- Dumping data for table `m00_05_plan`
--

INSERT INTO `m00_05_plan` (`plan_id`, `name`, `description`, `quantity`, `price`, `frequency`, `start_date`, `end_date`, `location`, `category`, `category_id`) VALUES
('PLN01', 'Subscription Plan 01', 'Subscription Plan 01 Description', 60, 580.00, 'Quarter', '2014-06-04', '2014-06-26', 'SHOP001', 'Coppuchino', 2),
('PLN02', 'Subscription Plan 02', 'Subscription Plan 02 Description', 20, 250.00, 'Quarter', '2014-06-18', '2014-06-20', 'SHOP001', 'Black Coppuchino', 3),
('PLN03', 'Subscription Plan 01', 'Subscription Plan 01 Description', 10, 100.00, 'Quarter', '2014-06-04', '2014-06-26', 'SHOP002', 'Coppuchino', 2),
('PLN04', 'Subscription Plan 01', 'Subscription Plan 01 Description', 20, 250.00, 'Quarter', '2014-06-18', '2014-06-20', 'SHOP003', 'Black Coppuchino', 3),
('PLN05', 'Subscription Plan 02', 'Subscription Plan 02 Description', 10, 100.00, 'Quarter', '2014-06-04', '2014-06-26', 'SHOP003', 'Coppuchino', 2);

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
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `address` varchar(255) COLLATE utf8_bin NOT NULL,
  `featured` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `longit` decimal(20,12) DEFAULT NULL,
  `latit` decimal(20,12) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `open_hours` decimal(12,2) DEFAULT NULL,
  `closed_hours` decimal(12,2) DEFAULT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `saving_upto` decimal(12,2) NOT NULL,
  PRIMARY KEY (`shop_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Master Locations(Shops)';

--
-- Dumping data for table `s00_02_locations`
--

INSERT INTO `s00_02_locations` (`shop_code`, `name`, `description`, `address`, `featured`, `longit`, `latit`, `contact_no`, `open_hours`, `closed_hours`, `availability`, `created_at`, `saving_upto`) VALUES
('SHOP001', 'Shop One', '', '', '0', 7.073033000000, 79.996028000000, 770190352, 8.30, 5.00, 1, '2014-06-19 16:23:43', 0.00),
('SHOP002', 'Shop Two', '', '', '0', 79.542311198568, 6.622764020291, 770190352, 8.30, 5.00, 1, '2014-06-19 16:28:31', 0.00),
('SHOP003', 'Shop Three', '', '', '0', 79.542311198567, 6.622764020292, 770190352, 8.30, 5.00, 1, '2014-06-19 16:28:57', 0.00),
('SHOP004', 'Shop Four', '', '', '0', 79.542311198566, 6.622764020293, 770190352, 8.30, 5.00, 1, '2014-06-19 16:29:17', 0.00),
('SHOP005', 'Shop Five', '', '', '0', 79.542311198565, 6.622764020294, 770190352, 8.30, 5.00, 1, '2014-06-19 16:29:35', 0.00),
('SHOP006', 'Shop Six', '', '', '0', 79.542311198564, 6.622764020295, 770190352, 8.30, 5.00, 1, '2014-06-19 16:29:56', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `s00_03_location_categories`
--

CREATE TABLE IF NOT EXISTS `s00_03_location_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) COLLATE utf8_bin NOT NULL,
  `category` int(11) NOT NULL,
  `type` enum('location','item') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Location Categories' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `s00_03_location_categories`
--

INSERT INTO `s00_03_location_categories` (`id`, `location`, `category`, `type`) VALUES
(1, 'SHOP001', 1, 'location'),
(2, 'SHOP002', 1, 'location'),
(3, 'SHOP003', 1, 'location'),
(4, 'SHOP004', 1, 'location'),
(5, 'SHOP005', 1, 'location'),
(6, 'SHOP006', 1, 'location'),
(7, 'SHOP001', 2, 'item'),
(8, 'SHOP001', 3, 'item'),
(9, 'SHOP003', 3, 'item'),
(10, 'SHOP004', 2, 'item'),
(11, 'SHOP005', 3, 'item'),
(12, 'SHOP006', 3, 'item');

-- --------------------------------------------------------

--
-- Table structure for table `s00_04_category`
--

CREATE TABLE IF NOT EXISTS `s00_04_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(35) DEFAULT NULL,
  `category_description` varchar(250) DEFAULT NULL,
  `sub_category_description` varchar(250) DEFAULT NULL,
  `parent_category` int(11) DEFAULT NULL,
  `status` enum('Enabled','Disabled') NOT NULL DEFAULT 'Enabled',
  `display_order` int(11) DEFAULT NULL,
  `saving_upto` decimal(12,2) NOT NULL,
  `type` enum('location','item') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `s00_04_category`
--

INSERT INTO `s00_04_category` (`id`, `category_name`, `category_description`, `sub_category_description`, `parent_category`, `status`, `display_order`, `saving_upto`, `type`) VALUES
(1, 'Cofee', 'Cofee', NULL, 0, 'Enabled', 1, 0.00, 'location'),
(2, 'Coppuchino', 'Coppuchino', NULL, 0, 'Enabled', NULL, 0.00, 'item'),
(3, 'Black Coppuchino', 'Black Coppuchino', NULL, NULL, 'Enabled', NULL, 0.00, 'item');

-- --------------------------------------------------------

--
-- Table structure for table `trn00_01_plan_items`
--

CREATE TABLE IF NOT EXISTS `trn00_01_plan_items` (
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `item_code` varchar(15) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  KEY `item_code` (`item_code`),
  KEY `plan_id` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Subscription Plan Item Data';

--
-- Dumping data for table `trn00_01_plan_items`
--

INSERT INTO `trn00_01_plan_items` (`plan_id`, `item_code`, `item_name`, `quantity`, `price`) VALUES
('PLN01', 'ITM002', 'Coffee Light Green', 30, 300.00),
('PLN01', 'ITM001', 'Coffee Light', 30, 280.00);

-- --------------------------------------------------------

--
-- Table structure for table `trn00_02_order_member_subscription`
--

CREATE TABLE IF NOT EXISTS `trn00_02_order_member_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscrb_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `item_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mode` enum('TAKEAWAY','DINEOUT') NOT NULL DEFAULT 'TAKEAWAY',
  `order_date` datetime DEFAULT NULL,
  `order_status` enum('PENDING','ACCEPTED') DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `comments` text,
  `pickup_time` time DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscrb_id` (`subscrb_id`),
  KEY `item_code` (`item_code`),
  KEY `subscrb_id_2` (`subscrb_id`),
  KEY `member_id` (`member_id`),
  KEY `item_code_2` (`item_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `trn00_02_order_member_subscription`
--

INSERT INTO `trn00_02_order_member_subscription` (`id`, `subscrb_id`, `member_id`, `item_code`, `mode`, `order_date`, `order_status`, `quantity`, `comments`, `pickup_time`, `pickup_date`) VALUES
(1, 1, 1, 'ITM001', 'TAKEAWAY', '2014-06-29 00:00:00', 'PENDING', 2, NULL, NULL, '2014-06-01'),
(4, 1, 1, 'ITM001', 'TAKEAWAY', '2014-06-29 00:00:00', 'PENDING', 1, '', '00:00:00', '0000-00-00'),
(5, 1, 1, 'ITM001', 'TAKEAWAY', '2014-06-29 00:00:00', 'PENDING', 1, '', '00:00:00', '0000-00-00'),
(6, 1, 1, 'ITM001', 'TAKEAWAY', '2014-06-29 00:00:00', 'PENDING', 1, '', '00:00:00', '0000-00-00'),
(7, 1, 1, 'ITM001', 'TAKEAWAY', '2014-06-29 00:00:00', 'PENDING', 1, 'this is a comment', '00:00:00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$08$tYS0cBIQwKEgdGZM3UlOY.ZeG3O.KRFWCdAHyqFJY88aiTbrVorV.', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1403977659, 1, 'Gayan', 'Chathuranga', 'Sithagi', '770190352');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(4, 1, 1),
(5, 1, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m00_01_member_subscription`
--
ALTER TABLE `m00_01_member_subscription`
  ADD CONSTRAINT `m00_01_member_subscription_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `s00_01_member` (`id`),
  ADD CONSTRAINT `m00_01_member_subscription_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `m00_05_plan` (`plan_id`),
  ADD CONSTRAINT `m00_01_member_subscription_ibfk_4` FOREIGN KEY (`item_code`) REFERENCES `trn00_01_plan_items` (`item_code`);

--
-- Constraints for table `m00_02_item`
--
ALTER TABLE `m00_02_item`
  ADD CONSTRAINT `m00_02_item_ibfk_1` FOREIGN KEY (`location`) REFERENCES `s00_02_locations` (`shop_code`);

--
-- Constraints for table `m00_05_plan`
--
ALTER TABLE `m00_05_plan`
  ADD CONSTRAINT `m00_05_plan_ibfk_1` FOREIGN KEY (`location`) REFERENCES `s00_02_locations` (`shop_code`);

--
-- Constraints for table `s00_03_location_categories`
--
ALTER TABLE `s00_03_location_categories`
  ADD CONSTRAINT `s00_03_location_categories_ibfk_1` FOREIGN KEY (`location`) REFERENCES `s00_02_locations` (`shop_code`);

--
-- Constraints for table `trn00_01_plan_items`
--
ALTER TABLE `trn00_01_plan_items`
  ADD CONSTRAINT `trn00_01_plan_items_ibfk_2` FOREIGN KEY (`item_code`) REFERENCES `m00_02_item` (`item_code`),
  ADD CONSTRAINT `trn00_01_plan_items_ibfk_3` FOREIGN KEY (`plan_id`) REFERENCES `m00_05_plan` (`plan_id`);

--
-- Constraints for table `trn00_02_order_member_subscription`
--
ALTER TABLE `trn00_02_order_member_subscription`
  ADD CONSTRAINT `trn00_02_order_member_subscription_ibfk_1` FOREIGN KEY (`subscrb_id`) REFERENCES `m00_01_member_subscription` (`subscription_id`),
  ADD CONSTRAINT `trn00_02_order_member_subscription_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `m00_01_member_subscription` (`member_id`),
  ADD CONSTRAINT `trn00_02_order_member_subscription_ibfk_3` FOREIGN KEY (`item_code`) REFERENCES `m00_01_member_subscription` (`item_code`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
