require 'rails_helper'

RSpec.feature "Employer can create a job" do
  
  before do
    role = Role.create(name: "employer")
    company = create_company
    user = User.find(company.user_id)
    UserRole.create(user_id: user.id, role_id: role.id)
  end
  
  scenario "a job is created with valid inputs" do
    visit login_path
    fill_in 'Username', with: 'Test'
    fill_in 'Password', with: "password"
    
    click_button "Login"
    click_link "Manage Jobs"

    expect(current_path).to eq(employer_jobs_path)

    click_button "Add New Job"

    fill_in 'Title', with: 'Developer'
    fill_in 'Description', with: "Experience required"
    select('$40,000-$60,000', from: 'job[salary]')
    select('Inspirato', from: 'job[company_id]')

    click_button "Create Job"

    expect(current_path).to eq(employer_jobs_path)
    expect(page).to have_content "Developer"

    visit job_path(Job.last)

    expect(page).to have_content "Developer"
    expect(page).to have_content "Experience required"
  end
end
