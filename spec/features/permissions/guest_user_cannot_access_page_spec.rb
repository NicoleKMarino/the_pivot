require 'rails_helper'

RSpec.feature "Guest can't visit certain pages" do
  scenario "guest visits pages and gets an error"  do
    Role.create(name:"guest_user")

    visit dashboard_path
    expect(page).to have_content "Please login to view this page"

    visit admin_dashboard_index_path

    expect(page).to have_content "You don't have the authority to visit this page"

    visit employer_dashboard_index_path

    expect(page).to have_content "You don't have the authority to visit this page"
  end
end
