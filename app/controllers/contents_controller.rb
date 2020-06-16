class ContentsController < ApplicationController

  GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

  # お気に入り登録した場合にDBへ登録
  def create
    @favorite = Favorite.new(
      user_id: favorite_params[:user_id],
      hobby_id: favorite_params[:id]
    )

    if @favorite.save
      respond_to do |format|
        format.json{@fav_num = @favorite.id } 
      end
    else
      redirect_to root_path
    end
  end

  # コンテンツの内容を表示
  def show

    if user_signed_in?
      @favorite = Favorite.where(user_id: current_user.id, hobby_id: params[:id])
      if @favorite[0] != nil
        @fav_num = @favorite[0].id
      else
        @fav_num = 0
      end
      @groups = User.find(current_user.id).groups.where(genre_id: params[:genre_id])
    end
    @hobby = Hobby.find(params[:id])
    @genre = Genre.find(params[:genre_id])
    @youtube_data = find_videos(@hobby.title,@genre.id)
    gon.hobby = @hobby
    gon.fav = @fav_num 
        
  end

  # お気に入り登録をDBから削除
  def destroy

    favorite = Favorite.find(params[:favorite_id])

    @fav_num = 0

    if favorite.destroy
      respond_to do |format|
        format.json 
      end
    else
      redirect_to root_path
    end

  end

  # youtube api v3による動画検索メソッド
  def find_videos(keyword,genre, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 2,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
  service.list_searches(:snippet, opt) if(genre == 1)
  end



  private 

  def favorite_params
    params.permit(:user_id, :id)
  end

  
end
