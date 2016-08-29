require "spec_helper"

describe Product, type: :model do

  it "Can create a Product" do
    product = Product.new(name: "item1", category: "category1", price: 123, quantity: 4, image: 'shoes.jpg')
    expect{product.save}.to change{Product.count}.by 1
  end

end
