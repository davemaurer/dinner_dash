require 'rails_helper'

RSpec.feature "the authenticated user" do
  let(:valid_attributes) {
    { full_name: "Stan The Man",
      user_name: "Theman",
      password: "password",
      role: 0,
      email: "stan@stan.com" }
  }

  scenario "stays on page when attempting to access root /admin route" do
    User.create(valid_attributes)

    visit items_path
    click_link "Login"
    fill_in "Email", with: "stan@stan.com"
    fill_in "Password", with: "password"
    click_button "Login"
    visit '/admin'

    expect(current_path).to eq items_path
  end

  scenario "receives an error when attempting to access /admin/items route" do
    User.create(valid_attributes)

    visit items_path
    click_link "Login"
    fill_in "Email", with: "stan@stan.com"
    fill_in "Password", with: "password"
    click_button "Login"
    visit '/admin/items'

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "receives an error when attempting to access /admin/categories route" do
    User.create(valid_attributes)

    visit items_path
    click_link "Login"
    fill_in "Email", with: "stan@stan.com"
    fill_in "Password", with: "password"
    click_button "Login"
    visit '/admin/categories'

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "sees a logout link in the navbar after logging in" do
    User.create(valid_attributes)

    visit items_path
    click_link "Login"
    fill_in "Email", with: "stan@stan.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_link("Logout")
  end

  scenario "cannot view another user's details" do
    User.create(valid_attributes)

    visit items_path
    click_link "Login"
    fill_in "Email", with: "stan@stan.com"
    fill_in "Password", with: "password"
    click_button "Login"
    visit '/orders/5'

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
