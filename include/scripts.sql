CREATE TABLE IF NOT EXISTS `s00_03_location_categories` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) COLLATE utf8_bin NOT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Location Categories';


CREATE TABLE IF NOT EXISTS `m00_04_plan` (
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `category_id` varchar(15) COLLATE utf8_bin NOT NULL, 
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `frequency` enum('Annual','Quarter') COLLATE utf8_bin NOT NULL DEFAULT 'Quarter',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `location` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Subscription Plan Master Data';


CREATE TABLE IF NOT EXISTS `trn00_01_plan_items` (
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL, 
  `item_code` int(11) NOT NULL DEFAULT '1',
  `item_name` int(11) NOT NULL DEFAULT '1',
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Subscription Plan Item Data';


CREATE TABLE IF NOT EXISTS `m00_02_item` (
  `item_code` varchar(100) COLLATE utf8_bin NOT NULL, 
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `category_id` int(11) COLLATE utf8_bin NOT NULL,
  `location` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`item_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Item Master Table';


CREATE TABLE IF NOT EXISTS `m00_04_locations` (
  `shop_code` varchar(100) COLLATE utf8_bin NOT NULL, 
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `longit` decimal(20,6) DEFAULT NULL,
  `latit` decimal(20,6) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `open_hours` decimal(20,6) DEFAULT NULL,
  `closed_hours` decimal(20,6) DEFAULT NULL,
  `availability` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shop_code`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Master Locations(Shops)';



CREATE TABLE IF NOT EXISTS `m00_03_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(50) COLLATE utf8_bin NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `image` text,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Master Locations(Shops)';



INSERT INTO  `cofee_app`.`m00_05_plan` (
 `plan_id` ,
 `category_id` ,
 `name` ,
 `description` ,
 `quantity` ,
 `price` ,
 `frequency` ,
 `start_date` ,
 `end_date` ,
 `location`
)
VALUES (
 'PLN03',  '1',  'Subscription Plan 01',  'Subscription Plan 01 Description',  '10',  '100',  'Quarter',  '2014-06-04',  '2014-06-26',  'SHOP002'
),
(
 'PLN05',  '1',  'Subscription Plan 02',  'Subscription Plan 02 Description',  '10',  '100',  'Quarter',  '2014-06-04',  '2014-06-26',  'SHOP003'
), 
(
 'PLN04',  '1',  'Subscription Plan 01',  'Subscription Plan 01 Description',  '20',  '250',  'Quarter',  '2014-06-18',  '2014-06-20',  'SHOP003'
)





INSERT INTO  `cofee_app`.`m00_02_item` (
`item_code` ,
`name` ,
`description` ,
`quantity` ,
`reorder_level` ,
`price` ,
`category` ,
`category_id` ,
`location`
)
VALUES (
'ITM003',  'Coffee Dark',  'Coffee Dark',  '20',  '5',  '12',  'Cofee',  '1',  'SHOP002'
), 
(
'ITM004',  'Cofee Dark Absalute',  'Cofee Dark Absalute',  '20',  '5',  '12',  'Cofee',  '1',  'SHOP002'
),
(
'ITM005',  'Green Tea',  'Green Tea',  '20',  '5',  '12',  'Cofee',  '1',  'SHOP003'
),
(
'ITM006',  'Green Tea',  'Green Tea',  '20',  '5',  '12',  'Cofee',  '1',  'SHOP001'
),
(
'ITM007',  'Cofee Dark Absalute',  'Cofee Dark Absalute',  '20',  '5',  '12',  'Cofee',  '1',  'SHOP004'
),
(
'ITM008',  'Coffee Light',  'Coffee Light',  '20',  '5',  '12',  'Cofee',  '1',  'SHOP006'
),
(
'ITM009',  'Coffee Light Green',  'Coffee Light Green',  '15',  '2',  '15',  'Cofee',  '1',  'SHOP006'
);