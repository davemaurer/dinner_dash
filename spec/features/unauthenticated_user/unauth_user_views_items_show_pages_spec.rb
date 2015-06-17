require "rails_helper"

feature "an authenticated user" do
  
  let(:unicorn) { Item.create(title: "Unicorn Pie", description: "Good", price: 8) }
  let(:medusa) { Item.create(title: "Medusa Hair Pasta", description: "Good", price: 8) }
  let(:titan) { Item.create(title: "Titan Burger", description: "Good", price: 8) }
  
  context "will see item show pages" do
    scenario "user will see links each item's show page" do
      visit items_path
      
      within ".large-3" do
        expect(page).to have_link("Unicorn Pie")
        expect(page).to have_link("Medusa Hair Pasta")
        expect(page).to have_link("Titan Burger")
      end
    end
  end
end
