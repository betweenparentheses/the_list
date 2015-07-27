theList.controller('DiscoverCtrl',
  ['$scope', '$window', '$filter', 'Restangular', 'googleLogin', 'googleCalendar',
  function($scope, $window, $filter, Restangular, googleLogin, googleCalendar) {


    $scope.createdEvents = [];

    $scope.login = function () {
        googleLogin.login();
    };


    Restangular.all('events').getList().then(function (results) {
        $scope.events = results;
        console.log(results);
    });

    $scope.createEvent = function(event){

      var dateTime = new Date(event.date);
      var startTime;

      var date = dateTime.getDate();


      if(event.time){ startTime = new Date(event.time); }
      if(startTime){
        dateTime.setMinutes(startTime.getMinutes());
        dateTime.setHours(startTime.getHours());
        dateTime.setDate(date + 1);
      }

      var d2 = new Date ( dateTime );
      d2.setMinutes ( dateTime.getMinutes() + 60 );


      var resource = {
        "summary": event.name,
        "location": event.location,
        "description": event.description,
        "start": {
          "dateTime": (dateTime.toISOString())
        },
        "end": {
          "dateTime": (d2.toISOString())
        }
      };

      var params = {
        'calendarId': 'primary',
        'resource' : resource
      };


      this.createdEvents.push(googleCalendar.createEvent(params));
      $window.alert('Reload your calendar! Created event: "' + event.name + '" on ' + $filter('date')(dateTime) + '!')
    };



}]);