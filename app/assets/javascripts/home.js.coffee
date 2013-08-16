# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('.write_to_us').click (event)->
    $('.popup-dialog').modal('show')
    $('#popup-dialog .popup-dialog .modal-header').html("<h3>Напиши нам</h3>")
    $('#popup-dialog .popup-dialog .modal-body').html("</p><input class='contact_us_email' type='email' name='email' placeholder='Можете не вводить Ваш email'/></p><p><textarea name='text' class='contact_us_text' placeholder='Ваше сообщение' style ='width: 515px;height: 120px;'/></p>")
    $('#popup-dialog .popup-dialog .modal-footer').html("</p><input type='button' class='btn btn-large btn-success send_contact_us' value='Отправить'/><input type='button' class='btn btn-inverse btn-large' value='Закрыть' data-dismiss='modal'/></p>")
    $('.send_contact_us').click (event)->
      email = $('.contact_us_email').val()
      text = $('.contact_us_text').val()
      if text.length < 10
        $('.contact_us_text').val('').attr('placeholder','Может побольше напишешь?')
      if text.length > 10
        $.ajax(
          url: "/home/write_to_us"
          data:
            email: email
            text: text
          dataType: "json"
          type: "post"
        ).success (response) ->
          $('.popup-dialog').modal('hide')
    $('.contact_us_text').click (event)->
      $('.contact_us_text').val('')