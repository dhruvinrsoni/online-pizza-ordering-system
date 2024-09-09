CREATE TABLE `siddhant`.`Customer` (
  `Customer_Id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `Customer_Name` VARCHAR(45) NOT NULL,
  `Customer_Address` VARCHAR(255) NOT NULL,
  `Customer_Username` VARCHAR(45) NOT NULL,
  `Customer_Number` INTEGER UNSIGNED NOT NULL,
  `Customer_Pincode` INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY (`Customer_Id`)
)
ENGINE = InnoDB;