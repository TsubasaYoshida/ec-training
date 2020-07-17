# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before do
    @user = create(:user)
    @user.confirm
    create(:product_1)
    create(:product_2)
  end

  example do
    # カート未生成ユーザーが、カート生成したあとにログインする
    post cart_details_path, params: { cart_detail: { product_id: 1, quantity: 1 } }
    post user_session_path, params: { user: { email: 'tsubasa@example.com', password: 'password' } }
    expect(Cart.first.id).to be @user.cart.id
    expect(session[:cart_id]).to be nil
  end

  example do
    # カート生成済みユーザーが、別のカートを生成したあとにログインする
    cart = Cart.create!(user: @user)
    CartDetail.create!(
      cart: cart,
      product_id: 2,
      quantity: 1
    )
    post cart_details_path, params: { cart_detail: { product_id: 1, quantity: 1 } }
    post user_session_path, params: { user: { email: 'tsubasa@example.com', password: 'password' } }
    expect(Cart.count).to be 1
    expect(Cart.first.id).to be @user.cart.id
    expect(cart.cart_details.count).to be 2
    expect(session[:cart_id]).to be nil
  end
end
