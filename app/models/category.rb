class Category < ActiveRecord::Base
  before_save :capitalize_name

  validates :name, presence: true

  has_many :item_categories
  has_many :items, through: :item_categories

  def capitalize_name
    self.name.capitalize!
  end
end
