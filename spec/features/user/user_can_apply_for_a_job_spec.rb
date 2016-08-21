require 'rails_helper'
require 'support/test_helper'

RSpec.feature "Registered user can apply for a job" do
  scenario "User visits a jobs index page and applies for a job" do
    create_user
    job = create_job
    
    visit login_path

    fill_in "Username", with: "josh"
    fill_in "Password", with: "password"
    click_button "Login"
    
    visit jobs_path
    click_on "Apply"
    
    job_application = JobApplication.last

    expect(current_path).to eq(edit_job_application_path(job_application))

    fill_in "Summary",    with: "I would love to get this job!"
    fill_in "Education",  with: "Turing School of Software & Design"
    fill_in "Experience", with: "Google"
    
    click_on "Submit Application"
    
    expect(page).to have_content("Your application was successfully submitted.")
    expect(current_path).to eq(dashboard_path)    
  end
  
  xscenario "User visits a job page and applies for that job" do
  end
end
  
