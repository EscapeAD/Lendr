$(document).on('turbolinks:load', function(){
  // jquery tabs for user
    $('#myTabs a[href="#pending"]').tab('show');
    $('#myTabs a[href="#borrow"]').tab('show');
    $('#myTabs a[href="#lent"]').tab('show');
    $('#myTabs a[href="#inventory"]').tab('show');


    //Search function from main page
    $('#mainSearchBtn').on('click', function(e){
      e.preventDefault();
      searchInput = $('#mainSearchTextField').val();
      window.location.href = "/items?searchInput="+searchInput;
    });

    $("#mainSearchTextField").keyup(function(event){
    if(event.keyCode == 13){
        $("#mainSearchBtn").click();
    }
    });


  // Search function
    $('#searchBtn').on('click',function(e){
        e.preventDefault();
        $('#searchList').empty();
        $('#allItems').empty();
        var searchInput = $('#searchTextField').val();
        categoryInput = '';
        $.ajax({
          url: '/items',
          method: 'GET',
          data: {searchInput: searchInput, categoryInput: categoryInput},
          dataType: 'HTML'
        }).done(function(rData){
          $('#searchList').append(rData);
        });
    });

    $("#searchTextField").keyup(function(event){
    if(event.keyCode == 13){
        $("#searchBtn").click();
    }
    });


  // CATEGORY
  $('#leisureCat').on('click',function(e){
    e.preventDefault();
    $('#searchList').empty();
    $('#allItems').empty();
    var searchInput = $('#searchTextField').val();
    categoryInput = 'Leisure';
    $.ajax({
      url: '/items',
      method: 'GET',
      data: {searchInput: searchInput, categoryInput: categoryInput},
      dataType: 'HTML'
    }).done(function(rData){
      $('#searchList').append(rData);
    });
  });


  $('#equipmentCat').on('click',function(e){
    e.preventDefault();
    $('#searchList').empty();
    $('#allItems').empty();
    var searchInput = $('#searchTextField').val();
    categoryInput = 'Equipment';
    $.ajax({
      url: '/items',
      method: 'GET',
      data: {searchInput: searchInput, categoryInput: categoryInput},
      dataType: 'HTML'
    }).done(function(rData){
      $('#searchList').append(rData);
    });
  });

  $('#outdoorCat').on('click',function(e){
    e.preventDefault();
    $('#searchList').empty();
    $('#allItems').empty();
    var searchInput = $('#searchTextField').val();
    categoryInput = 'Outdoor';
    $.ajax({
      url: '/items',
      method: 'GET',
      data: {searchInput: searchInput, categoryInput: categoryInput},
      dataType: 'HTML'
    }).done(function(rData){
      $('#searchList').append(rData);
    });
  });

  $('#repairsCat').on('click',function(e){
    e.preventDefault();
    $('#searchList').empty();
    $('#allItems').empty();
    var searchInput = $('#searchTextField').val();
    categoryInput = 'Repairs';
    $.ajax({
      url: '/items',
      method: 'GET',
      data: {searchInput: searchInput, categoryInput: categoryInput},
      dataType: 'HTML'
    }).done(function(rData){
      $('#searchList').append(rData);
    });
  });

  $('#landscapeCat').on('click',function(e){
    e.preventDefault();
    $('#searchList').empty();
    $('#allItems').empty();
    var searchInput = $('#searchTextField').val();
    categoryInput = 'Landscape';
    $.ajax({
      url: '/items',
      method: 'GET',
      data: {searchInput: searchInput, categoryInput: categoryInput},
      dataType: 'HTML'
    }).done(function(rData){
      $('#searchList').append(rData);
    });
  });

  $('#educationCat').on('click',function(e){
    e.preventDefault();
    $('#searchList').empty();
    $('#allItems').empty();
    var searchInput = $('#searchTextField').val();
    categoryInput = 'Education';
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


    // To handle redirection from landing page
    if (getUrlParameter('categoryInput')) {
      $('#'+getUrlParameter('categoryInput')+'Cat').click()
    }

    if (getUrlParameter('searchInput')) {
      $('#searchTextField').val(getUrlParameter('searchInput'))
      $('#searchBtn').click()
    }





  });
