require "rails_helper"

RSpec.feature "the unauthenticated user", type: :feature do

  before(:each) do
    category = Category.create(name: "new cat")
    Item.create(title: "Unicorn Pie", description: "Good", price: 8, status: "active", categories: [category])
  end

  scenario "is prompted to login if he/she hasn't done so at checkout" do
    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Unicorn Pie")

    click_button "Checkout"

    expect(current_path).to eq(login_path)
  end

  scenario "when I login from the checkout path and click 'login' I return to the cart page" do
    User.create(full_name: "John Doe",
                user_name: "john",
                email: "john@john.com",
                password: "password",
                password_confirmation: "password")

    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Unicorn Pie")

    click_button "Checkout"

    expect(current_path).to eq(login_path)
    fill_in "Email", with: "john@john.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(cart_path)
    expect(page).to have_button("Checkout")
  end

  scenario "when I login from the checkout path and click 'login' my cart still contains all its items" do
    User.create(full_name: "John Doe",
      user_name: "john",
      email: "john@john.com",
      password: "password",
      password_confirmation: "password")

    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Unicorn Pie")

    click_button "Checkout"

    expect(current_path).to eq(login_path)
    fill_in "Email", with: "john@john.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Unicorn Pie")
  end
end
