require "rails_helper"

feature "an unauthenticated user" do

  before(:each) do
    pasta_cat     = Category.new(name: "pasta")
    burgers_cat   = Category.new(name: "burgers")
    dessert_cat   = Category.new(name: "dessert")

    Item.create(title: "Unicorn Pie", description: "Good", price: 8, status: "active", categories: [dessert_cat])
    Item.create(title: "Medusa Hair Pasta", description: "Good", price: 8, status: "active", categories: [pasta_cat])
    Item.create(title: "Titan Burger", description: "Good", price: 8, status: "active", categories: [burgers_cat])
  end

  scenario "will see links to each item's show page" do
    visit items_path

    expect(page).to have_link("Unicorn Pie")
    expect(page).to have_link("Medusa Hair Pasta")
    expect(page).to have_link("Titan Burger")
  end

  scenario "can click to each item's show page" do
    visit items_path
    click_link "Unicorn Pie"

    expect(page).to have_content("Unicorn Pie")
    expect(page).to have_content("$8")
    expect(page).to have_content("Good")
  end

  scenario "can click back to return to the items index page" do
    visit items_path
    click_link "Unicorn Pie"
    click_link "<< Back"

    expect(current_path).to eq(items_path)
    expect(page).to have_link("Unicorn Pie")
    expect(page).to have_link("Medusa Hair Pasta")
    expect(page).to have_link("Titan Burger")
  end
end
