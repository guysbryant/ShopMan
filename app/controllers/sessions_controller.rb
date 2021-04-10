class SessionsController < ApplicationController

  def homepage
    redirect_to user_path(current_user) if current_user
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_url
    end
  end

  def destroy
    reset_session
    redirect_to users_path
  end
end
