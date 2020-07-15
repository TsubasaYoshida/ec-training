# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :validatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable

  has_one :cart

  validates :screen_name, presence: true
  validates :screen_name, length: { maximum: 20 }, allow_blank: true
  validates :screen_name, uniqueness: { case_sensitive: false }, allow_blank: true
end
