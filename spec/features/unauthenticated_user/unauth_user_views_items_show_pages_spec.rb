require "rails_helper"

feature "an authenticated user" do
  
  before(:each) do
    Item.create(title: "Unicorn Pie", description: "Good", price: 8, status: "active")
    Item.create(title: "Medusa Hair Pasta", description: "Good", price: 8, status: "active")
    Item.create(title: "Titan Burger", description: "Good", price: 8, status: "active")
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
