# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before do
    @user = create(:user)
    @user.confirm
    create(:product_1)
  end

  example do
    # カート未生成ユーザーが、カート生成したあとにログインする
    post cart_details_path, params: { cart_detail: { product_id: 1, quantity: 1 } }
    post user_session_path, params: { user: { email: 'tsubasa@example.com', password: 'password' } }
    expect(Cart.first.id).to be @user.cart.id
    expect(session[:cart_id]).to be nil
  end
end
