class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true

  has_attached_file :image, :default_url => "/Fat_unicorn.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validate :has_category

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories


  def has_category
    if categories.to_a.count < 1
      errors.add(:categories, "item must have at least one category")
    end
  end
end
