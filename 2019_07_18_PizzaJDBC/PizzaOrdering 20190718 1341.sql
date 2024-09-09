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
-- Create schema siddhant
--

CREATE DATABASE IF NOT EXISTS siddhant;
USE siddhant;

--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Customer_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(45) NOT NULL,
  `Customer_Address` varchar(255) NOT NULL,
  `Customer_Username` varchar(45) NOT NULL,
  `Customer_Number` int(10) unsigned NOT NULL,
  `Customer_Pincode` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`Customer_Id`,`Customer_Name`,`Customer_Address`,`Customer_Username`,`Customer_Number`,`Customer_Pincode`) VALUES 
 (1,'Sam','Bakers Street','sam',123456,100100),
 (2,'John','Avenue Park','john',465789,100101),
 (3,'Mary','Laburnum Park','mary',789123,100102),
 (4,'Sandy','Jasminium','sandy',444656,100103);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `food_items`
--

DROP TABLE IF EXISTS `food_items`;
CREATE TABLE `food_items` (
  `Item_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Item_Name` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Item_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_items`
--

/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` (`Item_Id`,`Item_Name`,`Type`,`Price`) VALUES 
 (1,'Margherita','Pizza',150),
 (2,'Veggie Feast','Pizza',200),
 (3,'Farmhouse','Pizza',250),
 (4,'Five Pepper','PIzza',280),
 (5,'Chicken Dominator','Pizza',300),
 (6,'Chicken Feasta','Pizza',350),
 (7,'Non-Veg Supreme','Pizza',400);
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;


--
-- Definition of table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `Customer_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Order_Id` int(10) unsigned NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


--
-- Definition of table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `Order_Item_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Order_Id` int(10) unsigned NOT NULL,
  `Price` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Order_Item_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `Payment_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Order_Id` int(10) unsigned NOT NULL,
  `Payment_Mode` varchar(45) NOT NULL,
  `Payment_Time` varchar(45) NOT NULL,
  `Payment_Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Payment_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
