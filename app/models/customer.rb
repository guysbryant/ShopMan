class Customer < ApplicationRecord
  has_many :sales_orders
  has_many :sales_order_lines, through: :sales_orders
  has_many :products, through: :sales_order_lines

  validates :name, :address, :contact_name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: { case_sensitive: false }
  validates :phone_number, uniqueness: true
end
