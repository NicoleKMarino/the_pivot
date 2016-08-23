require 'rails_helper'

RSpec.feature 'Remove application from the bucket' do
  scenario 'guest with an application in the bucket visits the bucket page' do
    create_job
    visit jobs_path

    within(".jobs-list") do
      first(".job-option-buttons").click_on "Apply"
    end

    visit bucket_index_path

    expect(page).to have_content "SOFTWARE INTEGRATION DEVELOPER"

    click_on "Remove this Application"

    expect(page).to have_content "Your application for Software Integration Developer has been cancelled."

    expect(page).not_to have_content "SOFTWARE INTEGRATION DEVELOPER"
  end
end
