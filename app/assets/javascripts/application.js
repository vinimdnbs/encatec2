// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require anchor
//= require bootstrap.min

$(document).ready(function(){
  $('#my-button').click(function(){
    $('#region-text').toggleClass('show-on-mobile');
    var value = $('#my-button').val();

    if(value == 'Mostrar Texto')
      $('#my-button').val('Ocultar');
    else
      $('#my-button').val('Mostrar Texto');
  });

  $('.pal-img a').click(function(event){
    event.preventDefault();
    var selector = $(this).attr('id');
    $('.pal-img').removeClass('change-bc');
    $('#'+selector).parent().addClass('change-bc');
    $('.pal-description').addClass('hide');
    $('.pal-description#' + selector).removeClass('hide');
  });
});
