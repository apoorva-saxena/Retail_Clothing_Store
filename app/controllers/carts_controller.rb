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
		end

		def destroy
			id = params[:id]
			session[:cart].delete_at session[:cart].index(id)
		end

		def clear_session
			session.clear
		end

		def voucher_params
			@vouchers_selected << params[:voucher]
		end

		# private
		# #
		# # def bill_with_voucher
		# # 	@bill_without_voucher =
		# # end
end
