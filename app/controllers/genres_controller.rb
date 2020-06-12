class GenresController < ApplicationController

  # ジャンル毎のコンテンツ一覧を表示
  def show    
    @hobbies = Hobby.where(genre_id: params[:id]).where(group_id:'0').includes(:user)
    @genre = Genre.find(params[:id])
    if user_signed_in? 
      @favorites = Favorite.where(user_id: current_user.id) 
      @fav_list = @hobbies.make_favorite_list(@hobbies, @favorites)
      @groups = User.find(current_user.id).groups.where(genre_id: params[:id])
    end   
  end
end
