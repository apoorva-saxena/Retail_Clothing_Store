require "spec_helper"

describe Voucher, type: :model do

  it "Can create a Voucher" do
    voucher = Voucher.new(name: "£5 off your order", discount_amount: 5, spend_requirement: 0, category_requirements: nil)
    expect{voucher.save}.to change{Voucher.count}.by 1
  end

end
