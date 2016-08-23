require 'rails_helper'

RSpec.feature "guest sees job show page" do
  scenario "when they visit path for specific job" do
    job = create_job

    visit job_path(job)

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.company.name.capitalize)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job.salary)
    expect(page).to_not have_button("Apply")
    expect(page).to have_button("Login or Create Account to Continue Application")
    expect(page).to have_button("Continue Browsing Jobs")
  end
end
