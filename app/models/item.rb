class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :status, presence: true

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories

  has_many :order_items
  has_many :orders, through: :order_items
end
