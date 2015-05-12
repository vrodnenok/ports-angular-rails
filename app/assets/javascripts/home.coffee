# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

portsapp = angular.module('portsapp', [
  # 'templates',
  'ngRoute',
  'ngResource',
  'ngAnimate',
  'ngSanitize',
  'ng-token-auth',
  'controllers'
]).config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/',
    templateUrl: 'templates/main.html'
    controller: 'MainCtrl')
    .when('/about',
    templateUrl: 'templates/about.html'
    controller: 'AboutCtrl')
    .when('/signin',
    templateUrl: 'templates/user_sessions/new.html',
    controller: 'UserSessionsCtrl')
    .when('/signup',
    templateUrl: 'templates/user_registrations/new.html',
    controller: 'UserRegistrationsCtrl')
    .otherwise redirectTo: '/'  

controllers = angular.module('controllers', [])

controllers
  .controller("MainCtrl", ['$scope',
  ($scope) ->
]).controller("AboutCtrl", ['$scope',
  ($scope) ->
]).controller("UserSessionsCtrl", ['$scope',
  ($scope) ->
    $scope.$on 'auth:login-error', (ev, reason) ->
      $scope.error = reason.errors[0]
      console.log ("ev = " + ev)
]).controller "UserRegistrationsCtrl", ['$scope', '$auth',
  ($scope, $auth) ->
    $scope.handleRegBtnClick = ->
      $auth.submitRegistration($scope.registrationForm)
      .then resp ->
        $auth.submitLogin
          email: $scope.registrationForm.email, 
          password: $scope.registrationForm.password
]

portsapp.run [
  '$rootScope'
  '$location'
  ($rootScope, $location) ->
    $rootScope.$on 'auth:login-success', ->
      $location.path '/'
      return
    return
]