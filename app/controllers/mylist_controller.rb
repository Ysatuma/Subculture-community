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

    # 動画を保存、スクリーンショットを作成、DBへ登録
    when 1
      @video = Video.create(content_params) 
      file_name = params[:hobby][:content].original_filename
      movie = FFMPEG::Movie.new("#{@location}/#{@video[:id]}/#{file_name}")  
      movie.screenshot("#{@location}/#{@video[:id]}/screenshot.jpg",resolution: '160x120')
      @video.thumb = "/uploads/video/content/#{@video[:id]}/screenshot.jpg"
      @video.save!

    #音楽を保存
    when 2    
      @music = Music.create(content_params) 

    # イラストを保存  
    when 3
      @illust = Illust.create(content_params) 

    else
    end
    @hobby.save!

    # グループ用の投稿か否かでリダイレクト先を変更
    if params[:hobby][:group_id] != '0'
      redirect_to genre_group_path(params[:hobby][:genre_id], params[:hobby][:group_id])
    else
      redirect_to genre_path(params[:hobby][:genre_id])
    end
  end


  private

  # hobbyテーブル用のストロングパラメータ
  def hobby_params
    params.require(:hobby).permit(:title, :genre_id, :group_id).merge(user_id: current_user.id)
  end  

  # 各コンテンツテーブル用のストロングパラメータ
  def content_params
    params.require(:hobby).permit(:content).merge(hobby_id: @hobby.id)
  end  

  def save_location
    @location = "public/uploads/video/content"
  end
end
