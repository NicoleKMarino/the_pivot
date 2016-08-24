require 'rails_helper'

RSpec.feature "Admin can login" do
  scenario "registered admin can login" do
    role = Role.create!(name: "platform_admin")
    user = User.create!(username: "Admin", email: "lane@email.com", password: "password", first_name: "Lane", last_name: "Beard", address: "2122 Concord Lane", city: "Denver", state: "CO", zip_code: 80215)
    UserRole.create(user_id: user.id, role_id:role.id)
    
    visit login_path
    fill_in 'Username', with: 'Admin'
    fill_in 'Password', with: "password"
    click_button 'Login'

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_link "Logout"
    expect(page).to have_content "Pending Requests"
    expect(page).to have_content "Edit My Profile"
    expect(page).not_to have_content "Login"
  end
end
