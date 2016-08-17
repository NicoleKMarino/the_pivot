require 'rails_helper'

RSpec.feature "All sold-out items can be viewed" do
  xscenario "a visitor views the root path" do
    items = create_list(:sold_out_item, 2)

    visit root_path

    click_on "Best Of"

    expect(current_path).to eq(unavailable_items_path)

    expect(page).to have_content(items.first.title)
    expect(page).to have_content(items.last.title)
  end
end
