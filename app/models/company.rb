class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy
  belongs_to :industry
  belongs_to :user
  before_validation :create_slug
  validates :name, presence: true, uniqueness: true
  before_validation :create_slug
  validates_presence_of :slug

  def to_params
    slug
  end

  private

    def create_slug
      self.slug = name.parameterize if name
    end
end
