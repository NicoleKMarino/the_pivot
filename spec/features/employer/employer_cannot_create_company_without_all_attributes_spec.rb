require 'rails_helper'

RSpec.feature "Employer cannot create a company without all attributes" do
  scenario "approved employer does not fill all the information to create a company" do
    role = Role.create!(name: "employer")
    user = User.create!(
      username: "Employer",
      email: "deb@hotmail.com",
      password: "password",
      first_name: "Deb",
      last_name: "Hamel",
      address: "2122 Concord Lane",
      city: "Denver",
      state: "CO",
      zip_code: 80215
    )

    UserRole.create(user_id: user.id, role_id: role.id)
    Industry.create!(name: 'Finance')

    visit login_path
    fill_in 'Username', with: 'Employer'
    fill_in 'Password', with: "password"
    click_button 'Login'

    expect(current_path).to eq(employer_dashboard_index_path)

    click_link "Add Company"

    fill_in 'Name', with: ''
    fill_in 'Description', with: 'testertestertester'
    select('Arizona', from: 'company[location]')
    select('Finance', from: 'company[industry_id]')

    click_button 'Submit'

    expect(page).to have_content "Missing required fields. Please re-enter your company information."
    expect(current_path).to eq(employer_companies_path)
  end
end
