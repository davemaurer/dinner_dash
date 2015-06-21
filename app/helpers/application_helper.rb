module ApplicationHelper

  
  def categories
    Category.all
  end
  
  def category_list
    categories.map{ |category| [category.name, category.id] }
  end
end
