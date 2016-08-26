def dummy_products
  @product = Product.create(name: "item1", category: "category1", price: 1.23, quantity: 4, image: 'shoes.jpg')
end
