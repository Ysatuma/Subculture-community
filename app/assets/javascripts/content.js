$(function(){

  // ボタン押下時に登録済み又は未登録へ切り替える
  $('.contents__add-mylist').on('click', function(e){
    console.log($(this).closest(".mylist").find('.contents__rm-mylist'))
    $(this).removeClass("active");
    $(this).closest(".mylist").find('.contents__added').addClass("active");

    })
  });

  $('.contents__rm-mylist').on('click', function(e){
    $(this).removeClass("active");
    $(this).closest(".mylist").find('.contents__removed').addClass("active") 
  });

  // ボタン押下時に登録済み又は未登録へ切り替える
  $('.mylist__add').on('click', function(e){
    $(this).removeClass("active");
    $(this).closest(".mylist").find('.mylist__remove').addClass("active")
    $('.mylist__status').attr('id', 'add');
    console.log($(this).attr('pathname')) 

  });
  
  $('.mylist__remove').on('click', function(e){
    $(this).removeClass("active");
    $(this).closest(".mylist").find('.mylist__add').addClass("active") 
    $('.mylist__status').attr('id', 'remove');
  });

// $(".contents__rm-mylist").addClass("active");
// $(".contents__add-mylist").removeClass("active");    
