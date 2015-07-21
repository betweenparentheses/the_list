theList.controller('DiscoverCtrl',
  ['$scope', 'Restangular', 'gApiCalendar',
  function($scope, Restangular, gApiCalendar) {

    Restangular.all('events').getList().then(function (results) {
        $scope.events = results;
        console.log(results);
    });

    $scope.createEvent = function(event){
      console.log(gApiCalendar);
      gApiCalendar.startAuthFlow();
    }


}]);