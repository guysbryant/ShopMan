class SalesNumberTracker < ApplicationRecord
  has_many :sales_orders

  def next_sales_number
    self.sales_number += 1
    self.save
    self.sales_number
  end
end
