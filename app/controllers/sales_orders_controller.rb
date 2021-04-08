class SalesOrdersController < ApplicationController
  before_action :require_logged_in

  def index
    @sales_orders = SalesOrder.all
  end

  def new
    @sales_order = SalesOrder.new
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
end
