require 'rails_helper'

RSpec.feature "Remove an item from the cart" do
  xscenario "a visitor visits the cart path" do
    item = create(:item)
    
    visit items_path

    within ("#item-#{item.id}") do
      click_on "Add to Cart"
    end

    visit cart_index_path

    within("#item-#{item.id}") do
      click_on "Remove"
    end

    expect(current_path).to eq(cart_index_path)

    expect(page).to have_content("Successfully removed #{item.title} from your cart.")

    expect(page).to have_link("#{item.title}", href: item_path(item))

    within("tbody") do
      expect(page).not_to have_content(item.title)
    end
  end
end
