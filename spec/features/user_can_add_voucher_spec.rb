require 'rails_helper'

feature 'Adds voucher' do
    context 'Valid Voucher' do
        before do
            dummy_products
            dummy_vouchers
            visit '/products'
            page.driver.post('/carts', id: @product.id.to_s)
            visit '/carts'
        end
        scenario 'vouchers present' do
            expect(page).to have_content '£5 off your order'
        end

        scenario 'voucher applied on the product' do
            page.choose('voucher_id')
            click_button('Apply Voucher')
            expect(page).to have_content '118'
        end

        scenario 'expect page to show the initial total amount also' do
            page.choose('voucher_id')
            click_button('Apply Voucher')
            expect(page).to have_content('123')
        end

        scenario 'expect page to show the success message' do
            page.choose('voucher_id')
            click_button('Apply Voucher')
            expect(page).to have_content('Voucher applied successfully! Discount = £5.0')
        end
    end

    context 'Invalid Voucher' do
        before do
            dummy_products_less_price
            dummy_invalid_voucher
            visit '/products'
            page.driver.post('/carts', id: @product.id.to_s)
            visit '/carts'
        end
        scenario 'vouchers present' do
            expect(page).to have_content '£10 off when you spend over £50'
        end

        scenario 'voucher applied on the product' do
            page.choose('voucher_id')
            click_button('Apply Voucher')
            expect(page).to have_content '12'
        end

        scenario 'expect page to show the failure message' do
            page.choose('voucher_id')
            click_button('Apply Voucher')
            expect(page).to have_content('Voucher cannot be applied as it does not meet the requirements!')
        end
    end
end
