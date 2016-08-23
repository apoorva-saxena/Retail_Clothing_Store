def dummy_products
  Product.create(name: "item1", category: "category1", price: 1.23, quantity: 4, image: 'shoes.jpg')
  Product.create(name: "item2", category: "category2", price: 16.9, quantity: 3, image: 'dress.jpg')
  Product.create(name: "item3", category: "category3", price: 17, quantity: 6, image: 'shirt.jpg')
end
