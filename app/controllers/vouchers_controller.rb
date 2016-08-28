class VouchersController < ApplicationController

  def index
    # @return_json ||= {}
    @voucher = Voucher.all
    # @voucher.each do |voucher|
    #   @return_json_voucher << {
    #     id: voucher.id
    #     name: voucher.name,
    #     discount_amount: voucher.discount_amount,
    #     spend_requirement: voucher.spend_requirement,
    #     category_requirements: voucher.category_requirements
    #     }

  end
end
