class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.integer :age
      t.date :birthday
      t.string :address
      t.string :school_grade
      t.boolean :currently_studying

      t.timestamps
    end
  end
end
