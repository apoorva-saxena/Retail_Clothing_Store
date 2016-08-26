require 'rails_helper'

feature 'Products' do

  context 'User sees products' do
    before do
      dummy_products
      visit '/products'
    end

    scenario 'name' do
      expect(page).to have_content 'item1'
    end

    scenario 'category' do
      expect(page).to have_content 'category1'
    end

    scenario 'price' do
      expect(page).to have_content '1.23'
    end

    scenario 'quantity' do
      expect(page).to have_content '4'
    end

    scenario 'image' do
      expect(page).to have_css("img[src*='shoes.jpg']")
    end
  end

  context 'User sees no products' do
    scenario 'noting visible on the screen' do
      visit '/products'
      expect(page).to have_content ''
    end
  end
end
