require 'rails_helper'

RSpec.feature "Admin can edit an item" do
  xscenario "when they click Edit on items page" do
    admin = create(:admin)
    item = create(:item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit items_path

    within("#item-#{item.id}") do
      click_on "Edit"
    end

    expect(current_path).to eq(edit_admin_item_path(item))
    fill_in "Title", with: "Hairbrush"
    click_on "Update Item"

    expect(current_path).to eq(item_path(item))

    expect(page).to have_content("Hairbrush")
  end

  xscenario "default user cannot edit item" do
    user = create(:user)
    item = create(:item)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_admin_item_path(item)

    expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')
  end
end
