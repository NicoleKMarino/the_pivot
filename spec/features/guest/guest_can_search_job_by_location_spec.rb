require 'rails_helper'
require "support/test_helper"

RSpec.feature "Guest can search jobs by location" do
  scenario "guest visits companies page and filters job list by location" do
	
  job = create_job
  visit root_path
  click_on "Search Jobs"
  
  expect(current_path).to eq(jobs_path)
  expect(page).to have_content("Filter By")
  
  
  # Then my current page should be "/jobs"
  # And I should see the title "Filter by"
  # If I select "CO" in the drop-down list
  # I should see the job title "Software Integration Developer"
  # I should see the company name "Inspirato"
  # I should see the location "Denver, CO"


  end
end
