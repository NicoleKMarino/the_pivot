class JobApplication < ApplicationRecord
  belongs_to :job
  validates :summary, presence: true

  enum status: %w(started submitted)

  def change_status_to_submitted
    self.status = "submitted"
  end
end
