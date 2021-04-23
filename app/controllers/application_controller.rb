class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  helper_method :redirect_if_product_exists

  private

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def current_user
    @user_id ||= session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def product_exists(product_params)
    if !product_params[:name].blank? && Product.find_by(name: product_params[:name]) || !product_params[:part_number].blank? && Product.find_by(part_number: product_params[:part_number])
      flash[:notice] = "Product Already Exists, Create A New Product Or Select A Product From Drop Down"
      return true
    end
  end
end
