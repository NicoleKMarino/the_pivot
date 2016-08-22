class CreateSavedJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_jobs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.timestamps
    end
  end
end
