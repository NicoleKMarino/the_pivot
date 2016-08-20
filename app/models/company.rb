class Company < ApplicationRecord
  has_many :jobs
  belongs_to :industry
  before_validation :create_slug
  validates :name, presence: true, uniqueness: true
  before_validation :create_slug
  validates_presence_of :slug
  validates :img_path, presence: true


  def to_params
    slug
  end

  private

  def create_slug
    self.slug = name.parameterize if name
  end

end
