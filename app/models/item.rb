class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :status, presence: true

  has_many :item_categories
  has_many :categories, through: :item_categories
end
