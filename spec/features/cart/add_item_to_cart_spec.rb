require 'rails_helper'

RSpec.feature 'Add item to cart' do
  xscenario "a visitor views an item's page" do
    item = create(:item)

    visit items_path

    within("#item-#{item.id}") do
      expect(page).to have_button('Add to Cart')
      click_on 'Add to Cart'
    end

    expect(current_path).to eq(current_path)

    visit cart_index_path

    within('tbody') do
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
    end
    expect(page).to have_content("Total: $199.99")
  end
end
