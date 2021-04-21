class UsersController < ApplicationController
  before_action :require_logged_in, except: %i(new create)
  before_action :find_user, only: %i(edit update destroy show)

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    reset_session if @user.id == current_user
      @user.destroy
      redirect_to users_path
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :address, :phone_number)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
