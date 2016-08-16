class ChangeEmployersNametoCompany < ActiveRecord::Migration[5.0]
  def change
    rename_table :employers, :companies
  end
end
