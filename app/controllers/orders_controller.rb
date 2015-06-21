class OrdersController < ApplicationController

  def create
    @items = []
    @cart.contents.each do |item_id, quantity|
      quantity.times do
        @items << (Item.find(item_id))
      end
    end
    @order = Order.new(total_price: total_price,
                       user_id: session[:user_id],
                       items: @items)
    @order.save!
    @cart.reset
    flash[:notice] = "Thank you for your order, #{@order.user.full_name}!"
    redirect_to @order
  end

  def show
    @order = Order.find(params[:id])
  end
  
  def index
    @orders = Order.by_user(current_user.id)
  end

  private

  def total_price
    @cart.item_quantities.inject(0) do |sum, (item, quantity)|
      sum + (item.price * quantity)
    end
  end

end
