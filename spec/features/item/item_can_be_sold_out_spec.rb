require 'rails_helper'

RSpec.feature "Item can be sold out" do
  xscenario "logged-in user visits the show page of a sold-out item" do
    user = create(:user)
    item = create(:sold_out_item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit item_path(item)

    expect(page).not_to have_button("Add to Cart")
    expect(page).to have_content("SOLD OUT")
  end

  xscenario "visitor views the page to view all items" do
    available_item = create(:item)
    sold_out_item = create(:sold_out_item)

    visit items_path

    expect(page).to have_content(available_item.title)
    expect(page).to_not have_content(sold_out_item.title)
  end

  xscenario "visitor views the category page for the sold-out item" do
    sold_out_item = create(:sold_out_item)
    category = sold_out_item.category

    visit category_path(category)

    expect(page).not_to have_content(sold_out_item.title)
  end
end
