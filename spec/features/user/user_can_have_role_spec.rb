require 'rails_helper'

RSpec.feature "Registered user can have a role" do
  it "should have a relationship with user" do
    role1 = Role.create(name: "employer")
    role2 = Role.create(name: "registered_user")
    role3 = Role.create(name: "platform_admin")

    user1 = User.create(username: "Ryan", password: "isgreat", email: "the email@here", roles_id: role1.id)
    user2 = User.create(username: "Lane", password: "isgreat", email: "the-email@here.com", roles_id:role2.id)
    user3 = User.create(username: "Lane", password: "isgreat", email: "the-email@here.com", roles_id: role3.id)


    expect(user1.roles_id).to eq(1)
    expect(user2.roles_id).to eq(2)
    expect(user3.roles_id).to eq(3)
  end
end
