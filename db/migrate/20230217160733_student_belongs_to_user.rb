class StudentBelongsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :user, null: false
  end
end
