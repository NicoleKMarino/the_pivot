class ChangeCelebritiesTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :celebrities, :employers
    add_column :employers, :description, :text
    add_column :employers, :location, :text
    add_column :employers, :status, :integer, default: 0
    add_column :employers, :img_path, :text
  end
end
