FactoryBot.define do
  factory :cart_detail do
    cart { nil }
    product { nil }
    quantity { 1 }
  end
end
