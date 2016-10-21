class User < ApplicationRecord
  has_secure_password
  has_many :shoes
  has_many :purchases
  has_many :shoes_purchased, through: :purchases, source: :shoe
  has_many :shoes_sold, through: :shoes, source: :purchase

  validates :first_name, :last_name, :email, presence: true
  validates :password, :password_confirmation, presence: true, if: :password_digest_changed?
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
