theList.controller('ActivitiesIndexCtrl',
 ['$scope',
 'activities',
 'allActivities',
 function($scope, activities, allActivities){
  $scope.activities = activities.activities;
  $scope.categories = activities.categories;


  // $scope.viewActivity = function(id){
  //   $location.url("/activities\/" + id );
  // }

  $scope.name = "";
  $scope.category = "";
  $scope.location = "";
  $scope.description = "";
  $scope.expiration_date = "";
}]);