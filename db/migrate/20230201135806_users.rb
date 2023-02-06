class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, uniqueness: true
      t.string :crypted_password, default: nil
      t.string :salt, default: nil
      t.timestamps
    end
  end
end
