class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs
  before_action :initialize_session
  before_action :load_cart

  def add_breadcrumb(label, path = nil)
    @breadcrumbs << {
      label: label,
      path: path
    }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end

  def home
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to request.referrer, notice: "Product added to cart."
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to request.referrer, notice: "Product removed from cart."
  end

  private

  def initialize_session
    session[:cart] ||= []
    session[:quantity] ||= []
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
end
