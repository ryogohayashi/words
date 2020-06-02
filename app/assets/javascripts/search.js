$(function(){

  let search_list = $('.cardlist');

  function appendWord(word) {
    let html = `<div class="wordbook__word__card">
                  <div class="cardcontent">
                    ${word.word}
                  </div>
                  <div class="cardcontent">
                    ${word.meaning}
                  </div>
                </div>`
    search_list.append(html);
  }

  function editElement(element) {
    let result = "^" + element;
    return result;
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${msg}</div>`
    search_list.append(html);
  }

  $('#keyword').on('keyup', function(){
    let input = $('#keyword').val();
    let inputs = input.split(' ');
    let newInputs = inputs.map(editElement);
    let reg = RegExp(newInputs.join("|"));
    $.ajax({
      type: 'GET',
      url: '/groups/:group_id/words/:id/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(words){
      $('.cardlist').empty();
      if (words.length !== 0) {
        words.forEach(function(word){
          let word1 = word.word;
          if  (word1.match(reg)) {
            appendWord(word);
          }
        });
      }
      else {
        appendErrMsgToHTML('一致する単語がありません');
      }
    })
    .fail(function(){
      alert('error');
    });
  });
});
