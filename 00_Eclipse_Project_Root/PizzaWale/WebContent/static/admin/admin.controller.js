(function(){
    'use strict' ;
    app
    .controller('adminController', adminController);

    // inject dependencies
   adminController.$inject = ['$location', 'UserService','$localStorage'] ;

    function adminController(adminService, $location,$localStorage) {
    	
    	var vm = this;
        console.log(" admin Here") ;
        vm.admin = function() {
        	console.log("Inside  admin controller") ;
        	console.log($localStorage.email);
        	vm.order1.email=$localStorage.email;
            vm.dataLoading = true ;
            console.log(vm.order1);
            adminService.create(vm.order1)
            .then(function(response) {
            	console.log(response) ;
            	
            	if(response!=false) {
                	console.log("order success");
                	$localStorage.admined=response.adminItem;
                    $location.path('/editorder') ;
                    alert("order placed in cart");
                }
                else {
                    vm.dataLoading = false ;
                    $location.path('/admin') ;
                    alert("order not placed");
                }
            	
           
            }) ;
        } ;
    }
})();
