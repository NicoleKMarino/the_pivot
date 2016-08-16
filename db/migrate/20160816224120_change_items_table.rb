class ChangeItemsTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :items, :jobs
    remove_column :jobs, :price
    remove_column :jobs, :image_path
    remove_column :jobs, :upload_image_file_name
    remove_column :jobs, :upload_image_content_type
    remove_column :jobs, :upload_image_file_size
    remove_column :jobs, :upload_image_updated_at
    add_column :jobs, :salary, :text
    remove_column :jobs, :celebrity_id
    remove_column :jobs, :category_id
    add_reference :jobs, :company, foreign_key: true
  end
end
