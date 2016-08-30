require 'rails_helper'

feature 'Adds voucher' do
  context 'One product in cart' do
    before do
      dummy_products
      dummy_vouchers
      visit '/products'
      visit "/carts/#{@product.id}"
      visit '/carts'
    end
    scenario 'vouchers present' do
      expect(page).to have_content '£5 off your order'
    end

    scenario 'voucher applied on the product'  do
      page.choose('voucher_id')
      click_button('Apply Voucher')
      expect(page).to have_content '118'
    end

    scenario 'expect page to show the initial total amount also' do
      page.choose('voucher_id')
      click_button('Apply Voucher')
      expect(page).to have_content('123')
    end

    scenario 'expect page to show the initial total amount also' do
      page.choose('voucher_id')
      click_button('Apply Voucher')
      expect(page).to have_content("Voucher applied successfully")
    end
  end
end
