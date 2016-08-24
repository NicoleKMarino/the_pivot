require 'rails_helper'

RSpec.feature "Employer can create an account" do
  scenario "guest visitor visits create account page and creates an employer account" do
    Role.create!(name: "employer")

    visit new_user_path

    fill_in "Username", with: "Tester"
    fill_in "Email", with: "lane@nil.com"
    fill_in "City", with: "Denver"
    fill_in "Password", with: "password"
    check "Are you an employer?"

    click_button "Create Account"

    expect(current_path).to eq(employer_dashboard_index_path)
    expect(page).to have_link "Logout"
    expect(page).not_to have_content "Login"
  end
end
