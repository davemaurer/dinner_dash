require "rails_helper"

RSpec.feature "filtering items by category", type: :feature do
  scenario "it has a categories filter" do
    visit items_path

    within ".filter" do
      expect(page).to have_content("Choose your fare:")
    end
  end

  context "interacting with the categories filter" do
    before(:each) { Category.create(name: "pasta")
                    Category.create(name: "burgers")
                    Category.create(name: "appetizer") }

    scenario "it has all categories in its dropdown menu" do
      visit items_path

      click_button "Onward!"

      within ".f-dropdown" do
        expect(page).to have_content("Pasta")
        expect(page).to have_content("Burgers")
        expect(page).to have_content("Appetizer")
      end
    end

    scenario "selecting a category will filter items index page" do
      pasta_cat = Category.find_by_name("Pasta")
      Item.create(title: "Angel Hair Pasta",
                  description: "Gooooood",
                  price: 8,
                  status: "active",
                  categories: [pasta_cat])

      burgers_cat = Category.find_by_name("Burgers")
      Item.create(title: "Cyclops Burger",
                  description: "Gooooood",
                  price: 8,
                  status: "active",
                  categories: [burgers_cat])

      visit items_path

      click_button "Onward!"
      click_link "Pasta"

      within ".items" do
        expect(page).to have_content("Angel Hair Pasta")
        expect(page).to_not have_content("Cyclops Burger")
      end
    end

    scenario "selecting a category updates the dropdown button display" do
      visit items_path

      click_button "Onward!"
      click_link "Pasta"

      expect(page).to_not have_content("Onward!")
      expect(page).to have_content("Pasta")
    end
  end

end
