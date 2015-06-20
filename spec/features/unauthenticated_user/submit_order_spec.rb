require "rails_helper"

feature "an unauthenticated user" do
  
  before(:each) do
    category = Category.create(name: "new cat")
    @unicorn = Item.create(title: "Unicorn Pie",
                           description: "Good",
                           price: 8,
                           status: "active",
                           categories: [category])
    User.create(full_name: "John Doe",
                user_name: "john",
                email: "john@john.com",
                password: "password")
  end

  scenario "can submit an order" do
    visit items_path
    first(:button, "Add To Cart").click
    within ".right" do
      first(:link).click
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Unicorn Pie")

    click_button "Checkout"

    expect(current_path).to eq(login_path)

    fill_in "Email", with: "john@john.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(cart_path)

    click_button "Checkout"

    expect(page).to have_content("Thank you for your order, John Doe!")
  end

  scenario "can see their order details on the order confirmation page" do
    visit items_path
    first(:button, "Add To Cart").click
    within ".right" do
      first(:link).click
    end
    click_button "Checkout"
    fill_in "Email", with: "john@john.com"
    fill_in "Password", with: "password"
    click_button "Login"
    click_button "Checkout"

    expect(page).to have_content("Your Order:")
    expect(page).to have_content("Customer Name: John Doe")
    expect(page).to have_link("Unicorn Pie")
    expect(page).to have_content("Order Total: $8")
    expect(page).to have_content("Order Status: ordered")
    expect(page).to have_content("Order Submitted:")
  end

  scenario "can click to a particular item's show page from his/her order confirmation page" do
    visit items_path
    first(:button, "Add To Cart").click
    within ".right" do
      first(:link).click
    end
    click_button "Checkout"
    fill_in "Email", with: "john@john.com"
    fill_in "Password", with: "password"
    click_button "Login"
    click_button "Checkout"
    click_link "Unicorn Pie"

    expect(current_path).to eq(item_path(@unicorn))
    expect(page).to have_content("Unicorn Pie")
  end
end
