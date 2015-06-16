<<<<<<< HEAD
require 'rails_helper'

RSpec.feature "the unauthenticated user view", type: :feature do
=======
require "rails_helper"

feature "an unauthenticated user" do
>>>>>>> e66bc4eadb22921e1ee559f918a7975517b095d0
  scenario "will see an items index page" do
    visit items_path
    within "h1" do
      expect(page).to have_content("Menu")
    end
  end

  scenario "the index page has all items listed" do
    Item.create(title: "Unicorn Roll",
                description: "Gooooood", 
                price: 8, 
                status: "active")
    
    visit items_path
    
    within "table" do
      expect(page).to have_content("Unicorn Roll")
    end
  end

  scenario "the index page displays items in rows of four" do
    Item.create(title: "Unicorn Roll", 
                description: "Gooooood", 
                price: 8, 
                status: "active")
    Item.create(title: "Medusa Hair Pasta", 
                description: "Gooooood", 
                price: 8, 
                status: "active")
    Item.create(title: "Pixie Bread Stix", 
                description: "Gooooood", 
                price: 8, 
                status: "active")
    Item.create(title: "Phoenix Spicy Curry", 
                description: "Gooooood", 
                price: 8, 
                status: "active")
    Item.create(title: "Titan Burger", 
                description: "Gooooood", 
                price: 8, 
                status: "active")

    visit items_path
    
    within "table" do
      Item.all.each do |item|
        expect(page).to have_content(item.title)
      end
    end

  end
end
