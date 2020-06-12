$(function(){

  function buildHTML(message) {
    var html = `
    <div class="groups__sidebar__messages__message">
      <div class="groups__sidebar__messages__message__info">
        <div class="groups__sidebar__messages__message__info__contributor">
          ${message.user_name}
        </div>
        <div class="groups__sidebar__messages__message__info__timeline">
          ${message.createtime}
        </div>
      </div>      
      <div class="wrapper__chat-main__content__message__text">
        ${message.content}
      </div>
    </div>    
    `
    return html
  }

  //送信された投稿メッセージを更新する
  $('.groups__sidebar__form__content__frame').on('submit', function(e){
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
    console.log(url)
    $.ajax({
      url: url,
      type: 'POST', 
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done( function(data){
      console.log(data)
      $(".groups__sidebar__messages").append(buildHTML(data))
      $('.groups__sidebar__messages').animate({ scrollTop: $('.groups__sidebar__messages')[0].scrollHeight});
      $('.groups__sidebar__form__content__frame')[0].reset();

    })
    .fail( function(data){
      alert("メッセージ送信に失敗しました");
    })
    .always(function() {
      $('.groups__sidebar__form__content__frame__submit').prop('disabled', false);
    });

  })

});