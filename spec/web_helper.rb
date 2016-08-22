def dummy_products
  Product.create(name: "item1", category: "category1", price: 1.23, quantity: 4)
  Product.create(name: "item2", category: "category2", price: 16.90, quantity: 3)
  Product.create(name: "item3", category: "category3", price: 17, quantity: 4)
end
