require 'rails_helper'

RSpec.feature "the unauthenticated user" do
  scenario "stays on page when attempting to access any /admin route" do
    visit items_path
    visit '/admin'

    expect(current_path).to eq items_path
  end

  scenario "does not see admin links when viewing items page" do
    visit items_path

    expect(page).not_to have_link("Menu")
    expect(page).not_to have_link("Orders")
    expect(page).not_to have_link("Categories")
  end

  scenario "does not see admin links when viewing cart page" do
    visit items_path

    expect(page).not_to have_link("Menu")
    expect(page).not_to have_link("Orders")
    expect(page).not_to have_link("Categories")
  end

  scenario "does not see admin buttons when viewing items page" do
    visit items_path

    expect(page).not_to have_button("Edit")
  end
end
