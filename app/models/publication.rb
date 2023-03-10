class Publication < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :likes, dependent: :destroy
  has_many_attached :files

  validates :body, presence: true
  validates :files, content_type: ['image/jpg','image/png','application/pdf','application/msword']

  def liked?(user)
    likes.exists?(user: user)
  end
end
