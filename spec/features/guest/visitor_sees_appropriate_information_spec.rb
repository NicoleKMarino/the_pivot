require 'rails_helper'

RSpec.feature "Visitor sees appropriate information" do
  scenario "views the item index" do
    create_three_jobs

    visit jobs_path

    expect(page).to have_button("Apply")
    expect(page).to have_link("Software Integration Developer")
    expect(page).to_not have_button("Save For Later")

    expect(page).to have_link("Login")
  end
end
