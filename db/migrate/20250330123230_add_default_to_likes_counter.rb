class AddDefaultToLikesCounter < ActiveRecord::Migration[8.0]
  def change
    change_column_default :posts, :likes_counter, 0
  end
end
