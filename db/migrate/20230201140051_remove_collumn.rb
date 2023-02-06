class RemoveCollumn < ActiveRecord::Migration[7.0]
  def change
    def self.up
      remove_column :users, :password
      remove_column :users, :password_confirmation
    end
  end
end
