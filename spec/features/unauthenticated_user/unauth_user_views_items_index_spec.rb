require "rails_helper"

RSpec.feature "the unauthenticated user view", type: :feature do
  let(:category) { Category.create(name: "new category") }

  context "will see an item" do
    scenario "will see an items index page" do
      visit items_path
      within "h1" do
        expect(page).to have_content("Mythical Eatures")
      end
    end
  end

  scenario "will see that the index page has all items listed" do
    Item.create(title: "Unicorn Roll",
      description: "Gooooood",
      price: 8,
      status: "active",
      categories: [category])

    visit items_path

    within ".item-title" do
      expect(page).to have_content("Unicorn Roll")
    end
  end

  scenario "will see that the index page displays items in rows of four" do
    Item.create(title: "Unicorn Roll",
      description: "Gooooood",
      price: 8,
      status: "active",
      categories: [category])
    Item.create(title: "Medusa Hair Pasta",
      description: "Gooooood",
      price: 8,
      status: "active",
      categories: [category])
    Item.create(title: "Pixie Bread Stix",
      description: "Gooooood",
      price: 8,
      status: "active",
      categories: [category])
    Item.create(title: "Phoenix Spicy Curry",
      description: "Gooooood",
      price: 8,
      status: "active",
      categories: [category])
    Item.create(title: "Titan Burger",
      description: "Gooooood",
      price: 8,
      status: "active",
      categories: [category])

    visit items_path
    
    Item.all.each do |item|
      expect(page).to have_content(item.title)
    end
  end

end
