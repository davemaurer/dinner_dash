require "rails_helper"

RSpec.feature "the authenticated user's past orders", type: :feature do

  before(:each) do
    category = Category.create(name: "dessert")

    unicorn  = Item.create(title: "Unicorn Pie",
                           description: "Good",
                           price: 8,
                           status: "active",
                           categories: [category])

    jaime    = User.create(full_name: "Jamie Lannister",
                           user_name: "LannisterGold",
                           email: "jamie@casterlyrock.com",
                           password: "password")

    order    = Order.create(status: "ordered",
                            total_price: "100",
                            user_id: jaime.id,
                            items: [unicorn])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(jaime)
  end

  scenario "authenticated user always has a 'Past Orders' button" do
    visit items_path

    within(".right") do
      expect(page).to have_content("Past Orders")
    end

    visit cart_path

    within(".right") do
      expect(page).to have_content("Past Orders")
    end
  end

  scenario "'Past Orders' button links to orders index for user" do
    visit items_path
    click_link "Past Orders"

    expect(current_path).to eq(orders_path)
    within(".orders") do
      expect(page).to have_content("Your Past Orders")
    end
  end

  xscenario "orders index shows all past orders for user" do
    visit orders_path

    within(".orders") do
      expect(page).to have_content(order.created_at.to_s)
    end
  end


#   as a non-admin authenticated user
#
# when i visit 'user_path'
#
# and i click the 'past orders' button
#
# i see a list of past orders as links to view each one ('/order/:id'

end
