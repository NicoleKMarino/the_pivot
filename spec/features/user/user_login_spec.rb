require 'rails_helper'

RSpec.feature "User can login" do
  scenario "registered user can login" do
    user = User.create(username: "lane", email: "lane@nil.com", password: "password")

    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link "Logout"

    expect(page).not_to have_content "Login"
  end
end
