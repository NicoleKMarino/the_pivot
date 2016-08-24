require 'rails_helper'

RSpec.feature "Employer can edit a job" do
  scenario "that job is updated once you slick submit" do
    company = create_company
    user = User.find(company.user_id)
    role1 = Role.create(name: "employer")
    UserRole.create(user_id: user.id, role_id: role1.id)

    Job.create(
      title: "Web Developer",
      description: "Web Stuff",
      salary: "10,000",
      company_id: company.id
    )

    visit login_path

    fill_in 'Username', with: 'Test'
    fill_in 'Password', with: "password"

    click_button 'Login'

    click_link 'Manage Jobs'

    expect(current_path).to eq(employer_jobs_path)

    click_button "Edit"

    fill_in 'Title', with: 'Doctor'
    fill_in 'Description', with: "poke things"
    fill_in 'Salary', with: "50,000-60,0000"

    click_button "Update Job"

    expect(page).to have_content("Doctor")
    expect(page).to_not have_content("Web Developer")
  end
end
