require 'rails_helper'

RSpec.feature "Guest can finilize application after creating an account" do
  xscenario "guest starts an application and after creating an account submits the application" do
    role = Role.create(name: "registered_user")
    job = create_job

    visit jobs_path
    within(".jobs-list") do
      first(".job-option-buttons").click_on "Apply"
    end

    fill_in "summary", with: "I have tons of experience in this industry."
    click_button "Login or Create Account to Continue Application"
    
    click_on "Create an account"
    
    fill_in "Username", with: "lane"
    fill_in "Email", with: "lane@nil.com"
    fill_in "First name", with: "Lane"
    fill_in "Last name", with: "Beard"
    fill_in "Address", with: "Turing"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip code", with: "80202"
    fill_in "Password", with: "password"

    click_button "Create Account"

    expect(current_path).to eq(dashboard_path)
  end
end