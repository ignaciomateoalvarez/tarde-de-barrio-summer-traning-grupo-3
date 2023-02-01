class User < ApplicationRecord
  # validates
  validates :name, :lastname, format: { with: /\A[a-zA-Z]+\z/, message: 'Only letters allowed' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
