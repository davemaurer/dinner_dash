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

  scenario "admin home page displays admin details" do
    visit root_path
    expect(page).to have_content("Welcome, #{admin.user_name}")

    within(".account_details") do
      expect(page).to have_content "Jon Snow"
      expect(page).to have_content "Ghost"
      expect(page).to have_content("jon@thewall.com")
      expect(page).to_not have_content("old_password")
      expect(page).to_not have_content("role")
      # expect(page).to have_button("Edit")
    end
  end
end
