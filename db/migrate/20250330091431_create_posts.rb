class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
