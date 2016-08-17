require 'rails_helper'
require 'support/test_helper.rb'

RSpec.feature "All companies can be viewed" do
  scenario "a guest views the root path" do
    create_three_companies

    visit root_path

    click_on "Explore Companies"

    expect(current_path).to eq(companies_path)

    expect(page).to have_content("Inspirato")
    expect(page).to have_content("Great company")
    expect(page).to have_content("Tech")

  end
end
