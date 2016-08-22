require 'rails_helper'

RSpec.feature "Registered user can have a role" do
  it "should have a relationship with user" do
    role1 = Role.create(name: "employer")

    user1= User.create(username: "Test", email: "lanerdoce@aol.com", password: "password", first_name: "Lane", last_name: "Winham", address: "2122 Concord Lane", city: "Denver", state: "CO", zip_code: 80215, )

    UserRole.create(user_id:user1.id, role_id:role1.id)

    expect(user1.roles.first.name).to eq("employer")

  end
end
