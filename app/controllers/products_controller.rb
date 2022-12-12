class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
    add_breadcrumb("Products")
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
    add_breadcrumb("Products", products_path)
    add_breadcrumb(@product.product_name)
  end

  def search
    @filter = params[:filters]
    @query = params[:query]
    if @filter.nil?
      @products = Product.where("product_name LIKE ?", "%#{@query}%").page(params[:page])
    else
      @products = Product.where("product_name LIKE ?", "%#{@query}%").where("category_id =#{@filter}").page(params[:page])
      @category = Category.find(@filter)
    end
    add_breadcrumb("Search Results")
  end

  def buy
    @address = Address.where(current_user.id == :user_id)
    province_id = @address.first.province_id
    @province = Province.find(province_id)
    order_total = 0
    @cart.each do |cart_item|
      order_total += cart_item.product_price
      session[:cart].delete(cart_item.id)
    end
    Order.create(user_id: current_user.id, order_total: order_total)
  end
end
