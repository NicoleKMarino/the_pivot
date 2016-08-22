class AddEducationAndExperienceToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :education, :text 
    add_column :applications, :experience, :text
  end
end
