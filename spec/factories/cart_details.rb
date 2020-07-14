# frozen_string_literal: true

FactoryBot.define do
  factory :cart_detail do
    association :cart, factory: :cart
    association :product, factory: :product_1
    quantity { 1 }
  end
end
