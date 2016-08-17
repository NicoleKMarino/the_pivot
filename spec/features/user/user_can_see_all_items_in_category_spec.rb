require 'rails_helper'

RSpec.feature "User can see all items in a category" do
  xscenario "they view page for a specific category and see all items" do
    celebrity = Celebrity.create(name: "Tom Cruise")

    cat1 = Category.create(title: "Kitchen")
    cat1.items.create(title: "Knife", description: "Steel with wood handle", price: 100, image_path: "www", celebrity_id: celebrity.id)
    cat1.items.create(title: "Bowl", description: "Steel", price: 50, image_path: "www", celebrity: celebrity)

    cat2 = Category.create(title: "Outdoor Supplies")
    cat2.items.create(title: "Shovel", description: "Garden Shovel", price: 20.00, image_path: "www", celebrity: celebrity)
    cat2.items.create(title: "Saw", description: "Circular", price: 400, image_path: "www", celebrity: celebrity)

    visit category_path(cat2.title)

    expect(page).to have_content "Shovel"
    expect(page).to have_content "Saw"

    visit category_path(cat1.title)

    expect(page).to have_content "Knife"
    expect(page).to have_content "Bowl"

    visit category_path("outdoor-supplies")

    expect(page).to have_content "Outdoor Supplies"
    expect(page).to have_content "Shovel"
    expect(page).to have_content "Saw"
  end
end
