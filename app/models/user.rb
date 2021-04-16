class User < ApplicationRecord
  has_secure_password

  validates :name, :username, :address, :phone_number, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..10 }
  validates :phone_number, numericality: { only_integer: true }
  validate :phone_number_validator

  def phone_number_validator
    size = self.phone_number.digits.size
    size == 7 || size == 10 || size == 11 ? true : (self.errors.add :phone_number, "is not the correct length")[0]
  end

end
