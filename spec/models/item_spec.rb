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

  context "setting item attributes" do
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

    it "has a title that is not an empty string" do
      item = Item.new(title: "",
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

    it "has a description that is not an empty string" do
      item = Item.new(title: "title!",
                      description: "",
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

    it "has a price that is a decimal numeric value" do
      item = Item.new(title: "food",
                      description: "good",
                      price: 9.50,
                      status: "active")

      expect(item.price).to eq(9.50)
    end

    it "has a price that is greater than zero" do
      item = Item.new(title: "food",
                      description: "good",
                      price: 0.00,
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

  context "item relationships" do
    it "has many categories" do
      item = Item.create(valid_attributes)

      expect(item).to respond_to(:categories)
    end

    it "destroys item-category records for itself if it is destroyed" do
      item = Item.create(valid_attributes)
      category = item.categories.create(name: "stuff for eating")
      item.destroy

      item_category = ItemCategory.find_by_item_id(item.id)

      expect(item_category).to be_nil

      cat_from_db = Category.find(category.id)
      expect(cat_from_db.name).to eq(category.name)
    end

    xit "has at least one category" do
      item = Item.new(valid_attributes)

      expect(item).to_not be_valid

      category = Category.create(name: "new cat")
      item2 = category.items.create(valid_attributes)

      expect(item2).to be_valid
      # expect(item.categories.count).to be >= 1
    end
  end
end
