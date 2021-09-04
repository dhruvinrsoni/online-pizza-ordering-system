(function () {
	'use strict';

	app
	.controller('LogoutController', LogoutController);

	LogoutController.$inject = ['$location', 'UserService','$localStorage', '$cookies'];
	function LogoutController($location, UserService,$localStorage, $cookies) {
		var vm = this;
        console.log("inside LogoutController");
		logout();
		
		function logout() {
			var serverUrl = 'http://localhost:8080/PizzaWale' ;
			  console.log("inside logout");
			  vm.email=$localStorage.email;
			vm.dataLoading = false;
			UserService.logout(vm.email, vm.password)
		    .then(function(response) {
            	console.log(response) ;
                if(response) {
                	console.log("logout success");
                	

                	$localStorage=null;
                	console.log("Clearing the localStorage...");
                	localStorage.clear();
                	console.log("localStorage cleared...");
                	$cookies.remove();
                	console.log("$localStorage after logout:- ",$localStorage);
                	alert("User Logout successful.");
                	$location.path('/');
                	//NavBarController.checkLogin();
                	document.location=serverUrl;
                }
                else {
                    vm.dataLoading = true ;
                	$localStorage.email=vm.email;
                    alert("Unsuccessful logout");
                }
            }) ;
	}
}})();
