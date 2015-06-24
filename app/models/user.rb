class User < ActiveRecord::Base
  has_many :orders

  has_secure_password

  validates :full_name, presence: true
  validates :user_name, length: {minimum: 2, maximum: 32}, :if => :username_present?
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }

  enum role: %w[default admin]

  def display_name
    self.user_name.nil? ? self.full_name : self.user_name
  end

  private

  def username_present?
    !user_name.blank?
  end
end
