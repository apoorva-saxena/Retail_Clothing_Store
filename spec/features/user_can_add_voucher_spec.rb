require 'rails_helper'

feature 'Adds voucher' do
  context 'One product in cart' do
    before do
      dummy_products
      visit '/products'
      visit "/carts/#{@product.id}"
      visit '/carts'
    end

    scenario 'click on voucher' do
      
    end
  end
end
