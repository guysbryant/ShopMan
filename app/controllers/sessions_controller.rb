class SessionsController < ApplicationController

  def homepage
    session.delete :login
    redirect_to user_path(current_user) if current_user
  end

  def new
  end

  def create
    made_user = User.make_user(request, params)
    @user = made_user[:user]
    if made_user[:method] == "omniauth" || @user && @user.authenticate(params[:password])
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
end
