require 'rails_helper'
require 'support/test_helper.rb'

RSpec.feature "User sees company show page" do
  scenario "when they visit path for specific company" do
    company = create_company

    visit companies_path

    click_on "Inspirato"

    expect(current_path).to eq company_path(company.slug)

    expect(page).to have_xpath("//img[@src='http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904']")
    
    expect(page).to have_content("Great company")
    expect(page).to have_content("All Jobs")
  end
end
