# frozen_string_literal: true

class CartDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }, allow_blank: true
end
