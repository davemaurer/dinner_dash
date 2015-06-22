require "rails_helper"

RSpec.feature "admin can update an item", type: :feature do
  before(:each) do
    dessert_cat = Category.create(name: "dessert")
    entree_cat = Category.new(name: "entrees")
    seafood_cat = Category.new(name: "seafood")
    drinks_cat = Category.new(name: "drinks")
    exotic_cat = Category.new(name: "exotic")

    unicorn = Item.create(title: "Unicorn Pie",
      description: "Just like mom used to make!",
      price: 8,
      status: "active",
      categories: [exotic_cat, entree_cat])

    thomas = User.create(full_name: "Thomas Covenant",
      user_name: "unbeliever",
      email: "thomas@thomas.com",
      password: "password",
      role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(thomas)
  end

  let(:item) { Item.first }

  scenario "an item has an edit button" do
    visit admin_items_path

    expect(page).to have_button("Edit Item")
  end
end


