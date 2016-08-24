class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy
  belongs_to :industry
  belongs_to :user
  before_validation :create_slug
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :location, presence: true
  # validates :img_path, presence: true
  before_validation :create_slug
  validates_presence_of :slug

  enum status: %w(offline online)


  def to_params
    slug
  end

  private

    def create_slug
      self.slug = name.parameterize if name
    end
end
