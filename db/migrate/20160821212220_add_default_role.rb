class AddDefaultRole < ActiveRecord::Migration[5.0]
  def change
    change_column :user_roles, :role_id, :integer, :default => 1
  end
end
