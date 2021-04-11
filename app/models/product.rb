class Product < ApplicationRecord
  has_many :sales_order_lines, dependent: :destroy
  has_many :sales_orders, through: :sales_order_lines
  has_many :customers, through: :sales_orders
end
