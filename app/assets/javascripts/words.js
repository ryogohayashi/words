$(function(){

  function buildData(post) {
    let html = `<div class="wordbook__word__card">
                  <div class="cardcontent">
                    ${post.word}
                  </div>
                  <div class="cardcontent">
                    ${post.meaning}
                  </div>
                  <div class="cardcontent__edit" id="edit-${post.id}">
                    edit
                  </div>
                  <div class="cardcontent__delete">
                    <a rel="nofollow" data-method="delete" href="/groups/${post.group_id}/words/${post.id}">delete</a>
                  </div>
                </div>`
    return html;
  }

  $('.new_word').on('submit',function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(post){
      let html = buildData(post);
      $('.cardlist').append(html);
      $('.input_box').val('');
      $('input[type="submit"]').attr('disabled',false);
    })
    .fail(function(){
      alert('エラー');
    })
  });
});