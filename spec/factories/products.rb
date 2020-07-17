# frozen_string_literal: true

FactoryBot.define do
  factory :product_1, class: Product do
    id { 1 }
    name { '商品1' }
    price { 1000 }
  end

  factory :product_2, class: Product do
    id { 2 }
    name { '商品2' }
    price { 2000 }
  end
end
