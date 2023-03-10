class Answer < ApplicationRecord
  belongs_to :publication
  belongs_to :user

  validates :body, presence: true
end