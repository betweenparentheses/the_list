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
  };

  o.create = function(formData){

    return $http.post('./activities', formData).success(function(data){
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


  return o;

}]);