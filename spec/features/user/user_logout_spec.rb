require 'rails_helper'

RSpec.feature "User can logout" do
  scenario "registered user can logout" do
    user = User.create(username: "lane", email: "lane@nil.com", password: "password")

    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_link "Logout"

    expect(page).not_to have_content "Login"

    click_link "Logout"

    expect(page).not_to have_content "Logged in as lane"
    expect(page).not_to have_link "Logout"
  end
end
