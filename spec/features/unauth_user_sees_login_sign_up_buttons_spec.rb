require "rails_helper"

feature "an unauthenticated user" do
  context "will see login and sign up buttons" do

    scenario "will see a login button on the items index page" do
      visit items_path

      expect(page).to have_content("Login")
    end

    scenario "will see a signup button on the items index page" do
      visit items_path

      expect(page).to have_content("Sign Up")
    end

    scenario "will see a login button on the cart show page" do
      visit cart_path

      expect(page).to have_content("Login")
    end

    scenario "will see a signup button on the items index page" do
      visit cart_path

      expect(page).to have_content("Sign Up")
    end
  end
end
