require 'rails_helper'

RSpec.feature "Employer can login" do
  scenario "registered employer can login and view employer dashboard" do
    role1 = Role.create(name: "employer")
    user1 = User.create(username: "Employer", email: "lanerdoce@aol.com", password: "password", first_name: "Lane", last_name: "Winham", address: "2122 Concord Lane", city: "Denver", state: "CO", zip_code: 80215, )
    UserRole.create(user_id:user1.id, role_id:role1.id)

    visit login_path

    fill_in 'Username', with: 'Employer'
    fill_in 'Password', with: "password"
    click_button 'Login'

    expect(current_path).to eq(employer_dashboard_index_path)
    expect(page).to have_link "Logout"
    expect(page).to have_content "Manage Jobs"
    expect(page).not_to have_content "Login"
  end

  scenario "if user does not a employer role, they cannot access the employer dashboard" do
    create_user

    visit login_path

    fill_in 'Username', with: 'josh'
    fill_in 'Password', with: "password"
    click_button 'Login'

    visit employer_dashboard_index_path

    expect(page).to have_content("You don't have the authority to visit this page")
  end
end
