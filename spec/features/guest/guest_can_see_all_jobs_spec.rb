require 'rails_helper'

RSpec.feature "all available jobs are shown" do
  scenario "guest user visits index and sees only available jobs" do
    #need to create unavailable job 
    #expect to see the available jobs
    #expect not to see the unanvailable jobs
    create_three_jobs
    job = Job.create(title:"Lawyer", salary:"$60,000-$80,000", company_id: Company.last.id)

    visit jobs_path

    expect(page) .to have_link "Software Integration Developer"
    expect(page).to have_link "Senior Software Integration Developer"
    expect(page).to have_link "Lawyer"
    expect(page).to have_content(job.company.location)
    expect(page).to have_link "Designer"
  end
end
