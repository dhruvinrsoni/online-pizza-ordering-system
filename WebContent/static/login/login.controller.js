(function () {
	'use strict';

	app
	.controller('LoginController', LoginController);

	LoginController.$inject = ['$timeout', '$location', 'UserService','$localStorage'];
	function LoginController($timeout, $location, UserService,$localStorage) {
		var vm = this;
        console.log("inside LoginController");
		vm.login = login;
		
		(function initController() {
		
		})();
		var user = {};
		
		function login() {
			  console.log("inside login");

			vm.dataLoading = true;
			UserService.Login(vm.email, vm.password)
		    .then(function(response) {
            	console.log(response) ;
                if(response) {
                	console.log("login.controller:-> login success. showing the response", response);
                	$localStorage.email=vm.email;
                	$localStorage.userName=response.data.name;
                	$localStorage.userType=response.data.userType;
                	
                	console.log($localStorage.email);
                	
                	switch(response.data.userType)
                	{
                		case 1:
                			 $location.path('/admin') ;
                			 $location.replace("http://localhost:8080/PizzaWale/#/login");
                			 //alert("Admin Login successful");
                			break;
                			
                		case 2:
                			$location.path('/employee') ;
               			 	$location.replace("http://localhost:8080/PizzaWale/#/login");
                			// alert("Employee Login successful");  
                			break;
                			
                		case 3:
                			$location.path('/order') ;
                			 $location.replace("http://localhost:8080/PizzaWale/#/login");
                			//alert("User Login successful");
                			break;
                			
                		case 4:
                			//$location.path('/order') ;
                			$location.path('/home') ;
               			 $location.replace("http://localhost:8080/PizzaWale/#/login");
                			alert("Guest Login successful");
                			break;
                			
                		case 5:
                			break;
                			
                		default:
                			$location.path('/order');
              			 $location.replace("http://localhost:8080/PizzaWale/#/login");
                			
                	}
                	/*if(vm.email=="dhruvin@pizzawale"){ $location.path('/admin') ;alert("Admin Login successful");          		
                	}else if(vm.email=="pranav@pizzawale"){$location.path('/admin') ; alert("Admin Login successful");  
                	}else if(vm.email=="siddhant@pizzawale"){$location.path('/admin') ;alert("Admin Login successful");}
                	else if(vm.email=="employee@pizzawale"){$location.path('/employee') ;alert("Employee Login successful");}
                	else {$location.path('/order') ;alert("User Login successful");}     */
                	
                }
                else {
                    vm.dataLoading = false ;
                	$localStorage.email=null;
                	
                    alert("Login Failed");
                    //$location.path('/login') ;
                    //document.getElementById("login_err").style.display="block";
                    //setTimeout(function(){document.getElementById("login_err").style.display="none";},3000);
                    //document.location.reload();
                }
            }) ;
	}
}})();
