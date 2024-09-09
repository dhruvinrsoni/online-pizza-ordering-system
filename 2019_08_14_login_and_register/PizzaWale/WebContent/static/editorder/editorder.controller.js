(function(){
    'use strict' ;
    angular.module('app')
    .controller('editorderController', editorderController);

    // inject dependencies
   editorderController.$inject = ['OrderService','$location','$localStorage'] ;

    function editorderController(OrderService, $location,$localStorage) {
        if($localStorage.email==null){$location.path('/') ;}
    	var vm = this;
        console.log("update order Here") ;
        vm.items=$localStorage.ordered;
    }
})();
