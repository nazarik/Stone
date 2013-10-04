#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree ./admin

$ ->
  $('#sliders li:nth-child(4n)').css('margin-left', '0')

  $('#category-filter').find('select').on 'change', ->
    $(this).closest('form').submit()
