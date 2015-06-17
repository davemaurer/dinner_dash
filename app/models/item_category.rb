class ItemCategory < ActiveRecord::Base
  belongs_to :item
  belongs_to :category

  validates :item_id, :category_id, presence: true
end
