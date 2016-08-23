require 'rails_helper'

RSpec.feature "Visitor sees appropriate information" do
  scenario "views root path" do

    visit root_path

    expect(page).to have_content("Looking for a job? MakeMyPayday
    We've helped 50 bajillion people find jobs. And we can help you.
    Job searching is hard, we make it easy.")
    expect(page).to_not have_button("Explore Companies")
    expect(page).to_not have_button("Search Jobs")
  end
end
