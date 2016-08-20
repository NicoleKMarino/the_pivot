require 'rails_helper'
require "support/test_helper"

RSpec.feature "Guest can search jobs by salary range" do
  scenario "guest visits job page and filters job list by salary"  do

    create_three_jobs
    visit root_path
    click_on "Search Jobs"

    expect(current_path).to eq(jobs_path)

    expect(page).to have_content("Filter By")
    expect(page).to have_content("Software Integration Developer")
    expect(page).to have_content("Senior Software Integration Developer")
    expect(page).to have_content("Designer")

    select("$60,000-$80,000", from: 'job[filter_salary]')

    expect(page).to have_content("Senior Software Integration Developer")
    expect(page).to have_content("Software Integration Developer")
# sorry for this terrible code, .salary6 is a class pertaining to the designer job (salary) line # 16
    expect(page).to have_selector(".salary6", visible: false)
  end
end
