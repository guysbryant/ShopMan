class SessionsController < ApplicationController

  def homepage
    session.delete :login
    redirect_to user_path(current_user) if current_user
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session.delete :login
      redirect_to @user
    else
      session[:login] = "fail"
      redirect_to login_url
    end
  end

  def destroy
    reset_session
    redirect_to users_path
  end

  def omniauth
    @user = User.find_or_create_by(email: auth["email"]) do |u|
      u.name = auth["name"]
      u.password = SecureRandom.hex(10)
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/'
    end
  end

  private

  def auth
    request.env['omniauth.auth']["info"]
  end
end
