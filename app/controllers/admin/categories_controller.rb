class Admin::CategoriesController < Admin::BaseController
  before_action :set_categories

  def index
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "You just created #{@category.name}"
      redirect_to admin_categories_path
    else
      render :index
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
