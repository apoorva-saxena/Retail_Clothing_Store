class VouchersController < ApplicationController
    def index
        @voucher = Voucher.all
    end

    def verify_category_requirement?(category_requirements, products_in_cart)
        return true unless category_requirements
        # Check if any product in cart matches the category_requirements
        products_in_cart.each do |product|
            return true if product.category.include? category_requirements
        end
        false
    end

    def verify_spend_requirement?(spend_requirement, bill_without_voucher)
        bill_without_voucher > spend_requirement
    end

    def check_voucher_validity(applied_voucher)
        products_in_cart = session[:cart].map { |id| Product.find id }
        bill_without_voucher = products_in_cart.map(&:price).reduce(0, :+)

        verify_category_requirement?(applied_voucher.category_requirements, products_in_cart) &&
           verify_spend_requirement?(applied_voucher.spend_requirement, bill_without_voucher)
    end

    def apply_voucher_discount
        if !params.key?(:voucher_id)
            # No voucher selected.
            redirect_to('/carts', warning: 'Please select a voucher!')
        else
            applied_voucher = Voucher.find params[:voucher_id]
            voucher_valid = check_voucher_validity(applied_voucher)
            if voucher_valid
              redirect_to("/carts?voucher_applied=#{applied_voucher.id}", success: "Voucher applied successfully! Discount = £#{applied_voucher.discount_amount}")
            else
              redirect_to('/carts', warning: 'Voucher cannot be applied as it does not meet the requirements!')
            end
        end
    end
end
