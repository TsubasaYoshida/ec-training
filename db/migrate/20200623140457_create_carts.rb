# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      # nullを許容する
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
