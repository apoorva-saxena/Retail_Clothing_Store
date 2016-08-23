require 'rails_helper'

feature 'user sees a list of items' do

  context 'details of the Product' do
    before do
      dummy_products
      visit '/products'
    end

    scenario 'name' do
      expect(page).to have_content 'item1'
      expect(page).to have_content 'item2'
      expect(page).to have_content 'item3'
    end

    scenario 'category' do
      expect(page).to have_content 'category1'
      expect(page).to have_content 'category2'
      expect(page).to have_content 'category3'
    end

    scenario 'price' do
      expect(page).to have_content '1.23'
      expect(page).to have_content '16.9'
      expect(page).to have_content '17'
    end

    scenario 'quantity' do
      expect(page).to have_content '4'
      expect(page).to have_content '3'
      expect(page).to have_content '6'
    end

    scenario 'image' do
      expect(page).to have_css("img[src*='shoes.jpg']")
      expect(page).to have_css("img[src*='dress.jpg']")
      expect(page).to have_css("img[src*='shirt.jpg']")
    end
  end

  context 'has no data in database' do
    scenario 'noting visible on the screen' do
      visit '/products'
      expect(page).to have_content ''
    end
  end
end
