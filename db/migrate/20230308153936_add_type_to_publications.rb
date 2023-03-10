class AddTypeToPublications < ActiveRecord::Migration[7.0]
  def change
    add_column :publications, :type, :string
  end
end
