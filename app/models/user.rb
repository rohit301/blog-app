class User < ApplicationRecord
  has_secure_password
  has_many :blogs
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email invalid"  }
  validates :password_digest, confirmation: true, length: {within: 8..40}
end
