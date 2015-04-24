theList.factory('activities', ['$http', function($http){
  var o = {};
  o.activities = [];
  o.categories = [];
  o.categoryHash = {};

  o.getAll = function(){
    return $http.get('./activities.json').success(function(data){
      console.log(data.activities);
      console.log(data.categories);
      o.activities = data.activities;
      o.categories = data.categories;

      angular.forEach(data.categories, function(elem){
        o.categoryHash[elem.id] = elem.name;
      })

    });
  };

  o.create = function(formData){

    return $http.post('./activities.json', formData).success(function(data){
      console.log(data);
      o.activities.push(data);
      return data;
    });
  };

  o.delete = function(activity){

    return $http.delete('./activities/'+ activity.id+'.json').success(function(data){
      var index = o.activities.indexOf(activity);
      if(index > -1){ o.activities.splice(index); }

      return data;
    });
  };

  o.getCategory = function(activity){
    return o.categoryHash[activity.category_id];
  };

  return o;

}]);