#= require jquery
#= require jquery_ujs
#= require jquery.cookie
#= require jquery.easing.1.3
#= require jquery.flexslider-min
#= require jquery.kwicks-1.5.1
#= require jquery.preloader
#= require superfish
#= require touchTouch.jquery
#= require jquery.browser.min

if $(window).width() > 1024
  document.write("<script src='/assets/jquery.preloader.js'></script>")

$(window).load ->
  windowWidth = $(window).width()
  if windowWidth > 1024
    $("#content .row").preloader()
  $('.magnifier').touchTouch()
  $('.spinner').animate({'opacity': 0},1000,'easeOutCubic', -> $(this).css('display','none'))
