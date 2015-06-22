require "rails_helper"

RSpec.feature "admin can update categories for an item", type: :feature do
  let(:dessert) { Category.create(name: "Dessert") }
  let(:seafood) { Category.create(name: "Seafood") }
  let(:curry)   { Category.create(name: "Curry") }
  let(:drinks)  { Category.create(name: "Drinks") }

  let(:unicorn) { Item.create(title: "Unicorn Pie",
                              description: "Good",
                              price: 8,
                              status: "active",
                              categories: [dessert, seafood]) }

  let(:elaria) { User.create(full_name: "Elaria Sand",
                             user_name: "HouseMartell",
                             email: "elaria@dorne.com",
                             password: "password",
                             role: 1) }

  before(:each) do
    dessert
    seafood
    curry
    drinks
    unicorn
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(elaria)
  end

  scenario "the item show page for admins shows the item's categories" do
    visit admin_item_path(unicorn)

    within(".categories") do
      expect(page).to have_content("Dessert")
      expect(page).to have_content("Seafood")
    end
  end

  scenario "the item show page has a link to edit the item" do
    visit admin_item_path(unicorn)

    within("#nav_links") do
      expect(page).to have_link("Edit")
    end
  end

  scenario "the edit link redirects to the edit page" do
    visit admin_item_path(unicorn)
    click_link("Edit")

    expect(current_path).to eq(edit_admin_item_path(unicorn))
  end

  context "adding and removing categories for an item" do
    scenario "admin can remove a category from an item" do
      visit edit_admin_item_path(unicorn)

      find(:xpath, "//input[@value='#{dessert.id}']").set(false)
      click_button "Finished"

      within(".categories") do
        expect(page).to_not have_content(dessert.name)
        expect(page).to have_content(seafood.name)
      end
    end

    scenario "admin can add a category from an item" do
      visit edit_admin_item_path(unicorn)

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
