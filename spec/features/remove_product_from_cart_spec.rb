require 'rails_helper'

feature 'Remove from cart' do

  context 'One product in cart' do
    before do
      dummy_products
      visit '/products'
      page.driver.post('/carts', { :id => "#{@product.id}" })
      visit '/carts'
    end

    scenario 'has one item in cart' do
      expect(page).to have_content 'item1'
    end

    scenario 'removes the product from the cart' do
      click_button 'Remove item'
      visit '/carts'
      expect(page).not_to have_content 'item 1'
    end
  end
end
