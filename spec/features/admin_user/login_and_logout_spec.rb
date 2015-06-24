require 'rails_helper'

RSpec.feature "the admin user" do
  let(:admin) { User.create(full_name: "Admin Annie",
                            user_name: "admin",
                            password: "password",
                            password_confirmation: "password",
                            role: 1,
                            email: "admin@admin.com") }
  before(:each) { admin }

  scenario "sees admin home page after logging in" do
    visit "/"

    within(".left") do
      first(:link).click
    end

    expect(current_path).to eq(login_path)

    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq admin_path(admin)
    expect(page).to have_content("Welcome, #{admin.user_name}")
  end

  scenario "admin logout redirects to items index" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_path

    click_link "Logout"

    expect(current_path).to eq(items_path)
  end
end
