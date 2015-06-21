require 'rails_helper'

RSpec.feature "the authenticated user" do
  let(:valid_attributes) {
    { full_name: "Stan The Man",
      user_name: "Theman",
      password: "password",
      role: 0,
      email: "stan@stan.com" }
  }

  scenario "stays on page when attempting to access the /admin route" do
    User.create(valid_attributes)

    visit items_path
    click_link "Login"
    fill_in "Email", with: "stan@stan.com"
    fill_in "Password", with: "password"
    click_button "Login"
    visit '/admin'

    expect(current_path).to eq items_path
  end
end
