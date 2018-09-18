   var Carousel1Opts =
   {
      delay: 5000,
      duration: 600,
      easing: 'linear',
      mode: 'forward',
      direction: '',
      scalemode: 3,
      pagination: true,
      pagination_img_default: 'images/page_default.png',
      pagination_img_active: 'images/page_active.png',
      start: 0
   };
   $("#Carousel1").carousel(Carousel1Opts);
   $("#Carousel1_back a").click(function()
   {
      $('#Carousel1').carousel('prev');
   });
   $("#Carousel1_next a").click(function()
   {
      $('#Carousel1').carousel('next');
   });
   $("a[href*='#BookmarkServicios']").click(function(event)
   {
      event.preventDefault();
      $('html, body').stop().animate({ scrollTop: $('#wb_BookmarkServicios').offset().top }, 600, 'linear');
   });
   $("a[href*='#BookmarkNoticia']").click(function(event)
   {
      event.preventDefault();
      $('html, body').stop().animate({ scrollTop: $('#wb_BookmarkNoticia').offset().top }, 600, 'linear');
   });
   $("a[href*='#BookmarkBeneficios']").click(function(event)
   {
      event.preventDefault();
      $('html, body').stop().animate({ scrollTop: $('#wb_BookmarkBeneficios').offset().top }, 600, 'linear');
   });
   $("a[href*='#BookmarkActividades']").click(function(event)
   {
      event.preventDefault();
      $('html, body').stop().animate({ scrollTop: $('#wb_BookmarkActividades').offset().top }, 600, 'linear');
   });
   $("a[href*='#BookmarkNuetrasSedes']").click(function(event)
   {
      event.preventDefault();
      $('html, body').stop().animate({ scrollTop: $('#wb_BookmarkNuetrasSedes').offset().top }, 600, 'linear');
   });