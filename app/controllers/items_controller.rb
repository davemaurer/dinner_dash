class ItemsController < ApplicationController
  def index
    if params[:category_id].nil?
      @items = Item.active_alphabetized
      @dropdown = "Onward!"
    else
      category = Category.find(params[:category_id])
      @items = category.items
      @dropdown = category.name
    end

    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
