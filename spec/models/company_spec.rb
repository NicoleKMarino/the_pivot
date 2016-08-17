require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :jobs }
  it { should belong_to(:industry) }
end
