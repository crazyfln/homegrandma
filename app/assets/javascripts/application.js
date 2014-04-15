//= require jquery
//= require jquery.ui.all
//= require jquery_ujs

//= require components/cycle.js
//= require components/tween
//= require components/tooltip
//= require components/uniform/jquery.uniform
//= require jquery_nested_form
//= require jquery.nyroModal.custom
//= require fancybox

//= require common
//= require jquery.maskedinput
//= require core
//= require contact
//= require searches
//= require properties


$(document).ready(function(){
  initNyroModal();

  // init fancybox media popup for vide player
  $('.fancybox-media').fancybox({
    openEffect  : 'none',
    closeEffect : 'none',
    helpers : {
      media : {}
    }
  });

  // init datepicker
  $( ".datepicker" ).datepicker();

  $("#hm-2").click(function(){
    $('.p-login').fadeIn();
    return false ;
  })
  $(".hm-1").click(function(){
    $('.p-login').fadeOut();
    $('.p-register').fadeIn();
    return false ;
  })
  $("#property_include_service_charge").click(function () {
    if(this.checked){
      $("#service-types").slideUp("slow");
    } else {
      $("#service-types").slideDown("slow");
    }
  });

  $(document).on('nested:fieldAdded', function(event){
    $("input[type=checkbox]").uniform();
  })

});
