class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
  end

  def search
    @filter = params[:filters]
    @query = params[:query]
    if params[:filters] == nil
      @products = Product.where("product_name LIKE ?", "%" + params[:query] + "%").page(params[:page])
    elsif params[:filters] != "nil"
      @products = Product.where("product_name LIKE ?", "%" + params[:query] + "%").where("category_id =" + params[:filters]).page(params[:page])
      @category = Category.find(@filter)
    else
      @products = Product.where("product_name LIKE ?", "%" + params[:query] + "%").page(params[:page])
    end
  end
end
