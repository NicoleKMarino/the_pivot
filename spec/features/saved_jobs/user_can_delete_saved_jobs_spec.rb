require 'rails_helper'

RSpec.feature "Registered user can delete saved job" do
  it "should no longer see deleted job" do
    company1= create_company
    job= Job.create(title:"Software Integration Developer", description: "test", salary:"10,000",company_id: company1.id)
    user = User.create(username: "lane", email: "lane@nil.com", password: "password")
    SavedJob.create(user_id:user.id,job_id:job.id)

    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password"
    click_button "Login"


    visit saved_jobs_path

    expect(page).to have_content("Software integration developer")
    click_button "Delete"
    expect(page).to have_content "Number of Jobs Saved: 0"


  end
end
