class SalesOrder < ApplicationRecord
  belongs_to :customer
  has_many :sales_order_lines
end
