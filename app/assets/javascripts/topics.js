$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(function () {
  $('[data-toggle="popover"]').popover()
})


jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/