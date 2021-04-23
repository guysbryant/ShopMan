class SalesOrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :sales_order

  before_create :get_line_number
  after_save :save_sales_order

  validates :qty, :price, presence: true
  validates :qty, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }

  def save_sales_order
    self.sales_order.save
  end

  def get_line_number
    self.line_number = self.sales_order.next_line_number
  end

  def product_attributes=(attributes)
    self.product = Product.find_or_create_by(attributes) unless attributes.values.any?(&:empty?) || Product.find_by_name(attributes[:name]) || Product.find_by_part_number(attributes[:pat_number])
  end

  def self.find_by_name(name)
    Product.find_by(name: name)
  end

  def self.find_by_part_number(part_number)
    Product.find_by(part_number: part_number)
  end

end

