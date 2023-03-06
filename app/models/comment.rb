class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_many :subcomments
  has_many :likes, dependent: :destroy

  validates :body, presence: true

  def liked?(user)
    likes.exists?(user: user)
  end
end
