def dummy_products
  @product = Product.create(name: "item1", category: "category1", price: 123, quantity: 4, image: 'shoes.jpg')
end

def dummy_vouchers
  @voucher = Voucher.create(name: "£5 off your order", discount_amount: 5, spend_requirement: 0, category_requirements: nil)
end

def dummy_products_less_price
  @product = Product.create(name: "item1", category: "category1", price: 12, quantity: 4, image: 'shoes.jpg')
end

def dummy_invalid_voucher
  @voucher = Voucher.create(name: "£10 off when you spend over £50", discount_amount: 10, spend_requirement: 50, category_requirements: nil)
end
