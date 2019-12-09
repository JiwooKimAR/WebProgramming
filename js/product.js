$(document).ready(function(){

  $('.tab-title li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('.tab-title li').removeClass('active');
    $('.content-detail').removeClass('active');

    $(this).addClass('active');
    $("#"+tab_id).addClass('active');
  })

});
