# frozen_string_literal: true

# TODO: cart_idとproduct_idのユニーク制約と、ユニークバリデーション

class CartDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_blank: true
end
