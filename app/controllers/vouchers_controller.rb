class VouchersController < ApplicationController

  def index
    @voucher = Voucher.all
  end
end
