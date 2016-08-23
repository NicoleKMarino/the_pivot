require 'rails_helper'

RSpec.feature "Employer can create a job" do
  scenario "that job is associated with company" do
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

    expect(page).to have_content "Web Developer"

    click_button "Delete"

    expect(current_path).to eq(employer_jobs_path)

    expect(page).to have_content "You've deleted job Web Developer."
  end
end
