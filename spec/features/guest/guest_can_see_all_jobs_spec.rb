require 'rails_helper'

RSpec.feature "all available jobs are shown" do
  scenario "guest user visits index and sees only available jobs" do
    create_three_jobs
    job1 = Job.create(title:"Lawyer", salary:"10,000", company_id:Company.last.id)

    visit jobs_path

    expect(page) .to have_link("Software Integration Developer")
    expect(page).to have_link("Senior Software Integration Developer")
    expect(page).to have_link(job1.title)
    expect(page).to have_content(job1.company.location)
    expect(page).to have_link("Designer")
  end
end
