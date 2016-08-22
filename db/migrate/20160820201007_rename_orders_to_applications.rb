class RenameOrdersToApplications < ActiveRecord::Migration[5.0]
  def change
    rename_table :orders, :applications
  end
end
