class GroupsController < ApplicationController

  # 新規作成画面及び編集画面のインクリメンタルサーチ
  def index
    @users = User.search(params[:keyword], current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  # グループ作成画面
  def new
    @group = Group.new
    @genre = Genre.find(params[:genre_id]) 
  end

  # グループを作成
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to genre_group_path(@group.genre_id,@group.id), notice: 'グループを作成しました'
    else
      redirect_to action: 'new'
    end
  end

  # 選択されたグループのホーム画面
  def show
    @groups = User.find(current_user.id).groups.where(genre_id: params[:genre_id])
    @group = Group.includes(:users).find(params[:id])
    @genre = Genre.find(params[:genre_id])
    @messages = Message.includes(:user).where(group_id: params[:id])  
    @message = Message.new
    @hobbies = Hobby.where(group_id: params[:id]).includes(:user)
    favorites = Favorite.where(user_id: current_user.id) 
    @fav_list = @hobbies.make_favorite_list(@hobbies, favorites)
  end

  # グループ編集画面
  def edit
    @group = Group.find(params[:id])
    @genre = Genre.find(params[:genre_id]) 
  end

  # グループを編集
  def update   
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to genre_group_path(@group.genre_id,@group.id), notice: 'グループを編集しました'
    else
      redirect_to action: 'edit'
    end
  end

  
  private

  def group_params
    params.require(:group).permit(:name, user_ids: []).merge(genre_id: params[:genre_id])
  end

end
