# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Client side javascript to publish events to crushmet

Add the following code snippet to your application under /app/assets/javascripts/application.js -

var crushmet = {};

crushmet.report = function(eventName) {
   var event = { event: { name: eventName }};

   var request = new XMLHttpRequest();

   request.open("POST", "http://localhost:3000/api/events", true);
   request.setRequestHeader('Content-Type', 'application/json');
   request.send(JSON.stringify(event));

  };

<!-- Publishes a sample event with eventname "sale" -->
crushmet.report("sale");
