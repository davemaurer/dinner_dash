require "rails_helper"

RSpec.feature "the admin can create new items", type: :feature do

    let(:dessert) { Category.create(name: "dessert") }

    let(:arya) { User.create(full_name: "Arya of House Stark",
                             user_name: "Nymeria",
                             email: "arya@winterfell.com",
                             password: "password",
                             role: 1) }

  before(:each) do
    dessert
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(arya)
  end

  scenario "admin can create a new item" do
    visit new_admin_item_path

    fill_in(:item_title, with: "babaganoush")
    fill_in("item_description", with: "eggplant mush with smokey hints")
    fill_in(:item_price, with: 9.95)
    find(:xpath, "//input[@value='#{dessert.id}']").set(true)

    click_button "Finished"

    expect(Item.first.title).to eq("babaganoush")
  end

  scenario "creating a new item from view redirects admin to item show" do
    visit new_admin_item_path

    fill_in(:item_title, with: "babaganoush")
    fill_in("item_description", with: "eggplant mush with smokey hints")
    fill_in(:item_price, with: 9.95)
    find(:xpath, "//input[@value='#{dessert.id}']").set(true)

    click_button "Finished"

    expect(current_path).to eq(admin_item_path(Item.first))
    within(".row") do
      expect(page).to have_content("babaganoush")
      expect(page).to have_content("eggplant mush with smokey hints")
    end
  end
end
