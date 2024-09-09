(function(){
    'use strict' ;
    angular.module('app')
    .controller('registerController', registerController);

    // inject dependencies
    registerController.$inject = ['UserService','$location'] ;

    function registerController(UserService, $location) {
    	if($localStorage.email!=null){$location.path('/') ;}
    	var vm = this ;
        console.log("Here") ;
        vm.register = function() {
        	console.log("Inside controller") ;
            console.log(vm.user) ;
            vm.dataLoading = true ;
            UserService.create(vm.user)
            .then(function(response) {
            	console.log("response : " + response.email) ;
                if(response.email != undefined) {
                	console.log("UserService.create() returned Success");
                    $location.path('/login') ;
                    alert("abdec");
                }
                else {
                    vm.dataLoading = false ;
                    alert("abc");
                }
            }) ;
        } ;
    }
})();
