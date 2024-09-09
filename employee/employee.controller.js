
(function () {
    'use strict';
    app
    .controller('employeeController',employeeController);
    employeeController.$inject = ['OrderService','$scope','$localStorage'] ;
    	function employeeController(OrderService,$scope,$localStorage){
    		var vm = this;
            console.log("inside employeeController");
            
            
            $scope.orders = [
                             {serialKey: '1', done: true, orderid:'123', name: 'Cust 1',  items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '2', done: true, orderid:'124', name: 'Cust 2',  items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '3', done: true, orderid:'125', name: 'Cust 3', items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},
                             {serialKey: '4', done: false, orderid:'126', name: 'Cust 3', items:'1. Pizza bleh bleh  2. Pasta bleh bleh'},

                             ];
            $scope.items = [
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
                          ];
            
            $scope.theme = true;

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
        





