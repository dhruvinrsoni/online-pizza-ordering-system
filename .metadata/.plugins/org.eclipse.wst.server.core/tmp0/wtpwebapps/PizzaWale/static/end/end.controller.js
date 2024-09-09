(function () {
	'use strict';

	app
	.controller('endController', endController);

	endController.$inject = ['$location', 'UserService','$localStorage'];
	function endController($location, UserService, $localStorage) {
		var vm=this;
		$localStorage.email=vm.email;
		$location.path('/') ;

	}})();
