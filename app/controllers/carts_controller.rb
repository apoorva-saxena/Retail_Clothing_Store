class CartsController < ApplicationController
		def index
			session[:cart] ||= []
			@products = session[:cart].map {|id| Product.find id}
			@product_map = Hash.new(0)
			@products.map{|product| @product_map[product]+=1}
			@vouchers = Voucher.all
			@bill_without_voucher = (@products.map{|product| product.price}).reduce(0, :+)
		end

		def create
			session[:cart] << params[:id]
			puts session[:cart]
		end

		def destroy
			id = params[:id]
			puts "================1"
			puts id
			# session.data.delete :id
			session[:cart].delete_at session[:cart].index(id)
			puts session[:cart]
		end

		def clear_session
			session.clear
		end
end
