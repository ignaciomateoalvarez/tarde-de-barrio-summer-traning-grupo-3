class AddColumnDestacar < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :stand_out, :boolean, default: false
  end
end
