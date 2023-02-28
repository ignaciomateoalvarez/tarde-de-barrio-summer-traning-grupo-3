class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :students
  has_many :comments

  enum rol: { colaborador: 0, administrador: 1 }

  validates :name, :lastname, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'Only letters allowed.' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Formato de email incorrecto.' },
                    uniqueness: true, presence: true
  validate :forbid_changing_email, on: :update
  validates :password, length: { minimum: 3 }, if: :new_record?
  validates_confirmation_of :password

  private

  def forbid_changing_email
    errors.add :email, 'can not be changed!' if email_changed?
  end
end
