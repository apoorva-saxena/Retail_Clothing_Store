class CartsController < ApplicationController
		def index
			if params[:voucher_applied]
				voucher = Voucher.find params[:voucher_applied]
				discount = voucher.discount_amount
			else
				discount = 0
			end
			session[:cart] ||= []
			@products = session[:cart].map {|id| Product.find id}
			@product_map = Hash.new(0)
			@products.map{|product| @product_map[product]+=1}
			@vouchers = Voucher.all
			@bill_without_voucher = (@products.map{|product| product.price}).reduce(0, :+)
			@bill_with_voucher = @bill_without_voucher - discount
		end

		def create
			session[:cart] << params[:id]
		end

		def destroy
			id = params[:id]
			session[:cart].delete_at session[:cart].index(id)
			redirect_to('/carts')
		end

		def clear_session
			session.clear
		end

end
