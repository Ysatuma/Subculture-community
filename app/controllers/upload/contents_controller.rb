class Upload::ContentsController < ApplicationController

  # 投稿画面へ遷移
  def new
    @groups = User.find(current_user.id).groups.where(genre_id: params[:genre_id])
    @group = Group.includes(:users).find(params[:group_id])
    @genre = Genre.find(params[:genre_id])
    @hobby = Hobby.new
  end

  # グループ内で投稿されたコンテンツを登録
  def create
    @hobby = Hobby.create(hobby_params)
    binding.pry
    @hobby.image = "/uploads/hobby/content/#{@hobby[:id]}/screenshot.jpg"
    @hobby.save
  
    redirect_to root_path
  end
  
  
  private
  
  def hobby_params
       params.require(:hobby).permit(:title, :content, :genre_id, :group_id).merge(user_id: current_user.id)
  end

end
