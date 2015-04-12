// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var theList = angular.module('theList', ['ngRoute']);

theList.config(['$routeProvider', function($routeProvider){
  $routeProvider
    .when('/activities', {
      templateUrl: './templates/activities/index.html',
      controller: 'ActivitiesIndexCtrl'
    })
    .when('/activities/:id', {
      templateUrl: './templates/activities/show.html',
      controller: 'ActivitiesShowCtrl'
    })
    .otherwise({
      templateUrl: './templates/home.html',
      controller: 'HomeCtrl'
    })
}]);


