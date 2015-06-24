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

  xscenario "sees admin home page after logging in" do
    admin = User.create(valid_attributes)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit items_path
    within ".left" do
      first(:link).click
    end
    save_and_open_page
    expect(current_path).to eq items_path
    within ".left" do
      first(:link).click
    end
    fill_in "email", with: "admin@admin.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq admin_path
    expect(page).to have_content("Welcome, Admin")
  end
end
