theList.controller('ActivitiesIndexCtrl', ['$scope', '$location', '$http', function($scope, $location, $http){
  $scope.activities = [];
  $http.get('./activities.json').success(function(data){
    $scope.activities = data;
    $scope.categories = data.map(function(elem, i, arr){
      return elem.category.name;
    });
  });

  $scope.viewActivity = function(id){
    $location.url("/activities\/" + id );
  }

  $scope.name = "";
  $scope.category = "";
  $scope.location = "";
  $scope.description = "";
  $scope.expiration_date = "";
}]);