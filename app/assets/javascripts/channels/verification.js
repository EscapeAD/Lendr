$(document).on('turbolinks:load', function(){
// $(function(){
  var messages, messages_to_bottom;
  messages = $('.chat');
  if ($('.chat').length > 0) {
    messages_to_bottom = function() {
      return messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();
  }

App.verification = App.cable.subscriptions.create({
  channel:'VerificationChannel',
   room: window.location.pathname.split("/")[6]
 }, {
  received: function(data){

    $('#new_message').append(data.message);
    $('#enterChat').val('');
    messages_to_bottom();
  }
});
});
