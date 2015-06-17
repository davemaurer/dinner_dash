require "rails_helper"

feature "an unauthenticated user" do
  scenario "sees a login page when clicking the login button" do
    visit items_path
    click_link "Login"

    expect(page).to have_content("password")
  end
end

