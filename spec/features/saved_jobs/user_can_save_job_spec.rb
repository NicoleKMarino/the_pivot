require 'rails_helper'

RSpec.feature "Registered user can save a job for later" do
  scenario "user can save a job and see it in the saved jobs page" do
    company = create_company
    job = company.jobs.create!(
      title: "Software Integration Developer", 
      description: "test", 
      salary: "$60,000-$80,000"
    )
    user = User.create(username: "lane", email: "lane@nil.com", password: "password")
    
    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password"
    click_button "Login"

    visit jobs_path

    click_button "Save For Later"
    
    expect(page).to have_content "You have saved Software Integration Developer for later."
    
    visit saved_jobs_path
    
    expect(page).to have_link "Software integration developer"
  end
  
  scenario "user cannot save a job twice" do
    company = create_company
    job = company.jobs.create!(
      title: "Software Integration Developer", 
      description: "test", 
      salary: "$60,000-$80,000"
    )
    user = User.create(username: "lane", email: "lane@nil.com", password: "password")
    
    visit login_path

    fill_in "Username", with: "lane"
    fill_in "Password", with: "password"
    click_button "Login"

    visit jobs_path

    click_button "Save For Later"
    
    expect(page).to have_content "You have saved Software Integration Developer for later."

    click_button "Save For Later"
        
    expect(page).to have_content "You already saved that job"
  end
end
