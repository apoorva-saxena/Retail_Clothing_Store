class VouchersController < ApplicationController
  def index
    @voucher = Voucher.all
  end

  def verify_category_requirement?(category_requirements, products_in_cart)
    if !category_requirements
      return true
    end
    products_in_cart.each do |product|
      if product.category.include? category_requirements
         return true
      end
    end
     return false
  end

  def verify_spend_requirement?(spend_requirement, bill_without_voucher)
    if bill_without_voucher > spend_requirement
      true
    else
      false
    end
  end

  def check_voucher_validity(applied_voucher)
    products_in_cart = session[:cart].map {|id| Product.find id}
    bill_without_voucher = (products_in_cart.map{|product| product.price}).reduce(0, :+)

    if verify_category_requirement?(applied_voucher.category_requirements, products_in_cart) &&
       verify_spend_requirement?(applied_voucher.spend_requirement, bill_without_voucher)
      voucher_invalid = false
    else
      voucher_invalid = true
    end
  end

  def apply_voucher_discount
    if !(params.has_key?(:voucher_id))
      # No voucher selected.
      redirect_to("/carts", warning: "Please select a voucher!")
    else
      applied_voucher = Voucher.find params[:voucher_id]
      voucher_invalid = check_voucher_validity(applied_voucher)
      if voucher_invalid
        redirect_to('/carts', warning: "Voucher cannot be applied as it does not meet the requirements!")
      else
        redirect_to("/carts?voucher_applied=#{applied_voucher.id}", success: "Voucher applied successfully! Discount = £#{applied_voucher.discount_amount}")
      end
    end
  end
end
