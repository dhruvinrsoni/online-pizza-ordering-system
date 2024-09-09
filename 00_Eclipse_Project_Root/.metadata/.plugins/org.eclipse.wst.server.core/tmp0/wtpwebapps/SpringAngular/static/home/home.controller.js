(function () {
    'use strict';

    angular
        .module('app')
        .controller('HomeController', HomeController);

    HomeController.$inject = ['UserService', '$rootScope','AuthenticationService', 'FlashService','$location'];
    function HomeController(UserService, $rootScope, AuthenticationService, FlashService, $location) {
        var vm = this;

        vm.user = null;
        vm.allUsers = [];
        vm.deleteUser = deleteUser;
        //vm.myfunc = myfunc;
        vm.logout = logout;

        initController();

        function initController() {
            loadCurrentUser();
            loadAllUsers();
        }

        function loadCurrentUser() {
            UserService.GetByUsername($rootScope.globals.currentUser.username)
                .then(function (user) {
                    vm.user = user;
                });
        }

        function loadAllUsers() {
            UserService.GetAll()
                .then(function (users) {
                    vm.allUsers = users;
                });
        }

        function deleteUser(id) {
            UserService.Delete(id)
            .then(function () {
                loadAllUsers();
            });
        }
        
        function myfunc() {
        	  alert('inside myfunc');
          	
        }

       
        //new start
        function logout() {
//            vm.dataLoading = true;
            alert('inside homeController - vm.logout()');
        	
            AuthenticationService.Logout(function (response) {
                if (response.success) {
//                    AuthenticationService.SetCredentials(vm.username, vm.password);
                    alert('After response.success - calling $location.path(\'/login\')');
                	
                    $location.url('/login');
                    alert('logout successful !');
                } else {
                    FlashService.Error(response.message);
//                    vm.dataLoading = false;
                    alert('logout failed');
                }
            });
        }

        //new end
        
    }

})();