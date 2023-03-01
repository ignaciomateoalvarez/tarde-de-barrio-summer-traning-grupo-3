class AddSubCommentCommentReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :subcomments, :user
  end
end
