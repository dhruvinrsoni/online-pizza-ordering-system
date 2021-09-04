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
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`,`item_name`,`item_price`,`item_type`,`isVeg`,`description`,`image_url`) VALUES 
 (1,'Margherita',250,1,1,'A hugely popular margherita, with a deliciously tangy single cheese topping','static/images/pizza/veg/Margherita.jpg'),
 (2,'Farmhouse',300,1,1,'Farmhouse is a pizza that goes ballistic on veggies!','static/images/pizza/veg/Farmhouse.jpg'),
 (3,'Peppy Paneer',350,1,1,'Chunky paneer with crisp capsicum and spicy red pepper - quite a mouthful!','static/images/pizza/veg/Peppy_Paneer.jpg'),
 (4,'Chicken Fiesta',350,1,0,'Chewy pizza crust topped with tender strips of taco-seasoned chicken, Colby Jack cheese and salsa','static/images/pizza/nonveg/Chicken_Fiesta.jpg'),
 (5,'Chicken Golden Delight',400,1,0,'Barbeque chicken with a topping of golden corn loaded with extra cheese','static/images/pizza/nonveg/Chicken_Golden_Delight.jpg'),
 (6,'Non Veg Supreme',450,1,0,'Bite into supreme delight of Black Olives, Onions, Grilled Mushrooms, Pepper BBQ Chicken, Peri-Peri Chicken, Grilled Chicken Rashers','static/images/pizza/nonveg/Non_Veg_Supreme.jpg'),
 (7,'Garlic Bread',100,2,1,'Bread topped with garlic and olive oil or butter and include additional herbs, such as oregano or chives','static/images/sides/Garlic_Bread.jpg'),
 (8,'Stuffed Garlic Bread',150,2,1,'Bursting with flavour, this Stuffed Garlic Bread can be served with soup or enjoyed as a snack by itself','static/images/sides/Stuffed_Garlic_Break.jpg'),
 (9,'White Pasta',100,3,1,'White sauce pasta is a creamy, delicious and cheesy pasta tossed in white sauce or bechamel sauce and loaded with veggies','static/images/pasta/White_Pasta.jpg'),
 (10,'Non Veg Pasta',150,3,0,'A basic tomato spaghetti recipe made with chicken','static/images/pasta/Non_Veg_Pasta.jpg'),
 (11,'Mousse Cake',50,4,1,'Chocolate Mousse Cake with three layers of moist chocolate cake and two layers of smooth & creamy chocolate mousse','static/images/desserts/Mousse_Cake.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

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
 (9,'pizza@pizza','pizzawale','pizza','000000','999666333',800,'2019-08-20 16:34:25',1,1,0),
 (10,'pizza@pizza','pizzawale','pizza','000000','999666333',2350,'2019-08-20 21:02:20',1,1,0),
 (11,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 20:26:20',1,1,0),
 (12,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 20:26:49',1,1,0),
 (13,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 20:27:34',1,1,0),
 (14,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 20:31:25',1,1,0),
 (15,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 20:32:18',1,1,0),
 (16,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 20:32:34',1,1,0),
 (17,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 20:33:16',1,1,0),
 (18,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 20:38:19',1,1,0),
 (19,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 21:00:59',1,1,0),
 (20,'pizza@pizza','pizzawale','pizza','000000','999666333',0,'2019-08-20 21:02:20',1,1,0),
 (21,'dhruvin@gmail.com','my address','Dhruvin Sonio','100100','123456789',600,'2019-08-20 22:12:15',1,1,0),
 (22,'dhruvin@gmail.com','my address','Dhruvin Sonio','100100','123456789',1050,'2019-08-21 09:24:48',1,1,0),
 (23,'dhruvin@gmail.com','my address','Dhruvin Sonio','100100','123456789',800,'2019-08-21 09:55:43',1,1,0),
 (24,'dhruvin@gmail.com','my address','Dhruvin Sonio','100100','123456789',800,'2019-08-21 09:58:50',1,1,0),
 (25,'tommy@gmail.com','Laburnum Park','Tom','789456','77445588',800,'2019-08-21 10:16:49',1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

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
 (15,5,2,9,800),
 (16,1,3,10,750),
 (17,2,3,10,900),
 (18,3,2,10,700),
 (19,2,2,21,600),
 (20,1,3,22,750),
 (21,2,1,22,300),
 (22,1,2,23,500),
 (23,2,1,23,300),
 (24,1,2,24,500),
 (25,2,1,24,300),
 (26,1,2,25,500),
 (27,2,1,25,300);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`email`,`password`,`mobile_num`,`user_type`,`address`,`pincode`,`user_name`) VALUES 
 (1,'dhruvin@gmail.com','010a5bf4bd8303cfb3b2ab867288144d','987654321',3,'Pizzawale','789456','dhruvin'),
 (2,'tommy@gmail.com','e358efa489f58062f10dd7316b65649e','77445588',3,'Laburnum Park','789456','Tom'),
 (3,'dhruvin@pizzawale.com','010a5bf4bd8303cfb3b2ab867288144d','987654321',1,'Pizzawale','789456','Dhruvin'),
 (4,'admin@pizzawale.com','21232f297a57a5a743894a0e4a801fc3','987654321',1,'Pizzawale','789456','Admin'),
 (5,'employee@pizzawale.com','ac8be4aee61f5f6e21b8c5afffb52939','987654321',2,'Pizzawale','789456','Employee');
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
