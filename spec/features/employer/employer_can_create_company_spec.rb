require 'rails_helper'

RSpec.feature "Employer can create a company" do
  scenario "approved employer creates company" do
    role = Role.create!(name: "employer")
    user = User.create!(username: "Employer",
      email: "nicolekmarina@hotmail.com",
      password: "password",
      first_name: "Nicole",
      last_name: "Marina",
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

    fill_in 'Name', with: 'Hewitt and packard'
    fill_in 'Description', with: 'testertestertester'
    fill_in 'Location', with: 'Colorado'
    select('Finance', from: 'company[industry_id]')

    click_button 'Submit'

    expect(current_path).to eq(company_path(Company.last.slug))

    expect(page).to have_content 'Hewitt and packard'
    expect(page).to have_content 'Company added successfully'
    expect(page).to have_content "testertestertester"
    expect(page).to have_content "Finance"
  end
end
