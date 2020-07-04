# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    id { 1 }
    name { '商品1' }
    price { 1000 }
  end
end
