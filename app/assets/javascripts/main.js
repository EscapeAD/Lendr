$(document).on('turbolinks:load', function(){

  $('#searchTextField').keypress(function(e){
    if (e.which === 13) {
      $.ajax({
        url:'/items/'+'$(this).items[:owner.id]/checkouts/'+ $(this).items[:owner.id]+'/verifications/:id',
        method: 'POST',
        data:{meetup_location: place.formatted_address},
        dataType: 'JSON'
      });
    }
  });

  $('#searchBtn').on('click',function(e){
      e.preventDefault();
      $('#searchList').empty();
      $('#allItems').empty();
      var searchInput = $('#searchTextField').val();
      categoryInput = ''
      $.ajax({
        url: '/items',
        method: 'GET',
        data: {searchInput: searchInput, categoryInput: categoryInput},
        dataType: 'HTML'
      }).done(function(rData){
        $('#searchList').append(rData);
      });
  });

  $('#bookCat').on('click',function(e){
    e.preventDefault();
    $('#searchList').empty();
    $('#allItems').empty();
    var searchInput = $('#searchTextField').val();
    categoryInput = 'Book'
    $.ajax({
      url: '/items',
      method: 'GET',
      data: {searchInput: searchInput, categoryInput: categoryInput},
      dataType: 'HTML'
    }).done(function(rData){
      $('#searchList').append(rData);
    });
  });

  $('#toolCat').on('click',function(e){
      e.preventDefault();
      $('#searchList').empty();
      $('#allItems').empty();
      var searchInput = $('#searchTextField').val();
      categoryInput = 'Tool'
      $.ajax({
        url: '/items',
        method: 'GET',
        data: {searchInput: searchInput, categoryInput: categoryInput},
        dataType: 'HTML'
      }).done(function(rData){
        $('#searchList').append(rData);
      });
  });


  $('#mailSubmitBtn').on('click',function(e){
      e.preventDefault();
      var mailTitleInput = $('#mailTitle').val();
      var mailTextInput = $('#mailText').val();
      var ownerId = $('#mailSubmitBtn').attr('data-ownerId');

      alert(ownerId);
      $.ajax({
        url: '/mails',
        method: 'POST',
        data: {mailTitleInput: mailTitleInput, mailTextInput: mailTextInput, ownerId: ownerId},
        dataType: 'JSON'
      }).always(function(nothing){
      });
  });

  $('#verify_button').on('click', function(event){
      event.preventDefault();
    $.ajax({
      url: $(this).attr('href'),
      method: 'PUT',
      data: {},
      dataType: 'JSON'
    }).done(function(responseData){
      location.reload();
    });
  });

});
