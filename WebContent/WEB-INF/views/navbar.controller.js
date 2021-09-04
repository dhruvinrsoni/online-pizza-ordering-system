(function () {
	'use strict';

	app
	.controller('NavBarController', NavBarController);

	NavBarController.$inject = ['$scope', '$location', 'UserService','$localStorage'];
	function NavBarController($scope, $location, UserService,$localStorage) {
        console.log("inside NavBarController");
        var vm= this;
        vm.getUserName=getUserName;
    	$scope.userName=$localStorage.email;
        /*$scope.checkLoggedIn = function(){
        	if($localStorage.email!=null){
        		return true;
        	}
        	else{
        		return false;
        	}
    	};*/
    	$scope.getUserName=function()
    	{
    		console.log("$localStorage.email:-"+$localStorage.email);
    		if($localStorage.email!=null)
    			{
    			return $localStorage.email;
    			}
    		else
    			{
    				return "Guest";
    			}
    	}
    	
    	/*function getUserName() {
    		console.log("$scope.userName:-"+$scope.userName);
    		if($scope.userName!=null)
    			{
    			return $scope.userName;
    			}
    		else
    			{
    				return "Guest";
    			}
		}*/
    	
		(function checkLoggedIn() {
			if($localStorage.email!=null){
        		return true;
        	}
        	else{
        		return false;
        	}
		})();
}})();
