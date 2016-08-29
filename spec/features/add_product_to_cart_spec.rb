require 'rails_helper'

feature 'Shopping cart' do

  context 'no products have been added' do
    before do
      dummy_products
      visit '/products'
    end

    scenario 'displays a prompt to add to cart per product' do
      expect(page).to have_content 'Add to cart'
    end

    scenario 'displays items in cart as 0' do
      expect(page).to have_content '0'
    end
  end

  context 'products have been added' do
    before do
      dummy_products
      visit '/products'
      visit "/carts/#{@product.id}"
      visit '/carts'
    end

    scenario 'displays item in cart as 1' do
      expect(page).to have_content 'item1'
    end

    scenario 'displays the price of the product' do
      expect(page).to have_content '123'
    end
  end
end
