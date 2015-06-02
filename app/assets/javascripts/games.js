//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  setTimeout(function() {
    var url = window.location.pathname + '/browser';
    var source = new EventSource(url);
    source.addEventListener('refresh', function(e) {
      window.location.reload();
    });
  }, 1);
});
