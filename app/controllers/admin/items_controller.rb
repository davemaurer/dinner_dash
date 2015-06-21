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
      redirect_to admin_path
    else
      flash[:notice] = "Please try again"
      render :new
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_plus_categories(item_params)
      redirect_to admin_items_path
      flash[:notice] = "You have successfully updated #{@item.title}"
    else
      flash.now[:errors] = @item.errors.full_messages.join(", ")
      redirect_to admin_items_path
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :status, :categories => [])
  end
end
