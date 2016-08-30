module ProductsHelper
  def get_cart_size
    session[:cart].count
  end

  def product_count_in_cart(product)
    @product_in_cart_count[product]
  end
end
