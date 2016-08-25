require 'rails_helper'

RSpec.feature "Employer cant edit a job with invalid inputs" do

  before do
    role = Role.create(name: "employer")
    company = create_company
    company.jobs.create(
            title: "Web Developer",
            description: "Web Stuff",
            salary: "40,000-60,000",
          )
    user = User.find(company.user_id)
    UserRole.create(user_id: user.id, role_id: role.id)
  end

  scenario "a job is not created with invalid inputs" do
    visit login_path
    fill_in 'Username', with: 'Test'
    fill_in 'Password', with: "password"

    click_button "Login"
    click_link "Manage Jobs"

    expect(current_path).to eq(employer_jobs_path)

    click_button "Edit"

    fill_in 'Title', with: ''
    fill_in 'Description', with: "Experience required"
    select('$40,000-$60,000', from: 'job[salary]')
    select('Inspirato', from: 'job[company_id]')

    click_button "Update Job"

    expect(page).to have_content "Title can't be blank"
  end
end
