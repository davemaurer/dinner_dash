require "rails_helper"

RSpec.feature "the unauthenticated user view", type: :feature do
  scenario "it has a filter by category drop down" do
    visit items_path

    within "filter" do
      expect(page)
    end
  end


end
