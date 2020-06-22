class Stock < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }, allow_blank: true
end
