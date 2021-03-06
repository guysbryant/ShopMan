class Customer < ApplicationRecord
  has_many :sales_orders, dependent: :destroy
  has_many :sales_order_lines, through: :sales_orders
  has_many :products, through: :sales_order_lines

  validates :name, :address, :contact_name, :email, :phone_number, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: { case_sensitive: false }
  validates :phone_number, uniqueness: true


  def unique_products_sort_by_part_number
    self.products.unique_part_numbers_sort
  end
end
