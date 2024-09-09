(function(){
    'use strict' ;
    app
    .controller('orderController', orderController);

    // inject dependencies
   orderController.$inject = ['OrderService','$location','$localStorage'] ;

    function orderController(OrderService, $location,$localStorage) {
    	if($localStorage.email==null){$location.path('/') ;}
    	var vm = this;
        console.log(" order Here") ;
        vm.order = function() {
        	console.log("Inside  order controller") ;
        	console.log($localStorage.email);
        	vm.order1.email=$localStorage.email;
            vm.dataLoading = true ;
            console.log(vm.order1);
            OrderService.create(vm.order1)
            .then(function(response) {
            	console.log(response) ;
            	
            	if(response!=false) {
                	console.log("order success");
                	$localStorage.ordered=response.orderItem;
                    $location.path('/editorder') ;
                    alert("order placed in cart");
                }
                else {
                    vm.dataLoading = false ;
                    $location.path('/order') ;
                    alert("order not placed");
                }
            	
           
            }) ;
        } ;
    }
})();
