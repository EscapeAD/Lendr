App.verification = App.cable.subscriptions.create({
  channel:'VerificationChannel',
   room: window.location.pathname.split("/")[6]
 }, {
  received: function(data){
    $('#new_message').append(data.message);
  }
});
