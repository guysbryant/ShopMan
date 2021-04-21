class ProductsController < ApplicationController
  before_action :require_logged_in
  before_action :find_product, only: %i(edit update destroy show)

  def index
    @products = Product.all.sorted_by_part_number
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :part_number)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
end
