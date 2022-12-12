class ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page])
    add_breadcrumb('Products')
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
    add_breadcrumb('Products', products_path)
    add_breadcrumb(@product.product_name)
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
    add_breadcrumb('Search Results')
  end

  def buy
    @address = Address.where(:user_id == current_user.id)
    province_id = @address.first.province_id
    @province = Province.find(province_id)
    order_total = 0
    @cart.each do |cart_item|
      order_total += cart_item.product_price
      session[:cart].delete(cart_item.id)
    end
    order = Order.create(user_id: current_user.id, order_total: order_total)
  end
end
