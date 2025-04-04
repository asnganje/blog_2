class AddDeviseFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email,              :string, default: "", null: false
    add_column :users, :encrypted_password, :string, default: "", null: false
    add_index :users, :email, unique: true
  end
end
