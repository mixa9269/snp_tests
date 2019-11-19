class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :password, presence: true
  has_secure_token :auth_token
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: true }

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end
end
