class SalesOrdersController < ApplicationController
  before_action :require_logged_in
  before_action :set_customer_if_nested, only: %i(index new edit)
  before_action :new_sales_order, only: %i(new create)
  before_action :build_sales_order_lines, only: %i(new create)
  before_action :build_product, only: %i(new create)

  def index
    if @customer
      @sales_orders = @customer.sales_orders
    else
      @sales_orders = SalesOrder.all
    end
  end

  def new
  end

  def create
    @sales_order = SalesOrder.new(sales_order_params)
    if @sales_order.save
      redirect_to @sales_order
    else
      render :new
    end
  end

  def edit
    @sales_order = SalesOrder.find_by(id: params[:id])
  end

  def update
    @sales_order = SalesOrder.find_by(id: params[:id])
    if @sales_order.update(sales_order_params)
      redirect_to @sales_order
    else
      render :edit
    end
  end

  def show
    @sales_order = SalesOrder.find_by(id: params[:id])
  end

  def destroy
    @sales_order = SalesOrder.find_by(id: params[:id])
    @sales_order.destroy
    redirect_to sales_orders_path
  end

  private
  def sales_order_params
    params.require(:sales_order).permit(:customer_id, sales_order_lines_attributes: [:product_id, :qty, :description, :price, product_attributes: [:name, :description, :part_number]])
  end

  def set_customer_if_nested
    if params.include?(:customer_id)
      @customer = Customer.find_by(id: params[:customer_id])
    end
  end

  def new_sales_order
    @sales_order = SalesOrder.new
  end
  
  def build_sales_order_lines
    @sales_order_line = @sales_order.sales_order_lines.build
  end

  def build_product
    @sales_order_line.build_product
  end

end
