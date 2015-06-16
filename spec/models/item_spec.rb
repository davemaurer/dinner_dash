require "rails_helper"

RSpec.describe Item, type: :model do

  let(:valid_attributes) {
    { title: "food",
      description: "good",
      price: 5,
      status: "active"}
    }

  let(:invalid_attributes) {
    { title: nil,
      description: nil,
      price: nil,
      status: nil}
    }

  it "is valid" do
    item = Item.new(valid_attributes)

    expect(item).to be_valid
  end

  it "is invalid without a title" do
    item = Item.new(title: nil, 
                    description: "good", 
                    price: 5, 
                    status: "active")

    expect(item).to_not be_valid
  end

  it "is invalid without a description" do
    item = Item.new(title: "food", 
                    description: nil, 
                    price: 5, 
                    status: "active")

    expect(item).to_not be_valid
  end

  it "is invalid without a price" do
    item = Item.new(title: "food", 
                    description: "good", 
                    price: nil, 
                    status: "active")

    expect(item).to_not be_valid
  end

  it "is invalid without a status" do
    item = Item.new(title: "food", 
                    description: "good", 
                    price: 5, 
                    status: nil)

    expect(item).to_not be_valid
  end

  it "is invalid without a unique title" do
    Item.create(valid_attributes)
    item2 = Item.create(valid_attributes)

    expect(item2).to_not be_valid
    expect(Item.count).to eq(1)
  end
end
