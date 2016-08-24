require 'rails_helper'

RSpec.feature "Admin can approve a company" do
  scenario "the status should change to online from index" do
    user = User.create!(
      username: "Admin",
      email: "nicolekmarina@ssdshotmail.com",
      password: "password",
      first_name: "Nicole",
      last_name: "Marina",
      address: "2122 Concord Lane",
      city: "Denver",
      state: "CO",
      zip_code: 80215
    )
    industry = Industry.create!(name: "Tech")
    company = industry.companies.create!(
      name: "Inspirato",
      description: "Great company",
      location: "CO",
      status: "offline",
      img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904",
      user_id: user.id
    )
    user = User.find(company.user_id)
    role1 = Role.create(name: "platform_admin")
    UserRole.create(user_id: user.id, role_id: role1.id)

    visit login_path

    fill_in 'Username', with: 'Admin'
    fill_in 'Password', with: "password"
    click_button 'Login'

    expect(current_path).to eq(admin_dashboard_index_path)

    click_link "Pending Requests(#{Company.count})"

    expect(page).to have_content company.name
    click_button "Put Online"
    expect(page).to have_content('Company Now Online')
  end

  scenario "the status should change to online from show page" do

    user = User.create!(
      username: "Admin",
      email: "nicolekmarina@ssdshotmail.com",
      password: "password",
      first_name: "Nicole",
      last_name: "Marina",
      address: "2122 Concord Lane",
      city: "Denver",
      state: "CO",
      zip_code: 80215
    )
    industry = Industry.create!(name: "Tech")
    company = industry.companies.create!(
      name: "Inspirato",
      description: "Great company",
      location: "CO",
      status: "offline",
      img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904",
      user_id: user.id
    )
    user = User.find(company.user_id)
    role1 = Role.create(name: "platform_admin")
    UserRole.create(user_id: user.id, role_id: role1.id)

    visit login_path

    fill_in 'Username', with: 'Admin'
    fill_in 'Password', with: "password"
    click_button 'Login'

    expect(current_path).to eq(admin_dashboard_index_path)

    click_link "Pending Requests(#{Company.count})"

    expect(page).to have_content company.name
    click_link "#{company.name}"

    click_button "Put Online"

    expect(page).to have_content('Company Now Online')

  end
end
