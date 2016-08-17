class Job < ApplicationRecord
  belongs_to :company
  validates :title, presence: true
  validates :salary, presence: true
  validates :company, presence: true

  enum status: %w(available unavailable)

  def company_name
    company.name
  end
end
