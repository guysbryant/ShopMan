class SalesNumberTracker < ApplicationRecord
  has_many :sales_orders

  def next_sales_number
    self.sales_number += 1
  end
end
