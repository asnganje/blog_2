class AddDefaultToPostsCounter < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :posts_counter, 0
  end
end
