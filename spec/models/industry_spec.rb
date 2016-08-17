require 'rails_helper'

RSpec.describe Industry, type: :model do
  it { should have_many :companies }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end

