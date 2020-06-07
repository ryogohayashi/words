$(function() {

  $( '.cardcontent__edit' ).on('click', function() {
    let edit_id = $(this).attr('id');
    console.log(edit_id);
    $( "#" + edit_id ).next().fadeIn();
    $( "#" + edit_id ).next().next().fadeIn();
    return false;
  });

  $('.cancel-btn').on('click', function() {
    $('#overlay, #modalWindow').fadeOut();
    return false;
  });
  
});