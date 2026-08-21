jQuery(document).ready(function($) {
    $('.span_one').counterUp({
        delay: 10,
        time: 3000
    });
});




$('.slide_area').owlCarousel({
    loop:true,
    items:1,
    margin:10,
    nav:true,
    dots:true,
    autoplay:true,
    autoplaySpeed: 1500,
    autoplayTimeout:5000,
    smartSpeed:1500,

    navText:[
        '<span><i class="fa-solid fa-angle-left"></i></span>',
        '<span><i class="fa-solid fa-angle-right"></i></span>'
    ],


})
$('.testimonial_slider').owlCarousel({
    loop:true,
    margin:24,
    nav:true,
    dots:true,
    autoplay:true,
    autoplayTimeout:5000,
    autoplaySpeed: 1500,
    smartSpeed:1500,
    dotsSpeed: 1000,
    stagePadding:0,
    slideby:1,
    responsiveClass:true,
    navText:[
        '<span><i class="fa-solid fa-angle-left"></i></span>',
        '<span><i class="fa-solid fa-angle-right"></i></span>'
    ],
    responsive:{
        0:{
            items:1,
            
        },
        600:{
            items:1,
            stagePadding:100,
        },
        1000:{
            items:2,
            stagePadding:100,
        }
    }
    
});



jQuery(document).ready(function () {
    //============== magnific popup=================
    $('.play_btn').magnificPopup({
      type: 'iframe',
    
      iframe: {
        markup: '<div class="mfp-iframe-scaler">' +
          '<div class="mfp-close"></div>' +
          '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>' +
          '</div>',
    
        patterns: {
          youtube: {
            index: 'youtube.com/',
    
            id: 'v=',
    
            src: 'https://www.youtube.com/embed/%id%?rel=0&autoplay=1'
          },
          vimeo: {
            index: 'vimeo.com/',
            id: '/',
            src: 'https://player.vimeo.com/video/%id%?autoplay=1'
          },
          gmaps: {
            index: 'https://maps.google.',
            src: '%id%&output=embed'
          }
    
    
        },
    
        srcAction: 'iframe_src',
      }
    
    
    });
  
    // ==============counter=======================
    //   if (document.querySelector('.counter') !== null) {
    //     $('.counter').counterUp({
    //       delay: 10,
    //       disableOn: 0,
    //       time: 2000
    //     });
    //   }


});



