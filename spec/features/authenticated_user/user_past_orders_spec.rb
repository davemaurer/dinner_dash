require "rails_helper"

RSpec.feature "the authenticated user's past orders", type: :feature do
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
                           password: "password")

    order    = Order.create(status: "ordered",
                            total_price: 8,
                            user_id: jamie.id,
                            items: [unicorn])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(jamie)
  end

  scenario "authenticated user always has a 'Past Orders' button" do
    visit items_path

    within(".top-bar-section") do
      expect(page).to have_content("Past Orders")
    end

    visit cart_path

    within(".top-bar-section") do
      expect(page).to have_content("Past Orders")
    end
  end

  scenario "'Past Orders' button links to orders index for user" do
    visit items_path
    click_link "Past Orders"

    expect(current_path).to eq(orders_path)

    within first(".orders") do
      expect(page).to have_content("Past Orders")
    end
  end

  scenario "orders index shows all past orders for user" do
    visit orders_path

    within("table") do
      expect(page).to have_content(Order.first.created_at.to_s)
    end
  end

  scenario "each order has a link to the order show page" do
    order = Order.first

    visit orders_path
    click_link order.created_at.to_s
    expect(current_path).to eq(order_path(order.id))
  end
end
