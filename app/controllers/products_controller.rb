class ProductsController < ApplicationController
  def index
    session[:cart] ||= []
    @cart_size = session[:cart].count
    @products = Product.all
    @products_in_cart = session[:cart].map {|id| Product.find id}
    @product_map = Hash.new(0)
    @products_in_cart.map{|product| @product_map[product]+=1}
  end

end
