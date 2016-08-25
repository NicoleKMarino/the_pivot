require 'rails_helper'

RSpec.feature "User can't visit certain pages" do
  scenario "user visits pages and gets an error"  do
    User.create(username: "lane", email: "lane@nil.com", password: "password")
    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password"
    click_button "Login"

    visit admin_dashboard_index_path

    expect(page).to have_content("Please login to view this page!")

    visit employer_dashboard_index_path

    expect(page).to have_content("Please login to view this page!")
  end
end
