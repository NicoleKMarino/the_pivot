require 'rails_helper'

RSpec.feature "User sees one application detail" do
 scenario "logged-in user creates an order and visits their order show page" do
   create_user
   job = create_job
   
   visit login_path

   fill_in "Username", with: "josh"
   fill_in "Password", with: "password"
   click_button "Login"
   
   visit jobs_path
   click_on "Apply"
   
   fill_in "Summary",    with: "I would love to get this job!"
   fill_in "Education",  with: "Turing School of Software & Design"
   fill_in "Experience", with: "Google"
   
   click_on "Submit Application"
   
   expect(current_path).to eq(dashboard_path)  

   click_on "My Applications"
   click_on "Job Application for #{job.title}"
   
   job_application = JobApplication.last
   
   expect(current_path).to eq(user_job_application_path(job_application))

   expect(page).to have_content "I would love to get this job!"
   expect(page).to have_content "Turing School of Software & Design"
   expect(page).to have_content "Google"
  end
end
