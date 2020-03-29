$(function() {
  $(".search_field").on("keyup", function() {
    var input = $(".search_field").val();
    $.ajax({
      type: 'GET',
      url: '/words/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(words) {
      console.log(words);
    })
  });
});