# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

portsapp = angular.module('portsapp', [
  'templates',
  'ngRoute',
  'ngResource',
  'ngAnimate',
  'ngSanitize',
  'ng-token-auth',
  'controllers'
]).config ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl:'main.html'
    controller: 'MainCtrl').when('/about',
    templateUrl: 'assets/templates/about.html'
    controller: 'AboutCtrl').otherwise redirectTo: '/'

controllers = angular.module('controllers', [])

controllers.controller("MainCtrl", ['$scope',
  ($scope) ->
])