$(document).on('turbolinks:load', function(){
  // jquery tabs for user
    $('#myTabs a[href="#pending"]').tab('show');
    $('#myTabs a[href="#borrow"]').tab('show');
    $('#myTabs a[href="#lent"]').tab('show');
    $('#myTabs a[href="#inventory"]').tab('show');

  // Search function
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
  // CATEGORY
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
    // verify buttons
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
