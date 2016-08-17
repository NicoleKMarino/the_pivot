require 'rails_helper'
require "support/test_helper"

RSpec.feature "Guest can search jobs by location" do
  scenario "guest visits companies page and filters job list by location"  do

    create_three_jobs
    visit root_path
    click_on "Search Jobs"

    expect(current_path).to eq(jobs_path)

    expect(page).to have_content("Filter By")
    expect(page).to have_content("Software Integration Developer")
    expect(page).to have_content("Senior Software Integration Developer")
    expect(page).to have_content("Designer")

    select('CO', from: 'job[filter_location]')

    expect(page).to have_content("Software Integration Developer")
    expect(page).to have_content("Senior Software Integration Developer")
    expect(page).to have_selector('.FL', visible: false)
  end
end
