require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should have_secure_password }
  it { should validate_length_of :state }
  it { should validate_length_of :zip_code }
  xit { should have_many :applications } #need to update orders

  it "should validate the format of an email address" do
    user1 = User.new(username: "Ryan", password: "isgreat", email: "the email@here")
    user2 = User.new(username: "Lane", password: "isgreat", email: "the-email@here.com")
    expect(user1.valid?).to be false
    expect(user2.valid?).to be true
  end
end
