theList.controller('DiscoverCtrl',
  ['$scope', 'Restangular',
  function($scope, Restangular) {

    Restangular.all('events').getList().then(function (results) {
        $scope.events = results;
        console.log(results);
    });


}]);