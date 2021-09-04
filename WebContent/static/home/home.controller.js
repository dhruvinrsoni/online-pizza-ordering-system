(function () {
	'use strict';

	app
	.controller('HomeController', HomeController);

	HomeController.$inject = ['$location', 'UserService','$localStorage', '$cookies'];
	function HomeController($location, UserService,$localStorage, $cookies) {
		var vm = this;
        console.log("inside HomeController");
}})();
