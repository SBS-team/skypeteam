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
//= require bootstrap
//= require_tree .
//= require jquery.cssemoticons.min


$(document).ready(function() {

    $(".sidebar li.nav-header").click(function(e){
        if($(this).hasClass("year")){
            $(".sidebar .month").hide()
            $(this).find(".month").show();
        }
        if($(this).hasClass("month")){
            $(".sidebar .date").hide()
            $(this).find(".date").show();
        }
    });
    $(".like-message").tooltip();
    if ($.cookie("age_confirmation") != "true"){
        $('.popup-dialog.modal').modal();
        $('.popup-dialog.modal').on('hide', function () {return false;})
    }

    $("iframe").each(function(){
        var ifr_source = $(this).attr('src');
        var wmode = "?wmode=transparent";
        $(this).attr('src',ifr_source+wmode);
    });

});
function set_like(obj){
    $.post("/user/like",{message_id: obj.data('message')}, function(res){
        $(obj).tooltip('hide')
            .attr('data-original-title', res['count'])
            .tooltip('fixTitle')
            .tooltip('show');
    })
}

function age_confirmation(){
  $.cookie("age_confirmation", true, {expires: 5000})
  window.location.href = "/about"
}