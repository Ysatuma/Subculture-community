require 'streamio-ffmpeg'

class MylistController < ApplicationController
  before_action :save_location

  # マイリストのホーム画面へ遷移
  def index
  end

  # 投稿画面へ遷移  
  def new
    @hobby = Hobby.new
  end

  # 投稿されたコンテンツをDBへ登録する
  def create
    @hobby = Hobby.create(hobby_params)
    # コンテンツのジャンル毎に処理を変更
    case @hobby[:genre_id]
    # 動画をスクリーンショット共にDBへ登録
    when 1
      file_name = params[:hobby][:content].original_filename
      movie = FFMPEG::Movie.new("#{@location}/#{@hobby[:id]}/#{file_name}")  
      movie.screenshot("#{@location}/#{@hobby[:id]}/screenshot.jpg",resolution: '160x120')
      @hobby.image = "/uploads/hobby/content/#{@hobby[:id]}/screenshot.jpg"
      @hobby.save 

    # 動画以外はコンテンツ登録以外を行わない
    else   
    end

    # グループ用の投稿か否かでリダイレクト先を変更
    if params[:hobby][:group_id] != '0'
      redirect_to genre_group_path(params[:hobby][:genre_id], params[:hobby][:group_id])
   
    elsif params[:hobby][:group_id] != '3'
      redirect_to root_path
    else
      redirect_to genre_path(params[:hobby][:genre_id])
    end

  end


  private

  def hobby_params
    case params[:hobby][:genre_id]
    when '1'
      params.require(:hobby).permit(:title,:content, :genre_id, :group_id).merge(user_id: current_user.id)
    when '2'
      params.require(:hobby).permit(:title,:music, :genre_id, :group_id).merge(user_id: current_user.id)
    when '3'
      params.require(:hobby).permit(:title, :illust, :genre_id, :group_id).merge(user_id: current_user.id)
    else

    end
    
  end  

  def save_location
    @location = "public/uploads/hobby/content"
  end
end
