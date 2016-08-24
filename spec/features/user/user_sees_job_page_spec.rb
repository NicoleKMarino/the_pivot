require 'rails_helper'

RSpec.feature "User sees job show page" do
  scenario "when they visit path for specific job" do
    create_user
    job = create_job

    visit login_path

    fill_in "Username", with: "josh"
    fill_in "Password", with: "password"
    click_button "Login"

    visit job_path(job)

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.company.name.capitalize)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job.salary)
    expect(page).to have_button("Apply")
    expect(page).to have_button("Continue Browsing Jobs")
  end
end
