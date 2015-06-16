require 'rails_helper'

RSpec.feature "categories filter on the items index page", type: :feature do

  scenario "there is a categories dropdown menu" do
    within "categories" do
      expect(page).to have_content("Categories:")
    end
  end
end


# as an unauthenticated user
#
# when i visit '/items'
#
# i see a filter option
#
# and i expect to be able to filter by category
