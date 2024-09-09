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
-- Create schema pizza
--

CREATE DATABASE IF NOT EXISTS pizza;
USE pizza;

--
-- Definition of table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `Order_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Margherita` int(10) unsigned NOT NULL DEFAULT '0',
  `DCMargherita` int(10) unsigned NOT NULL DEFAULT '0',
  `Farmhouse` int(10) unsigned NOT NULL DEFAULT '0',
  `DeluxeVeggie` int(10) unsigned NOT NULL DEFAULT '0',
  `MexGW` int(10) unsigned NOT NULL DEFAULT '0',
  `PeppyPan` int(10) unsigned NOT NULL DEFAULT '0',
  `Email` varchar(45) NOT NULL DEFAULT '""',
  PRIMARY KEY (`Order_ID`,`Email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`Order_ID`,`Margherita`,`DCMargherita`,`Farmhouse`,`DeluxeVeggie`,`MexGW`,`PeppyPan`,`Email`) VALUES 
 (32,2,3,7,0,0,0,'wadCSAAD@gmail.com'),
 (33,12,1,1,0,0,0,'wad@gmail.com'),
 (34,1,3,5,0,0,0,'kunalthedevil@gmail.com'),
 (35,2,4,5,0,0,0,'wadCSAAD@gmail.com'),
 (36,1,2,3,0,0,0,'wadCSAAD@gmail.com'),
 (37,1,2,3,0,0,0,'wadCSAAD@gmail.com'),
 (38,1,2,3,0,0,0,'wadCSAAD@gmail.com'),
 (39,1,3,2,0,0,0,'wadCSAAD@gmail.com'),
 (40,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (41,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (42,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (43,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (44,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (45,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (46,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (47,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (48,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (49,2,23,3,0,0,0,'kkk@gmail.com'),
 (50,1,1,2,0,0,0,'kunalthedevil@gmail.com'),
 (51,1,2,3,0,0,0,'wadCSAAD@gmail.com'),
 (52,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (53,1,1,1,0,0,0,'wadCSAAD@gmail.com'),
 (54,1,2,3,0,0,0,'wadCSAAD@gmail.com'),
 (55,1,2,3,0,0,0,'wadCSAAD@gmail.com'),
 (56,0,0,0,0,0,0,'wadCSAAD@gmail.com'),
 (57,1,0,0,0,0,0,'wadCSAAD@gmail.com'),
 (58,2,3,4,0,0,0,'wadCSAAD@gmail.com'),
 (59,4,0,0,0,0,0,'wadCSAAD@gmail.com'),
 (60,1,0,0,0,0,0,'wadCSAAD@gmail.com'),
 (61,1,0,0,0,0,0,'kunalthedevil@gmail.com'),
 (62,2,2,4,0,0,0,'wadCSAAD@gmail.com'),
 (63,1,2,2,0,0,0,'wadCSAAD@gmail.com'),
 (64,0,0,0,4,0,0,'wadCSAAD@gmail.com'),
 (65,0,0,0,4,0,0,'wadCSAAD@gmail.com'),
 (66,1,0,2,3,5,11,'wadCSAAD@gmail.com'),
 (67,0,0,2,3,0,4,'wadCSAAD@gmail.com'),
 (68,2,0,5,5,0,5,'wadCSAAD@gmail.com'),
 (69,0,0,0,0,0,4,'wadCSAAD@gmail.com'),
 (70,6,0,0,0,0,0,'wadCSAAD@gmail.com'),
 (71,5,0,0,0,0,0,'wadCSAAD@gmail.com');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


--
-- Definition of table `item_type`
--

DROP TABLE IF EXISTS `item_type`;
CREATE TABLE `item_type` (
  `item_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_type`
--

/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` (`item_no`,`item_type`) VALUES 
 (1,'Toppings'),
 (2,'Sause'),
 (3,'Base'),
 (4,'Add Ons');
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;


--
-- Definition of table `ordered_items`
--

DROP TABLE IF EXISTS `ordered_items`;
CREATE TABLE `ordered_items` (
  `order_id` varchar(45) NOT NULL DEFAULT '',
  `item_no` int(10) unsigned NOT NULL,
  `item_name` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordered_items`
--

/*!40000 ALTER TABLE `ordered_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_items` ENABLE KEYS */;


--
-- Definition of table `orderinfo1`
--

DROP TABLE IF EXISTS `orderinfo1`;
CREATE TABLE `orderinfo1` (
  `orderno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `total` int(10) unsigned DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `ordereditems` varchar(345) DEFAULT NULL,
  PRIMARY KEY (`orderno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderinfo1`
--

/*!40000 ALTER TABLE `orderinfo1` DISABLE KEYS */;
INSERT INTO `orderinfo1` (`orderno`,`email`,`address`,`mobile`,`total`,`name`,`ordereditems`) VALUES 
 (1,'wadCSAAD@gmail.com','null','1234567890',0,'null','5 Margherita Pizza,  ');
/*!40000 ALTER TABLE `orderinfo1` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` varchar(45) NOT NULL,
  `payment_mode` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`payment_id`,`payment_mode`) VALUES 
 ('12342154','online');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `pizza_items`
--

DROP TABLE IF EXISTS `pizza_items`;
CREATE TABLE `pizza_items` (
  `item_no.` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) NOT NULL DEFAULT '',
  `price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_no.`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pizza_items`
--

/*!40000 ALTER TABLE `pizza_items` DISABLE KEYS */;
INSERT INTO `pizza_items` (`item_no.`,`item_name`,`price`) VALUES 
 (1,'Margherita',250),
 (2,'DCMargherita',350),
 (3,'Farmhouse',300),
 (4,'DeluxeVeggie',200),
 (5,'MexGW',345),
 (6,'PeppyPan',450),
 (7,'NVSupreme',250),
 (8,'ChickTikka',390),
 (9,'ChicFiesta',290),
 (10,'PPChic',280),
 (11,'Chicsau',360);
/*!40000 ALTER TABLE `pizza_items` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mobile_num` varchar(45) DEFAULT NULL,
  `user_type` int(10) unsigned DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`email`,`password`,`mobile_num`,`user_type`,`name`,`address`,`gender`) VALUES 
 (42,'wadCSAAD@gmail.com','SADSAD','1234567890',0,'null','null',NULL),
 (43,'wad@gmail.com','GSDSF','1234567890',0,'prasadSAD','wadwad',NULL),
 (44,'K@GMAIL.COM','K','K',0,'K','K',NULL),
 (45,'WADWAD@SADSAD.COM','WADWAD','WADWADWAD',0,'WAD','wadwadWAD',NULL),
 (46,'wadasdCSAAD@gmail.com','sadsad','1234567890',0,'prasad','anurag appartment',NULL),
 (47,'wadas@gmail.com','asas','1234567890',0,'prasad','anurag appartment',NULL),
 (48,'wadasasas@gmail.com','asas','1234567890',0,'prasad','anurag appartment',NULL),
 (49,'wadCSAsasaAD@gmail.com','assasa','1234567890',0,'WAD','anurag appartment',NULL),
 (50,'wadCSAAassaaaD@gmail.com','asdassda','1234567890',0,'prasad','anurag appartment',NULL),
 (51,'kunalthedevil@gmail.com','satanlover','1234567890',0,'KUNAL rOCKS','hELL',NULL),
 (52,'wadasrefrefer@gmail.com','ggggg','1234567890',0,'prasadwad','rdefw',NULL),
 (53,'wadCSsssAAD@gmail.com','ffff','1234567890',0,'WAD','anurag appartment',NULL),
 (54,'dfssdf@fdsfsd','fdsfsdf','fsdsdf',0,'fdsgfsdfsd','dfssdf',NULL),
 (55,'kkk@gmail.com','satanlover','7618032563',0,'Kunal Choukse','Pune',NULL),
 (56,'wadACSAAD@gmail.com','111','1234567890',0,'prasadSAD','anurag appartment',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
