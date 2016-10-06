$(document).on('turbolinks:load', function(){

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

  $('#enterChat').on(keypress,function (e) {
      console.log('TEST 123'); /// TEMP

        console.log(e); /// TEMP

        event.preventDefault();

        if (e.which == 13) {
          $.ajax({
            url: this.action,
            data: $(this).serialize(),
            method: "post"
          }).done(function(){
            console.log(); /// TEMP

            $('#enterChat').removeAttr('value');
          });
        };
  });




  // $('#enterChat').on('submit', function(){
  //     event.preventDefault();
  //
  //     if($('#enterChat').val()==""){
  //       return false;
  //     }
  //
  //     $.ajax({
  //       url: this.action,
  //       data: $(this).serialize(),
  //       method: "post"
  //     }).done(function(){
  //     }).always(function(){
  //       $('#enterChat').val().empty();
  //     })
  //   });





  // $('#enterChat').on('keypress',function(event){
  //   // event.preventDefault();
  //   if(event.keyCode == 13){
  //     $.ajax({
  //       url:
  //     })
  //   }
  // })
  });
