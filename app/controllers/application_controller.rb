class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def current_user
    @user ||= session[:user_id]
  end

  def logged_in?
    current_user
  end
end
