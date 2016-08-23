class AddUsertoCompanies < ActiveRecord::Migration[5.0]
  def change
    add_reference :companies, :user, index: true
  end
end
