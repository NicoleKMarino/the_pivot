require 'rails_helper'

RSpec.feature "User can be created" do
  scenario "user can visit create account form" do

    visit new_user_path

    fill_in "Username", with: "lane"
    fill_in "Email", with: "lane@nil.com"
    fill_in "City", with: "Denver"
    fill_in "Password", with: "password"

    click_button "Create Account"

    expect(page).to have_link "Logout"

    expect(page).not_to have_content "Login"
  end
end
