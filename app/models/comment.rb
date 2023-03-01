class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :subcomments

  validates :body, presence: true
end
