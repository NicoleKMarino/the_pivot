require 'rails_helper'

RSpec.feature "Registered user can edit account information" do
  scenario "user can click edit on the dashboard menu and edit account" do
    role = Role.create(name: "registered_user")

    visit new_user_path

    fill_in "Username", with: "lane"
    fill_in "Email", with: "lane@nil.com"
    fill_in "First name", with: "Lane"
    fill_in "Last name", with: "Beard"
    fill_in "Address", with: "Turing"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip code", with: "80202"
    fill_in "Password", with: "password"

    click_button "Create Account"

    expect(current_path).to eq(dashboard_path)

    click_link "Edit Profile"

    expect(page).to have_field "Username", with: "lane"
    expect(page).to have_field "Email", with: "lane@nil.com"
    expect(page).to have_field "First name", with: "Lane"
    expect(page).to have_field "Last name", with: "Beard"
    expect(page).to have_field "Address", with: "Turing"
    expect(page).to have_field "Zip code", with: "80202"
    expect(page).to have_field "Password"

    fill_in "Username", with: "THE NEW AND IMPROVED"
    fill_in "Email", with: "lane@nil.com"
    fill_in "First name", with: "Lane"
    fill_in "Last name", with: "Beard"
    fill_in "Address", with: "Turing"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip code", with: "80202"
    fill_in "Password", with: "password"
    click_on "Update Profile"

    expect(page).to have_content "THE NEW AND IMPROVED"
    expect(current_path).to eq(dashboard_path)
  end
end

# as a user
# when I visit /dashboard
# and I click "Edit Profile"
# I should be redirected to a form
# I should see current/old information in each field
# I should have to enter my password to make any changes
# Enter new/changed info in field
# then I click submit
# I should be redirected to /dashboard
# Verify all edited info is changed
# Old info should be gone
