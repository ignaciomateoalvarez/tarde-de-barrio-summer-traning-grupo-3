class ChangeSchoolGradeToEnum < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :school_grade
    add_column :students, :school_grade, :integer, default: 0
  end
end
