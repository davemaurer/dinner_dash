class Category < ActiveRecord::Base
  before_save :capitalize_name

  validates :name, presence: true

  has_many :item_categories, dependent: :destroy
  has_many :items, through: :item_categories

  def capitalize_name
    self.name = self.name.split(" ").map(&:capitalize).join(" ")
  end

  def self.selector_helper
    all.map{ |category| [category.name, category.id] }
  end
end
