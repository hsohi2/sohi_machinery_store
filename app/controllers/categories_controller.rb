class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page])
  end

  def show
    def show
      @category = Category.find(params[:id])
      @products = @category.products.page(params[:page])
    end
  end
end
