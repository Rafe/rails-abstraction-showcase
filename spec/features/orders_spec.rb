require 'rails_helper'

feature "Orders", :type => :feature do
  scenario 'can add items to order and checkout' do
    user = User.create(email: 'test@test.com', password: 'Password123')
    Product.create(name: 'Product 1', price: '200')
    Product.create(name: 'Product 2', price: '100')
    Product.create(name: 'Product 3', price: '40')

    login_as user

    visit products_path

    within '.col-md-4', text: 'Product 1' do
      click_on 'Order'
    end

    within '.col-md-4', text: 'Product 2' do
      click_on 'Order'
    end

    within '.col-md-4', text: 'Product 3' do
      click_on 'Order'
    end

    expect(page).to have_content 'Cart 3'

    click_link 'Cart 3'

    expect(page).to have_content('Total price : 340.0')

    within 'li', text: 'Product 1' do
      click_on 'delete'
    end

    expect(page).to have_content('Successfully removed item from cart')
    expect(page).to have_content('Total price : 140')

    click_link 'Checkout'

    fill_in 'order_address', with: 'test road 123'
    fill_in 'order_card_number', with: '4123 1234 1234 4123'
    fill_in 'order_card_code', with: '123'
    click_on 'Complete Order'

    expect(page).to have_content 'Order has already been processed, you will received confirmation email shortly'
  end
end
