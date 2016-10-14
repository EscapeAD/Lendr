$(document).on('turbolinks:load', function(){
  $('#fullpage').fullpage({
       //Navigation
       menu: '#menu',
       lockAnchors: false,
       anchors:['firstPage', 'secondPage'],
       navigation: false,
       navigationPosition: 'right',
       navigationTooltips: ['firstSlide', 'secondSlide'],
       showActiveTooltip: false,
       slidesNavigation: true,
       slidesNavPosition: 'bottom',

       //Scrolling
       css3: true,
       scrollingSpeed: 700,
       autoScrolling: true,
       fitToSection: true,
       fitToSectionDelay: 1000,
       scrollBar: false,
       easing: 'easeInOutCubic',
       easingcss3: 'ease',
       loopBottom: false,
       loopTop: false,
       loopHorizontal: true,
       continuousVertical: false,
       continuousHorizontal: false,
       scrollHorizontally: false,
       interlockedSlides: false,
       resetSliders: false,
       fadingEffect: false,
       normalScrollElements: '#element1, .element2',
       scrollOverflow: false,
       scrollOverflowOptions: null,
       touchSensitivity: 15,
       normalScrollElementTouchThreshold: 5,
       bigSectionsDestination: null,

       //Accessibility
       keyboardScrolling: true,
       animateAnchor: true,
       recordHistory: true,

       //Design
       controlArrows: true,
       verticalCentered: true,
       sectionsColor : ['#ccc', '#fff'],
       paddingTop: '3em',
       paddingBottom: '10px',
       fixedElements: '#header, .footer',
       responsiveWidth: 0,
       responsiveHeight: 0,
       responsiveSlides: false,

       //Custom selectors
       sectionSelector: '.section',
       slideSelector: '.slide',

       //events
       onLeave: function(index, nextIndex, direction){},
       afterLoad: function(anchorLink, index){},
       afterRender: function(){},
       afterResize: function(){},
       afterResponsive: function(isResponsive){},
       afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex){},
       onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex){}
   });




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
      $('#'+getUrlParameter('categoryInput')+'Cat').click();
      // refineUrl();
    }

    if (getUrlParameter('searchInput')) {
      $('#searchTextField').val(getUrlParameter('searchInput'));
      $('#searchBtn').click();
      // refineUrl();
    }


      /*Helper function to remove query string in url */
    function refineUrl()
    {
      var query = window.location.search.substring(1)
      if(query.length) {
          if(window.history != undefined && window.history.pushState != undefined) {
              window.history.pushState({}, document.title, window.location.pathname);
          }
      }
    }


  // //Alert user when the back button is pressed
  //   if (window.history && window.history.pushState) {
  //
  //     $(window).on('popstate', function() {
  //       var hashLocation = location.hash;
  //       var hashSplit = hashLocation.split("#!/");
  //       var hashName = hashSplit[1];
  //
  //       if (hashName !== '') {
  //         var hash = window.location.hash;
  //         if (hash === '') {
  //           alert('Back button was pressed.');
  //         }
  //       }
  //     });
  //
  //     window.history.pushState('forward', null, './#forward');
  //   }



    var timelineBlocks = $('.timeline-block'),
  		offset = 0.8;

  	//hide timeline blocks which are outside the viewport
  	hideBlocks(timelineBlocks, offset);

  	//on scrolling, show/animate timeline blocks when enter the viewport
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

    // animate carosel on item show
    // $('.flexslider').flexslider({
    //   animation: "slide"
    // });
     $('.flexslider').flexslider();

});
