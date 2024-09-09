(function () {
	'use strict';

	app
	.controller('LoginController', LoginController);

	LoginController.$inject = ['$location', 'UserService','$localStorage'];
	function LoginController($location, UserService,$localStorage) {
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
                	console.log("login success");
                	$localStorage.email=vm.email;
                	console.log($localStorage.email);
                    $location.path('/order') ;
                    alert("abdec");
                }
                else {
                    vm.dataLoading = false ;
                    alert("abc");
                }
            }) ;
		    
		
		
		
	



	}

}})();
