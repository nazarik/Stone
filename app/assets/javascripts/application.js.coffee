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
#= require jcarousellite_1.0.1.min
#= require bootstrap
#= require_tree ./public

if $(window).width() > 1024
  document.write("<script src='/assets/jquery.preloader.js'></script>")

$ ->
  $('body').tooltip({
    trigger: 'hover'
    selector: 'img[rel=tooltip]'
  })

  if $('#map_canvas').length > 0
    coords = new google.maps.LatLng(49.850173, 23.889424)
    myOptions = {
      zoom: 12,
      center: coords ,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      streetViewControl: false
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
    new google.maps.Marker({
      position: coords,
      map: map,
      optimized: false
    })

  if $('#contact-form').length > 0
    $('#clear-feedback').on 'click', (e) ->
      e.preventDefault()
      $('#contact-form').find('input:not([type=hidden]):not([type=submit]), textarea').val ->
        this.value = ''

  # Tooltips placement
  $('body').on 'mouseover', 'img[rel=tooltip]', (e) ->
    $element = $(e.target)
    $element.data('tooltip').options.placement = getPosition($element)
    $element.data('tooltip').show()

$(window).load ->
  windowWidth = $(window).width()
  if windowWidth > 1024
    $("#content .row").preloader()
  $('.magnifier').touchTouch()
  $('.spinner').animate({'opacity': 0},1000,'easeOutCubic', -> $(this).css('display','none'))

# private

getPosition = (element) ->
  position = element.position()
  if position.top > 50
    'top'
  else if position.left > 50
    'left'
  else if position.left < 50
    'right'
  else
    'bottom'
