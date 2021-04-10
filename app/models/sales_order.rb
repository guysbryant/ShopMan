class SalesOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :sales_number_tracker
  has_many :sales_order_lines, dependent: :destroy
  has_many :products, through: :sales_order_lines

  before_validation :set_sales_order_number, on: :create
  after_save :save_sales_tracker

  SALES_TRACKER ||= SalesNumberTracker.find_or_create_by(id: 1)


  def save_sales_tracker
    SALES_TRACKER.save
  end

  def set_sales_order_number
    set_sales_tracker unless self.sales_number_tracker
    self.sales_order_number = SALES_TRACKER.next_sales_number
  end

  def set_sales_tracker
    self.sales_number_tracker = SALES_TRACKER
  end

  def next_line_number
    self.number_of_lines += 1
  end
end
