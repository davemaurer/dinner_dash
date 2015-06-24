require 'rails_helper'

RSpec.feature "the admin user" do
  let(:admin) { User.create(full_name: "Admin Annie",
                            user_name: "admin",
                            password: "password",
                            role: 1,
                            email: "admin@admin.com") }

  before(:each) {
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  }

  scenario "sees admin home page after logging in" do
    visit admin_path

    expect(current_path).to eq admin_path
    expect(page).to have_content("Welcome, #{admin.user_name}")
  end

  scenario "sees admin home page after logging in" do
    visit items_path
    within ".left" do
      first(:link).click
    end
    
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

  xscenario "admin home lists personal account details" do
    visit admin_path

    within(".account_details") do
      expect(page).to have_content "Jon Snow"
      expect(page).to have_content "Ghost"
      expect(page).to have_content("jon@thewall.com")
      expect(page).to_not have_content("old_password")
      expect(page).to_not have_content("role")
      expect(page).to have_button("Edit")
    end
  end
end
