class AddSlugtoStore < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :slug, :string
  end
end
