class ItemsController < ApplicationController
  def index
    if params[:category_id].nil?
      @items = Item.all
    else
      @items = Category.find(params[:category_id]).items
    end

    @categories = Category.all
  end
end
