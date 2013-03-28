class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def authorize
    if current_user.admin?
      true
    elsif session[:user_id] == params[:id].to_i && params[:action] != 'index' #may need to change params[:id] later if conflits say with lists :)
      true
    else
      redirect_to root_path, alert: "Not authorized!"
    end
  end

  def authenticate
    redirect_to new_session_path unless current_user
  end


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end