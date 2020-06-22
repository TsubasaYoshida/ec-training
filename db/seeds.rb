# frozen_string_literal: true

5.times do |n|
  Product.create!(
    name: "商品#{n + 1}",
    price: 10_000
  )
end

Product.all.each do |product|
  product.create_stock!(
    quantity: 99
  )
end
