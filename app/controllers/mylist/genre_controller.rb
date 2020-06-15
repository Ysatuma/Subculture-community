class Mylist::GenreController < ApplicationController

  # 登録したコンテンツをジャンル毎に表示
  def show
    hobbies = Hobby.where(genre_id: params[:id]).includes(:user)
    @genre = Genre.find(params[:id])
    @favorites = Favorite.where(user_id: current_user.id) 

    @hobbies = hobbies.make_contents_list(hobbies, @favorites)
    @fav_list = hobbies.make_favorite_list(@hobbies, @favorites)
    @groups = User.find(current_user.id).groups.where(genre_id: params[:id])
  end

end
