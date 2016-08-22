class AddJobRefToJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_reference :job_applications, :job, foreign_key: true
  end
end
