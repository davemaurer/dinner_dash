class Item < ActiveRecord::Base
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: [ greater_than: 0]
  validates :status, presence: true
  # validates :categories, presence: true
  # validate :has_category

  # def has_category
  #   if item_categories.count < 1
  #     errors.add(:categories, "item must have at least one category")
  #   end
  # end
end
