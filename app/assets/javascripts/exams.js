// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
    Pusher.logToConsole = true;
    var pusher = new Pusher('ebfab9dd09c2e4eacb61', {
      encrypted: true,
      app_id: '210298',
    });

  var channel = pusher.subscribe('my-channel');
  channel.bind('new_question', function(data) {
    console.log("received");
  // alert('Received my-event with message: ' + data.message);
  });
});
