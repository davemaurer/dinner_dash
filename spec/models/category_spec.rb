require 'rails_helper'

RSpec.describe Category, type: :model do
  context "setting category attributes" do
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

  context "category relationships" do
    it "has many items" do
      category = Category.create(name: "Pasta")

      expect(category).to respond_to(:items)
    end

    it "destroys item-category records for itself if it is destroyed" do
      category = Category.create(name: "pasta")
      item = Item.create(title: "Angel Hair",
                          description: "Blond",
                          price: 8,
                          status: "active",
                          categories: [category])
      category.destroy

      item_category = ItemCategory.find_by_item_id(item.id)

      expect(item_category).to be_nil

      item_from_db = Item.find(item.id)
      expect(item_from_db.title).to eq(item.title)
    end
  end

end
