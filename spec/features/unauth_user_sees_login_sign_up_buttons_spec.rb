require "rails_helper"

feature "an unauthenticated user" do
  context "will see a login button" do

    scenario "will see a login button on the items index page" do
      visit items_path
        expect(page).to have_content("Login")
    end
  end
end
