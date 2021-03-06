require "rails_helper"

feature "an unauthenticated user" do
  before(:each) do
    category = Category.create(name: "sushi")
    @item = Item.create(title: "Unicorn Roll",
                        description: "Good",
                        price: 8,
                        status: "active",
                        categories: [category])
  end

  scenario "can view their cart" do
    visit items_path
    within ".right" do
      find(:link).click
    end

    expect(page).to have_content("Thy Cart")
  end

  scenario "can add an item to their cart" do
    visit items_path
    first(:link, "Add To Cart").click

    expect(current_path).to eq(items_path)
    expect(page).to have_content("(1)")
  end

  scenario "can view the item on their cart page" do
    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Unicorn Roll")
  end

  scenario "can add more than one item to their cart" do
    visit items_path
    first(:link, "Add To Cart").click
    first(:link, "Add To Cart").click

    expect(current_path).to eq(items_path)
    expect(page).to have_content("(2)")
  end

  scenario "the line-1item price of the item will change based on the quantity" do
    visit items_path
    first(:link, "Add To Cart").click
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
      end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("$16.00")
  end

  scenario "can see a delete button next to each item in his/her cart" do
    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Unicorn Roll")
    expect(page).to have_button("-1")
  end

  scenario "can delete an item from his/her cart" do
    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Unicorn Roll")
    expect(page).to have_button("-1")

    click_button("-1")

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("You have removed 1 Unicorn Roll from your backpack")
    expect(page).not_to have_content("$8.00")
    expect(page).not_to have_button("-1")
  end

  scenario "has the option to change the quantity of each item in his/her cart" do
    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
    end

    expect(page).to have_button("-1")
    expect(page).to have_button("+1")
  end

  scenario "can increase the quantity of an item in his/her cart" do
    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      first(:link).click
    end
    click_button "+1"

    expect(page).to have_content("Unicorn Roll")
  end

  scenario "can decrease the quantity of an item in his/her cart" do
    visit items_path
    first(:link, "Add To Cart").click
    within ".right" do
      find(:link).click
    end
    click_button "-1"

    expect(page).to_not have_content("Unicorn Roll ($8.00) x 1")
  end
end
