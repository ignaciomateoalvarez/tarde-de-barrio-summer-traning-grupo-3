class Student < ApplicationRecord
  belongs_to :user

  enum school_grade: { inicial: 0, primaria: 1, secundaria: 2 }

  validates :name, :lastname, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'Only letters allowed.' }
  validates :birthday, presence: true
  validates :address, presence: true
  validates :school_grade, presence: true
  validates :currently_studying, inclusion: { in: [true, false] }, presence: true
  def age
    age = Date.today.year - birthday.year
    age -= 1 if Date.today < birthday + age.years

    age
  end
end
