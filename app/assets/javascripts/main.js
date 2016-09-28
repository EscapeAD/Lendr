$(document).on('turbolinks:load', function(){
  $('.check').on('click', function(event){
    event.preventDefault();
    var itemId = $(this).attr('href');
    var checkoutId = $(this).attr('id');
    console.log(itemId);
    console.log(checkoutId);
    $.ajax({
      url: '/items/:item_id/checkouts',
      method: 'POST',
      data: {},
      dataType: 'JSON'
    })

  })
})
