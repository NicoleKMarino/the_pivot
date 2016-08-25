require 'rails_helper'
require 'support/test_helper'

RSpec.feature "Guest can start more than one application but needs to create an account to finalize applications" do

  scenario "Guest visits jobs page and selects apply for a certain job" do
    create_two_jobs
    
    visit jobs_path
    within(".jobs-list") do
      first(".job-option-buttons").click_on "Apply"
    end
  
    expect(page).to have_content "Started Applications: 1"
    expect(current_path).to eq(bucket_path(Job.first))
    expect(page).to have_button("Login or Create Account to Continue Application")
    expect(page).to have_button("Continue Browsing Jobs")
  
    click_on("Continue Browsing Jobs")
  
    expect(current_path).to eq(jobs_path)
  
    within(".jobs-list") do
      find(".job-item:nth-child(2)").click_on "Apply"
    end

    expect(page).to have_content("Started Applications: 2")
    expect(current_path).to eq(bucket_path(Job.second))
    expect(page).to have_button("Create Account to Continue Application")
    expect(page).to have_button("Continue Browsing Jobs")
  
    click_on "Create Account to Continue Application"
    expect(current_path).to eq(login_path)
  end
  
    scenario "Guest can't start more than one application for the same job" do
      create_job
      
      visit jobs_path
      within(".jobs-list") do
        first(".job-option-buttons").click_on "Apply"
      end
      
      expect(page).to have_content "Started Applications: 1"
      
      visit jobs_path
      within(".jobs-list") do
        first(".job-option-buttons").click_on "Apply"
      end

      expect(page).to have_content "Started Applications: 1"
      expect(page).to have_content "You can't apply twice for the same job position."
    end
end
