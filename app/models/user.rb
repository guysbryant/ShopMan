class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :phone_number, numericality: { only_integer: true }, allow_blank: true
  validate :phone_number_validator

  def phone_number_validator
    size = self.phone_number.digits.size if self.phone_number
    size == nil || size == 7 || size == 10 || size == 11 ? true : (self.errors.add :phone_number, "is not the correct length")[0]
  end

end
