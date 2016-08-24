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
      expect(page).to have_content 'items in cart: 0'
    end
  end
end
