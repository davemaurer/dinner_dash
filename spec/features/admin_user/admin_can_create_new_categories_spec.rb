require "rails_helper"

RSpec.feature "the admin can create new categories", type: :feature do
  before(:each) do
    category = Category.create(name: "dessert")

    unicorn  = Item.create(title: "Unicorn Pie",
                           description: "Good",
                           price: 8,
                           status: "active",
                           categories: [category])

    arya    = User.create(full_name: "Arya of House Stark",
                           user_name: "Nymeria",
                           email: "arya@winterfell.com",
                           password: "password",
                           role: 1)

    order    = Order.create(status: "ordered",
                            total_price: "100",
                            user_id: arya.id,
                            items: [unicorn])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(arya)
  end

  scenario "admin has button to view all categories" do
    visit admin_path

    expect(page).to have_button("Categories")
  end

  scenario "admin can navigate to view all categories" do
    visit admin_path
    click_button "Categories"

    expect(current_path).to eq(admin_categories_path)
  end

  scenario "admin can see all categories page" do
    visit admin_categories_path

    within("h1") do
      expect(page).to have_content("All Categories")
    end
  end

  scenario "categories index lists all categories" do
    visit admin_categories_path

    within(".categories") do
      Category.all.each do |category|
        expect(page).to have_content(category.name)
      end
    end
  end

  scenario "admin can create a new category" do
    visit admin_categories_path
    binding.pry

    fill_in("Name", with: "tea cakes")
    click_button("Create Category")

    expect(current_path).to eq(admin_categories_path)
    within(".categories") do
      expect(page).to have_content("Tea cakes")
    end
  end

end
