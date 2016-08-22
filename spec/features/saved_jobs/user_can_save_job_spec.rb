require 'rails_helper'

RSpec.feature "Registered user can save a job for later" do
  it "should add job and see it in saved jobs" do
    company1= create_company
    job= Job.create(title:"Programmer", description: "test", salary:"10,000",company_id: company1.id)
    user = User.create(username: "lane", email: "lane@nil.com", password: "password")
    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password"
    click_button "Login"

    visit jobs_path

    click_button("Save For Later")
    expect(page).to have_content "You have saved Programmer for later."
    click_button("Save For Later")
    expect(page).to have_content "You already saved that job"
    visit saved_jobs_path
    expect(page).to have_content "Programmer"
    expect(page).to have_content "Number of Jobs Saved: 1"


  end
end
