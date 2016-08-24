require 'rails_helper'

RSpec.feature "Employer can create a job" do
  scenario "that job is associated with company" do
    company = create_company
    user = User.find(company.user_id)
    role1 = Role.create(name: "employer")
    UserRole.create(user_id: user.id, role_id: role1.id)

    visit login_path

    fill_in 'Username', with: 'Test'
    fill_in 'Password', with: "password"

    click_button 'Login'

    click_link 'Manage Jobs'

    expect(current_path).to eq(employer_jobs_path)

    click_button "Add New Job"

    fill_in 'Title', with: 'Developer'
    fill_in 'Description', with: "Web Dev"
    fill_in 'Salary', with: "50,000-60,0000"
    select(company.name, :from => 'job[company_id]')
    click_button 'Create Job'

    expect(current_path).to eq(employer_jobs_path)

    expect(page).to have_content("Developer")

    visit job_path(Job.last)

    expect(page).to have_content("Developer")
    expect(page).to have_content("Web Dev")
  end
end
