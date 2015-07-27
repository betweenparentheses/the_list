// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
'use strict';
var theList = angular.module('theList', ['ui.router', 'restangular', 'googleApi']);



theList.config(['RestangularProvider',
  function(RestangularProvider) {
    RestangularProvider.setBaseUrl('/');
    RestangularProvider.setRequestSuffix('.json');
}]);


// configure Google API for read-write calendar access
theList.config(function(googleLoginProvider) {
        googleLoginProvider.configure({
            clientId: '319163226334-r1tdgnnsqcfmk13keh8u3du6jls5se66.apps.googleusercontent.com',
            scopes: ["https://www.googleapis.com/auth/calendar"]
        });
    })

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


