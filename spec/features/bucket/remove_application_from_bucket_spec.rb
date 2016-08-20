require 'rails_helper'

RSpec.feature 'Remove application from the bucket' do
  xscenario 'guest with an application in the bucket visits the bucket page' do
    create_job
    visit jobs_path
    within("#items-list") do
      first(".job-option-buttons").click_on "Apply"
    end
    
    visit bucket_index_path
    
    expect(page).to have_content("Software Integration Developer")
    
    click_on "Remove this Application"
    
    expect(page).not_to have_content("Software Integration Developer")
  end
end
