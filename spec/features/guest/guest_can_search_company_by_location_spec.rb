require 'rails_helper'
require "support/test_helper"

RSpec.feature "Guest can search companies by location" do
  scenario "guest visits companies page and filters company list by location"  do

    create_three_companies
    visit root_path
    click_on "Explore Companies"

    expect(current_path).to eq(companies_path)

    expect(page).to have_content("Filter By")
    expect(page).to have_content("Tech")
    expect(page).to have_content("Advertising")
    expect(page).to have_content("Finance")

    expect(page).to have_link("Inspirato")
    expect(page).to have_link("Integer")
    expect(page).to have_link("Td ameritrade")
    
    select('CO', from: 'company[filter_location]')

    expect(page).to have_content("Inspirato")
    expect(page).to have_content("Integer")
    expect(page).to have_selector('.FL', visible: false)
  end
end
