# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cart', type: :system do
  before do
    create(:product_1)
    create(:product_2)
  end

  scenario '商品をカートに入れる' do
    visit product_path(1)
    fill_in '数量', with: 1

    expect {
      click_on 'カートに入れる'
    }.to change { Cart.count }.by(1)
    expect(current_path).to eq cart_path
    expect(page).to have_content '商品1'
    expect(page).to have_content '数量: 1'
    expect(page).to have_selector '.cart-subtotal', text: '¥1,000'
  end

  scenario '商品をカートに入れた後に、セッション削除して、再度カートに入れる' do
    visit product_path(1)
    fill_in '数量', with: 1
    expect {
      click_on 'カートに入れる'
    }.to change { Cart.count }.by(1)

    reset_session!

    visit product_path(1)
    fill_in '数量', with: 1
    expect {
      click_on 'カートに入れる'
    }.to change { Cart.count }.by(1)

    expect(Cart.count).to eq 2
  end

  scenario '商品をカートに入れた後に、違う商品をカートに入れる' do
    visit product_path(1)
    fill_in '数量', with: 1
    expect {
      click_on 'カートに入れる'
    }.to change { Cart.count }.by(1)

    visit product_path(2)
    fill_in '数量', with: 1
    expect {
      click_on 'カートに入れる'
    }.to change { Cart.count }.by(0)

    expect(Cart.count).to eq 1
  end
end
