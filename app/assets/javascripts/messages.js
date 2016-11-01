// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.updateMessagesViaJSON = function() {
  console.log("inside updateMessagesViaJSON");
	json_path = window.location.pathname + ".json";
  $.getJSON(json_path, function(messages) {
    e = $('.messages');
		e.html('');
		for (i in messages)
		{
			message = messages[i];
			e.append("<li class='list-group-item'><span class='tag tag-default tag-pill float-xs-right'>12</span>"
			+ message.content +"</li>");
		}
  })
}