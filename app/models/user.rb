class User < ApplicationRecord
  authenticates_with_sorcery!
  # validates
  validates :name, :lastname, format: { with: /\A[a-zA-Z]+\z/, message: 'Only letters allowed' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
