# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name,
            :price,
            presence: true
  validates :price, numericality: { only_integer: true }
end
