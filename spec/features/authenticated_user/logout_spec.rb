require "rails_helper"

RSpec.feature "the authenticated user can logout", type: :feature do
  before(:each) do
    category = Category.create(name: "dessert")

    unicorn  = Item.create(title: "Unicorn Pie",
                           description: "Good",
                           price: 8,
                           status: "active",
                           categories: [category])

    jamie    = User.create(full_name: "Jamie Lannister",
                           user_name: "LannisterGold",
                           email: "jamie@casterlyrock.com",
                           password: "password",
                           password_confirmation: "password")

    order    = Order.create(status: "ordered",
                            total_price: "100",
                            user_id: jamie.id,
                            items: [unicorn])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(jamie)
  end

  scenario "once logged in, user has a 'Logout' button" do
    visit items_path

    within(".left") do
      expect(page).to have_link("Logout")
    end

    visit orders_path

    within(".left") do
      expect(page).to have_link("Logout")
    end

    item = Item.find_by(title: "Unicorn Pie")
    visit item_path(item)

    within(".left") do
      expect(page).to have_link("Logout")
    end
  end

  scenario "clicking on 'Logout' button redirects user to items index" do
    visit orders_path
    click_link "Logout"

    expect(current_path).to eq(items_path)
  end
end
