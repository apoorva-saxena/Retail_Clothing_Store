class VouchersController < ApplicationController
    def index
        @voucher = Voucher.all
    end

    def apply_voucher_discount
        if !params.key?(:voucher_id)
            # No voucher selected.
            redirect_to('/carts', warning: 'Please select a voucher!')
        else
            applied_voucher = Voucher.find params[:voucher_id]
            products_in_cart = session[:cart].map { |id| Product.find id }
            # check if voucher is valid from helper function.
            if Voucher.check_voucher_validity(applied_voucher, products_in_cart)
              redirect_to("/carts?voucher_applied=#{applied_voucher.id}", success: "Voucher applied successfully! Discount = £#{applied_voucher.discount_amount}")
            else
              redirect_to('/carts', warning: 'Voucher cannot be applied as it does not meet the requirements!')
            end
        end
    end
end
