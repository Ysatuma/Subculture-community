$(function(){

  // 選択されたジャンルに応じてコンテンツ投稿用アイコンを表示
  $('#hobby_genre_id').on('change', function(e){
    var val = $('#hobby_genre_id').val()
 
    $('.upload__form__content').removeClass("active");
    switch (val) {
      case 0:     
        break;
      case '1':
        $('#movie-form').addClass("active")
        break;
      case '2':
        $('#music-form').addClass("active")
        break;   
      case '3':
        $('#illust-form').addClass("active")
        break;           
    }
      
  })

  // コンテンツが選択された時に選択済みであることを表示
  $('.upload__form__content--icon__filefield').on('change', function(e){
    $('.upload__form__content__message').text('コンテンツが選択されました')
  })

  // グループ内投稿の場合にジャンルに対応したコンテンツ投稿用アイコンを表示
  $(window).load(function(){
    if ($('.selected-genre').length != 0){
      var val = $('#hobby_genre_id').val()
      switch (val) {
        case 0:     
          break;
        case '1':
          $('#movie-form').addClass("active")
          break;
        case '2':
          $('#music-form').addClass("active")
          break;   
        case '3':
          $('#illust-form').addClass("active")
          break;           
      }
    }
  })
})