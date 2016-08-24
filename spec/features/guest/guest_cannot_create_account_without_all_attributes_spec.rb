RSpec.feature "Guest cannot create account without filling all fields" do
  scenario "guest attempts to make account but doesnt complete form" do
    Role.create(name: "registered_user")
    visit new_user_path

    fill_in "Username", with: "lane"
    fill_in "Email", with: ""
    fill_in "First name", with: "Lane"
    fill_in "Last name", with: "Beard"
    fill_in "Address", with: "Turing"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip code", with: "80202"
    fill_in "Password", with: "password"

    click_button "Create Account"

    expect(page).to have_content "Email can't be blank, Email is invalid"
  end
end