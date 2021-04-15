class SalesOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :sales_number_tracker
  has_many :sales_order_lines, dependent: :destroy
  has_many :products, through: :sales_order_lines

  before_validation :set_sales_order_number, on: :create
  after_save :save_sales_tracker

  def sales_order_lines_attributes=(attributes)
    attributes.values.each do |sol_params|
      if sol = SalesOrderLine.find_by(id: sol_params[:id])
        sol.update(sol_params)
      else
          self.sales_order_lines << SalesOrderLine.create(sol_params)
      end
    end
  end

  def save_sales_tracker
    self.sales_number_tracker.save
  end

  def set_sales_order_number
    self.sales_order_number = set_sales_tracker.next_sales_number
  end

  def set_sales_tracker
    self.sales_number_tracker = SalesNumberTracker.find_or_create_by(id: 1)
  end

  def next_line_number
    self.number_of_lines += 1
  end
end
