class User < ApplicationRecord
  has_secure_password
  validates :nickname, presence: true
  validates :password, presence: true
  has_secure_token :auth_token
  validates :password, presence: true, length: { minimum: 6 }
  validates :nickname, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: true }
end
