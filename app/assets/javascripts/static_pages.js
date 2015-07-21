// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
'use strict';
var theList = angular.module('theList', ['ui.router', 'restangular']);


theList.config(['RestangularProvider',
  function(RestangularProvider) {
    RestangularProvider.setBaseUrl('/');
    RestangularProvider.setRequestSuffix('.json');
}]);

theList.config(['$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider){
  $stateProvider
    .state('activities', {
      url: '/activities',
      templateUrl: './templates/activities/index.html',
      controller: 'ActivitiesIndexCtrl',
      resolve: {
        allActivities: ['activities', function(activities){
          return activities.getAll();
        }]
      }
    })
    .state('activity', {
      url: '/activities/:id',
      templateUrl: './templates/activities/show.html',
      controller: 'ActivitiesShowCtrl'
    })
    .state('home', {
      url: '/',
      templateUrl: './templates/home.html',
      controller: 'HomeCtrl'
    })
    .state('discover', {
      url: '/discover',
      templateUrl: './templates/events/index.html',
      controller: 'DiscoverCtrl'
    })
    $urlRouterProvider.otherwise('/')
}]);


