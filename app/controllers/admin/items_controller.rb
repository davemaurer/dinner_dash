class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: [:show, :edit, :update]

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
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "Please try again"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update_plus_categories(item_params)
      redirect_to admin_item_path(@item)
      flash[:notice] = "You have successfully updated #{@item.title}"
    else
      flash.now[:errors] = @item.errors.full_messages.join(", ")
      redirect_to admin_item_path(@item)
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :status, :categories => [])
  end
end
