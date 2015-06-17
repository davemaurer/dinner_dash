class CartsController < ApplicationController
  
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    # flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to items_path
  end
  
  def show
  end
  
  def destroy
    item = Item.find(params[:item_id])
    item.destroy
    flash.notice = "You have removed #{item.title} from your backpack."
  end
end
