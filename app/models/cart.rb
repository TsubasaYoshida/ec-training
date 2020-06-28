# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_details

  def subtotal
    Product
      .joins(cart_detail: :cart)
      .group(:cart_id)
      .sum('price * cart_details.quantity')[id]
  end
end
