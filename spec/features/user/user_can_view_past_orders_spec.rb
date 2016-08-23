require 'rails_helper'

RSpec.feature "User can view all of their applications" do
  scenario "when they visit their dashboard they can view submitted and started applications " do
    user = create_user

    started_application = create_job_application
    started_application.user_id = user.id

    submitted_application = create_submitted_job_application
    started_application.user_id = user.id
    submitted_application.user_id = user.id

    visit login_path

    fill_in "Username", with: "josh"
    fill_in "Password", with: "password"
    click_button "Login"

    visit dashboard_path

    click_on "My Applications"
    byebug
    expect(current_path).to eq(user_job_applications_path)

    # within("#application-#{started_application.id}") do
    #   expect(page).to have_content(started_application.id)
    #   expect(page).to have_content(started_application.title)
    #   expect(page).to have_content("Started")
    #   expect(page).to have_content(submitted_application.id)
    #   expect(page).to have_content(submitted_application.title)
    #   expect(page).to have_content("Submitted")
    # end
    
#     As a registered user
# when I visit /dashboard
# and click on "Check Applications"
# I should see a list of jobs that I have applied to
# I should see the date, job title, and status
# when I click the job title, it should take me to the job show page
  end
end
