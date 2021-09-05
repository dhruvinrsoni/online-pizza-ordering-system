(function() {
    'use strict' ;
    angular.module('app')
    .factory('EmployeeService', EmployeeService);

    EmployeeService.$inject = ['$http','$localStorage'] ;

    function EmployeeService ($http,$localStorage) {
        var serverUrl = 'http://localhost:8080/PizzaWale' ;
        var service = {} ;
       
        
        service.getallorders = getAllOrders;


		       function getAllOrders() {
			console.log("Inside getting orders of employee.service");
			// console.log("order=>");
			// console.log(order);
			console.log("$localStorage.email:- " + $localStorage.email);
			console.log("getting data from server...");
			const headers = {
				'email' : $localStorage.email
			};
			// const options = new RequestOptions({headers: headers});
			// var dataObj1 = $http.get(serverUrl + '/orders')
			var dataObj1 = {};
			return $http.get(serverUrl + '/orders').then(handleSuccess1, handleError1('Error getting orders'));
			/*console.log("dataObj1 from EmployeeService.getAllOrders:- "
					+ dataObj1);
			console.log("dataObj1.data from EmployeeService.getAllOrders:- "
					+ dataObj1.data);

			console.log("dataObj1->");
			console.log(dataObj1);
			return dataObj1;*/
		} ;
        
        function handleSuccess1(res) {
        	console.log('res : ' + res);
        	console.log('res.data : ' + res.data);
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
