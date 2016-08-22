require 'rails_helper'

feature 'user see a list of items' do

  context 'has data in Product database' do
    before do
      dummy_products
      visit '/products'
    end
    scenario 'name of the products' do
      expect(page).to have_content 'item1'
      expect(page).to have_content 'item2'
      expect(page).to have_content 'item3'
    end

    scenario 'category of the products' do
      expect(page).to have_content 'category1'
      expect(page).to have_content 'category2'
      expect(page).to have_content 'category3'
    end

    scenario 'price of the products' do
      expect(page).to have_content '1.23'
      expect(page).to have_content '16.9'
      expect(page).to have_content '17'
    end

    scenario 'quantity of the products' do
      expect(page).to have_content '4'
      expect(page).to have_content '3'
      expect(page).to have_content '4'
    end
  end

context 'has no data in database' do
  scenario 'noting visible on the screen' do
    visit '/products'
    expect(page).to have_content ''
  end
end


end
