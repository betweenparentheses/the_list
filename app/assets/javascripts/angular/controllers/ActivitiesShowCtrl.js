theList.controller('ActivitiesShowCtrl', ['$scope', '$location', '$http', function($scope, $location, $http){
  $scope.activities = [];
  $http.get('./activities/#{$routeParams.id}.json').success(function(data){
    $scope.activity = data;
  });

}]);