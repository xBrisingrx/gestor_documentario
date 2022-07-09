// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require template/jquery.min
//= require template/jquery-migrate.min
//= require template/popper
//= require template/bootstrap
//= require template/hs.megamenu
//= require template/hs.core
//= require template/hs.header
//= require template/hs.hamburgers


$(document).on('ready', function () {
  // initialization of go to
  // $.HSCore.components.HSGoTo.init('.js-go-to');

  // initialization of carousel
  // $.HSCore.components.HSCarousel.init('.js-carousel');

  // initialization of masonry
  // $('.masonry-grid').imagesLoaded().then(function () {
  //   $('.masonry-grid').masonry({
  //     columnWidth: '.masonry-grid-sizer',
  //     itemSelector: '.masonry-grid-item',
  //     percentPosition: true
  //   });
  // });

  // initialization of popups
  // $.HSCore.components.HSPopup.init('.js-fancybox');
});

$(window).on('load', function () {
  // initialization of header
  $.HSCore.components.HSHeader.init($('#js-header'));
  $.HSCore.helpers.HSHamburgers.init('.hamburger');

  // initialization of HSMegaMenu component
  $('.js-mega-menu').HSMegaMenu({
    event: 'hover',
    pageContainer: $('.container'),
    breakpoint: 991
  });
});
