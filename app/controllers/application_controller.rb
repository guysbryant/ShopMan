class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def current_user
    @user_id ||= session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
