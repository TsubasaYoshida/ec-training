# frozen_string_literal: true

class CreateCartDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_details do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
