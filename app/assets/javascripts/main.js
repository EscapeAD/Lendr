$(document).on('turbolinks:load', function(){
  $('.confirm').on('click', function(event){
    event.preventDefault();
    var checkoutId = $(this).attr('href');
    var  itemId    = $(this).attr('id');
    console.log(itemId);
    console.log(checkoutId);
    $.ajax({
      url: '/items/'+itemId+'/checkouts/'+checkoutId,
      method: 'PUT',
      data: {id: checkoutId, intial_check: true},
      dataType: 'JSON'
    }).done(function(responseData){

    });

  })
})
