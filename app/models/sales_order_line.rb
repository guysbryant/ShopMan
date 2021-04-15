class SalesOrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :sales_order
  before_create :get_line_number
  after_save :save_sales_order

  def save_sales_order
    self.sales_order.save
  end

  def get_line_number
    self.line_number = self.sales_order.next_line_number
  end

  def product_attributes=(attributes)
    self.product = Product.find_or_create_by(attributes) unless attributes.values.any?(&:empty?)
  end
end

