class ChangeLastNameToLastname < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :last_name, :lastname
  end
end
