# frozen_string_literal: true

class CartDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_blank: true
  validate :added_to_cart?

  private

  def added_to_cart?
    errors[:base] << 'この商品はすでにカートに入っています。' if CartDetail.exists?(cart_id: cart_id, product_id: product_id)
  end
end
