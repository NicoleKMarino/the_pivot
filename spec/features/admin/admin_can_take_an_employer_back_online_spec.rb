require 'rails_helper'

RSpec.feature "Platform admin can take an employer back online" do
  scenario "platform admin take employer back online" do
    platform_role = Role.create(name: "platform_admin")
    employer_role = Role.create(name: "employer")
    platform_user = User.create!(
      username: "Platform_admin",
      email: "nicolekmarina@ssdshotmail.com",
      password: "password",
      first_name: "Nicole",
      last_name: "Marina",
      address: "2122 Concord Lane",
      city: "Denver",
      state: "CO",
      zip_code: 80215
    )
    UserRole.create(user_id: platform_user.id, role_id: platform_role.id)
    employer_user = User.create!(
      username: "Employer_admin",
      email: "employer@ssdshotmail.com",
      password: "password",
      first_name: "Bob",
      last_name: "Marina",
      address: "2122 Concord Lane",
      city: "Denver",
      state: "CO",
      zip_code: 80215
    )
    UserRole.create(user_id: employer_user.id, role_id: employer_role.id)

    industry = Industry.create!(name: "Tech")
    company = industry.companies.create!(
      name: "Inspirato",
      description: "Great company",
      location: "CO",
      status: "offline",
      img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904",
      user_id: employer_user.id
    )

    visit login_path

    fill_in 'Username', with: 'Platform_admin'
    fill_in 'Password', with: "password"
    click_button 'Login'

    expect(page).to have_link "Manage Employers"

    click_link "Manage Employers"

    expect(current_path).to eq(admin_employers_path)

    click_button "Change Status"

    expect(page).to have_content "Employer_admin"
    expect(page).to have_content "Total Companies: 1"
    expect(page).to have_content "Total Jobs: 0"
    expect(page).to have_content "Status: Offline"
    expect(page).to have_button "Change Status"

    click_button "Change Status"

    expect(page).to have_content "Employer_admin"
    expect(page).to have_content "Total Companies: 1"
    expect(page).to have_content "Total Jobs: 0"
    expect(page).to have_content "Status: Online"
    expect(page).to have_button "Change Status"
  end
end
