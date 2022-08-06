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

//= require vendor/datatables
//= require vendor/noty

//= require companies
//= require people

function noty_alert( type, msg, time = 2000) {
  new Noty({
      theme: 'bootstrap-v4',
      type: type,
      layout: 'topRight',
      text: msg,
      timeout: (true, time)
  }).show();
}

function show_errors(messages) {
  let msg = JSON.parse( messages.detail[2].response )
  let errors = document.querySelectorAll('.is-invalid')
  if (errors !== null) {
    errors.forEach( (el) => {
      el.classList.remove('is-invalid')
      document.getElementsByClassName( el.id ).item(0).innerText = ''
    } )
  }
  $.each( msg, function( key, value ) {
    $(`#form-person #person_${key}`).addClass('is-invalid')
    $(`#form-person .person_${key}`).text( value[0] ).show('slow')
  })
}

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
