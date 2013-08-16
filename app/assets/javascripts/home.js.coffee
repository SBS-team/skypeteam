# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('.write_to_us').click (event)->
    $('.popup-dialog_contact').modal('show')
    $(document).ajaxSuccess (response)->
      console.log response
      $('.popup-dialog_contact').modal('hide')
    $(document).ajaxError ->
      $('.contact_us_text').val('Минимум 10 символов!')