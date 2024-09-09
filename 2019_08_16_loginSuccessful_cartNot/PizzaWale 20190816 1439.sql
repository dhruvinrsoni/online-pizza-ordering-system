-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.22


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
  `order_total` int(10) unsigned NOT NULL,
  `order_ts` datetime NOT NULL,
  `payment_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitem`
--

/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_mode` int(10) unsigned NOT NULL,
  `payment_time` datetime NOT NULL,
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
  `address` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`email`,`password`,`mobile_num`,`user_type`,`address`,`pincode`) VALUES 
 (1,'dhruvin@pizzawale','dhruvin','987654321',1,'cosmos, magarpatta.','411028'),
 (2,'pranav@pizzawale','pranav','123456789',1,'hadapsar','411028'),
 (3,'siddhant@pizzawale','sid','465798123',1,'mundhwa','411028');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
