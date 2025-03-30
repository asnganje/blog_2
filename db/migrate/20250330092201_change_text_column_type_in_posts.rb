class ChangeTextColumnTypeInPosts < ActiveRecord::Migration[8.0]
  def change
    change_column :posts, :text, :text
  end
end
