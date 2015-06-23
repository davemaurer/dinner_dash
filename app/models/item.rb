class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true

  has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200',
      medium: '300x300>'
    },
    :storage => :s3,
    :bucket  => ENV['MY_BUCKET_NAME']
  

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  #                           :default_url => "/Fat_unicorn.jpg"
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

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

  def price_to_s
    unless valid_price_format?
      self.price.to_s + "0"
    else
      self.price
    end
  end

  def valid_price_format?
    self.price.to_s.split(".").last.length == 2
  end
end
