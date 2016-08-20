require 'rails_helper'

RSpec.feature "Employer can be created" do
  scenario "user can visit create account form and select employer" do
    Role.create!(name: "registered_user")
    Role.create!(name: "employer")

    visit new_user_path

    fill_in "Username", with: "Tester"
    fill_in "Email", with: "lane@nil.com"
    fill_in "City", with: "Denver"
    check "Are you an employer?"

    fill_in "Password", with: "password"

    click_button "Create Account"
    expect(current_path).to eq(employer_dashboard_index_path)


    expect(page).to have_link "Logout"

    expect(page).not_to have_content "Login"
  end
end
