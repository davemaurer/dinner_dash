require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:user) { User.create(full_name: "John Doe",
                           user_name: "john",
                           password: "password",
                           password_confirmation: "password",
                           email: "john@johndoe.com") }

  let(:category) { Category.create(name: "new cat") }

  let(:item) { Item.create(title: "Unicorn Pie",
                           description: "Good",
                           price: 8.00,
                           status: "active",
                           categories: [category]) }

  let(:valid_attributes) { { status: "ordered",
                             total_price: 16,
                             user_id: user.id,
                             items: [item] } }

  scenario "is valid" do
    order = Order.create(valid_attributes)

    expect(order).to be_valid
  end

  scenario "is invalid without a status" do
    order = Order.new(status: nil, total_price: 16, user_id: 1)

    expect(order).not_to be_valid
  end

  scenario "is invalid without a total_price" do
    order = Order.new(status: "ordered", user_id: 1)

    expect(order).not_to be_valid
  end

  scenario "is invalid without a user_id" do
    order = Order.new(status: "ordered", total_price: 16)

    expect(order).not_to be_valid
  end

  scenario "the status defaults to 'ordered'" do
    order = Order.new(total_price: 16, user_id: 1)

    expect(order.status).to eq("ordered")
  end

  scenario "the status must be either 'ordered', 'paid', 'cancelled', or 'completed'" do
    order = Order.new(status: "processed", total_price: 16, user_id: 1)

    expect(order).not_to be_valid
  end

  scenario "has many items" do
    order = Order.new(valid_attributes)

    expect(order).to respond_to(:items)
  end

  scenario "has at least one item" do
    valid_attributes[:items] = []
    order = Order.new(valid_attributes)
    expect(order).not_to be_valid

    order2 = Order.create(valid_attributes.merge(items: [item]))
    expect(order2).to be_valid
  end
end
