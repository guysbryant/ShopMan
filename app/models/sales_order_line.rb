class SalesOrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :sales_order
  before_create :get_line_number

  def get_line_number
    self.line_number = self.sales_order.next_line_number
  end

  def product_attributes=(attributes)
    self.product = Product.find_or_create_by(attributes) unless attributes['name'].empty?
  end

end
