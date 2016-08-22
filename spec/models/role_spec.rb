require 'rails_helper'


RSpec.describe Role, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :user_roles}

  it "should validate based on creation" do
    role1 = Role.new(name:"Admin")
    role2 = Role.new
    expect(role1.valid?).to be true
    expect(role2.valid?).to be false
  end
end
