$(document).on('turbolinks:load', function(){

  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
      {
        "lat": 0,
        "lng": 0,
        "picture": {
          "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
          "width":  32,
          "height": 32
        },
        "infowindow": "hello!"
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });

  $('#searchTextField').keypress(function(e){
    if (e.which === 13) {
      $('#searchBtn').click();
    }
  });

  $('#searchBtn').on('click',function(e){
      e.preventDefault();
      $('#searchList').empty();
      $('#allItems').empty();
      var searchInput = $('#searchTextField').val();
      $.ajax({
        url: '/items',
        method: 'GET',
        data: {searchInput: searchInput},
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
});
