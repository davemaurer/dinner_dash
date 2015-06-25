class CartsController < ApplicationController

  def create
    # byebug
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    # flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to items_path
  end

  def show
  end

  def update
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have added 1 #{item.title} to your backpack"
    redirect_to cart_path
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have removed 1 #{item.title} from your backpack"
    redirect_to cart_path
  end
end
