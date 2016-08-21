class Job < ApplicationRecord
  belongs_to :company
  has_many :job_applications
  validates :title, presence: true
  validates :salary, presence: true
  validates :company, presence: true
  has_many :saved_jobs
  has_many :users, through: :saved_jobs

  enum status: %w(available unavailable)

  def company_name
    company.name
  end

  def make_unavailable
    self.status = 1
  end

  def make_available
    self.status = 0
  end

  def available?
    return true if self.status == "available"
    return false
  end

  def unavailable?
    return true if self.status == "unavailable"
    return false
  end
end
