require 'rails_helper'

RSpec.feature "the admin user dashboard" do
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

    within("table") do
      expect(page).to have_content "Admin Annie"
      expect(page).to have_content "admin"
      expect(page).to have_content("admin@admin.com")
      expect(page).to_not have_content("password")
      expect(page).to_not have_content("role")
    end
  end

  scenario "admin dashboard has edit button" do
    visit root_path

    within("table") do
      expect(page).to have_link("Edit")
    end
  end

end
