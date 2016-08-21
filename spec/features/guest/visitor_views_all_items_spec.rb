require 'rails_helper'

RSpec.feature "Visitor Views All Items", type: :feature do
  xscenario "on the items index page" do
    item1 = create(:item)
    item2 = create(:item)

    visit items_path

    within('#items-list') do
      expect(page).to have_content(item1.celebrity.name)
      expect(page).to have_content(item2.celebrity.name)
      expect(page).to have_content(item2.price)
      expect(page).to have_content(item2.price)
    end
  end
end
