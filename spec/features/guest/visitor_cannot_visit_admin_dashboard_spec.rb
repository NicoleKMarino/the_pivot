require 'rails_helper'

RSpec.feature "Visitor cannot view the admin dashboard" do
  xscenario "visit gets redirected when tyring to view admin dashboard" do
    visit admin_dashboard_index_path

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')

    expect(page).to have_link "Login"
  end
end
