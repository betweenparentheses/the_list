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



  // /**
  //  * Handle response from authorization server.
  //  *
  //  * @param {Object} authResult Authorization result.
  //  */
  // var handleAuthResult = function(authResult) {
  //   var authorizeDiv = document.getElementById('authorize-div');
  //   if (authResult && !authResult.error) {
  //     // Hide auth UI, then load client library.
  //     authorizeDiv.style.display = 'none';
  //     loadCalendarApi();
  //   } else {
  //     // Show auth UI, allowing the user to initiate authorization by
  //     // clicking authorize button.
  //     authorizeDiv.style.display = 'inline';
  //   }
  // };



  /**
   * Initiate auth flow
   *
   */
  returnObject.startAuthFlow = function(event) {
    gapi.auth.authorize(
      {client_id: CLIENT_ID, scope: SCOPES, immediate: false},
      loadCalendarApi);
    return false;
  };



  /**
   * Load Google Calendar client library. List upcoming events
   * once client library is loaded.
   */
  var loadCalendarApi = function() {
    gapi.client.load('calendar', 'v3', createEvent);
  };



  /**
   * Print the summary and start datetime/date of the next ten events in
   * the authorized user's calendar. If no events are found an
   * appropriate message is printed.
   */
  var createEvent = function() {


    var d1 = new Date (),
        d2 = new Date ( d1 );
    d2.setMinutes ( d1.getMinutes() + 30 );

    var resource = {
      "summary": "A First Test",
      "location": "somewhere quick",
      "description": "More things to say about this",
      "start": {
        "dateTime": (d1.toISOString())
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