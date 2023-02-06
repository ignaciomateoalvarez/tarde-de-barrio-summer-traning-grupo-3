class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    def self.up
      remove_column :users, :password
      add_column :users, :crypted_password
      add_column :users, :salt
    end
  end
end
