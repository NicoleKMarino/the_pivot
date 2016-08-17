require 'rails_helper'

RSpec.feature "all available jobs are shown" do
  scenario "guest user visits index and sees only available jobs" do
    
    create_three_jobs
    visit jobs_path

    expect(page).to have_link("Software Integration Developer")
    expect(page).to have_link("Senior Software Integration Developer")
    expect(page).to have_link("Designer")
  end
end
