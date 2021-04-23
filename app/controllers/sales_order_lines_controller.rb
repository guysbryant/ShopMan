class SalesOrderLinesController < ApplicationController
  before_action :require_logged_in
  before_action :find_sales_order, only: %i(new create destroy)
  before_action :find_sales_order_line, only: %i(edit update destroy)
  before_action :check_for_product, only: %i(create update)

  def new
    @sales_order_line = @sales_order.sales_order_lines.build
    @product = @sales_order_line.build_product
  end

  def create
    @sales_order_line = @sales_order.sales_order_lines.build(sales_order_line_params)
    if @sales_order_line.save
      redirect_to sales_order_path(@sales_order)
    else
      @product = @sales_order_line.build_product
       render :new
    end
  end

  def edit
  end

  def update
    @sales_order_line.update(sales_order_line_params)
    if @sales_order_line.save
      redirect_to sales_order_path(@sales_order_line.sales_order)
    else
      render :edit
    end
  end

  def destroy
    @sales_order_line.delete
    redirect_to sales_order_path(@sales_order_line.sales_order)
  end

  private

  def sales_order_line_params
    params.require(:sales_order_line).permit(:product_id, :sales_order_id, :qty, :price, :line_number, product_attributes: [:name, :description, :part_number])
  end

  def find_sales_order
    @sales_order = SalesOrder.find_by(id: params[:sales_order_id])
  end

  def find_sales_order_line
    @sales_order_line = SalesOrderLine.find_by(id: params[:id])
  end

  def product_params
    params[:sales_order_line][:product_attributes]
  end

  def check_for_product
    if product_exists(product_params)
      request.env["HTTP_REFERER"].include?("edit") ? found_product_from_update : found_product_from_create
    end
  end

    def found_product_from_update
      redirect_to edit_sales_order_line_path(@sales_order_line)
    end

    def found_product_from_create
      redirect_to new_sales_order_sales_order_line_path(@sales_order)
    end
end
