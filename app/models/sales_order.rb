class SalesOrder < ApplicationRecord
  belongs_to :customer
  has_many :sales_order_lines, dependent: :destroy

  def next_line_number
    self.number_of_lines += 1
  end
end
