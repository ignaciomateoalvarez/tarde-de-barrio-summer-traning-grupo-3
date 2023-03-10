class Attendance < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :assistant
      t.references :student, foreign_key: true
      t.timestamps
    end 
  end
end