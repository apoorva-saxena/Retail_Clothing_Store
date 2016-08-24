class CartsController < ApplicationController
		def index
			puts "==================1"
			puts session[:cart]
			puts "==================3"
			session[:cart] ||= []
			@products = session[:cart].map {|id| Product.find id}
		end

		def create
			puts "=====================2"
			session[:cart] << params[:id]
			puts session[:cart]
		end

		def destroy
			id = params[:id]
			session[:cart].delete_at session[:cart].index(id)
			puts session[:cart]
		end

end
