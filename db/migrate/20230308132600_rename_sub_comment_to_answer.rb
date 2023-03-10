class RenameSubCommentToAnswer < ActiveRecord::Migration[7.0]
  def change
    rename_table :subcomments, :answers
    rename_column :answers, :comment_id, :publication_id
  end
end
