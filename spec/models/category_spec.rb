require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is invalid without a name" do
    category = Category.new(name: nil)

    expect(category).to_not be_valid
  end

  it "is valid with a name" do
    category = Category.new(name: "Pasta")

    expect(category).to be_valid
  end

  it "formats names" do
    category = Category.create(name: "appeTizer")

    expect(category.name).to eq("Appetizer")
  end
end
