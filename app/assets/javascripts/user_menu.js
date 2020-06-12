$(function(){

  // グループリストの表示、非表示
  $('.user-menu__group').on('mouseenter', function(e){
    $(".user-menu__group__list").addClass("active");
    // console.log(this);
  })

  $('.user-menu__group').on('mouseleave', function(e){
    $(".user-menu__group__list").removeClass("active");
  })


  // グループリストの表示、非表示
  $('.user-menu__genre').on('mouseenter', function(e){
    $(".user-menu__genre__list").addClass("active");
    // console.log(this);
  })

  $('.user-menu__genre').on('mouseleave', function(e){
    $(".user-menu__genre__list").removeClass("active");
  })
  

  // グループリストの表示、非表示
  $('.user-menu__my').on('mouseenter', function(e){
    $(".user-menu__my__list").addClass("active");
    // console.log(this);
  })

  $('.user-menu__my').on('mouseleave', function(e){
    $(".user-menu__my__list").removeClass("active");
  })
  
});