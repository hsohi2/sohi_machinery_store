class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page])
    add_breadcrumb("Categories")
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.page(params[:page])
    add_breadcrumb("Categories", categories_path)
    add_breadcrumb(@category.category_name)
  end
end
