class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user
  before_action :set_genre 


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  private
  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end

  def set_genre
    @all_genres = Genre.all
  end

end
