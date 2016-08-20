class Industry < ApplicationRecord
  has_many :companies
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  before_validation :create_slug

  def to_param
    slug
  end

  private

    def create_slug
      self.slug = name.parameterize if name
    end
end
