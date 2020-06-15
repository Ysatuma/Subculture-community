$(function(){

  function build_html(data) {
    var html =
    `
    <input id="fav_num", type="hidden", value="${data.fav}">
    `
    return html
  }

   // ボタン押下時に登録済み又は未登録へ切り替える
  $('.mylist__btn__add').on('click', function(e){
    $(this).removeClass("active");
    $(this).closest(".mylist").find('.mylist__btn__remove').addClass("active");
    $.ajax({
      url: '../contents',
      type: "POST",
      data: gon.hobby
    })
    .done(function(data){
      console.log(data)
      $('#fav_num').remove();
      $('.mylist__btn').append(build_html(data));
    })
    .fail(function(){
      alart("マイリストへの登録に失敗しました")
    })
  })

  $('.mylist__btn__remove').on('click', function(e){
    $(this).removeClass("active");
    $(this).closest(".mylist").find('.mylist__btn__add').addClass("active");
    var url = $('#url').val();
    var fav = $('#fav_num').val();
    console.log(gon.fav)
    $.ajax({
      url:  url,
      type: "DELETE",
      data:{ favorite_id: fav}
    })
    .done(function(data){ 
      $('#fav_num').remove();
      $('.mylist__btn').append(build_html(data));
    })
    .fail(function(){
      alart("マイリストからの削除に失敗しました")
    })
  })
})