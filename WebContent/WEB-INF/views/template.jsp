<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  ng-app="app">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />	
	
	<meta http-equiv="Cache-control" content="public">
	<meta http-equiv="Cache-control" content="private">
	<meta http-equiv="Cache-control" content="no-cache">
	<meta http-equiv="Cache-control" content="no-store">
	
	<title>Pizza Wale</title>
	<!-- link rel="stylesheet" href="static/bootstrap/bootstrap.min.css"-->
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
        <link rel="stylesheet" href="static/bootstrap/bootstrap.min.css">
        
        
	<link rel="shortcut icon" href="static/images/favicon.ico"/>
	<!-- script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script-->
	<!--  script src="static/bootstrap/bootstrap.min.js"></script-->
	<style>
		body
		{
			background-image: linear-gradient(rgba(0,0,0,0),rgba(0,0,0,.1)), url(static/images/pizza_background.jpg);
			background-repeat: no-repeat;
			background-size: cover;
			background-position: center;
			background-attachment: fixed;
			height: 100%;
		}
		.logo
		{
			margin-top:-15px;
			margin-bottom:-15px;
			width:45px;
			height:45px;
			float:left;
			border-radius: 100% ;
			border-color:black:
		}
	</style>
</head>
<body>
	<div style="display:none;z-index:-999;background-image: linear-gradient(rgba(0,0,0,.3),rgba(0,0,0,.6)), url(static/images/pizza_background.jpg);background-repeat: no-repeat;background-size: cover;height:100%;  position: fixed; width:110%;background-position: center;background-attachment: fixed;height: 100%;"></div>
	<div style=".">
	<div style="float:left;display:none;]">
		<img  src="static/images/logo.png" class="logo">
	</div>
	<div style="float: right;display:none;">
		<ul>
			<li ng-show="$localStorage.email"><a href="#/end">Logout</a></li>
			<li ng-hide="$localStorage.email"><a href="#/login">Login</a></li>
			<li ng-hide="$localStorage.email"><a href="#/register">Register</a></li>
			<li><a href="#/">Home</a></li>
		</ul>
	</div>
	
<nav class="navbar navbar-inverse navbar-fixed-top" style="margin:0px;color:orange;" role="navigation" ng-controller="NavBarController">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#exampleNavComponents" aria-expanded"false">
                <i class="glyphicon glyphicon-align-center" style=color:grey;></i>
            </button>
            <a href="#/" class="navbar-brand">
               <img  src="static/images/favicon.ico" class="logo">&nbsp;&nbsp;&nbsp;
               Pizza Wale
            </a>
        </div>
        <div class="collapse navbar-collapse" id="exampleNavComponents" style="display:;" >
            <!-- Navbar Menu -->
            <ul class="nav navbar-nav navbar-right">
                <li class="" id="home_li"><a class="homered" href="#/home">HOME</a></li>
                <li ng-show="checkLoggedIn()" id="order_li"><a class="homeblack" href="#/order">ORDER</a></li>
                <li id="aboutus_li"><a class="homeblack" href="#/aboutus">CONTACT US</a></li>
                <li ng-hide="checkLoggedIn()" id="register_li"><a class="homeblack" href="#/register">REGISTER</a></li>				
                <li ng-hide="checkLoggedIn()" id="login_li"><a class="homegreen" href="#/login">LOGIN</a>
                <li ng-show="checkLoggedIn()" id="logout_li"><a class="homegreen" href="#/logout">LOGOUT</a>
                <li ng-show="checkLoggedIn()" id="username_li"><a class="homegreen" href="#">Welcome, {{getUserName()}}</a>
                </li>             
            </ul>
        </div>
    </div>
</nav>
	</div>
	<br><br><br>
	<!-- render view dynamically -->
	<div ng-view>
	
	</div>

        <!-- Include JS files -->
        <!-- Include angular -->
        <script src="static/js/angular.js"></script>
        <script src="static/js/angular-route.js"></script>
        <script src="static/js/angular-cookies.js"></script>
        <script src="static/js/angular-animate.js"></script>
        <script src="static/js/ngStorage.min.js"></script>
        <!-- Include routing scripts -->
        <script src="static/js/app.js"></script>
        <!-- Include services -->
        <script src="static/app-services/order.service.js"></script>

        <script src="static/app-services/user.service.js"></script>
        <!-- Include angular controller scripts -->
        <script src="static/home/home.controller.js"></script>
        <script src="static/login/login.controller.js"></script>
        <script src="static/register/register.controller.js"></script>
         <script src="static/order/order.controller.js"></script>
         <script src="static/editorder/editorder.controller.js"></script>
         <script src="static/logout/logout.controller.js"></script>
           <script src="static/aboutus/aboutus.controller.js"></script>
           <script src="static/employee/employee.controller.js"></script>
           <script src="static/admin/admin.controller.js"></script>
         <!-- <script src="static/end/end.controller.js"></script> -->
         <script type="text/javascript">
         app
         .controller('MainCtrl',function($scope, $localStorage) {
        	 var vm = function(){
        		 if($localStorage.email){return true;}
        		 else { return; }
        		 
        	 }
         });
         </script>
         <script type="text/javascript">
         
         app
     	.controller('NavBarController', NavBarController);

         NavBarController.$inject = ['$scope', '$location', 'UserService','$localStorage'];
			function NavBarController($scope, $location, UserService,$localStorage) {
             console.log("inside NavBarController");
             /*$scope.checkLoggedIn = function(){
             	if($localStorage.email!=null){
             		return true;
             	}
             	else{
             		return false;
             	}
         	};*/
         	$scope.checkLoggedIn=function() {
         		console.log("inside checkLoggedIn()");
     			if($localStorage.email!=null){
             		if($localStorage.email!=null)
             			{
             			return true;
             			}
             		else return false;
             		
             	}
             	else{
             		return false;
             	}
     		};
         	function checkLogin()
         	{

             	$scope.checkLoggedIn=function() {
             		console.log("inside checkLogin()");
         			if($localStorage!=null){
                 		if($localStorage.email!=null)
                 			{
                 			return true;
                 			}
                 		else return false;
                 		
                 	}
                 	else{
                 		$location="/";
                 		return false;
                 	}
         		};
         	}
     		$scope.getUserName=function()
        	{
        		console.log("$localStorage.userName:-"+$localStorage.userName);
        		if($localStorage!=null)
        			{
        				if($localStorage.userName!=null)
        					{
        					return $localStorage.userName;
        					}
        				else
        					{
        						return "";
        					}
        			}
        		else
        			{
        				return "Guest";
        			}
        	}
     		
     		
     		
     		/* (function checkLoggedIn() {
     			if($localStorage.email!=null){
             		return true;
             	}
             	else{
             		return false;
             	}
     		}
     		)(); */
         	
     	}
         </script>
</body>
</html>