require 'rails_helper'

RSpec.feature "the admin user" do
  let(:valid_attributes) {
    {full_name: "Admin Annie",
      user_name: "admin",
      password: "password",
      role: 1,
      email: "admin@admin.com"}
  }

  scenario "sees admin home page after logging in" do
    admin = User.create(valid_attributes)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_path

    expect(current_path).to eq admin_path
    expect(page).to have_content("Welcome, Admin")
  end

  scenario "sees admin home page after logging in" do
    admin = User.create(valid_attributes)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    click_link "Logout"
    visit items_path
    click_link "Login"
    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq admin_path
    expect(page).to have_content("Welcome, Admin")
  end
end
