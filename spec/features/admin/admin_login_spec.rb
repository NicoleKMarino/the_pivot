require 'rails_helper'

RSpec.feature "Admin can login" do
  xscenario "registered admin can login" do
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_index_path

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_link "Logout"
    expect(page).not_to have_content "Login"
  end
end
