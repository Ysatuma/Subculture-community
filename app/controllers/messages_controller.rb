class MessagesController < ApplicationController

  # 投稿されたメッセージを保存する
  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.json      
      end
    else
      redirect_to  genre_group_path( params[:genre_id],  params[:group_id])
    end
  end


  private

  def message_params
    params.require(:message).permit(:content).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
