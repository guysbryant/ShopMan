class Product < ApplicationRecord
  has_many :sales_order_lines, dependent: :destroy
  has_many :sales_orders, through: :sales_order_lines
  has_many :customers, through: :sales_orders

  validates :name, :description, :part_number, presence: true
  validates :name, :part_number, uniqueness: { case_sensitive: false }
end
