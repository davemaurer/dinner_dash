class Admin::ItemsController < Admin::BaseController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new_plus_categories(item_params)
    if @item.save
      flash[:message] = "Thanks for creating #{@item.title}!"
      redirect_to admin_items_path
    else
      flash[:notice] = "Please try again"
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :categories => [])
  end
end
