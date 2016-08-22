require 'rails_helper'

RSpec.feature "User can login using Twitter" do
  xscenario "user clicks twitter link and is logged in with that information" do
    setup_for_oauth

    visit login_path

    expect(page).to have_link "Twitter"

    click_link "Twitter"

    expect(page).to have_content "Logged in as twitter_login"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link "Logout"

    expect(page).not_to have_content "Login"
  end
end
