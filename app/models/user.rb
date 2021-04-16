class User < ApplicationRecord
  has_secure_password

  validates :name, :username, :password, :address, :phone_number, :pay_rate, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..10 }
  validates :phone_number, numericality: { only_integer: true }
  validates :phone_number, numericality: true

end
