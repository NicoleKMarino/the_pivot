require 'rails_helper'

RSpec.feature "Registered user cannot view the admin dashboard" do
  xscenario "user gets 404 when tyring to view admin dashboard" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_index_path

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')

    expect(page).to have_link "Logout"
  end
end
