theList.controller('ActivitiesIndexCtrl',
 ['$scope',
 'activities',
 'allActivities',
 function($scope, activities, allActivities){
  $scope.activities = activities.activities;
  $scope.categories = activities.categories;


  $scope.formData = {};
  $scope.formData.category = $scope.categories[0];

  $scope.createActivity = function(){
    activities.create($scope.formData);
    $scope.formData = {};
  };

  $scope.deleteActivity = function(activity){
    activities.delete(activity);
  };

  $scope.getCategory = function(activity){
    return activities.getCategory(activity);
  };


}]);