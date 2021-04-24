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


  def self.make_user(request, params)
    request.env['PATH_INFO'].include?("auth") ? make_by_omniauth(request.env['omniauth.auth']['info']) : make_by_local(params)
  end

  def self.make_by_omniauth(auth_info)
    {user: User.find_or_create_by(email: auth_info["email"]) do |u|
      u.name = auth_info["name"]
      u.password = SecureRandom.hex(10)
      end, method: "omniauth"}
  end

  def self.make_by_local(params)
    {user: User.find_by(email: params[:email]), method: "local"}
  end
end
