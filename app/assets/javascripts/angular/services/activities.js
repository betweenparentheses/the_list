theList.factory('activities', ['$http', function($http){
  var o = {};
  o.activities = [];
  o.categories = [];

  o.getAll = function(){
    return $http.get('./activities.json').success(function(data){
      o.activities = data;
      o.categories = data.map(function(elem, i, arr){
        return elem.category.name;
      });
    });
  }

  o.create = function(formData){
    return $http.post('./activities', formData).success(function(data){
      return data;
    })
  }


  return o;

}]);