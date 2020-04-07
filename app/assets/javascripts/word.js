$(function(){
  function buildHTML(data){
    var html = `<div class="plate">
                  <div class="folk">
                    <div class="center">
                      <div class="textblock">
                        <div class="word">
                          ${data.word}
                        </div>
                        <div class="meaning">
                          ${data.meaning}
                        </div>
                      </div>
                      <div class="sentence">
                        ${data.sentence}
                      </div>
                    </div>
                    <div class="image">
                      <div class="image-image">
                        <img src=${data.image} >
                      </div>
                    </div>
                  </div>`
    return html;
  }
  $('#new_word').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
    })
    .fail(function(){
      alert('error');
    })
  })
})

// #にはid属性を記述
// フォームの送信についてonメソッドでイベントをセッティングする際は、form要素自体に設定するようにします。
// フォームが送信される時、何も設定していない状態(デフォルトの状態)だとフォームを送信するための通信が行われるため、preventDefault()を使用してデフォルトのイベントを止めます。
// フォームのデータの送信に使用することができます。その他にも、キーのついたデータを伝送するためにフォームとは独立して使用することもできます。今回はコメントフォームがあるので、そのフォームの情報を取得するのに使います。
// 5行目でフォームの送信先のurlを定義しています。$(this)は、thisで取得できる要素をjQueryオブジェクト化しています。
// attrメソッド:要素が持つ指定属性の値を返します。要素が指定属性を持っていない場合、関数はundefinedを返します。今回はイベントが発生した要素のaction属性の値を取得しており、今回のaction属性にはフォームの送信先のurlの値が入っています。これでリクエストを送信する先のURLを定義することができました。
// jbuilder:rails newコマンドでアプリケーションを作成した際にgemfileにデフォルトで記述されているgemで、入力データをJSON形式で出力するテンプレートエンジンです。今回はJbuilderを利用するので、コントローラ内でrender json: ○○を行いません。
// respond_toで処理を分けたら、jbuilderを使用してJavaScriptファイルに返すデータを作成します。jbuilderは、viewと同じように該当するアクションと同じ名前にする必要があります。wordのcreateアクションに対応するjbuilderのファイルになるので、作成するのはviews/words/create.json.jbuilderになります。
// jbuilderファイルでは基本的にjson.KEY VALUEという形で書くことができます。こうすることによってJavaScriptファイルに返ってきたデータをjbuilderで定義したキーとバリューの形で呼び出して使うことができます。複雑なjsonの生成も見やすく書くことができますので積極的にjbuilderを使っていきましょう。