class SalesOrderLinesController < ApplicationController
  before_action :require_logged_in
  before_action :set_sales_order_if_nested, only: %i(new edit create)
  before_action :set_sales_order_line, only: %i(edit update destroy)

  def new
    @sales_order_line = @sales_order.sales_order_lines.new
  end

  def create
    @sales_order_line = @sales_order.sales_order_lines.build(sales_order_line_params)
    @sales_order_line.line_number = @sales_order.next_line_number
    if @sales_order_line.save
      @sales_order.save
      redirect_to @sales_order
    else
      render :new
    end
  end

  def edit
    @sales_order = @sales_order_line.sales_order
  end

  def update
    if @sales_order_line.update(sales_order_line_params)
      redirect_to sales_order_path(@sales_order_line.sales_order)
    else
      render :edit
    end
  end

  def destroy
    @sales_order_line.destroy
    redirect_to sales_order_path(@sales_order_line.sales_order)
  end

  private
  def sales_order_line_params
    params.require(:sales_order_line).permit(:product_id, :sales_order_id, :qty, :price)
  end

  def set_sales_order
    @sales_order = SalesOrder.find_by(id: params[:sales_order_id]) || SalesOrder.find_by(id: @sales_order_line.sales_order.id )
  end

  def set_sales_order_if_nested
    @sales_order = SalesOrder.find_by(id: params[:sales_order_id]) if params[:sales_order_id]
  end

  def set_sales_order_line
    @sales_order_line = SalesOrderLine.find_by(id: params[:id])
  end
end
