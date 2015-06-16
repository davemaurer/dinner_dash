require 'rails_helper'

# describe "unauthenticated user", type: :feature do
#   it "shows an items index page to an unauthenticated user" do
#     visit "/items"
#
#     expect(page).to have_content("Menu")
#   end
# end

feature "an unauthenticated user" do
  scenario "will see an items index page" do
    visit items_path
    within "h1" do
      expect(page).to have_content("Menu")
    end
  end

  scenario "the index page has all items listed" do
    item = Item.create(title: "Unicorn Roll", description: "Gooooood", price: 8, status: "active")
    visit items_path
    within "table" do
      expect(page).to have_content("Unicorn Roll")
    end
  end

  scenario "the index page displays items in rows of four" do
    Item.create(title: "Unicorn Roll", description: "Gooooood", price: 8, status: "active")
    Item.create(title: "Medusa Hair Pasta", description: "Gooooood", price: 8, status: "active")
    Item.create(title: "Pixie Bread Stix", description: "Gooooood", price: 8, status: "active")
    Item.create(title: "Phoenix Spicy Curry", description: "Gooooood", price: 8, status: "active")
    Item.create(title: "Titan Burger", description: "Gooooood", price: 8, status: "active")

    visit items_path
    within "table" do
      save_and_open_page
      Item.all.each do |item|
        expect(page).to have_content(item.title)
      end
    end
  end
end
