theList.controller('ActivitiesIndexCtrl',
 ['$scope',
 'activities',
 'allActivities',
 function($scope, activities, allActivities){
  $scope.activities = activities.activities;
  $scope.categories = activities.categories;

  $scope.formData = {};

  $scope.createActivity = function(){
    console.log("createActivity() running");
    activities.create($scope.formData);
    $scope.formData = {};
  };


}]);