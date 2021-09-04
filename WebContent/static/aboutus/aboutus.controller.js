(function(){
    'use strict' ;
    app
    .controller('AboutUsController', AboutUsController);

    // inject dependencies
    AboutUsController.$inject = ['$location', 'UserService','$localStorage', '$timeout'] ;

    function AboutUsController(adminService, $location,$localStorage, $timeout) {
    	
    	/*$timeout(function(){alert("Welcome to About Us section: Who we are...");}, 1000);*/
    }
})();
