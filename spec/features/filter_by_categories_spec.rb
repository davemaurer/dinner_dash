require "rails_helper"

RSpec.feature "the unauthenticated user view", type: :feature do
  scenario "it has a categories filter" do
    visit items_path

    within ".filter" do
      expect(page).to have_content("Choose your food quest:")
    end
  end

end
