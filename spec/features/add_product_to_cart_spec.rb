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
    end

    scenario 'displays item in cart as 1' do
      expect(page).to have_content '1'
    end

    scenario 'displays the name of the product in cart'do
      visit "/carts/#{@product.id}"
      visit '/carts'
      expect(page).to have_content 'item1'
    end

    scenario 'displays the number of products added in cart' do
      visit "/carts/#{@product.id}"
      visit '/carts'
      expect(page).to have_content '1'
    end

    scenario 'displays the total price to be paid' do
      visit "/carts/#{@product.id}"
      visit '/carts'
      expect(page).to have_content '123'
    end
  end
end
