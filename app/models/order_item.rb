class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  
  def self.find_by_order_id(order_id)
    find_by(order_id)
  end
end
