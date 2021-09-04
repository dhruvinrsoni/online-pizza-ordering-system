	
    'use strict' ;
    var app = angular
    .module('app', ['ngRoute', 'ngCookies', 'ngAnimate','ngStorage']).config(config); //.run(run);
    config.$inject = ['$routeProvider','$locationProvider'];
    function config($routeProvider,$locationProvider,$localStorage) {
        console.log("Inside");
        $localStorage={name: 'kunal the devil'};
        console.log($localStorage.name);
        $routeProvider
            .when('/',{
            	controller: 'NavBarController',
                templateUrl : 'static/home/home.view.html'
            })
            .when('/register' , {
                controller : 'registerController' ,
            	templateUrl : 'static/register/register.view.html' ,
                controllerAs : 'vm'
            })
            .when('/home' , {
                controller : 'HomeController' ,
            	templateUrl : 'static/home/home.view.html' ,
                controllerAs : 'vm'
            })
            .when('/order' , {
            	controller : 'orderController' ,
            	templateUrl : 'static/order/order.view.html' ,
            	controllerAs : 'vm'
            })
            .when('/payment' , {
            	templateUrl : 'static/payment/payment.view.html' ,
            	controllerAs : 'vm'
            })
             .when('/editorder' , {
            	controller : 'editorderController' ,
            	templateUrl : 'static/editorder/editorder.view.html' ,
            	controllerAs : 'vm'
            })
             .when('/aboutus' , {
            	controller : 'AboutUsController' ,
            	templateUrl : 'static/aboutus/aboutus.view.html' ,
            	controllerAs : 'vm'
            })
            .when('/login' , {
            	templateUrl : 'static/login/login.view.html',
            	controller: 'LoginController',
            	controllerAs: 'vm'
            })
            .when('/admin' , {
            	controller : 'adminController' ,
            	templateUrl : 'static/admin/admin.view.html' ,
            	controllerAs : 'vm'
            })
            .when('/employee' , {
            	controller : 'employeeController' ,
            	templateUrl : 'static/employee/employee.view.html' ,
            	controllerAs : 'vm'
            })
            .when('/logout' , {
            	controller : 'LogoutController' ,
            	templateUrl : 'static/logout/logout.view.html' ,
            	controllerAs : 'vm'
            })
        	.when('/end' , {
        		templateUrl : 'static/end/end.view.html',
        		controller: "endController",
            	controllerAs: 'vm'
           	});
        console.log("Outside");
    }

