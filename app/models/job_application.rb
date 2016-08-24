class JobApplication < ApplicationRecord
  belongs_to :job
  validates :summary, presence: true

  enum status: %w(started submitted)

  def change_status_to_submitted
    update(status: "submitted")
  end

  def assign_user(user)
    update_columns(user_id: user.id)
  end
  
  def update_summary(summary)
    update_columns(summary: summary)
  end
end
