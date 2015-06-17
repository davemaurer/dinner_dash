require "rails_helper"

feature "an unauthenticated user" do
  scenario "can view their cart" do
    visit items_path
    click_link "Cart"
    
    expect(page).to have_content("Shopping Cart")
  end
end
