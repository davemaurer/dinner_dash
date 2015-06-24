require "rails_helper"

RSpec.feature "the admin can visit an order page" do

  let(:category)  {Category.create(name: "Category")}

  let(:admin)  {User.create(full_name: "Admin",
    email: "admin@admin.com",
    password: "password",
    password_confirmation: "password",
    role: 1)}
  let(:user)   {User.create(full_name: "User",
    email: "user@user.com",
    password: "password",
    password_confirmation: "password",
    role: 0)}

  let(:item1)   {Item.create(title: "Item 1",
    description: "I'm active!",
    price: 9.99,
    categories: [category])}
  let(:item2)   {Item.create(title: "Item 2",
    description: "I'm active!",
    price: 9.99,
    categories: [category])}

  let(:order1)  {Order.create(items: [item1],
    user_id: user.id,
    total_price: item1.price)}

  before(:each) do
    category
    admin
    user
    item1
    item2
    order1
  end

  before(:each) do
    DatabaseCleaner.strategy = :truncation
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  after(:all) do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  scenario "and click to view an order show page" do
    visit admin_order_path(order1)

    expect(page).to have_content("Order 1")
  end

  scenario "and sees the date and time the order was placed" do
    visit admin_order_path(order1)

    expect(page).to have_content("Ordered at:")
    expect(page).to have_content("M on")
  end

  scenario "and sees how long ago the order was placed" do
    visit admin_order_path(order1)

    expect(page).to have_content("ago)")
  end

  scenario "and sees the purchaser's full name" do
    visit admin_order_path(order1)

    expect(page).to have_content("User")
  end

  scenario "and sees the purchasers's email" do
    visit admin_order_path(order1)

    expect(page).to have_content("user@user.com")
  end

  scenario "and sees each item in the order, linked to their show page(s)" do
    visit admin_order_path(order1)

    expect(page).to have_content("Menu Items:")

    click_link("Item 1")

    expect(current_path).to eq(admin_item_path(item1))
  end

  scenario "and sees the quantity ordered for each item" do
    visit admin_order_path(order1)

    expect(page).to have_content(1)
  end

  scenario "and sees the price of each item" do
    visit admin_order_path(order1)

    expect(page).to have_content("$9.99")
  end

  scenario "and sees the line-item subtotal for each item" do
    visit admin_order_path(order1)

    expect(page).to have_content("Subtotal = $9.99")
  end

  scenario "and sees the status of the order" do
    visit admin_order_path(order1)

    expect(page).to have_content("ordered")
  end

  scenario "and sees the total cost of the order" do
    visit admin_order_path(order1)

    expect(page).to have_content("Order Total: $9.99")
  end

  scenario "can click a link to go back to the orders index" do
    visit admin_order_path(order1)

    expect(page).to have_link("<< Back to Orders Page")

    click_link "<< Back to Orders Page"

    expect(current_path).to eq(admin_orders_path)
  end
end
