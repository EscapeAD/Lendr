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



    var timelineBlocks = $('.timeline-block'),
  		offset = 0.8;

  	//hide timeline blocks which are outside the viewport
  	hideBlocks(timelineBlocks, offset);

  	//on scolling, show/animate timeline blocks when enter the viewport
  	$(window).on('scroll', function(){
  		(!window.requestAnimationFrame)
  			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
  			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
  	});

  	function hideBlocks(blocks, offset) {
  		blocks.each(function(){
  			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.timeline-img, .timeline-content').addClass('is-hidden');
  		});
  	}

  	function showBlocks(blocks, offset) {
  		blocks.each(function(){
  			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.timeline-img').hasClass('is-hidden') ) && $(this).find('.timeline-img, .timeline-content').removeClass('is-hidden').addClass('bounce-in');
  		});
  	}


});
