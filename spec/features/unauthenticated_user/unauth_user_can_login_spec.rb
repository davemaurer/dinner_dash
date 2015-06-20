require "rails_helper"

RSpec.feature "the unauthenticated user", type: :feature do
  let(:valid_attributes) {
    { full_name: "Stan The Man",
      user_name: "Theman",
      password: "password",
      role: 0,
      email: "stan@stan.com" }
  }

  scenario "can login" do
    User.create(valid_attributes)

    visit items_path
    click_link "Login"
    fill_in "Email", with: "stan@stan.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Welcome, Stan The Man")
    reset_session!
  end

  scenario "does not see login link after logging in" do
    User.create(valid_attributes)

    visit items_path
    click_link "Login"
    fill_in "Email", with: "stan@stan.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).not_to have_link("Login")
    expect(page).to have_link("Logout")
    reset_session!
  end
end
