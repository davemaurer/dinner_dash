require "rails_helper"

RSpec.feature "admin can edit personal details", type: :feature do
  let(:jon) { User.create(full_name: "Jon Snow",
                          user_name: "Ghost",
                          email: "jon@thewall.com",
                          password: "old_password",
                          role: 1) }

  before(:each) do
    jon
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(jon)
  end

  scenario "admin edit page displays admin's details" do
    visit edit_admin_path(jon)

    within("h1") do
      expect(page).to have_content("Edit Details")
    end
  end

  scenario "admin edit page displays admin details" do
    visit edit_admin_path(jon)
    within(".edit_form") do
      expect(page).to have_selector("input[value='Jon Snow']")
      expect(page).to have_selector("input[value='Ghost']")
      expect(page).to have_selector("input[value='jon@thewall.com']")
      expect(page).to_not have_selector("input[value='old_password']")
    end
  end

  scenario "admin can successfully edit personal details" do
    visit edit_admin_path(jon)

    fill_in("user_full_name", with: "Jon Stark")
    fill_in("user_user_name", with: "Lord Commander")
    fill_in("user_email", with: "jon@nightswatch.com")
    fill_in("user_password", with: "new_password")
    fill_in("user_password_confirmation", with: "new_password")

    click_button "Edit"

    expect(User.count).to eq(1)

    updated_jon = User.first
    expect(updated_jon.full_name).to eq("Jon Stark")
    expect(updated_jon.user_name).to eq("Lord Commander")
    expect(updated_jon.email).to eq("jon@nightswatch.com")
  end

  scenario "successfully editing admin details redirects admin to dashboard" do
    visit edit_admin_path(jon)

    fill_in("user_full_name", with: "Jon Stark")
    fill_in("user_user_name", with: "Lord Commander")
    fill_in("user_email", with: "jon@nightswatch.com")
    fill_in("user_password", with: "new_password")
    fill_in("user_password_confirmation", with: "new_password")

    click_button "Edit"

    expect(current_path).to eq("/admin")
  end

  xscenario "once the admin signs in, they can see their account details with an edit link" do
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
