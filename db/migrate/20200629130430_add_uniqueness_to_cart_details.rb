# frozen_string_literal: true

class AddUniquenessToCartDetails < ActiveRecord::Migration[6.0]
  def change
    add_index :cart_details, %i[cart_id product_id], unique: true
  end
end
