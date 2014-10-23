-- phpMyAdmin SQL Dump
-- version 2.8.0.1
-- http://www.phpmyadmin.net
-- 
-- Host: custsql-ipg04.eigbox.net
-- Generation Time: Jun 25, 2014 at 01:53 AM
-- Server version: 5.5.32
-- PHP Version: 4.4.9
-- 
-- Database: `cofee_app`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `m00_01_member_subscription`
-- 

CREATE TABLE `m00_01_member_subscription` (
  `subscription_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `subscription` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `usage` int(11) DEFAULT NULL,
  `subscribed_date` date NOT NULL,
  `revoked_date` date NOT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='m00_01_member_subscription';

-- 
-- Dumping data for table `m00_01_member_subscription`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `m00_02_item`
-- 

CREATE TABLE `m00_02_item` (
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

INSERT INTO `m00_02_item` VALUES (0x49544d303031, 0x436f66666565204c69676874, 0x436f66666565204c69676874, 20, 5, 12.00, 0x436f666565, 1, 0x53484f50303031);
INSERT INTO `m00_02_item` VALUES (0x49544d303032, 0x436f66666565204c6967687420477265656e, 0x436f66666565204c6967687420477265656e, 15, 2, 15.00, 0x436f666565, 1, 0x53484f50303031);
INSERT INTO `m00_02_item` VALUES (0x49544d303033, 0x436f66666565204461726b, 0x436f66666565204461726b, 20, 5, 12.00, 0x436f666565, 1, 0x53484f50303032);
INSERT INTO `m00_02_item` VALUES (0x49544d303034, 0x436f666565204461726b20416273616c757465, 0x436f666565204461726b20416273616c757465, 20, 5, 12.00, 0x436f666565, 1, 0x53484f50303032);
INSERT INTO `m00_02_item` VALUES (0x49544d303035, 0x477265656e20546561, 0x477265656e20546561, 20, 5, 12.00, 0x436f666565, 1, 0x53484f50303033);
INSERT INTO `m00_02_item` VALUES (0x49544d303036, 0x477265656e20546561, 0x477265656e20546561, 20, 5, 12.00, 0x436f666565, 1, 0x53484f50303031);
INSERT INTO `m00_02_item` VALUES (0x49544d303037, 0x436f666565204461726b20416273616c757465, 0x436f666565204461726b20416273616c757465, 20, 5, 12.00, 0x436f666565, 1, 0x53484f50303034);
INSERT INTO `m00_02_item` VALUES (0x49544d303038, 0x436f66666565204c69676874, 0x436f66666565204c69676874, 20, 5, 12.00, 0x436f666565, 1, 0x53484f50303036);
INSERT INTO `m00_02_item` VALUES (0x49544d303039, 0x436f66666565204c6967687420477265656e, 0x436f66666565204c6967687420477265656e, 15, 2, 15.00, 0x436f666565, 1, 0x53484f50303036);

-- --------------------------------------------------------

-- 
-- Table structure for table `m00_03_images`
-- 

CREATE TABLE `m00_03_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(50) COLLATE utf8_bin NOT NULL,
  `record_id` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `image` text COLLATE utf8_bin,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='App Images' AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `m00_03_images`
-- 

INSERT INTO `m00_03_images` VALUES (1, 0x7330305f30325f6c6f636174696f6e7320, 0x53484f50303031, 0x496d616765203031, 0);
INSERT INTO `m00_03_images` VALUES (2, 0x7330305f30325f6c6f636174696f6e7320, 0x53484f50303031, 0x496d616765203032, 2);
INSERT INTO `m00_03_images` VALUES (3, 0x7330305f30325f6c6f636174696f6e7320, 0x53484f50303032, 0x496d616765203031, 0);
INSERT INTO `m00_03_images` VALUES (4, 0x7330305f30325f6c6f636174696f6e7320, 0x53484f50303033, 0x496d616765203031, 0);
INSERT INTO `m00_03_images` VALUES (5, 0x7330305f30325f6c6f636174696f6e7320, 0x53484f50303032, 0x496d616765203032, 0);
INSERT INTO `m00_03_images` VALUES (6, 0x7330305f30325f6c6f636174696f6e7320, 0x53484f50303033, 0x496d616765203032, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `m00_05_plan`
-- 

CREATE TABLE `m00_05_plan` (
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `frequency` enum('Annual','Quarter') COLLATE utf8_bin NOT NULL DEFAULT 'Quarter',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `location` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Subscription Plan Master Data';

-- 
-- Dumping data for table `m00_05_plan`
-- 

INSERT INTO `m00_05_plan` VALUES (0x504c4e3031, 0x537562736372697074696f6e20506c616e203031, 0x537562736372697074696f6e20506c616e203031204465736372697074696f6e, 60, 580.00, 0x51756172746572, '2014-06-04', '2014-06-26', 0x53484f50303031);
INSERT INTO `m00_05_plan` VALUES (0x504c4e3032, 0x537562736372697074696f6e20506c616e203032, 0x537562736372697074696f6e20506c616e203032204465736372697074696f6e, 20, 250.00, 0x51756172746572, '2014-06-18', '2014-06-20', 0x53484f50303031);
INSERT INTO `m00_05_plan` VALUES (0x504c4e3033, 0x537562736372697074696f6e20506c616e203031, 0x537562736372697074696f6e20506c616e203031204465736372697074696f6e, 10, 100.00, 0x51756172746572, '2014-06-04', '2014-06-26', 0x53484f50303032);
INSERT INTO `m00_05_plan` VALUES (0x504c4e3034, 0x537562736372697074696f6e20506c616e203031, 0x537562736372697074696f6e20506c616e203031204465736372697074696f6e, 20, 250.00, 0x51756172746572, '2014-06-18', '2014-06-20', 0x53484f50303033);
INSERT INTO `m00_05_plan` VALUES (0x504c4e3035, 0x537562736372697074696f6e20506c616e203032, 0x537562736372697074696f6e20506c616e203032204465736372697074696f6e, 10, 100.00, 0x51756172746572, '2014-06-04', '2014-06-26', 0x53484f50303033);

-- --------------------------------------------------------

-- 
-- Table structure for table `s00_01_member`
-- 

CREATE TABLE `s00_01_member` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Member Master Table' AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `s00_01_member`
-- 

INSERT INTO `s00_01_member` VALUES (1, 0x476179616e2043686174687572616e6761, NULL, 0x63686174687572616e6761676340676d61696c2e636f6d, 0x243261243130246238323832303766353838326661653665333335324f6f336a424755494a732f384f3570656f61343538396a6b684a5744704d4b4f, 770190352, NULL, 0x3236666664383835356635363964623763363063616232633731616531626536, '', NULL, NULL, NULL, 1, '2014-06-18 02:47:04', '2014-06-18 02:47:04');
INSERT INTO `s00_01_member` VALUES (2, 0x43686174687572612057696a6573696e676865, NULL, 0x6364616e617369726940676d61696c2e636f6d, 0x2432612431302438646137643030373433346231343738636336326575767553754f664d64672e58466b467a46674b4e615a7352786f36586d517975, 773651248, NULL, 0x6238373164353438386136306230303361633038653236393733666263653037, NULL, NULL, NULL, NULL, 1, '2014-06-22 04:01:33', '2014-06-22 04:01:33');
INSERT INTO `s00_01_member` VALUES (3, 0x43686174687572612057696a6573696e676865, NULL, 0x636861746875696a747340676d61696c2e636f6d, 0x2432612431302464373663313030653638393830353135376364613775485849704f6d42536474316534794830395946554f467879706b363257312e, 773651248, NULL, 0x6565313336333263653765393136333639383036306332316636626533343738, NULL, NULL, NULL, NULL, 1, '2014-06-22 06:22:49', '2014-06-22 06:22:49');
INSERT INTO `s00_01_member` VALUES (4, 0x73616d61646869, NULL, 0x736d61646940676d61696c2e636f6d, 0x243261243130246137376436313265306530373833343734646638614f7a50674334777630385a344f6a4a7932667678577262575036726139463253, 0, NULL, 0x6538313963343365353534336164353231366461373661373534646363646235, NULL, NULL, NULL, NULL, 1, '2014-06-23 13:57:41', '2014-06-23 13:57:41');

-- --------------------------------------------------------

-- 
-- Table structure for table `s00_02_locations`
-- 

CREATE TABLE `s00_02_locations` (
  `shop_code` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `longit` decimal(20,12) DEFAULT NULL,
  `latit` decimal(20,12) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `open_hours` decimal(20,6) DEFAULT NULL,
  `closed_hours` decimal(20,6) DEFAULT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `saving_upto` decimal(12,2) NOT NULL,
  PRIMARY KEY (`shop_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Master Locations(Shops)';

-- 
-- Dumping data for table `s00_02_locations`
-- 

INSERT INTO `s00_02_locations` VALUES (0x53484f50303031, 0x53686f70204f6e65, 7.073033000000, 79.996028000000, 770190352, 8.300000, 5.000000, 1, '2014-06-19 12:23:43', 0.00);
INSERT INTO `s00_02_locations` VALUES (0x53484f50303032, 0x53686f702054776f, 79.542311198568, 6.622764020291, 770190352, 8.300000, 5.000000, 1, '2014-06-19 12:28:31', 0.00);
INSERT INTO `s00_02_locations` VALUES (0x53484f50303033, 0x53686f70205468726565, 79.542311198567, 6.622764020292, 770190352, 8.300000, 5.000000, 1, '2014-06-19 12:28:57', 0.00);
INSERT INTO `s00_02_locations` VALUES (0x53484f50303034, 0x53686f7020466f7572, 79.542311198566, 6.622764020293, 770190352, 8.300000, 5.000000, 1, '2014-06-19 12:29:17', 0.00);
INSERT INTO `s00_02_locations` VALUES (0x53484f50303035, 0x53686f702046697665, 79.542311198565, 6.622764020294, 770190352, 8.300000, 5.000000, 1, '2014-06-19 12:29:35', 0.00);
INSERT INTO `s00_02_locations` VALUES (0x53484f50303036, 0x53686f7020536978, 79.542311198564, 6.622764020295, 770190352, 8.300000, 5.000000, 1, '2014-06-19 12:29:56', 0.00);

-- --------------------------------------------------------

-- 
-- Table structure for table `s00_03_location_categories`
-- 

CREATE TABLE `s00_03_location_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) COLLATE utf8_bin NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Location Categories' AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `s00_03_location_categories`
-- 

INSERT INTO `s00_03_location_categories` VALUES (1, 0x53484f50303031, 1);
INSERT INTO `s00_03_location_categories` VALUES (2, 0x53484f50303032, 1);
INSERT INTO `s00_03_location_categories` VALUES (3, 0x53484f50303033, 1);
INSERT INTO `s00_03_location_categories` VALUES (4, 0x53484f50303034, 1);
INSERT INTO `s00_03_location_categories` VALUES (5, 0x53484f50303035, 1);
INSERT INTO `s00_03_location_categories` VALUES (6, 0x53484f50303036, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `s00_04_category`
-- 

CREATE TABLE `s00_04_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(35) DEFAULT NULL,
  `category_description` varchar(250) DEFAULT NULL,
  `sub_category_description` varchar(250) DEFAULT NULL,
  `parent_category` int(11) DEFAULT NULL,
  `status` enum('Enabled','Disabled') NOT NULL DEFAULT 'Enabled',
  `display_order` int(11) DEFAULT NULL,
  `saving_upto` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `s00_04_category`
-- 

INSERT INTO `s00_04_category` VALUES (1, 'Cofee', 'Cofee', NULL, 0, 'Enabled', 1, 0.00);

-- --------------------------------------------------------

-- 
-- Table structure for table `trn00_01_plan_items`
-- 

CREATE TABLE `trn00_01_plan_items` (
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

INSERT INTO `trn00_01_plan_items` VALUES (0x504c4e3031, 0x49544d303032, 0x436f66666565204c6967687420477265656e, 30, 300.00);
INSERT INTO `trn00_01_plan_items` VALUES (0x504c4e3031, 0x49544d303031, 0x436f66666565204c69676874, 30, 280.00);

-- 
-- Constraints for dumped tables
-- 

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
