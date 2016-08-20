require 'rails_helper'

RSpec.feature "Checking out" do
  xscenario "an existing user with items in cart visits their cart" do
    user = create(:user)
    item = create(:item)

    visit items_path(item)

    within("#item-#{item.id}") do
      click_on "Add to Cart"
    end

    visit cart_index_path

    click_on "Login or Create Account to Checkout"
    fill_in "Username", with: user.username
    fill_in "Password", with: 'password'
    within('form') do
      click_on "Login"
    end

    expect(current_path).to eq(cart_index_path)

    click_on "Checkout"

    expect(current_path).to eq(orders_path)
    expect(page).to have_content("Order was successfully placed")
    within("#order-#{Order.first.id}") do
      expect(page).to have_content(item.price)
    end
  end
end
