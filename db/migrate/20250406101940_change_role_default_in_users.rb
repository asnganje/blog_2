class ChangeRoleDefaultInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :role, 'user'
  end
end
