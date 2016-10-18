$(document).on('turbolinks:load', function(){
// $(function(){
  $('#fullpage').fullpage({
    //Navigation
    menu: '#menu',
    lockAnchors: true,
    anchors:['page1', 'page2','page3', 'page4'],
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
    scrollBar: true,
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
    scrollOverflow: true,
    scrollOverflowOptions: scroll,
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
    afterLoad: function(anchorLink, index){
      // if (anchorLink == 'page2'){
      //   $('.timeline-icon').animate({
      //     top:"+=50",
      //   });
      // } else {
      //   $('.timeline-icon').animate({
      //     top: ""
      //   })
      // }
    },
    afterRender: function(){},
    afterResize: function(){},
    afterResponsive: function(isResponsive){},
    afterSlideLoad: function(anchorLink, index, slideAnchor, slideIndex){},
    onSlideLeave: function(anchorLink, index, slideIndex, direction, nextSlideIndex){}
   });

   // section 3 animation
   var cards = document.querySelectorAll(".effect_random");
   var timeMin = 1;
   var timeMax = 7;
   var timeouts = [];

   // looping through cards
   for (var i=0; i<cards.length; i++){
      var card = cards[i];
      var cardID = card.getAttribute("data-id");
      var id = "timeoutID" + cardID;
      var time = randomNum(timeMin,timeMax)*1000;
      cardsTimeout(id,time,card);
   }

   // timeout listener
   function cardsTimeout(id,time,card){
     if (id in timeouts){
       clearTimeout(timeouts[id]);
     }
     timeouts[id] = setTimeout(function(){
        var c = card.classList;
        var newTime = randomNum(timeMin, timeMax)*1000;
        c.contains("flipped") == true? c.remove("flipped") : c.add("flipped");
        cardsTimeout(id, newTime, card);
     }, time);
   };

   // randomNum generator given min and max
   function randomNum(min,max){
     return Math.random() * (max-min) + min;
   };


 });
