require 'rails_helper'

RSpec.feature "User sees item show page" do
  xscenario "when they visit path for specific item" do
    item = create(:item)

    visit item_path(item)

    expect(page).to have_css("img[src*=\"#{item.image_path}\"]")
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.celebrity_name)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_button("Add to Cart")
  end
end
