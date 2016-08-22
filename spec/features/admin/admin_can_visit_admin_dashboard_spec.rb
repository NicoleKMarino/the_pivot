require 'rails_helper'

RSpec.feature "Admin can login and view dashboard" do
  scenario "admin can login view dashboard" do
    role1 = Role.create(name: "platform_admin")
    user1 = User.create(username: "Admin", email: "lanerdoce@aol.com", password: "password", first_name: "Lane", last_name: "Winham", address: "2122 Concord Lane", city: "Denver", state: "CO", zip_code: 80215, )
    UserRole.create(user_id:user1.id, role_id:role1.id)

    visit login_path
    fill_in 'Username', with: 'Admin'
    fill_in 'Password', with: "password"
    click_button 'Login'

    visit admin_dashboard_index_path

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_content "Profile for Admin"
    expect(page).to have_content "Pending Requests"

  end
end
