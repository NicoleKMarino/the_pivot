require 'rails_helper'

RSpec.feature "User can login" do
  
  before do
    role = Role.create(name: "registered_user")
    role.users.create!(username: "lane", email: "lane@nil.com", password: "password")
  end
  
  scenario "registered user can login with valid credentials" do  
    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link "Logout"

    expect(page).not_to have_content "Login"
  end
  
  scenario "registered user cannot login with invalid credentials" do
    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password2"
    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content "Login information incorrect."
  end

end
