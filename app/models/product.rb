# frozen_string_literal: true

class Product < ApplicationRecord
  has_one :stock

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }, allow_blank: true
end
