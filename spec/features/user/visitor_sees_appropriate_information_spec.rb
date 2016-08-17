require 'rails_helper'

RSpec.feature "Visitor sees appropriate information" do
  xscenario "views their cart" do
    item = create(:item)

    visit items_path

    within ("#item-#{item.id}") do
      click_on "Add to Cart"
    end

    visit cart_index_path

    expect(page).not_to have_button("Checkout")
    expect(page).to have_link("Login or Create Account to Checkout")

    click_on "Login or Create Account to Checkout"
    click_on "Create an account"

    fill_in "Username", with: 'Ryan'
    fill_in "Email", with: 'ryan@example.com'
    fill_in "Password", with: 'password'
    click_on "Create Account"

    visit cart_index_path

    within("#item-#{item.id}") do
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
    end

    expect(page).to have_link("Checkout")

    click_on "Logout"

    expect(page).to have_link("Login")
    expect(page).to_not have_link("Logout")
  end
end
