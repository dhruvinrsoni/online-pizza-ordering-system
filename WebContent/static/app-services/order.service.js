(function() {
    'use strict' ;
    angular.module('app')
    .factory('OrderService', OrderService);

    OrderService.$inject = ['$http','$localStorage'] ;

    function OrderService ($http,$localStorage) {
        var serverUrl = 'http://localhost:8080/PizzaWale' ;
        var service = {} ;
       
        
        service.create = Create;
        service.Update = Update;
        service.getItems=getItems;

        service.create = Create;
       function Create(order) {
        	console.log("Inside create order of order.service");
        	console.log("order=>");
        	console.log(order);
        	console.log("$localStorage.email:- "+$localStorage.email);
        	console.log("sending data to server...");
        	const headers = {'email': $localStorage.email};
        	//const options = new RequestOptions({headers: headers});
        	var dataObj1 = $http.post(serverUrl + '/order/'  ,order, {headers})
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
        };
        
        function GetAll(email) {
			
       	 console.log("in editordersummary ");
           return $http.get(serverUrl + '/editorder').then(handleSuccess1, handleError1('Error getting all users'));
       }
        
        function getItems()
        {
        	console.log("Inside order service: getItems:- ");
        	return $http.get(serverUrl + '/items').then(handleSuccess1, handleError1('Error getting all users'));
        	
        }
        
        
        

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
