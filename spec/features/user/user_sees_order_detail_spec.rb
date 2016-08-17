require 'rails_helper'

RSpec.feature "User sees one order's detail" do
  xscenario "logged-in user creates an order and visits their order show page" do
    user = create(:user)
    item = create(:item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit items_path
    click_on "Add to Cart"
    click_on "Add to Cart"

    visit cart_index_path
    click_on "Checkout"

    order = Order.first

    expect(current_path).to eq(orders_path)

    click_on "Order Details"

    expect(current_path).to eq(order_path(order))
    expect(page).to have_content(order.status)

    within("#item-#{item.id}") do
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_content(order.item_quantity(item))
      expect(page).to have_content(item.price)
      expect(page).to have_content(order.sub_total(item))
      expect(page).to have_content(order.time_updated)
    end
    expect(page).to have_content(order.total)
  end
end
