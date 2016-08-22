require 'rails_helper'

RSpec.feature "User can view nav bar info" do
  scenario "user can see all details of nav bar" do
    Role.create(name: "registered_user")
    user1 = User.create(
      username: "user",
      email: "lanerdoce@aol.com",
      password: "password",
      first_name: "Lane",
      last_name: "Winham",
      address: "2122 Concord Lane",
      city: "Denver",
      state: "CO",
      zip_code: 80215
    )

    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"

    visit root_path

    expect(page).to have_content("Hello, #{user1.username}")
    expect(page).to have_content("All Jobs")
    expect(page).to have_content("All Companies")
    expect(page).to have_content("My Account")
    expect(page).to have_content("MakeMyPayday")
  end
end
