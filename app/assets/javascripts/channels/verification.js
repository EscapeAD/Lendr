$(document).on('turbolinks:load', function(){

App.verification = App.cable.subscriptions.create({
  channel:'VerificationChannel',
   room: window.location.pathname.split("/")[6]
 }, {
  received: function(data){
    var messages, messages_to_bottom;
    messages = $('.chat');
    if ($('.chat').length > 0) {
      messages_to_bottom = function() {
        return messages.scrollTop(messages.prop("scrollHeight"));
      };
      messages_to_bottom();
    }
    $('#new_message').append(data.message).get(0).focus();
    $('#enterChat').val('');
    messages_to_bottom();
  }
});
});
