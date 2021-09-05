
(function () {
    'use strict';
    app
    .controller('employeeController',employeeController);
    employeeController.$inject = ['EmployeeService','$scope','$localStorage','$http'] ;
    	function employeeController(EmployeeService,$scope,$localStorage){
    		var vm = this;
            console.log("inside employeeController");
            var orders={};
            EmployeeService.getallorders()
                 .then(function(response) {
                 	console.log("response from EmployeeController.getallorders:- "+response) ;
                 	//console.log("response.data from EmployeeController.getallorders:- "+response.data) ;
                 	//console.log(response);
                 	
                 	for(var i=0;i<response.length;i++){
                 		console.log("for i:"+i+" the order:"+response[i]);
                 		response[i].serialKey=i+1;
                 		if(response[i].orderStatus==1){
                 			response[i].done=false;
                 		} else {
                 			response[i].done=true;
                 		}
                 	}
                 	
                 	orders=response;
                 	
                 	$scope.orders=orders;
                 	
                 	if(response!=false) {
                     	console.log("order success");
                     	//$localStorage.ordered=response;
                         //$location.path('/editorder') ;
                         //alert("Order placed in cart..");
                     }
                     else {
                         //vm.dataLoading = false ;
                         //$location.path('/order') ;
                         //alert("Sorry! Your Order is not placed");
                     }
                 }) ;
            
            /*$scope.orders = [
                             {serialKey: '1', done: true, orderid:'123', name: 'Cust 1',  items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '2', done: true, orderid:'124', name: 'Cust 2',  items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '3', done: true, orderid:'125', name: 'Cust 3', items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '4', done: false, orderid:'126', name: 'Cust 3', items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},

                             ];*/
            /*$scope.orders = [
                             {serialKey: '1', done: true, orderid:'123', name: 'Shyam Sharma', address:'4, Pune road, Pune' ,  phone:'7618032564', items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '2', done: true, orderid:'124', name: 'Ram Mishra', address:'5, Pune road, Pune' ,  phone:'7618032564', items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '3', done: true, orderid:'125', name: 'Ghanshyam', address:'6, Pune road, Pune' ,  phone:'7618032564', items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '4', done: false, orderid:'126', name: 'Kishan', address:'7, Pune road, Pune' ,  phone:'7618032564', items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},

                             ];*/
            
            /*$scope.items = [
                            {orderid:'123',  item:' Onion Single'},
                            {orderid:'123',  item:' Veg Overloaded'},
                            {orderid:'123',  item:' Fusilli Pasta'},
                            {orderid:'123',  item:' Cheesy Dip'},
                            {orderid:'124',  item:' Cheesy Single'},
                            {orderid:'124',  item:' Chicken Overloaded'},
                            {orderid:'124',  item:' Spaghetti Pasta'},
                            {orderid:'124',  item:' Peri peri Dip'},
                            {orderid:'125',  item:' Chicken Barbeque Single'},
                            {orderid:'125',  item:' Overloaded'},
                            {orderid:'125',  item:' Alfredo Pasta'},
                            {orderid:'125',  item:' Guacamole Dip'},
                            {orderid:'126',  item:' Barbeque chicken Single'},
                            {orderid:'126',  item:' Veg Overloaded'},
                            {orderid:'126',  item:' Penne Pasta'}
                          ];*/
            
            $scope.theme = true;
            $scope.getTheme= function(them) {

                if(them){
                  return "dark";
              }
                else{
                  return "light";
                }

              };

            $scope.getorderClass = function(status) {
              if(status){
                return 'done';
              }
              else{
                return 'pending';
              }

            };

            $scope.changeState= function(status) {
            status=!status;
            };
           
    }

})();
        





