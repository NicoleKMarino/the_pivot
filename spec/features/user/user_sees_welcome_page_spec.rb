require 'rails_helper'

RSpec.feature "User sees welcome page" do
  xscenario "when they visit the root" do
    visit root_path

    expect(page).to have_content("One Fan's Treasure")
  end
end
