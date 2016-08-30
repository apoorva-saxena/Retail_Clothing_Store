class ProductsController < ApplicationController
    def index
        session[:cart] ||= []
        @products = Product.all
        products_in_cart = session[:cart].map { |id| Product.find id }
        @product_in_cart_count = Hash.new(0)
        products_in_cart.map { |product| @product_in_cart_count[product] += 1 }
    end
end
