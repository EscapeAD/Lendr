$(document).on('turbolinks:load', function(){
  // Borrow button post
    $('#borrowBtn').on('click', function(event){
      event.preventDefault();
      $.ajax({
        url: $(this).attr('href'),
        method: 'POST',
        data: {},
        dataType: 'JSON'
      }).always(function(res){
        location.reload();
      })
    })

  // Ajax for mail
  $('#mailSubmitBtn').on('click', function(event){

    event.preventDefault();
    $.ajax({
      url: '/mailboxes',
      method: 'POST',
      data: {
        recipient: $(this).data('ownerid'),
        title: $('#mailTitle').val(),
        text: $('#mailText').val(),
        sender: $(this).data('senderId')
      },
      dataType: 'JSON'
    }).always(function(){
      location.reload();
    })
  })
})
