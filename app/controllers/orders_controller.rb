class OrdersController < ApplicationController
  
  def create
    @order = Order.new(status: "pending", 
                       total_price: total_price,
                       user_id: session[:user_id])
    @cart.contents.each do |item_id, quantity|
      @order.order_items.build(:item_id => item_id, :quantity => quantity)
    end
    @order.save!
    @cart.reset
    flash[:notice] = "Thank you for your order, #{@order.user.full_name}!"
    redirect_to @order
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def total_price
    @cart.item_quantities.inject(0) do |sum, (item, quantity)|
      sum + (item.price * quantity)
    end
  end
  
end
