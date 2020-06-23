class Order < ApplicationRecord
  belongs_to :user

  validates :order_code, presence: true
  validates :order_code, length: { maximum: 16 }, allow_blank: true
  validates :order_code, uniqueness: { case_sensitive: false }, allow_blank: true
end
