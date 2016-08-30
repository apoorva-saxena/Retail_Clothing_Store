class Voucher < ApplicationRecord
    def self.verify_category_requirement?(category_requirements, products_in_cart)
        return true unless category_requirements
        # Check if any product in cart matches the category_requirements
        products_in_cart.each do |product|
            return true if product.category.include? category_requirements
        end
        false
    end

    def self.verify_spend_requirement?(spend_requirement, bill_without_voucher)
        bill_without_voucher > spend_requirement
    end

    def self.check_voucher_validity(applied_voucher, products_in_cart)
        bill_without_voucher = products_in_cart.map(&:price).reduce(0, :+)

        verify_category_requirement?(applied_voucher.category_requirements, products_in_cart) &&
            verify_spend_requirement?(applied_voucher.spend_requirement, bill_without_voucher)
    end
end
