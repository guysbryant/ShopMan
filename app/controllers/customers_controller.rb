class CustomersController < ApplicationController
  before_action :require_logged_in
  before_action :find_customer, only: %i(edit update destroy show)

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    @customer_products = @customer.unique_products_sort_by_part_number
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address, :contact_name, :phone_number, :email)
  end

  def find_customer
    @customer = Customer.find_by(id: params[:id])
  end
end
