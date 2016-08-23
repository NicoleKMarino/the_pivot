require 'rails_helper'

RSpec.feature "User can view all of their applications" do
  scenario "when they visit their dashboard they can view submitted and started applications " do
    user = create_user

    started_application = create_job_application
    started_application.assign_user(user)

    submitted_application = create_submitted_job_application
    started_application.user_id = user.id
    submitted_application.assign_user(user)

    visit login_path

    fill_in "Username", with: "josh"
    fill_in "Password", with: "password"
    click_button "Login"

    visit dashboard_path

    click_on "My Applications"
    
    expect(current_path).to eq(user_job_applications_path)

    within("#application-#{started_application.id}") do
      expect(page).to have_content(started_application.id)
      expect(page).to have_content(started_application.job.title)
      expect(page).to have_content("Started")
      expect(page).to have_content(submitted_application.id)
      expect(page).to have_content(submitted_application.job.title)
      expect(page).to have_content("Submitted")
    end
    
    within("#application-#{started_application.id}") do
      click_link "Job Application # #{started_application.id}"
    end
    
    expect(current_path).to eq(user_job_application_path(started_application))
  end
end
