class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false
      t.references :comment, null: false
      t.timestamps
    end
  end
end