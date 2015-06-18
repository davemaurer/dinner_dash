class User < ActiveRecord::Base
  has_secure_password

  validates :full_name, presence: true
  validates :user_name, length: {minimum: 2, maximum: 32}
  validates :password, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
end
