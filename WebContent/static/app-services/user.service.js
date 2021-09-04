(function() {
    'use strict' ;
    angular.module('app')
    .factory('UserService', UserService);

    UserService.$inject = ['$http','$location'] ;

    function UserService ($http) {
        var serverUrl = 'http://localhost:8080/PizzaWale' ;
        var service = {} ;

      
        service.create = Create;
        service.Login = Login;
     
        service.AddToCart = AddToCart;
        service.logout = logout;
 
        service.getHistory = getHistory;
        service.changePassword = changePassword;
        
//service.Order = Order;

        function Login(email, password) {
        	console.log("inside Login of user.service with email as:-"+email+" and password as:- "+password);
        	var user = {};
        	user.email=email;
        	user.password=password;
        	console.log("fetching account...");
            //return $http.post(serverUrl + '/user/login',user ).then(handleSuccess1, handleError1('Error getting user by email'));
        	return $http.post(serverUrl + '/user/login',user ).then(function(response){
        		console.log("user.service.js:-> Login():-> Login Successful!... Now showing response:->");
        		console.log(response);
        		return response;    		
        	}, function(response){
        		
        		console.log("Login Credentials wrong");
        		return 0;
        	});
            
        };
        
  
              
        function logout(email, password) {
        	var user = {};
        	user.email=email;
        	user.password=password;
			console.log('inside user.service: logout...');
            return $http.get(serverUrl + '/logout').then(handleSuccess, handleError('Error while logging out'));
        }

        
        
        function AddToCart(email,pizza) {
			alert('inside addtocart. for.. ' + email);
            return $http.post(serverUrl + '/user/cart/' +email ,pizza).then(handleSuccess, handleError('Error adding to cart'));
        }
        
        function getHistory(){
        	alert('in getHistory()');
        	return $http.get(serverUrl + '/user/history/').then(handleSuccess, handleError('Error retrieving history'));
        }
        
        function changePassword(old, password){
        	alert('Service for changing password');
        	return $http.post(serverUrl + '/user/password/' + old, password).then(handleSuccess, handleError('Error Changing password'));
        }


            
            
      
       function Create(user) {
        	console.log("Inside create");
        	var dataObj = $http.post(serverUrl + '/register' ,user)
            .then(handleSuccess, handleError('Error creating user'));
        	console.log(dataObj) ;
        	return dataObj ;
        } ;

        function handleSuccess(res) {
        	console.log('res.status : ' + res.status);
            return res.data ;
        };

        function handleError(error) {
            return function() {
                return {
                    success : false ,
                    message : error
                };
            };
        };
        
        
        
        function handleSuccess1(res) {
        	console.log('res.status : ' + res.status);
                 
        //	  return function() { 
            return true;
        	//  };
            
        };

        function handleError1(error) {
          //  return function() {
                return  false ;
          //      };
        };
        //service.create = create ;
        return service ;
    };
})();
