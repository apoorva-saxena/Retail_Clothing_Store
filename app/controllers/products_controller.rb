class ProductsController < ApplicationController
  def index
    session[:cart] ||= []
    @cart_size = session[:cart].count
    @products = Product.all
  end
end
