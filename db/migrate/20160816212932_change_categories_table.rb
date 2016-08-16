class ChangeCategoriesTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :categories, :industries
    rename_column :industries, :title, :name
  end
end
