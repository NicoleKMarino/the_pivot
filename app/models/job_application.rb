class JobApplication < ApplicationRecord
  belongs_to :job
  validates :summary, presence: true

  enum status: %w(started submitted)
end