class RenameCommentToPublication < ActiveRecord::Migration[7.0]
  def change
    rename_table :comments, :publications
    rename_column :likes, :comment_id, :publication_id
  end
end
