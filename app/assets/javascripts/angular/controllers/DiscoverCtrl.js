theList.controller('DiscoverCtrl',
  ['$scope', '$window', 'Restangular', 'googleLogin', 'googleCalendar',
  function($scope, $window, Restangular, googleLogin, googleCalendar) {

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
        // fix time overflow issues
        dateTime.setDate(date);
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

      console.log(googleCalendar);
      this.calendarItems = googleCalendar.createEvent(params);

    };



}]);