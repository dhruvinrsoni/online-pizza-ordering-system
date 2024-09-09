(function () {
    'use strict';
    app
    .controller('editorderController',editorderController);
		editorderController.$inject = ['OrderService','$scope','$localStorage'] ;
    	function editorderController(OrderService,$scope,$localStorage){
    		var vm = this;
            console.log("inside editOrderController");
            vm.Allitems=$localStorage.ordered;
            vm.email=$localStorage.email;
           
    }

})();
            
            
            /*
            vm.items=$localStorage.ordered;
    		vm.editorder = editorder;
    	$scope.stars=[
         { 		
    		"type":"condo",
    		"price":22000    		
    	},
         {"type":"jerry",
     		"price":8000         	 
         }
    	];
    	
    	function editorder(){
    		console.log("Inside  editorder controller") ;
        	console.log("$localStorage.email:- "+$localStorage.email);
        	vm.order1.email=$localStorage.email;
        	vm.dataLoading = true;
        	
        	 service.Postorder(vm.editorder)
        	 .then(function(response) {
             	console.log(response) ;
             	if(response!=false) {
                	console.log("editorder success");
                	$localStorage.ordered=response;
                    $location.path('/payment') ;
                    alert("Redirecting to payment..");
                }
                else {
                    vm.dataLoading = false ;
                    $location.path('/editorder') ;
                    alert("Sorry! Your Order is not edited");
                }
        	 });
        	
    	}
    
    
    };
    });
    		
    		*/
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		/*editorderController);

    // inject dependencies
   editorderController.$inject = ['OrderService','$location','$localStorage'] ;

    function editorderController(OrderService, $location,$localStorage) {
        if($localStorage.email==null){$location.path('/') ;}
    	var vm = this;
        console.log("update order Here") ;
        vm.items=$localStorage.ordered;
    }
})();
/*

var app= angular.module("app",[]);

//here we declare the controller in wihch used the order array

app.controller("editorderController",function($scope,$localStorage) {
	var res =$localStorage.ordered;
	$scope.result = res;
	
});*/
