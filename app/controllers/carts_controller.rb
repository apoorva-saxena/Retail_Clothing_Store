class CartsController < ApplicationController
		def index
			session[:cart] ||= []
			@products = session[:cart].map {|id| Product.find id}
      puts "======================="
      puts @products
		end

		def create
      puts "==============1"
      puts product.id
			session[:cart] << params[:product_id]
		end

		def destroy
			id = params[:id]
			session[:cart].delete_at session[:cart].index(id)
			puts session[:cart]
		end

    def show
      puts "==============show"
      puts id
      puts params
      @products = session[:cart].map {|id| Product.find id}

    end
end
