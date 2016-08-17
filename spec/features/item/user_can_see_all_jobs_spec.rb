require 'rails_helper'

RSpec.feature "all available jobs are shown" do
  scenario "guest user visits index and sees only available jobs" do
    industry= Industry.create(name:"Tech")
    company1 = Company.create(name:"google", description:"test", location: "Denver", industry_id:1,status:1, img_path:"example.com")
    job1 = Job.create(title: "Customer Service", description: "Test", status: "available", salary: "10,000", company_id: 1)
    job2 = Job.create(title: "Web Developer", description: "Test", status: "available", salary: "10,000", company_id: 1)
    filled_job = Job.create(title:"Web Developer", description: "This is a job", status:1, salary:"10,000", company_id:1)
    visit jobs_path

    expect(page).to have_content(job2.name)
    expect(page).to have_content(job1.name)
    expect(page).to_not have_content(filled_job.name)
  end
end
