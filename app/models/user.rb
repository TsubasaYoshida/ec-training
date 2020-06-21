# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :validatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable

  validates :screen_name,
            presence: true,
            length: { maximum: 20 },
            uniqueness: { case_sensitive: false }
end
