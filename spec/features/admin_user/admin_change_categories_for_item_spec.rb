require "rails_helper"

RSpec.feature "admin can update categories for an item", type: :feature do
  before(:each) do
    dessert_cat = Category.create(name: "dessert")
    curry_cat   = Category.create(name: "curry")
    seafood_cat = Category.create(name: "seafood")
    drinks_cat  = Category.create(name: "drinks")

    unicorn     = Item.create(title: "Unicorn Pie",
                              description: "Good",
                              price: 8,
                              status: "active",
                              categories: [dessert_cat, seafood_cat])

    elaria      = User.create(full_name: "Elaria Sand",
                              user_name: "HouseMartell",
                              email: "elaria@dorne.com",
                              password: "password",
                              role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(elaria)
  end

  let(:item) { Item.first }

  scenario "the item show page for admins shows the item's categories" do
    visit admin_item_path(item.id)

    within(".categories") do
      expect(page).to have_content("Dessert")
      expect(page).to have_content("Seafood")
    end
  end

  scenario "the item show page has a link to edit the item" do
    visit admin_item_path(item.id)

    within("#nav_links") do
      expect(page).to have_link("Edit")
    end
  end

  scenario "the edit link redirects to the edit page" do
    visit admin_item_path(item)
    click_link("Edit")

    expect(current_path).to eq(edit_admin_item_path(item))
  end

  context "adding and removing categories for an item" do
      let(:dessert) { Category.find_by(name: "Dessert") }
      let(:seafood) { Category.find_by(name: "Seafood") }
      let(:curry)   { Category.find_by(name: "Curry") }
      let(:drinks)  { Category.find_by(name: "Drinks") }

    scenario "admin can remove a category from an item" do
      visit edit_admin_item_path(item)

      find(:xpath, "//input[@value='#{dessert.id}']").set(false)
      click_button "Finished"

      within(".categories") do
        expect(page).to_not have_content(dessert.name)
        expect(page).to have_content(seafood.name)
      end
    end

    scenario "admin can add a category from an item" do
      visit edit_admin_item_path(item)

      find(:xpath, "//input[@value='#{curry.id}']").set(true)
      click_button "Finished"

      within(".categories") do
        expect(page).to have_content(curry.name)
        expect(page).to have_content(dessert.name)
        expect(page).to have_content(seafood.name)
        expect(page).to_not have_content(drinks.name)
      end
    end
  end
end
