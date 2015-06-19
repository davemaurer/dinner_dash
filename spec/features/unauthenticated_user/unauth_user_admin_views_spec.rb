require 'rails_helper'

RSpec.feature "the unauthenticated user" do
  scenario "stays on page when attempting to access any /admin route" do
    visit items_path
    visit '/admin'

    expect(current_path).to eq items_path
  end
end
