require 'rails_helper'
require "support/test_helper"

RSpec.feature "Guest can search jobs by location" do
  scenario "guest visits companies page and filters job list by location" do
	
  # industry = create(:industry)
  create_three_companies
  
  # company = create(:company)

  # create_company
  
  visit companies_path

  expect(page).to have_content "Explore Companies"

#select location from dropdown
#list should change

  end
end
