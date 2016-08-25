class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart_size = session[:cart].count
  end
end
