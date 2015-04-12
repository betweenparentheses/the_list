theList.controller('ActivitiesIndexCtrl', ['$scope', '$location', '$http', function($scope, $location, $http){
  $scope.activities = [];
  $http.get('./activities.json').success(function(data){
    $scope.activities = data.activities;
  });

  $scope.viewActivity = function(id){
    $location.url("/activities/#{id}");
  }
}]);