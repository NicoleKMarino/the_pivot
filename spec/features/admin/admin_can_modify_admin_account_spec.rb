require 'rails_helper'

RSpec.feature "Logged in admin can alter admin account" do
  xscenario "admin can change their account" do
    admin = create(:admin)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: 'password'
    click_button "Login"

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_content "Admin Dashboard"
    click_on "Edit My Profile"
    expect(current_path).to eq(edit_user_path(admin))

    fill_in "Username", with: "ADMIN"
    fill_in "Email", with: admin.email
    fill_in "Password", with: 'password'
    click_button "Update Profile"

    expect(page).to have_content "Logged in as ADMIN"
    expect(current_path).to eq(admin_dashboard_index_path)
  end

  xscenario "admin cannot change another user's account" do
    admin = create(:admin)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit edit_user_path(user)

    expect(page).to have_content("Admins can only modify their own accounts")
    expect(current_path).to eq(admin_dashboard_index_path)
  end
end
