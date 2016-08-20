class Company < ApplicationRecord
  has_many :jobs
  belongs_to :industry
  validates :name, presence: true, uniqueness: true
  validates :img_path, presence: true
  before_validation :create_slug

  enum status: %w(pending online offline)
  
  def to_params
    slug
  end 
  
  private
  
    def create_slug
      self.slug = name.parameterize if name
    end
end
