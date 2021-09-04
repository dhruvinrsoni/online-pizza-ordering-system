(function(){
    'use strict' ;
    app
    .controller('orderController', orderController);

    // inject dependencies
   orderController.$inject = ['OrderService','$location','$localStorage', '$scope'] ;

    function orderController(OrderService, $location,$localStorage, $scope) {
    	if($localStorage.email==null){$location.path('/') ;}
    	var vm = this;
    	
        console.log("Order Controller: Order Here...") ;
        vm.addToCart=addToCart;
        var arr=new Array();
 	   function addToCart(id)
 	   {
 		   var size=itemList.length;
 		   console.log("size:-"+size);
 		   arr.length=(size+1);
 		   for(var i=0;i<size+1;i++)
			   {
			   	arr[i]=0;
			   }
 		   arr[0]=$localStorage.email;
 		   arr[id]=arr[id]+1;
 	   }
        
        getItemFromController();
        
       function getItemFromController()
       {
    	   console.log("inside order Controller-> getItemFromController()");
    	   OrderService.getItems()
           .then(function(response){
           	
           	console.log("response of items:", response);
           	
           	$localStorage.itemList=response;
           	vm.itemList=$localStorage.itemList;
           	
           });
        
        vm.order = function() {
        	console.log("Inside  order controller") ;
        	console.log("$localStorage.email:- "+$localStorage.email);
        	//vm.order1.email=$localStorage.email;
            vm.dataLoading = true ;
            var scope=[];
            //scope.push($localStorage.email);
            /*scope.push(vm.order1.margherita);
            scope.push(vm.order1.farmhouse);
            scope.push(vm.order1.peppyPaneer);
            scope.push(vm.order1.chickenFiesta);
            scope.push(vm.order1.chickenGoldenDelight);
            scope.push(vm.order1.nonVegSupreme);*/
            //console.log("vm.order1:- "+vm.order1+" & vm.order1.peppyPaneer:- "+vm.order1.peppyPaneer+" & vm.order1.email:-"+vm.order1.email);
            //console.log("vm.order1.peppyPaneer_id:- "+vm.order1.peppyPaneer_id);
            //vm.order1 = scope;
            vm.order1.email=$localStorage.email;
            //vm.order1.item[0]=$localStorage.email;
            console.log("==================================Order Object");
            console.log(vm.order1.item);
            console.log("calling orderservice");
            //vm.order1.item[0]=$localStorage.email;
            OrderService.create(vm.order1.item)
            .then(function(response) {
            	console.log("response from OrderService.create:- "+response) ;
            	console.log(response);
            	
            	
            	if(response!=false) {
                	console.log("order success");
                	$localStorage.ordered=response;
                    $location.path('/editorder') ;
                    alert("Order placed in cart..");
                }
                else {
                    vm.dataLoading = false ;
                    $location.path('/order') ;
                    alert("Sorry! Your Order is not placed");
                }
            }) ;
        } ;
       
       }
    }
})();
