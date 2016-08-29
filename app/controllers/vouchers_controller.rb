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

  def apply_voucher_discount
    if !(params.has_key?(:voucher_id))
      redirect_to("/carts", warning: "Please select a voucher!")
    else
      total_discount = 0
      products_in_cart = session[:cart].map {|id| Product.find id}
      bill_without_voucher = (products_in_cart.map{|product| product.price}).reduce(0, :+)
      voucher = Voucher.find params[:voucher_id]
      if verify_category_requirement?(voucher.category_requirements, products_in_cart) && verify_spend_requirement?(voucher.spend_requirement, bill_without_voucher)
        voucher_invalid = false
      else
        voucher_invalid = true
      end
      puts "Total discount=#{total_discount} and invalid=#{voucher_invalid}"
      if voucher_invalid
        redirect_to('/carts', warning: "Voucher cannot be applied as it does not meet the requirements!")
      else
        redirect_to("/carts?voucher_applied=#{voucher.id}", success: "Voucher applied successfully! Discount = #{voucher.discount_amount} £")
      end
    end
  end

end
