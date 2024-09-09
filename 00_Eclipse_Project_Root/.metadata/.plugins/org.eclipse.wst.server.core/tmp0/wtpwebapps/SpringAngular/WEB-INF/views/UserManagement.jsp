<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html ng-app="app">
<head>
    <meta charset="utf-8" />
    <title>Topaz BSI AngularJS User Registration and Login Example</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
    <link href="static/app-content/app.css" rel="stylesheet" />
</head>
<body>

    <div class="jumbotron">
        <div class="container">
            <div class="col-sm-8 col-sm-offset-2">
                <div ng-class="{ 'alert': flash, 'alert-success': flash.type === 'success', 'alert-danger': flash.type === 'error' }" ng-if="flash" ng-bind="flash.message"></div>
                <div ng-view></div>
            </div>
        </div>
    </div>
    <div class="credits text-center">
        <p>
            <a href="http://www.bluesapphiretech.com">BSI - Your Career Growth Catalyst</a>
        </p>
        <p>
            <a href="http://www.topazsys.com">Shriram Deokule</a>
        </p>
    </div>

    <script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
    <script src="//code.angularjs.org/1.2.20/angular.js"></script>
    <script src="//code.angularjs.org/1.2.20/angular-route.js"></script>
    <script src="//code.angularjs.org/1.2.13/angular-cookies.js"></script>

    <script src="static/app.js"></script>
    <script src="static/app-services/authentication.service.js"></script>
    <script src="static/app-services/flash.service.js"></script>

    <!-- Real user service that uses an api -->
    <script src="static/app-services/user.service.js"></script>

    <!-- Fake user service for demo that uses local storage -->
<!--    <script src="app-services/user.service.local-storage.js"></script> -->

    <script src="static/home/home.controller.js"></script>
    <script src="static/login/login.controller.js"></script>
    <script src="static/register/register.controller.js"></script>
</body>
</html>