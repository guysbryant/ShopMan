class Customer < ApplicationRecord
  has_many :sales_orders
  has_many :sales_order_lines, through: :sales_orders
  has_many :products, through: :sales_order_lines
end
