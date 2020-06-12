class ContentsController < ApplicationController

  GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

  # お気に入り登録した場合にDBへ登録
  def create
    @favorite = Favorite.create(favorite_params)
    redirect_to action: 'show', id: params[:hobby_id]
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
    @youtube_data = find_videos('明日香ちゃんねる')

    binding.pry
  end

  # お気に入り登録をDBから削除
  def destroy
    favorite = Favorite.find(params[:favorite_id])
    favorite.destroy
    redirect_to action: 'show', id: params[:id]
  end

  # youtube api v3による動画検索メソッド
  def find_videos(keyword, after: 1.months.ago, before: Time.now)
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
    service.list_searches(:snippet, opt)
  end


  private 

  def favorite_params
    params.permit(:user_id, :hobby_id)
  end

  
end
