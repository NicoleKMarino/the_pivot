require 'rails_helper'
require 'support/test_helper'

RSpec.feature "Registered user can apply for a job" do
  before do
    create_user
    job = create_job
  end
  scenario "User visits a jobs index page and applies for a job" do
    
    visit login_path

    fill_in "Username", with: "josh"
    fill_in "Password", with: "password"
    click_button "Login"
    
    visit jobs_path
    click_on "Apply"
    
    job_application = JobApplication.last

    expect(page).to have_content("Started Applications: 1")
    expect(job_application.status).to eq("started")
    expect(current_path).to eq(edit_job_application_path(job_application))
    
    fill_in "Summary",    with: "I would love to get this job!"
    fill_in "Education",  with: "Turing School of Software & Design"
    fill_in "Experience", with: "Google"
    
    click_on "Submit Application"

    job_application = JobApplication.last

    expect(page).to have_content("Your application was successfully submitted.")
    expect(page).to have_content("Started Applications: 0")
    expect(job_application.status).to eq("submitted")
    expect(current_path).to eq(dashboard_path)    
  end
  
  scenario "User cannot apply twice for the same job" do
    visit login_path

    fill_in "Username", with: "josh"
    fill_in "Password", with: "password"
    click_button "Login"
    
    visit jobs_path
    click_on "Apply"
    
    job_application = JobApplication.last

    expect(page).to have_content("Started Applications: 1")
    expect(job_application.status).to eq("started")
    expect(current_path).to eq(edit_job_application_path(job_application))
    
    fill_in "Summary",    with: "I would love to get this job!"
    fill_in "Education",  with: "Turing School of Software & Design"
    fill_in "Experience", with: "Google"
    
    click_on "Submit Application"
    visit jobs_path
    click_on "Apply"
    
    expect(page).to have_content "You can't apply twice for the same job position."
  end
end  
  
