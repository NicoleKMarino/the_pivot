require 'rails_helper'

RSpec.feature "Admin can login and view dashboard" do
  xscenario "admin can login view dashboard" do
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_content "Admin Dashboard"
    expect(page).not_to have_content "You cannot access admin content!"
  end
end
