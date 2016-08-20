class Company < ApplicationRecord
  has_many :jobs
  belongs_to :industry
  before_validation :generate_slug
  validates :name, presence: true, uniqueness: true
  validates_presence_of :slug

  enum status: %w(pending online offline)

private

  def generate_slug
    self.slug = name.parameterize
  end

end
