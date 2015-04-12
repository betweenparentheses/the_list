theList.controller('ActivitiesShowCtrl', ['$scope', '$routeParams', '$http', function($scope, $routeParams, $http){
  $scope.activities = [];
  $http.get('./activities/' + $routeParams.id + '.json').success(function(data){
    $scope.activity = data;
  });

}]);