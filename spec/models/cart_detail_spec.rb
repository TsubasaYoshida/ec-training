# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartDetail, type: :model do
  before do
    @cart_detail = build(:cart_detail)
  end

  it '有効' do
    expect(@cart_detail.valid?).to be_truthy
  end

  it '無効：数量が存在しない' do
    @cart_detail.quantity = nil
    expect(@cart_detail.valid?).to be_falsey
  end

  it '無効：数量が小数になっている' do
    @cart_detail.quantity = 1.5
    expect(@cart_detail.valid?).to be_falsey
  end

  it '無効：数量が0になっている' do
    @cart_detail.quantity = 0
    expect(@cart_detail.valid?).to be_falsey
  end

  it '無効：商品がすでにカートに入っている' do
    new_cart_detail = CartDetail.new(cart_id: 1, product_id: 1)
    expect(new_cart_detail.valid?).to be_falsey
  end
end
