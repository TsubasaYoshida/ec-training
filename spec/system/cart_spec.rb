# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cart', type: :system do
  before do
    create(:product)
  end

  scenario '商品をカートに入れる' do
    visit product_path(1)
    fill_in '数量', with: 1
    click_on 'カートに入れる'

    expect(current_path).to eq cart_path
    expect(page).to have_content '商品1'
    expect(page).to have_content '数量: 1'
    expect(page).to have_selector '.cart-subtotal', text: '¥1,000'
  end
end
