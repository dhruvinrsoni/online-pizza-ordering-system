(function() {
    'use strict' ;
    angular.module('app')
    .factory('editOrderService', editOrderService);

    editOrderService.$inject = ['$http','$localStorage','$scope'] ;

    function OrderService ($http,$localStorage,$scope) {
        var serverUrl = 'http://localhost:8080/PizzaWale' ;
        var service = {} ;

      
        service.Postorder = Postorder;
        service.Update = Update;
     
       function Postorder(editorder) {
        	console.log("Inside post editorder of editOrder.service");
        	console.log("order=>");
        	console.log(editorder);
        	console.log("$localStorage.email:- "+$localStorage.email);
        	console.log("sending data to server...");
        	var dataObj1 = $http.post(serverUrl + '/editorder' ,editorder)
            .then(handleSuccess1, handleError1('Error creating order'));
        	console.log("dataObj1->") ;
        	console.log(dataObj1) ;
        	return dataObj1 ;
        } ;
        
        function Update(order) {
        	console.log("Inside update order");
        	console.log($localStorage.email);
        	var dataObj2 = $http.post(serverUrl +'/updateorder', order)
        	.then(handleSuccess1, handleError1('Error updating user'));
        	return dataObj2 ;
        }

        /*
        function EditOrder(order){
        	console.log("Inside edit order");
        	console.log("$localStorage.email:- "+$localStorage.email);
        	
        	var dataObj3 = $http.post(serverUrl + '/editorder' ,order)
        	.then(handleSuccess1, handleError1('Error updating user'));
        	console.log("dataObj3->") ;
        	console.log(dataObj3) ;
        	return dataObj3 ;
        };*/
        
        

        function handleSuccess1(res) {
        	console.log('res.status : ' + res.status);
            return res.data ;
        };

        function handleError1(error) {

        	return function() {
                return false; 
                
            };
        };
        
        //service.create = create ;
        return service ;
    };
})();
