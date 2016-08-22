require 'rails_helper'

RSpec.feature "User can see jobs on company show page" do
  scenario "they view a companies page and see available jobs" do
    job1 = create_job
    job2 = Job.create(title: "Lawyer", salary: "10,250", company_id: job1.company.id)

    visit company_path(job1.company.slug)

    expect(page).to have_content(job1.title.capitalize)
    expect(page).to have_content(job2.title.capitalize)
    expect(page).to have_content(job1.company.name.capitalize)
  end
end
