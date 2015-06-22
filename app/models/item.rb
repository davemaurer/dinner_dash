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

  has_many :order_items
  has_many :orders, through: :order_items

  def has_category
    if categories.to_a.count < 1
      errors.add(:categories, "item must have at least one category")
    end
  end

  def quantity
    order_items.where(item_id: self.id).count
  end

  def self.new_plus_categories(params)
    if params[:categories]
      params[:categories].delete("0")
      params[:categories] = params[:categories].map do |category_id|
        Category.find(category_id.to_i)
      end
    end
    item = self.new(params)
  end

  def update_plus_categories(params)
    if params[:categories]
      params[:categories].delete("0")
      params[:categories] = params[:categories].map do |category_id|
        Category.find(category_id.to_i)
      end
    end
    self.update(params)
  end
end
