require 'rails_helper'

RSpec.feature 'Admin creates an item' do
  context 'with valid item infomation and no photo' do
    xscenario 'logged-in admin visits the items path' do
      admin = create(:admin)
      categories = create_list(:category, 3)
      celebrity = create(:celebrity)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit items_path
      click_on 'Add New Treasure'

      expect(current_path).to eq(new_admin_item_path)

      fill_in 'Title', with: 'Creamy Ranch Dressing'
      fill_in 'Description', with: "It's not self-indulgent when it's the best. By Newman, for Newman."
      fill_in 'Price', with: 29.99
      select "#{categories.first.title}", from: 'Category'
      select "#{celebrity.name}", from: 'Celebrity'
      click_on 'Add Treasure'

      expect(current_path).to eq(item_path(Item.first))
      expect(page).to have_content(Item.first.title)
      expect(page).to have_content(Item.first.description)
      expect(page).to have_content(Item.first.price)
      expect(page).to have_css("img[src*='#{Item.first.image_path}']")
    end
  end

  context 'with valid information and photo' do
    xscenario 'logged-in admin visits the items path' do
      admin = create(:admin)
      categories = create_list(:category, 3)
      celebrity = create(:celebrity)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit items_path
      click_on 'Add New Treasure'

      fill_in 'Title', with: 'Creamy Ranch Dressing'
      fill_in 'Description', with: "It's not self-indulgent when it's the best. By Newman, for Newman."
      fill_in 'Price', with: 29.99
      select "#{categories.first.title}", from: 'Category'
      select "#{celebrity.name}", from: 'Celebrity'
      # Commented out due to this being a static asset.
      # attach_file('Image', '/Users/Ryan/Desktop/No_available_image.gif')
      click_on 'Add Treasure'

      expect(current_path).to eq(item_path(Item.first))
      expect(page).to have_content(Item.first.title)
      expect(page).to have_content(Item.first.description)
      expect(page).to have_content(Item.first.price)
      expect(page).to have_css("img[src*='#{Item.first.image_path}']")
    end
  end

  context 'with invalid item information' do
    xscenario 'logged-in admin visits the items path' do
      admin = create(:admin)
      item = create(:item)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit items_path
      click_on 'Add New Treasure'
      fill_in 'Title', with: item.title
      fill_in 'Description', with: item.description
      click_on 'Add Treasure'

      expect(page).to have_content("Title has already been taken, Price can't be blank")
      expect(Item.count).to eq(1)
    end
  end

  context 'unauthorized user' do
    xscenario 'logged-in user visits the items path' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path

      expect(page).to_not have_link('Add New Treasure')
    end

    xscenario 'logged-in user attempts to visit new item path' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_item_path

      expect(current_path).to eq(new_admin_item_path)
      expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')
    end

    xscenario 'visitor visits the items path' do
      visit items_path

      expect(page).to_not have_link('Add New Treasure')
    end

    xscenario 'visitor attempts to visit new item path' do
      visit new_admin_item_path

      expect(current_path).to eq(new_admin_item_path)
      expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')
    end
  end
end
