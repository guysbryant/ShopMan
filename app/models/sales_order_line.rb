class SalesOrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :sales_order
  accepts_nested_attributes_for :product
  before_create :get_line_number

  def get_line_number
    self.line_number = self.sales_order.next_line_number
  end

end

