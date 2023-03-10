class Attendance < ApplicationRecord
  belongs_to :student
  has_many :users
  enum assistant: { presente: 'presente', ausente: 'ausente', retiraron: 'retiraron' }
end