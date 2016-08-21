class AddSlugToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :slug, :text
  end
end
