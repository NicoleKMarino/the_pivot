class SavedJob < ApplicationRecord
  belongs_to :job
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :job_id
end
