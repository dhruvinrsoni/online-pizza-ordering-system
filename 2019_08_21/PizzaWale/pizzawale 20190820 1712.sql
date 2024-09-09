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
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`,`item_name`,`item_price`,`item_type`,`isVeg`,`description`,`image_url`) VALUES 
 (1,'Margherita',250,1,1,'Margherita...','static/images/pizza/veg/Margherita.jpg'),
 (2,'Farmhouse',300,1,1,'Farmhouse...','static/images/pizza/veg/Farmhouse.jpg'),
 (3,'Peppy Paneer',350,1,1,'Peppy Paneer...','static/images/pizza/veg/Peppy_Paneer.jpg'),
 (4,'Chicken Fiesta',350,1,0,'Chicken Fiesta...','static/images/pizza/nonveg/Chicken_Fiesta.jpg'),
 (5,'Chicken Golden Delight',400,1,0,'Chicken Golden Delight...','static/images/pizza/nonveg/Chicken_Golden_Delight.jpg'),
 (6,'Non Veg Supreme',450,1,0,'Non Veg Supreme','static/images/pizza/nonveg/Non_Veg_Supreme.jpg'),
 (7,'Garlic Bread',100,2,1,'Garlic Bread','static/images/sides/Garlic_Bread.jpg'),
 (8,'Stuffed Garlic Break',150,2,1,'Stuffed Garlic Break','static/images/sides/Stuffed_Garlic_Break.jpg'),
 (9,'White Pasta',100,3,1,'White Pasta','static/images/pasta/White_Pasta.jpg'),
 (10,'Non Veg Pasta',150,3,0,'Non Veg Pasta','static/images/pasta/Non_Veg_Pasta.jpg'),
 (11,'Mousse Cake',50,4,1,'Mousse Cake','static/images/desserts/Mousse_Cake.jpg');
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
  `order_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_id` int(10) unsigned NOT NULL,
  `order_status` int(10) unsigned NOT NULL DEFAULT '1',
  `order_paid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_id`,`order_email`,`order_address`,`order_name`,`order_pincode`,`order_mobile`,`order_total`,`order_ts`,`payment_id`,`order_status`,`order_paid`) VALUES 
 (1,'pizza@pizza','pizzawale','pizza','000000','999666333',1850,'2019-08-19 19:36:17',1,1,0),
 (2,'pizza@pizza','pizzawale','pizza','000000','999666333',1150,'2019-08-19 19:37:20',1,1,0),
 (3,'pizza@pizza','pizzawale','pizza','000000','999666333',1250,'2019-08-19 19:37:50',1,1,0),
 (4,'pizza@pizza','pizzawale','pizza','000000','999666333',1250,'2019-08-19 19:38:25',1,1,0),
 (5,'pizza@pizza','pizzawale','pizza','000000','999666333',1150,'2019-08-19 20:06:58',1,1,0),
 (6,'pizza@pizza','pizzawale','pizza','000000','999666333',700,'2019-08-19 20:55:15',1,1,0),
 (7,'pizza@pizza','pizzawale','pizza','000000','999666333',700,'2019-08-20 15:33:52',1,1,0),
 (8,'pizza@pizza','pizzawale','pizza','000000','999666333',1050,'2019-08-20 16:05:50',1,1,0),
 (9,'pizza@pizza','pizzawale','pizza','000000','999666333',800,'2019-08-20 16:34:25',1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitem`
--

/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` (`order_item_id`,`item_id`,`quantity`,`order_id`,`subtotal`) VALUES 
 (1,4,3,1,1050),
 (2,5,2,1,800),
 (3,1,1,2,250),
 (4,2,3,2,900),
 (5,5,2,3,800),
 (6,6,1,3,450),
 (7,5,2,4,800),
 (8,6,1,4,450),
 (9,1,1,5,250),
 (10,2,3,5,900),
 (11,2,1,6,300),
 (12,5,1,6,400),
 (13,4,2,7,700),
 (14,3,3,8,1050),
 (15,5,2,9,800);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;


--
-- Definition of table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus` (
  `order_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderstatus`
--

/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` (`order_status_id`,`order_status_name`) VALUES 
 (1,'In Cart'),
 (2,'Payment Pending'),
 (3,'Payment Recieved'),
 (4,'Order Accepted'),
 (5,'Order Preparing'),
 (6,'Order Dispatched'),
 (7,'Delivered');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_mode` int(10) unsigned NOT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_status` int(10) unsigned NOT NULL DEFAULT '4',
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
-- Definition of table `paymentstatus`
--

DROP TABLE IF EXISTS `paymentstatus`;
CREATE TABLE `paymentstatus` (
  `payment_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymentstatus`
--

/*!40000 ALTER TABLE `paymentstatus` DISABLE KEYS */;
INSERT INTO `paymentstatus` (`payment_status_id`,`payment_status_name`) VALUES 
 (1,'Payment Not Initiated'),
 (2,'Payment Initiated'),
 (3,'Payment Pending'),
 (4,'Payment Done');
/*!40000 ALTER TABLE `paymentstatus` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mobile_num` varchar(45) NOT NULL,
  `user_type` int(10) unsigned NOT NULL DEFAULT '3',
  `address` varchar(255) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`email`,`password`,`mobile_num`,`user_type`,`address`,`pincode`,`user_name`) VALUES 
 (1,'dhruvin@pizzawale','dhruvin','987654321',1,'cosmos, magarpatta.','411028','dhruvin'),
 (2,'pranav@pizzawale','pranav','123456789',1,'hadapsar','411028','pranav'),
 (3,'siddhant@pizzawale','sid','465798123',1,'mundhwa','411028','siddhant'),
 (4,'pizza@pizza','piz','999666333',3,'pizzawale','000000','pizza'),
 (5,'employee@pizzawale','emp','123123123',2,'Employee, PIzzaWale','100000','Employee'),
 (6,'ram@ayodhya','ram','741852963',0,'ram mandir, ayodhya','123456','Ram'),
 (7,'wfadsc@gfdv','ram','345',0,'wefsdv','2345','wefa'),
 (8,'ram@dsfg','ramsfdg','34567',0,'sdfgnbh','34567','sfgd'),
 (9,'asd@asd','asd','123',3,'asd','123','asd'),
 (10,'ram@ay3456odhya','ram435678','234567',1,'sdfghmj','21345','sdxsfgh');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `user_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(45) NOT NULL,
  `user_type_description` varchar(45) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` (`user_type_id`,`user_type_name`,`user_type_description`) VALUES 
 (1,'admin','The Administrators'),
 (2,'employee','The Employees'),
 (3,'Customer','The Customers'),
 (4,'Guest','Guests');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
