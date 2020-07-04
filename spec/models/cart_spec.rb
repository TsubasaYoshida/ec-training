# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "subtotalメソッドのテスト" do
    @cart = Cart.create
    product_1 = Product.create(
      name: '商品1',
      price: 1000
    )
    product_2 = Product.create(
      name: '商品2',
      price: 2000
    )
    @cart.cart_details.create(
      product: product_1,
      quantity: 1
    )
    @cart.cart_details.create(
      product: product_2,
      quantity: 2
    )
    expect(@cart.subtotal).to eq 5000
  end
end
