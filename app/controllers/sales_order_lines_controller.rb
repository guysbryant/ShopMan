class SalesOrderLinesController < ApplicationController
  before_action :require_logged_in
  before_action :set_sales_order

  def new
    @sales_order_line = @sales_order.sales_order_lines.build()
  end

  def create
    @sales_order_line = @sales_order.sales_order_lines.build(sales_order_line_params)
    if @sales_order_line.save
      redirect_to @sales_order
    else
      render :new
    end
  end

  def edit
  end

  def update
    # @sales_order_line = SalesOrderLine.find_by(id: params[:id])
    if @sales_order_line.update(sales_order_line_params)
      redirect_to @sales_order
    else
      render :edit
    end
  end

  def destroy
    # @sales_order_line = SalesOrderLine.find_by(id: params[:id])
    @sales_order_line.destroy
    redirect_to sales_order_path(@sales_order)
  end

  private
  def sales_order_line_params
    params.require(:sales_order_line).permit(:product_id, :sales_order_id, :qty, :price, :line_number)
  end

  def set_sales_order
    @sales_order_line ||= SalesOrderLine.find_by(id: params[:id])
    @sales_order = SalesOrder.find_by(id: params[:sales_order_id]) || SalesOrder.find_by(id: @sales_order_line.sales_order.id )
  end
end
