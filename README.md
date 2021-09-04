# online-pizza-ordering-system
Here is a small project that implements online pizza ordering system using angular and spring mvc in tomcat.

## About the Project

This project has been given a simple name for convenience as **PizzaWale**

### ```For this name, We don't claim any copyright.```

### Features of the product

- User Profiling based login and further customizations
- Registration of User Details (Signing Up)
- Selection of the products
- Payments page to make the payments online

This is created using: 

#### Frontend: `HTML`, `CSS`, `JS`, `AngularJS`

#### Backend: `Java`, `SpringMVC`, `MySQL`

### Specifics about the Project (Technical)

- AngularJS based routing
- SQL Injection proof login
- Encrypted password storage
- Dynamically storing of data into DB

## Pre-requisites
1.This project needs to be run with the help of Apache Tomcat: [Refer This Link](http://tomcat.apache.org/)
  
  Kindly install the Apache Tomcat.
  Current code is tested on ```Apache Tomcat/9.0.52```
  
2.This project uses MySQL server for DB Operations. [Refer This Link](https://dev.mysql.com/downloads/mysql/)
  
  Kindly set-up a DB Server with default configurations and host it locally.
  Current code is configured for the ```MySQL Community Server 8.0.26 @ jdbc:mysql://localhost:3306/, root, root```

### Requerements Check List
- [ ] Apache Tomcat Installation
- [ ] MySQL Server @ jdbc:mysql://localhost:3306/, root, root

## Building and Running the Project

We hope you have met the required Pre-Requisites mentioned above.

Kindly follow the below steps to run the project.

- Run the SQL script which is in the repository to create the basic tables for the project. (**`Pizzawale 20190821 0922.sql`**) **`ONE TIME TASK`**
- Import the project into IDE. (`Eclipse IDE`)
- In the IDE go to `Window > Preferences > Server > Runtime Environments` and add the installed Tomcat Server.
  - Navigate to : `Properties > Java Build Path > Libraries section` & `Add Library` of type `Server Runtime` where you can mention the installed **Apache Tomcat**.
- Navigate to : `Properties > Java Build Path > Libraries section` & Add all JARs as `Add External JARs...` which are present in repository's **`lib/*`** folder.
- Bulid the project once and ensure there aren't any errors.
- DB populated with initial data, all the required build dependencies configured, *You should be able to* `Run on Server` which will start the application with tomcat server.

Navigate to [this link](http://localhost:8080/PizzaWale/#/) to see the home page of started application.

You can register to create new user and then login since the user will be added into DB.

To access previous users with admin, employee etc. profiles the credentials are avaialble *in the code* as well as they can be decoded from hashed passwords *in the SQL script* via md5 algorithm.
