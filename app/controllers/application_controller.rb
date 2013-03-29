class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

  def authorize
    accessing_own_data = session[:user_id] == params[:id].to_i
    return if current_user.admin?
    return if accessing_own_data
    redirect_to root_path, alert: "Not authorized!"
  end

  def authenticate
    redirect_to new_session_path unless current_user
  end


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end