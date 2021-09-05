# online-pizza-ordering-system
Here is a small project that implements online pizza ordering system using angular and spring mvc in tomcat.

## About the Project

This project has been given a simple name for convenience as **PizzaWale**

### ```For this name, We don't claim any copyright.```

### Features of the product

- Addition of new Users by Registration page and storing User Details
- Login/Logout with User Profiling
- Login Persistence even if browser is closed
- Separate Accesses based on User Profiling
- For Customers:
	- Ordering the items and checkout page for customer login
	- Payments page redirection to make the payments online post checkout
- For Employees:
	- Updation of the order statuses which can be reflected further
- For Admins:
	- Updation of the menu to add/remove items from order page

This is created using: 

#### Frontend: `HTML`, `CSS`, `JS`, `AngularJS`

#### Backend: `Java`, `SpringMVC`, `MySQL`

### Specifics about the Project (Technical)

- Session Persistence even if browser is closed
- SQL Injection proof login
- Encrypted password storage
- AngularJS based UI routing
- Dynamically storing of data into DB(users, orders)
- Real-Time Updation of statuses

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


## Screenshots


### PizzaWale-home-welcome-page
![PizzaWale-home-welcome-page.png](/images/PizzaWale-home-welcome-page.png)


### PizzaWale-contact-us-page
![PizzaWale-contact-us-page.png](/images/PizzaWale-contact-us-page.png)


### PizzaWale-registration-signup-form
![PizzaWale-registration-signup-form.png](/images/PizzaWale-registration-signup-form.png)


### PizzaWale-login-page
![PizzaWale-login-page.png](/images/PizzaWale-login-page.png)


### PizzaWale-order-page-1
![PizzaWale-order-page-1.png](/images/PizzaWale-order-page-1.png)


### PizzaWale-order-page-2
![PizzaWale-order-page-2.png](/images/PizzaWale-order-page-2.png)


### PizzaWale-order-page-3
![PizzaWale-order-page-3.png](/images/PizzaWale-order-page-3.png)


### PizzaWale-order-page-4
![PizzaWale-order-page-4.png](/images/PizzaWale-order-page-4.png)


### PizzaWale-order-in-cart-summary
![PizzaWale-order-in-cart-summary.png](/images/PizzaWale-order-in-cart-summary.png)


### PizzaWale-order-checkout-payment-page
![PizzaWale-order-checkout-payment-page.png](/images/PizzaWale-order-checkout-payment-page.png)


### PizzaWale-logout-successful
![PizzaWale-logout-successful.png](/images/PizzaWale-logout-successful.png)


### PizzaWale-employee-login-order-status-updation
![PizzaWale-employee-login-order-status-updation.png](/images/PizzaWale-employee-login-order-status-updation.png)


### PizzaWale-admin-login-menu-updation-1
![PizzaWale-admin-login-menu-updation-1.png](/images/PizzaWale-admin-login-menu-updation-1.png)



# Thank You !
