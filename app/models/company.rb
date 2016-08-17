class Company < ApplicationRecord
  has_many :jobs
  belongs_to :industry
  validates :name, presence: true, uniqueness: true
  
  enum status: %w(pending online offline)
end