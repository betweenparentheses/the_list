theList.factory('gApiCalendar', function(){
  // Your Client ID can be retrieved from your project in the Google
  // Developer Console, https://console.developers.google.com
  var CLIENT_ID = '319163226334-r1tdgnnsqcfmk13keh8u3du6jls5se66.apps.googleusercontent.com';
  var SCOPES = ["https://www.googleapis.com/auth/calendar"];


  var returnObject = {};

  /**
   * Check if current user has authorized this application.
   */
  var checkAuth = function() {
    gapi.auth.authorize(
      {
        'client_id': CLIENT_ID,
        'scope': SCOPES,
        'immediate': true
      }, handleAuthResult);
  };



  /**
   * Initiate auth flow
   *
   */
  returnObject.startAuthFlow = function(event) {
    gapi.auth.authorize(
      {client_id: CLIENT_ID, scope: SCOPES, immediate: false},
      function(){
        loadCalendarApi(event);
      });
    return false;
  };



  /**
   * Load Google Calendar client library. List upcoming events
   * once client library is loaded.
   */
  var loadCalendarApi = function(event) {
    gapi.client.load('calendar', 'v3', function(){
      createEvent(event);
    });
  };



  /**
   * Print the summary and start datetime/date of the next ten events in
   * the authorized user's calendar. If no events are found an
   * appropriate message is printed.
   */
  var createEvent = function(event) {



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

    var request = gapi.client.calendar.events.insert({
      'calendarId': 'primary',
      'resource' : resource

    });

    request.execute(function(resp) {
      var result = resp.result;
      console.log(result);

    });

  };



  return returnObject;

});