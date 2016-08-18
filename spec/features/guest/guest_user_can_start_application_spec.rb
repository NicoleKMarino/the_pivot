require 'rails_helper'
require 'support/test_helper'

RSpec.feature "Guest can start more than one application" do
  scenario "Guest visits jobs page and selects apply for a certain job" do
    create_three_jobs
    job = Job.first
    job2 = Job.second

    visit jobs_path
    within("#items-list") do
      first(".job-option-buttons").click_on "Apply"
    end

    expect(page).to have_content("Started Applications: 1")
    expect(current_path).to eq(bucket_path(job))
    expect(page).to have_button("Login or Create Account to Continue Application")
    expect(page).to have_button("Continue Browsing Jobs")

    click_on("Continue Browsing Jobs")
    expect(current_path).to eq(jobs_path)
    within("#items-list") do
      find(".job-item:nth-child(2)").click_on "Apply"
    end

    expect(page).to have_content("Started Applications: 2")
    expect(current_path).to eq(bucket_path(job2))
    expect(page).to have_button("Create Account to Continue Application")
    expect(page).to have_button("Continue Browsing Jobs")
  end
end
