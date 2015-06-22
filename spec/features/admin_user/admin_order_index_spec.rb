require "rails_helper"

RSpec.feature "the admin can visit the orders page" do

  let(:category)  {Category.create(name: "Category")}

  let(:admin)  {User.create(full_name: "Admin",
    email: "admin@admin.com",
    password: "password",
    role: 1)}
  let(:user)   {User.create(full_name: "User",
    email: "user@user.com",
    password: "password",
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
  let(:order2)  {Order.create(items: [item2],
                              user_id: user.id,
                              total_price: item2.price,
                              status: "paid")}
  let(:order3)  {Order.create(items: [item1, item2],
                              user_id: user.id,
                              total_price: item1.price + item2.price,
                              status: "cancelled")}
  let(:order4)  {Order.create(items: [item1, item2],
                              user_id: user.id,
                              total_price: item1.price + item2.price,
                              status: "completed")}

  before(:each) do
    category
    admin
    user
    item1
    item2
  end
  
  before(:each) do
    DatabaseCleaner.strategy = :truncation
  end
  
  after(:all) do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  scenario "and see all orders" do
    order1
    order2
    order3
    order4
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_orders_path

    expect(page).to have_content "All Orders"
    expect(page).to have_content "Order: 10"
    expect(page).to have_content "Order: 11"
    expect(page).to have_content "Order: 12"
    expect(page).to have_content "Order: 13"
  end

  scenario "and see order counts by status" do
    order1
    order2
    order3
    order4
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_orders_path

    expect(page).to have_content("Status \"Ordered\": 1")
    expect(page).to have_content("Status \"Paid\": 1")
    expect(page).to have_content("Status \"Cancelled\": 1")
    expect(page).to have_content("Status \"Completed\": 1")
  end

  scenario "and click links to each order" do
    order1
    order2
    order3
    order4
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_orders_path
    click_link "Order: 18"
    
    expect(current_path).to eq(admin_order_path(order1))
    expect(page).to have_content("Order 18")
  end

  scenario "and udpate the status of an 'ordered' order to 'paid'" do
    order1
    order3
    order4
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_orders_path
    select "paid", :from => "order[status]"
    first(:button, "Update").click

    expect(current_path).to eq(admin_orders_path)
    expect(page).to have_content("You have successfully updated order number 22's status")
    expect(page).to have_content("Order: 22: paid")
  end

  scenario "and udpate the status of an 'ordered' order to 'cancelled'" do
    order1
    order3
    order4

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_orders_path
    select "cancelled", :from => "order[status]"
    first(:button, "Update").click

    expect(current_path).to eq(admin_orders_path)
    expect(page).to have_content("You have successfully updated order number 25's status")
    expect(page).to have_content("Order: 25: cancelled")
  end

  scenario "and udpate the status of a 'paid' order to 'completed'" do
    order2
    order3
    order4

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_orders_path
    select "completed", :from => "order[status]"
    first(:button, "Update").click

    expect(current_path).to eq(admin_orders_path)
    expect(page).to have_content("You have successfully updated order number 28's status")
    expect(page).to have_content("Order: 28: completed")
  end

  scenario "and udpate the status of a 'paid' order to 'cancelled'" do
    order2
    order3
    order4

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_orders_path
    select "cancelled", :from => "order[status]"
    first(:button, "Update").click

    expect(current_path).to eq(admin_orders_path)
    expect(page).to have_content("You have successfully updated order number 31's status")
    expect(page).to have_content("Order: 31: cancelled")
  end
end
