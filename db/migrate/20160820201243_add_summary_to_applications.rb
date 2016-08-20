class AddSummaryToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :summary, :text
  end
end
