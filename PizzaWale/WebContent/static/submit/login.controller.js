(function () {
	'use strict';

	app
	.controller('SubmitController', SubmitController);

	SubmitController.$inject = ['$location', 'UserService','$localStorage'];
	function SubmitController($location, UserService,$localStorage) {
		var vm = this;
        console.log("inside SubmitController");
		vm.login = login;
	

		(function initController() {
		
		})();
		var user = {};
		
		function submit() {
			  console.log("inside submit");

			vm.dataLoading = true;
			UserService.Submit()
		    .then(function(response) {
            	console.log(response) ;
                if(response) {
                	console.log("Submit success");
                	
                    $location.path('/login') ;
                    alert("Login Success!!");
                }
                else {
                    vm.dataLoading = false ;
                    alert("Login Unsuccessful!!");
                }
            }) ;
		    
		
		
		
	



	}

}})();
