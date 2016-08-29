def dummy_products
  @product = Product.create(name: "item1", category: "category1", price: 123, quantity: 4, image: 'shoes.jpg')
end

def dummy_vouchers
  @voucher = Voucher.create(name: "£5 off your order", discount_amount: 5, spend_requirement: 0, category_requirements: nil)
end
