-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	6.0.3-alpha-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema pizzawale
--

CREATE DATABASE IF NOT EXISTS pizzawale;
USE pizzawale;

--
-- Definition of table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) NOT NULL,
  `item_price` int(10) unsigned NOT NULL,
  `item_type` int(10) unsigned NOT NULL,
  `isVeg` int(10) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`,`item_name`,`item_price`,`item_type`,`isVeg`,`description`) VALUES 
 (1,'Margherita',250,1,1,NULL),
 (2,'Farmhouse',300,1,1,NULL),
 (3,'Peppy_Paneer',350,1,1,NULL),
 (4,'Chicken_Fiesta',350,1,0,NULL),
 (5,'Chicken_Golden_Delight',400,1,0,NULL),
 (6,'Non_Veg_Supreme',450,1,0,NULL),
 (7,'Garlic_Bread',100,2,1,NULL),
 (8,'Stuffed_Garlic_Break',150,2,1,NULL),
 (9,'White_Pasta',100,3,1,NULL),
 (10,'Non_Veg_Pasta',150,3,0,NULL),
 (11,'Mousse_Cake',50,4,1,'');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


--
-- Definition of table `itemtype`
--

DROP TABLE IF EXISTS `itemtype`;
CREATE TABLE `itemtype` (
  `item_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_name` varchar(45) NOT NULL,
  `Item_type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemtype`
--

/*!40000 ALTER TABLE `itemtype` DISABLE KEYS */;
INSERT INTO `itemtype` (`item_type_id`,`item_type_name`,`Item_type_description`) VALUES 
 (1,'pizza',NULL),
 (2,'sides',NULL),
 (3,'pasta',NULL),
 (4,'dessert',NULL),
 (5,'beverages',NULL);
/*!40000 ALTER TABLE `itemtype` ENABLE KEYS */;


--
-- Definition of table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_email` varchar(45) NOT NULL,
  `order_address` varchar(45) NOT NULL,
  `order_name` varchar(45) NOT NULL,
  `order_pincode` varchar(45) NOT NULL,
  `order_mobile` varchar(45) NOT NULL,
  `order_total` int(10) unsigned NOT NULL DEFAULT '0',
  `order_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_id` int(10) unsigned NOT NULL DEFAULT '1',
  `order_status` varchar(45) NOT NULL DEFAULT '"Pending"',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_id`,`order_email`,`order_address`,`order_name`,`order_pincode`,`order_mobile`,`order_total`,`order_ts`,`payment_id`,`order_status`) VALUES 
 (1,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2100,'2019-08-18 15:26:18',1,'\"Pending\"'),
 (2,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2100,'2019-08-18 15:27:28',1,'\"Pending\"'),
 (3,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2100,'2019-08-18 15:30:37',1,'\"Pending\"'),
 (4,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1050,'2019-08-18 15:42:06',1,'\"Pending\"'),
 (5,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2100,'2019-08-18 15:44:13',1,'\"Pending\"'),
 (6,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',5700,'2019-08-18 15:46:18',1,'\"Pending\"'),
 (7,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',5400,'2019-08-18 15:49:05',1,'\"Pending\"'),
 (8,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2100,'2019-08-18 15:54:46',1,'\"Pending\"'),
 (9,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2100,'2019-08-18 15:56:35',1,'\"Pending\"'),
 (10,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2100,'2019-08-18 15:58:20',1,'\"Pending\"'),
 (11,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1250,'2019-08-18 15:59:40',1,'\"Pending\"'),
 (12,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',900,'2019-08-18 16:02:23',1,'\"Pending\"'),
 (13,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1000,'2019-08-18 16:09:21',1,'\"Pending\"'),
 (14,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',900,'2019-08-18 16:17:51',1,'\"Pending\"'),
 (15,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',750,'2019-08-18 16:21:44',1,'\"Pending\"'),
 (16,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1350,'2019-08-18 16:23:50',1,'\"Pending\"'),
 (17,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1350,'2019-08-18 16:25:16',1,'\"Pending\"'),
 (18,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2350,'2019-08-18 16:26:41',1,'\"Pending\"'),
 (19,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1650,'2019-08-18 16:27:15',1,'\"Pending\"'),
 (20,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1550,'2019-08-18 16:31:24',1,'\"Pending\"'),
 (21,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1350,'2019-08-18 16:35:45',1,'\"Pending\"'),
 (22,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1750,'2019-08-18 16:38:02',1,'\"Pending\"'),
 (23,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',900,'2019-08-18 16:42:41',1,'\"Pending\"'),
 (24,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',900,'2019-08-18 16:49:41',1,'\"Pending\"'),
 (25,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',1550,'2019-08-18 16:50:03',1,'\"Pending\"'),
 (26,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',2200,'2019-08-18 16:51:44',1,'\"Pending\"'),
 (27,'dhruvin@pizzawale','cosmos, magarpatta.','dhruvin','411028','987654321',0,'2019-08-18 16:52:38',1,'\"Pending\"');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


--
-- Definition of table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `order_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `subtotal` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitem`
--

/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` (`order_item_id`,`item_id`,`quantity`,`order_id`,`subtotal`) VALUES 
 (25,1,1,1,250),
 (26,2,1,1,300),
 (27,3,1,1,350),
 (28,4,1,1,350),
 (29,5,1,1,400),
 (30,6,1,1,450),
 (31,1,1,2,250),
 (32,2,1,2,300),
 (33,3,1,2,350),
 (34,4,1,2,350),
 (35,5,1,2,400),
 (36,6,1,2,450),
 (37,1,1,3,250),
 (38,2,1,3,300),
 (39,3,1,3,350),
 (40,4,1,3,350),
 (41,5,1,3,400),
 (42,6,1,3,450),
 (43,4,3,4,1050),
 (44,1,1,5,250),
 (45,2,1,5,300),
 (46,3,1,5,350),
 (47,4,1,5,350),
 (48,5,1,5,400),
 (49,6,1,5,450),
 (50,1,2,6,500),
 (51,2,1,6,300),
 (52,3,3,6,1050),
 (53,4,5,6,1750),
 (54,5,3,6,1200),
 (55,6,2,6,900),
 (56,1,2,7,500),
 (57,2,2,7,600),
 (58,3,2,7,700),
 (59,4,3,7,1050),
 (60,5,3,7,1200),
 (61,6,3,7,1350),
 (62,1,1,8,250),
 (63,2,1,8,300),
 (64,3,1,8,350),
 (65,4,1,8,350),
 (66,5,1,8,400),
 (67,6,1,8,450),
 (68,1,1,9,250),
 (69,1,1,9,250),
 (70,2,1,9,300),
 (71,3,1,9,350),
 (72,4,1,9,350),
 (73,5,1,9,400),
 (74,6,1,9,450),
 (75,1,1,10,250),
 (76,2,1,10,300),
 (77,3,1,10,350),
 (78,4,1,10,350),
 (79,5,1,10,400),
 (80,6,1,10,450),
 (81,1,1,11,250),
 (82,2,1,11,300),
 (83,3,1,11,350),
 (84,4,1,11,350),
 (85,1,1,12,250),
 (86,2,1,12,300),
 (87,3,1,12,350),
 (88,1,1,13,250),
 (89,4,1,13,350),
 (90,5,1,13,400),
 (91,1,1,14,250),
 (92,2,1,14,300),
 (93,3,1,14,350),
 (94,3,1,15,350),
 (95,5,1,15,400),
 (96,2,1,16,300),
 (97,3,3,16,1050),
 (98,2,1,17,300),
 (99,3,3,17,1050),
 (100,1,3,18,750),
 (101,2,3,18,900),
 (102,3,2,18,700),
 (103,2,2,19,600),
 (104,3,3,19,1050),
 (105,1,1,20,250),
 (106,2,2,20,600),
 (107,4,2,20,700),
 (108,2,2,21,600),
 (109,3,1,21,350),
 (110,5,1,21,400),
 (111,1,3,22,750),
 (112,2,1,22,300),
 (113,3,2,22,700),
 (114,1,1,23,250),
 (115,2,1,23,300),
 (116,3,1,23,350),
 (117,1,1,24,250),
 (118,2,1,24,300),
 (119,3,1,24,350),
 (120,1,1,25,250),
 (121,2,2,25,600),
 (122,3,2,25,700),
 (123,1,1,26,250),
 (124,2,3,26,900),
 (125,3,3,26,1050);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_mode` int(10) unsigned NOT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `paymentmode`
--

DROP TABLE IF EXISTS `paymentmode`;
CREATE TABLE `paymentmode` (
  `payment_mode_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_mode_name` varchar(45) NOT NULL,
  `payment_mode_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payment_mode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymentmode`
--

/*!40000 ALTER TABLE `paymentmode` DISABLE KEYS */;
INSERT INTO `paymentmode` (`payment_mode_id`,`payment_mode_name`,`payment_mode_description`) VALUES 
 (1,'Cash or Card or Wallet On Delivery',NULL),
 (2,'Net Banking',NULL),
 (3,'Online Credit or Debit Card',NULL),
 (4,' PayTM Wallet',NULL),
 (5,'GPay',NULL),
 (6,'UPI Payment',NULL);
/*!40000 ALTER TABLE `paymentmode` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mobile_num` varchar(45) NOT NULL,
  `user_type` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`email`,`password`,`mobile_num`,`user_type`,`address`,`pincode`,`user_name`) VALUES 
 (1,'dhruvin@pizzawale','dhruvin','987654321',1,'cosmos, magarpatta.','411028','dhruvin'),
 (2,'pranav@pizzawale','pranav','123456789',1,'hadapsar','411028','pranav'),
 (3,'siddhant@pizzawale','sid','465798123',1,'mundhwa','411028','siddhant'),
 (4,'pizza@pizza','piz','999666333',2,'pizzawale','000000','pizza');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
