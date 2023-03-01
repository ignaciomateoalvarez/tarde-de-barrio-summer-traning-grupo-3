class SubCommentCommentReference < ActiveRecord::Migration[7.0]
  def change
    create_table :subcomments do |t|
      t.text :body, null: false
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
